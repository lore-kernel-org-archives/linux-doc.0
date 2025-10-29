Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1DF283682
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744635; cv=none; b=b+g/9hkRwI3aniC5VOPEVrlHit1Igvq7R69Tvqt+Pv4jpvzdLaWeoCbCcAYD16A0LHPrikWAu0rBaZez6Q/WYY33IuvXMyUVo4NGpC/2RVHSxrtciIOh44eilfe+aagsK3PQ/IPs+9NAJvKd0rpQlhFCvT8eZ4UUWVE+7eTMn74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744635; c=relaxed/simple;
	bh=P2YQYyxAPSZpXd/i/92Ex57u+40+oZJvWkUOQRGtaCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxuAUDGzTMiXqbvzvmp7UMMxwYJ+VVygcZMx8YZQf4a1Bq4ksRoooc0/IunJ3HHq/QgHo8tk0/WhubnUeo/uluA9CeKxO24rMIcyx5EcZiC7c5IxCRyZClawkp5pfmX2ng1aMqBuOocvoORYKuspe/yYNm7cayXi/lFwJfpxVrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=boqy2HyY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="boqy2HyY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 20533C0DB00;
	Wed, 29 Oct 2025 13:30:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 764D5606E8;
	Wed, 29 Oct 2025 13:30:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32E3B117F8098;
	Wed, 29 Oct 2025 14:30:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761744629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cp6JpAtoASV5c2ZHnxjic8luGPShZOCddn0tveS2zCk=;
	b=boqy2HyYA56JznCdDuiNlNOggeOQsF3Frvq3i3KhWrQ+s7spIpcfkI5wJK+XYXCSL81odJ
	yHwM6eCo5h6A7KGHbdH5ClVos9BXij50usTPRfE/XYczeeqCs117KzRQvO71kwt83ivJXl
	QqFwbjLbgaOWT0fYCFsgMX4d5AeVv+yMhpFR0JTr+qORWKk+X+P+jjQIA1j8ZqX6Ak9py1
	TByBohiitkS9WENPUWI7ByWqnniro28UHPhzoPj7yEyE6WDcftaQNNjGjMvMBTUw333rkF
	rEeHnYcpxIMCBcHWp8qKBsEb0v4NxvvAfwQ/TsHU5qIpgYM3iLsRCgckdzOJ0g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 14:30:13 +0100
Subject: [PATCH v2 03/32] drm/vkms: Use enabled/disabled instead of 1/0 for
 debug
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-3-be20b9bf146e@bootlin.com>
References: <20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=P2YQYyxAPSZpXd/i/92Ex57u+40+oZJvWkUOQRGtaCI=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAhbpKKqwnk9Jg/KzpwQPyvh4Dy+jCFteQFLgk
 WobJKey5xKJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQIW6QAKCRAgrS7GWxAs
 4pqID/9mS6B6/OF0Gp1LuPZCqXuO++XQs9DYgZauNZX7GaVMhatv1Vb03Zgb+MsYkMaKlgUL2Yi
 hGq6y34EOiPO51oAPafQwA8fOwe+CMwqgxquc0d/1SoDFaYdEO5Gn4Pamr8vm7DMviR9BIrgHrd
 G5+3ZaX6KqtJ9eSdHD7kJ5Az6G4+ynhzC9UgBJkfbv7WUFMJkug3CBtGuGAcGRREoENDwhD7EEu
 nhMcFZrxWg6SeW7tpGY3rbxpsupLzI6ijUiZvCMNvsQ+ElJHqgsD9cs25d92QYdiLiCgVyt/XSU
 4Vq3xV9WwjnXfkilWJFCneL9GqPaCH/k3u8T9VQp7LBr/aFdSCTmqZLZ5X6d7whwqruDNOI/8WG
 +qGVm09+MfAipSGotIInLRNnFzzEaUdVlobvSNedt+YCEQjtm5XcZmv9NR2raahga2LgKN3I2YI
 PLEwqP6utb//9Lvt6IBY8fq5sgG916HDgbF68BnyrUmUR8EqXIrIxffM9V+I68OU/JYYH/rI/0L
 H+ALhVzRDWmjapKiLFrU8arp8jgP08x/hjTHcAkIiKupYLDFF4IEfq0dSFNOZbVavwxcY7YS0r0
 kLCQ81/4f7Upl4Az9M+wxQwoSjzvgG0j6blpS9ZdGZSFK7f0JOrlWhJUlBEkXiTnCijn/y41/AZ
 IoxACUMjL9B9exA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so display human
readable values.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index cfdd5f32f234..391794d391c5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -354,8 +355,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
 		seq_puts(m, "crtc:\n");
-		seq_printf(m, "\twriteback=%d\n",
-			   vkms_config_crtc_get_writeback(crtc_cfg));
+		seq_printf(m, "\twriteback=%s\n",
+			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
 	}
 
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)

-- 
2.51.0

