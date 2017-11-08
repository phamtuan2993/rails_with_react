class Picture < ActiveRecord::Base

	MAX_IMAGE_SIZE = 10 * 1024 * 1024

  belongs_to :idea

	has_attached_file :image,
		path: ":rails_root/public/system/ideas/:year/:month/:date/:class/:basename_:style.:extension",
		url: "/system/ideas/:year/:month/:date/:class/:basename_:style.:extension",
		default_url: "http://placehold.it/300x600",
		styles: {
		  thumb: 		['100x100#',  :jpg, :quality => 70],
		  preview: 	['480x480#',  :jpg, :quality => 70],
		  large: 		['600>',      :jpg, :quality => 70],
		  retina: 	['1200>',     :jpg, :quality => 30]
		},
		convert_options: {
		  thumb:  	'-set colorspace sRGB -strip',
		  preview: 	'-set colorspace sRGB -strip',
		  large:    '-set colorspace sRGB -strip',
		  retina: 	'-set colorspace sRGB -strip -sharpen 0x0.5'
		}


	validates_presence_of :idea

	validates_attachment :image,
		content_type: { content_type: /^image\/\w*$/ },
		size: { in: 0..MAX_IMAGE_SIZE }
end
