Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197952;
	b=TBjrshM+kMrDOcj4yUhmrUHPT2AlPztK4ZX1ttsY3ctZqtYj6hnGQgCvyDjxkDpDWWqf
	 bm8pKvexfZCt/5mAAcTHLkvHiDrNj3YUz7kDbC+FoDKUB2lR5RCuBE5qknA/C94Nz6VRC
	 pmTMrlMeE8dcD8MQkDw8aoAfnWnsR0sPK69S+/YK40+cg+HHK0DnKzLdLJubDBculeuAX
	 Su3HObJP2OtbzevxZ8eIwomxu8rxSuHHe1xeh6ftQ0zaPba5sOYRhPPpp4/2d4wwlrYqx
	 uKLhQRSk1CcQdNP2DxIguDoyyO9u1SFxbKXOnvwqnfnyrKE645FVkCFE0YRMC+8erew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197952;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=kU59R9B0ZGj/DStFfGWYpgpeLf3AWqEZ6qiHgIV7BCA=;
	b=xbqWJ2tEsP1hYym4YhTSsmFC7OUwT9fJEJ21JxsTYMKXAui1U9gZMiigw1Y1Oa9PWp9P
	 jVSlVjmeSiZG4XWzRzC4kz94RzobibSWvWMPI4S+AtAUnGUeUfzVYeNaBO0p1dZhhtSMI
	 skmxbmy794UmIsj9IcqrH9RX51I7xKBEOCWJZ5LwHWale5uT7uXsuZfTtqgi0ll9KKZPl
	 62D5UTt4HDkY+LDmeboErpx/SkEzP6Mru5CXuZ8a2TRplOhAOAA5g4ePMX1hdl0xHi7Hb
	 i0bwtexajBaAvgnQpByqrRq/Rswsh/onizeGM/Upz3oliBGpzLY7OJ+FBRPv49CNwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=y2BCqKNh;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6BC60A3816
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 18:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6BC60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=y2BCqKNh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D3F01C62225;
	Fri, 20 Nov 2026 18:05:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E6C601B9;
	Fri, 20 Nov 2026 18:05:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59C8811BC0627;
	Fri, 20 Nov 2026 19:05:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kU59R9B0ZGj/DStFfGWYpgpeLf3AWqEZ6qiHgIV7BCA=;
	b=y2BCqKNheon1ffznVYjaU7wq9bztjkm8uJkl9rbG9PThOjKaGWQjAWyyOqhlIIaqLHBKHP
	MMY+h6DVGcXBa3O7scAsl2ZJMysBBPVzMJIpisjtfKmGZPqjm5gFa8FtR5o9moVX4XqV7r
	iRrx8UTK8iQnenBZurymXDuQuw56I3yW6PHDyQihgerDmkHpeINpCEjFYNiMEIBRnoNeV3
	sVovF5quScr6kRPozburMZp228wKl6pVpvutw/R6bBakHfMPEgm8Iofaf6JlX8zvhZp29a
	93zruCoKHWyHKN2qMPXcWdcS1mVyAaQbX7pmSq54xNL1Ev98SkCK8lF9z7cDBA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:59:16 +0100
Subject: [PATCH v6 34/43] drm/vkms: Rename vkms_connector_init to
 vkms_connector_init_static
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-vkms-all-config-v6-34-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
In-Reply-To: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=AKXomGhTkxXeXR2/kPMqrcFHY6V0nkVDYPlGmwIr1i4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIsCE4I/uPsDxWviWLS0ZrjBLOCTOouA7zNbR
 p3lvay4M3OJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCLAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLzbQ//ZFy7J1MkThCl3HJqzZu38ximLCGmQ8F
 77reM1YrrVVfBKwXjKBKNSR8T6bkvOWKixvZQb7wL1Sw9KRcv85YhCxpyIFzI559b3UnnzyiQpr
 9rfRPXPVTD+vFDE0Ar/4GTr/3XmBtCJ+b2yYco/l+TbcKQ21t/rQpruZZOLIc2tBFKpDbAga6MN
 dGK7njWF6yTL1f/p4brU/RoUkCOM6/W469p/AQhnwR6Mcb4/FIOcM5CfmGuaO0226eCHgbpmDhJ
 6d6eHWXtnfabftrvjOnBdaaEwUcVhCGSnrDyh+4S2acINLejw8PmWdUw/dvDZ2D+U+OkQGtmp53
 p8+/DR7Xrdvb9ON8s5kPPb4SE7dg7qyL5cgO+NbeoYnnOjqYupWZXBDKm83VCX8njPezPH4CpC0
 Uq8SOuuPU7aXXmRogUUOewFpdHpgZKADKfmp/sg+6/4ESfc21BzaznlcKKfikvFAh5/N+xe6Ehu
 EU0iIGohRT0S8Ku2MhOWYnUNbRmCkedfkW2JkqvfIrBX0uIOqlgKnuVx64UWSDMIFG5lmk6gwlp
 amerQfnLKWSMm4hDizumVpnSC00aGjMcENKpAHIomTfXEuW2U8NBi21jK6CS9xjbbtySCj+zkHa
 9Os1wlm9rn7z5D4YBOlxeKNFfjTInx+7NusMi2VTeN0+cCCeZk/8=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

With the introduction of dynamic connectors we will have two way of
initializing a VKMS connector. Rename the current function to clarify
the case.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 5 ++---
 drivers/gpu/drm/vkms/vkms_connector.h | 6 +++---
 drivers/gpu/drm/vkms/vkms_output.c    | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index f5e99e77e84f..64d79b778551 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -75,9 +75,8 @@ static void vkms_connector_static_cfg_release(struct drm_device *dev, void *res)
 	vkms_config_connector_put(connector->cfg);
 }
 
-
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg)
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 89d7f3a15d6e..61a8dd55d7f7 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -23,15 +23,15 @@ struct vkms_connector {
 };
 
 /**
- * vkms_connector_init() - Initialize a connector
+ * vkms_connector_init_static() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
  * @connector_cfg: Connector's configuration
  *
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg);
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 7783a2f6d343..2b0f7a8a80b5 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
+		connector_cfg->connector = vkms_connector_init_static(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);

-- 
2.56.0

