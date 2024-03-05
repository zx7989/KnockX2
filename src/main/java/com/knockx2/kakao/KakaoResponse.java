package com.knockx2.kakao;

public class KakaoResponse {



	private String id;
	    private String connected_at;
	    private Properties properties;
	    private KakaoAccount kakao_account;
		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

			public String getConnected_at() {
				return connected_at;
			}

			public void setConnected_at(String connected_at) {
				this.connected_at = connected_at;
			}

			public Properties getProperties() {
				return properties;
			}

			public void setProperties(Properties properties) {
				this.properties = properties;
			}

			public KakaoAccount getKakao_account() {
				return kakao_account;
			}

			public void setKakao_account(KakaoAccount kakao_account) {
				this.kakao_account = kakao_account;
			}
	    // getter, setter 생략...

	    public static class Properties {
	        private String nickname;
	        private String profile_image;
	        private String thumbnail_image;
			public String getNickname() {
				return nickname;
			}
			public void setNickname(String nickname) {
				this.nickname = nickname;
			}
			public String getProfile_image() {
				return profile_image;
			}
			public void setProfile_image(String profile_image) {
				this.profile_image = profile_image;
			}
			public String getThumbnail_image() {
				return thumbnail_image;
			}
			public void setThumbnail_image(String thumbnail_image) {
				this.thumbnail_image = thumbnail_image;
			}

	        // getter, setter 생략...
	    }

	    public static class KakaoAccount {
	        private boolean profile_nickname_needs_agreement;
	        private boolean profile_image_needs_agreement;
	        private Profile profile;

	        // getter, setter 생략...

	        public boolean isProfile_nickname_needs_agreement() {
				return profile_nickname_needs_agreement;
			}

			public void setProfile_nickname_needs_agreement(boolean profile_nickname_needs_agreement) {
				this.profile_nickname_needs_agreement = profile_nickname_needs_agreement;
			}

			public boolean isProfile_image_needs_agreement() {
				return profile_image_needs_agreement;
			}

			public void setProfile_image_needs_agreement(boolean profile_image_needs_agreement) {
				this.profile_image_needs_agreement = profile_image_needs_agreement;
			}

			public Profile getProfile() {
				return profile;
			}

			public void setProfile(Profile profile) {
				this.profile = profile;
			}

			public static class Profile {
	            private String nickname;
	            private String thumbnail_image_url;
	            private String profile_image_url;
	            private boolean is_default_image;
				public String getNickname() {
					return nickname;
				}
				public void setNickname(String nickname) {
					this.nickname = nickname;
				}
				public String getThumbnail_image_url() {
					return thumbnail_image_url;
				}
				public void setThumbnail_image_url(String thumbnail_image_url) {
					this.thumbnail_image_url = thumbnail_image_url;
				}
				public String getProfile_image_url() {
					return profile_image_url;
				}
				public void setProfile_image_url(String profile_image_url) {
					this.profile_image_url = profile_image_url;
				}
				public boolean isIs_default_image() {
					return is_default_image;
				}
				public void setIs_default_image(boolean is_default_image) {
					this.is_default_image = is_default_image;
				}

	            // getter, setter 생략...
	        }
	    }
}
