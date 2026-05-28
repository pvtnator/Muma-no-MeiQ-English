class Game_Screen
  unless method_defined?(:speedup)
    alias speedup update
  end
  def update
    speedup
    if Input.press?(Input::CTRL)
      Graphics.frame_rate = 600
    else
      Graphics.frame_rate = 60
    end
  end
end

module Graphics
  #-----------------------------------------------------------------------------
  # Overwrite. Manually set the value. This is only for testing purposes
  #-----------------------------------------------------------------------------
  def self.frame_rate=(rate)
    val = [rate].pack("L")
    ptr = DL::CPtr.new(0x1025EB00) #0x10000000 base + 0x25EB00
    addr = ptr[0, val.size].unpack("L")[0]
    addr += 0x214
    ptr = DL::CPtr.new(addr)
    ptr[0,val.size] = val
  end
end

class Window_Message < Window_Base
  def se_play_ok?
    (@se_count % 4 == 0) && !$game_switches[25]
  end
end

class Window_Message < Window_Base
  @skip_next = true
  #--------------------------------------------------------------------------
  # ● 一文字出力後のウェイト
  #--------------------------------------------------------------------------
  def wait_for_one_character
    update_show_fast
    if @skip_next
      @skip_next = false
      return
    end
    @skip_next = true
    unless @show_fast || @line_show_fast
      @yield_count ||= 0
      if $game_variables[FAI_MSPEED_VARID] <= 0
        ($game_variables[FAI_MSPEED_VARID] - 1).abs.times{ Fiber.yield }
      else
        @yield_count -= 1 if @yield_count > 0
        if @yield_count == 0
          @yield_count = $game_variables[FAI_MSPEED_VARID] + 1
          Fiber.yield
        end
      end
    end
  end
end

#class Window_Message < Window_Base
#  def update_show_fast
#    @show_fast = true
#  end
#end