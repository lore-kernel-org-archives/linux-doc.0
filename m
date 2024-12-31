Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7D19DFAB;
	Tue, 31 Dec 2024 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735666320; cv=none; b=oBOn1VrI5660mE2F+yZd4iANBt13+a3gDkVwCYDRSZAYZy8MPVnFQsFU0Hz3g/eyyVc8rTLNuzVPv05oE6J+wu7vQUGPk+BjFCaOKil5IKh8cjwR6aQwoRy1Wz8UmMp6xrJw9lmltSF5P00A/rhM15GB7eJMwkELNkbnbfmJDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735666320; c=relaxed/simple;
	bh=8Uq8ZT/ywuww+T3GIkafX85EmzQbUT5V6IgJh+L8dAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpDeUnJMCrJD7kGhKdSmGO+K//mZ9yOPkaKksh6HRwCH/z3g85HmLfiZfd5CpYdZafJGAPBezkL55FtawpmBkudIUKelgxKLi6p/nrQbeeM4i8tmav4jJThOx3VKFletOJMX5Y2A8Hn6l66R4HFcaEMV7SlSzZTh7F4e0ZVJ/T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LLR8FQbG; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LLR8FQbG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1650FFF807;
	Tue, 31 Dec 2024 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735666316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChVdaZEBxgvUA4UbVcQXFzc7IvJlOB+v+/6/CwncXu8=;
	b=LLR8FQbGSTY1urrsMYZ40HhE88L3TgovjYUSXNjHy2izY5+9mnsIYO87ifnTIXq+HnHcYJ
	5Ec3BAfI9j2PqF/e+H0TXoAvOZDu3fozi9TcYrSZ4P5GWsvfUOTxmg7a5O+7kg2bbajyBP
	4e6wR53LYGGwhtW66+Mf6rKUPxOYavxKtfUVIfDhtNf7EeWaBE7IEysFGxx/ZGJYVaaMAX
	r3ypAmg6ZDvfywPzBPf0VEXDc70/2ptDDf/jY/hHAZ4wKhG42M6RD4mXS6C6iHW58L6C09
	v8ND2l9XKQBhXQOqXL2o0iDuvMqWhdJ99N6qdz0DQUZ6/98hD/mvX3DWkfvO6A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Dec 2024 18:31:45 +0100
Subject: [PATCH v15 2/7] drm/vkms: Add range and encoding properties to the
 plane
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-yuv-v15-2-eda6bb3028e6@bootlin.com>
References: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
In-Reply-To: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HyvmbiXZNdWLvhYkgRwbhVQB9LKmC17XVJjEGeUmRrk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBndCqF7pxXZhQWtZksZZvJvYxNZldWBKVPq7Ue7
 HuUVuhTo9eJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3QqhQAKCRAgrS7GWxAs
 4iKMEADNMaXU91dLJzBGn90aD3ErSrBQL+J3Fexgx/0drCX1EOCHxw1ItLrMClvo+Bd7NRCcnbq
 WOMYG8xLRiJwVWxzjBYwCD4n6FxcDE7QXTNJrOEzpxIRiQEpTQGntW5xh/KRp8iJjPuSaiFoIUM
 g/yUZfYlknmq6daXMtN0YSvj3O7KCbrNS0m0S2fsnxYqQ0MpBB/LAM7+rnv3A2q1V0Ex0tj4L/b
 fBHC1v4aWzXnBLzw8zVv6PWKdNl/CBytX3okbkYZr265lQ0VF3eoKCoa+ZSgEbNJbGMCDR4r5N9
 HP48/LF5aXLa6rHzEpu1p0k6Twk+0zvbxKlou9U7/wL62EkEFmK79F7YV57VISGfUYUWrlmzMqD
 0gt+Ms7s05CxBp4aIjbbZaTucPm/XZPqVRfNUeyfasOD/FNBfCW/aEj91s+Xd3DQt+O+INEBbFn
 Ka5eJsZ76AMtLSWCKqwsYz7fr70BNppSyYYakyq25h7Phx3cE/RhWZD/M8VUS4+qaxX2RyywCp3
 XRAYYvl+sLQ6x8L/u9qZMqoxNtCiQCZIv6xpfgOW34cb9wSzkITY3+j2pxBXQw9/UQ2cKX+VaL5
 RCEP9wCaKXinlt0OdD8yxoa4TPm93ynCqlocWyp9ukhZhKwASJRi+oMYGTSATWdafgK2HavcU8F
 pdn8jKIDNCyG3sg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that the driver internally handles these quantization ranges and YUV
encoding matrices, expose the UAPI for setting them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: retained only relevant parts, updated the commit message]
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 10e032e146f093d0fd99a82c7b58d62a0d987fd7..e6ca8f2db32d92068ddba7eed92cfae0d28cd45f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -218,5 +218,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
+	drm_plane_create_color_properties(&plane->base,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT601,
+					  DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return plane;
 }

-- 
2.47.1

