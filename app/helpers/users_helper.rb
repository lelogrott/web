module UsersHelper
	require 'uri'
	def gravatar_for(user)
		default_image = URI.encode("http://www.tc.columbia.edu/arts-and-humanities/arts-administration/alumni/alumni-profiles/alumni-profiles/profilePicture.jpg")
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=#{default_image}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar w3-image")
	end
end
