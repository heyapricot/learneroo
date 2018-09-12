def build_pairs(points_array)
  pairs = points_array.each_slice(2).map{|i,j| [i,j]}
  pairs.sort_by{|point| point[0]}
end

def distance_between_points(pair)
  Math.hypot((pair[0][0] - pair[1][0]),(pair[0][1] - pair[1][1]))
end

def closest_pairs_brute_force(points)
  min = Float::MAX
  point_max_idx = points.length - 1
  points.each_with_index do |sample, idx|
    points[idx+1..point_max_idx].each do |point|
      d = distance_between_points([sample,point])
      min = d if min > d
    end
  end
  return min
end

def min_distance_in_strip(points, min_d)
  min = min_d
  point_max_idx = points.length - 1
  points.each_with_index do |sample, idx|
    points[idx+1..point_max_idx].each do |point|
      break if (point[1] - sample[1]) >= min_d
      d = distance_between_points([sample,point])
      min = d if min > d
    end
  end
  min
end

def closest_pairs(points)
  point_qty = points.length
  return closest_pairs_brute_force(points) if point_qty <= 3
  mid = point_qty / 2
  midpoint = points[mid]
  left_distance = closest_pairs(points[0,mid])
  right_distance = closest_pairs(points[mid..-1])
  min_d = left_distance < right_distance ? left_distance : right_distance
  #Build strip of Points close (closer than d) to the line passing through the middle point
  points_close_to_middle = points.select{|pair| (pair[0] - midpoint[0]).abs < min_d }.sort_by{|point| point[1]}
  return min_distance_in_strip(points_close_to_middle,min_d)
end