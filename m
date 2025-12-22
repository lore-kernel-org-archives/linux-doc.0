Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F73148C7;
	Mon, 22 Dec 2025 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398287; cv=none; b=VG/7HSiC2GuM/m96seMcWdlRsCx3IVK35gHl5DjrQSMgEPyrLYFBmz+bYvVsGSqjBnDy8/kjtJxL6g9VLVtDLYi6O1D7N5BEW1p7K3MzbZYf8cGdHzaOXsltu8QccD0s6gQ3swp3lG7GBvhSHPl8lZIqbbw2azyeHW156f5TgdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398287; c=relaxed/simple;
	bh=NJ3vqBeS2HoSwulpqyKvzV1dxHx6uodXMXnq6MM3zjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfmzvzUIkKjgByxeRiTVvgZvN7TgMFVrPFDGEVT/Txgv8kCe2pK26RdkBtROxslDDXeM9aBq4CDVIoJl2VuTF3sg+zRDgU6Xc9migMiDGeeiA7Ce9xFFr45iyHo4/tcIsDXViyZ6qxBTXN8mERxpnE8340oOF9K+PRwGhbrvYsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vEFw39J2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vEFw39J2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E1781A236D;
	Mon, 22 Dec 2025 10:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34D5D606C1;
	Mon, 22 Dec 2025 10:11:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B8F810AB019E;
	Mon, 22 Dec 2025 11:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=enYFEjapjoDSW7/LWjwZVYA1UOdx6e9CfcbRDewBj7Y=;
	b=vEFw39J2HRgnbVVfGs9Vi9L34RijsX+s+UUg4uB9Dpjf0dx7xm7USDKFcTuS4cm49uuyd4
	CXtCI/3FDPKsgmdMUyXzK54uNnPOYRIhyzEFe5e8EJnZl28dG52Q7scSgOq2hFm3I4Uwfz
	Noih+zu6dP1E57dJ9+bP2TaiZssALcLmtc4u/Tm1hNDvhmcgHqDk3+xjRF3nhz8bKHW10K
	I9IjQ0Sslw/WVKmUWRVkyYNTOwgBLXWdhYhbySguVQMFiCRXLmUg9jE1nBKGuVe/ZAcpov
	CdnDBkDR730WoOk4JOGsOD6J7cTiXQznkyxfQRr7t/stivadM9t294fQXsA96A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:07 +0100
Subject: [PATCH v3 05/33] drm/vkms: Explicitly display connector status
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-5-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=NJ3vqBeS2HoSwulpqyKvzV1dxHx6uodXMXnq6MM3zjQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlASXz/vnOxb/7V3x/h6R/M900nX3Ms5V81F
 b/QHLDshq6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLMuRAAqerJ5B0gN2dLF7TIL4nx67rMfna1c5p
 ieDYVtieOS73oVW37sdGkd/wPbbhhg03fiUKVNPKhZZsGwFJ6GalLO/1+DcASqmDfafVJEfbuZL
 5UXFYVv5DJnF/1A/ZsZxJ61LRXcTzO2u40MlGwhxpBkj3A3ML/fizB4ETfsdPMgX5hnVuv5seXH
 HsoTqYSXUaOEX4Wk+dNfF4JqK+SGZkgzD8oq3hfnjyA9jykH6hTVpLdT7hIXo5NvvlW8uztCofo
 Oluh6s4acGtUWFIfgHfzQISkE6gXdUJLo0V2mK2tM9udgfBbxdk8mXHo+eWs7jfoQeno7mbrSxe
 fpo7BKnBw10qLfdHr66d82ihgFp/OtLQjuhsV09C+nvn/jnqxTbulFIB7v6JH5tYQQJeIreFQ3Q
 Q+88k9MC34AHt6cvEmgLhzvurxP8ZzX+ZrZ/d37AS9ZnrZfPgL1RMW4UKpgRCNwbEO0IcnmHISr
 mvkDhmQ0pnHbieMXW5HuG3iwKKL4HXRF2Z/XrqKJ+w+/AR92qW6c/PI/vdxBkJlQw/X8ALiPZP1
 uC+LNd7jeqpcT/ZeENevN/U54RQm2iUW6h8DQNUcm03qMzuSfHBPd2XCV2kjsjWnUwWwUUlQJGQ
 0xqk4pnPztQFGaQxkJfAc04J40jGamjaG4rdEUnTLgDBzOeCKX+A=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so use full name instead
of raw values for connector status.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 233e7ad4d45b..ed1cd8d153c5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -3,6 +3,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 
+#include <drm/drm_connector.h>
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 #include <kunit/visibility.h>
@@ -368,8 +369,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
 		seq_puts(m, "connector:\n");
-		seq_printf(m, "\tstatus=%d\n",
-			   vkms_config_connector_get_status(connector_cfg));
+		seq_printf(m, "\tstatus=%s\n",
+			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
 	}
 
 	return 0;

-- 
2.51.2

