
class ArrayMerger
  def merge(array1, array2)
    return result_of_invalid_args(array1, array2) if array1.nil? or array2.nil?

    result = []
    min_array = array1.size < array2.size ? array1:array2
    result += firsts_of(array1, array2) while min_array.size != 0
    result += the_rest_of(array1, array2) if array1.size != 0 or array2.size != 0
    return result
  end

  def result_of_invalid_args(array1, array2)
    raise "There are need two array" if array1.nil? and array2.nil?
    return array2 unless array1
    return array1 unless array2
  end

  def firsts_of(array1, array2)
    if array1.first < array2.first
      return [array1.shift, array2.shift]
    else
      return [array2.shift, array1.shift]
    end
  end

  def the_rest_of(array1, array2)
    if array1.size != 0
      return array1
    else
      return array2
    end
  end

end
