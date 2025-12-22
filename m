Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7731C31354B
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398286; cv=none; b=q1/jgdJMvKLsgJfa6955m7Wh4Gtsj5wkkkCwH8dPhML0FqYrfRiepfrYmR7NAnMs1+Nz0L5jFcCfQbYvfLerCuMh0Lto2GoNxMhyqqS7Sv3jBm3GIJEaLt2ULfEltZ6lm6D85B/bZ/Z7JWcvso3N8SGM23HPy/6cbg/AOoJgOx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398286; c=relaxed/simple;
	bh=K38wOBTG/91e6Yb1mIir+Yt1rsf04yjLLgb90rfe0BA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/Q10BY1AodDqZW38dmlfZwk/UcHDGo7uK+G1En1756BO4EZg5/Sw5JDXaG2iBeprWaULtJdnrhx/ReJs4MEAqGNpiPBMACYL76xxAzQpEaAe80fw3MSvPFRlzspz4n7rxCeuarfcfleFMkwXJf1lObKQ2JQm0Dm0W4pe51nqNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MAvTand2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MAvTand2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 605074E41D35;
	Mon, 22 Dec 2025 10:11:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36D5D606C1;
	Mon, 22 Dec 2025 10:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C4AC10AB019D;
	Mon, 22 Dec 2025 11:11:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WhU6P3hf6ihdOZrrfK4WQvf2PxNpGmlUzFEm+JAPP1I=;
	b=MAvTand2XwqPG2hVIIB0F6FOHEgJi/+nrlAx0l6G8YTdLizSU7UieFaxnNHVUcHG58zGNE
	YNhnNvqIMnWNDBlVzRW8uys7YxWuOpeCllrGucT+QpFXxVkcvULbWsKqSF7aBuMQKQACeZ
	lhuR120ytYtMe0DYXLO+OrP2fM/mMxG/8CA4iwsqfeRRyafX16Cxy42IKwg8IRe7HNDOUA
	EcTXWQ3xGoWWDpo/uKVpGzrdDA48lkuN0+Wuj5Bu6w+tUNxsdI5/zkwsPuI5oSg6Wsxo9G
	myHtnt4MZYG1b3rVFAAkMk/y1ss4HMb3e5o6uiygsHw9J14GOZsqt2FkxYGDvg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:06 +0100
Subject: [PATCH v3 04/33] drm/vkms: Use enabled/disabled instead of 1/0 for
 debug
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-4-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=K38wOBTG/91e6Yb1mIir+Yt1rsf04yjLLgb90rfe0BA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlAvLUGPQZwHMBR/TUb5LaWTeklGbtDXi+2R
 0/Q9cnANDqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKsxRAAm+vzQ5iHLsHMl01wgOLVvQhLSWd7HKo
 b/IGpsinU3Nj43ZEUMdIW7oORzWyMUmVHofdC6XL4zm37pPNsu2/9pIhykmSCOzLQsHqmkE2/iw
 kust0y9ek265rWVbn+iQgkAhTdpYAauUEiejr3BgmMBue8JBTTbD4jsTrIBWKGwR0KoIDfi+nQP
 hcj3ZlZxJLRMhq+bETXkVkHk0C9yyDqlOGH7SLhM/bWeUtoUkTE6j/mI3zE0tm7mkP7ZYF4xJEQ
 NqnRoHFb02U3Z6W70bCa9rFzOySCal3zyJhiW8kvljqdEKgGiKTkip79V9OQJWK9qMv8dXSvK3n
 DOxDzxgsnhGTkQDIVvk82FBR4iutD8sEpCoxnFQAnDEXNPbnqF8NvwvrrtIljM+0Jn03ZgelAJp
 8G8BysnXGcynGk5zR9i2fO10Xfq0BCPkXXOb5AE73/2DR7tb5LpSwW8FFKP4oUI3o7A4fiUQKIY
 jHPROp4M75Y+tDJHeLSz1pzKY774pwK+GVkRLKae7ZEDFX7buVHHYkICl0sBgx3Qn/dV6Kcm7sE
 r8Ca9T0nfeGd0DHXRr+RLp95lFZ/BNgZC0gh+uIkou5EvlvBK3v8aQtp2k5EdkPw7NH7G0fG6Bv
 k5DhLvQYiuU+a6tTGEW9LNrDSfxwRi3nkOUCcUGH0SnjOffpMm8Y=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so display human
readable values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index ec0001adc4d1..233e7ad4d45b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -358,8 +359,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
 		seq_puts(m, "crtc:\n");
-		seq_printf(m, "\twriteback=%d\n",
-			   vkms_config_crtc_get_writeback(crtc_cfg));
+		seq_printf(m, "\twriteback=%s\n",
+			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
 	}
 
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)

-- 
2.51.2

