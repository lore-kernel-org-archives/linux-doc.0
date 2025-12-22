Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37DC313554
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398283; cv=none; b=fGQDuduMVQDIqFNQ857tDYXTvYYMVwY4oqsZhEWiGgZreFEUAr9+XV3IkfgO74hRLLWNL6LPhCsNMwqD12ddOhSz3Sj7ylbMQBM+x/hoeN7NEBEi76Ka/BY2uaLXbABpaLCdgWGPS12h51ChHr41CKNYzUPI5aCKkCvUrreS/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398283; c=relaxed/simple;
	bh=g1vbeumKRvYydQoIx12RB5g9ouajWh+dHntqU6W9eGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6/3iWibKilMcsQCzrgOI9aVnaJ+IP2y+BipA0WXK3EbqTCh6AjD4WYnzFCceObRz61ku2kb61kbW2gtE68+tPlZGchWXp0OscLXnTTjbwzlUUeLKCq2E4w1/+4fKP/b0vjaBWTiQI1S+ybZshkik77IMTfh1UlVjvvY95NiweY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RI2qcdOr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RI2qcdOr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 756A11A2371;
	Mon, 22 Dec 2025 10:11:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C62B606C1;
	Mon, 22 Dec 2025 10:11:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36A9710AB0199;
	Mon, 22 Dec 2025 11:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=70aS4LgI4fXlyEns96sw8SPFGUG5N1Qg9z4OxGLWrGA=;
	b=RI2qcdOrMk7R7cOBt/d1ItB2eVcgsRleFIjNrJRQjbFMOEcnY32Bo3IlAPXb3z/vy3VOSq
	RcWatsbAQnKaIiENHbdcwK42YfHROw3ftmO4iWlZ/R1UjO6LUGitclD9bokcJjYvvUZB6j
	BqKcvGXcw+ZQW+a2JlbSC7Sf/mSfp3c49SA4dFVt8ofVbt9yegXdLeCzRsn1IKeO2NiWc3
	kfhYYKwH0ldfYMV4jw+NiJoE1WqtmopJmiUebcR0Z8O6EyCjjT2Yyyy2emlnYFhh2TT2IQ
	DJJeuMBlxBB0Qb4mHGTw6469YwqLS9YB6lbFLNhmJkhfetiEE2dLXCQi+4EFPA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:05 +0100
Subject: [PATCH v3 03/33] drm/vkms: Explicitly display plane type
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-3-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=g1vbeumKRvYydQoIx12RB5g9ouajWh+dHntqU6W9eGc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRk/twntv97Gc2/zyiPUtWL4X09t7H2W7kHFD
 /ZhlW1HhdqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJNhw//ePEOQU3RKMhD342ewl5rDYAb2Pn3TLo
 jqfWNFcyN1Br10R0E/SBUiKx5rxz3Zle6Tr4hkaoxF0ZMysWXEoOjmoOB9OBD2KBU5KpT4+TP+/
 YmsJGdc1bmq15RfJ3/r90xII0nNg7qEzGHbO5dK/UJp578tVnWV16URObD/sI65MJ5K59EbrEoT
 tLRKaBQdjLQdcec6MtTK1ifFGDHvJJOJuWtYUuN/ZWbXVmvLjMJBPX9ljkMH/4pK1o8S0RKNr8P
 u9AEjpCFrPZ3kuuRhiEvbKL0pglNZERdWiqu0MiUz0Agt8pO+okmsmVIjbEiKFrKJXPVUwmLRjB
 vqNY2N2tRPlg1r/xdFViO8nCOTP1LrhfXVl7xDRXWCGGzf0X3dj5EOur+CWAGHxzjYGOursOcfw
 xe0pbI/3ykwvncozX+4W2tt0oUDmGRHGh8VtMKNulqxpWhmcJhpZHmWTmszn/vNzcCTsZtTClj9
 kVusGO7bggVA2z2YGBXn45rLSTr9TmZGAfL5y0x7EM+LmCw5by/A2ppXyUmZbRKmMSfyTuAznLc
 tE8ebEJhhNv7Ks6W4X0CGXZJUGvZuclUPmq6D/q6rhZvV1UL/t6YThtCaACzW2RG3Nlg7OPJof0
 5F0a2inCksb6T4l5iKUBOSFwIy6bUXannuTOWHuueCEwzPOEHIYo=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so use full name instead
of values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 8788df9edb7c..ec0001adc4d1 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -352,8 +352,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
 		seq_puts(m, "plane:\n");
-		seq_printf(m, "\ttype=%d\n",
-			   vkms_config_plane_get_type(plane_cfg));
+		seq_printf(m, "\ttype=%s\n",
+			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {

-- 
2.51.2

