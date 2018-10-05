class Bottles
  attr_reader :number

  def song
    verses(99, 0)
  end

  def verse(number)
    @number = number

    str = ''
    str += current_text
    str += number_left_text
    str
  end

  def verses(x, y)
    str = ''
    x.downto(y) do |i|
      str += verse(i)
      str += "\n" if i != y
    end
    str
  end

  private

  def current_text
    "#{number_to_text(number)} #{pluralize} of beer on the wall, #{number_to_text(number)} #{pluralize} of beer.\n".capitalize
  end

  def number_to_text(number)
    number.zero? ? 'no more' : number.to_s
  end

  def number_left
    (number - 1).negative? ? 99 : number - 1
  end

  def number_left_text
    first_part = if no_more_left?
        "Go to the store and buy some more,"
      elsif last_one?
        "Take it down and pass it around,"
      else
        "Take one down and pass it around,"
      end

    "#{first_part} #{number_to_text(number_left)} #{pluralize(number_left)} of beer on the wall.\n".capitalize
  end

  def last_one?
    number == 1
  end

  def no_more_left?
    number.zero?
  end

  def pluralize(n = number)
    n == 1 ? 'bottle' : 'bottles'
  end
end
