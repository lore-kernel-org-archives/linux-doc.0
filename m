Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDB038F636;
	Wed, 22 Apr 2026 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876555; cv=none; b=pyOaWxzYHUs9RmoBRvlTshfZQcnr/phUXb3npiBxPVTHTGVwUnJM7wKozRsBbL8hZGwtMFZyG33TqHvAwzRUgEfNdQ/sRI350ynoS59HjbQowMXVZoYzAhYVxU0ctHI6sIuvVt4pK0LJI3+WI0eRgD+aTStGcTB1w/i/yuf+jlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876555; c=relaxed/simple;
	bh=LLCs59HPPrtC3R4f8VpEHvL6MwP8Mnd84ez61GoVGBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJ++HzXlTq5gggC0Bp2dcxnPcFLXkI4c7ZDtmJwum1q2UREfO9DkdvsJ39gFTswWk3yLrBFHxroY3jDtxq/XTFWm3mhilqJf4w6Q48sGICb0WRL383gJ4UmKbxXr0ZtE3YY0HQFolRyHIZs7rco6ev55S1jx0lzteENJQBNXR3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vnD5aShm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vnD5aShm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED8011A33A5;
	Wed, 22 Apr 2026 16:49:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C37685FA8F;
	Wed, 22 Apr 2026 16:49:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EA1A10460C15;
	Wed, 22 Apr 2026 18:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GjZ3Li0hgSFG+5Kg7ETwAe+lLOQj73cG0WZcoLSfcXY=;
	b=vnD5aShmjCsLo7AieSsev83EoptEuEB5B2FG0aYYWcnJkpll1g/WwCgpPaWW34WWiuOj+s
	ltE/awsfBR5UloiYFQmuhNNh/gcjLxdFT3oDBn/jJF9PCVAqehymgVZEB4WRu6259oowF+
	sxGbRWWwtJLo/+Q+oEPRE+v1meNr2c8QGDMUCNCOrXUKejTVAtqhU4rF207ub4F8pZfZj0
	5PP0lt5rsfLxh55jAKGRNeZtKsCZQZ0r+xtdPcMWHLvlrz2s+BMMJ1xkvJNtP9do0plD29
	UhwUkO73v0kgHabBD/CH+OwL9+8pzxpR+6lr/hWSRfG+Eio6zx8aHm+QJwXFKw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:05 +0200
Subject: [PATCH v4 08/37] drm/vkms: Add error handling in plane config
 creation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-vkms-all-config-v4-8-dbb52e9aadc3@bootlin.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
In-Reply-To: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3

For future patches, it is useful to properly handle errors in
vkms_config_create_plane.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 5a654d6dead8..1fd2ed1167c5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -384,13 +384,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 }
 
-struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
+struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config)
 {
 	struct vkms_config_plane *plane_cfg;
+	int ret;
 
 	plane_cfg = kzalloc_obj(*plane_cfg);
-	if (!plane_cfg)
-		return ERR_PTR(-ENOMEM);
+	if (!plane_cfg) {
+		ret = -ENOMEM;
+		goto fail;
+	}
 
 	plane_cfg->config = config;
 	plane_cfg->default_pipeline = false;
@@ -400,6 +403,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 	list_add_tail(&plane_cfg->link, &config->planes);
 
 	return plane_cfg;
+
+fail:
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
 

-- 
2.54.0

