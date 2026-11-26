Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692668;
	b=Hx8pcxh7s8iv7OYGNaRrr7dq2VWVle5cVfcsA0zAm55N5qqvc45LP1HYVhIeRYd2Xpz6
	 nSx4RdbxfjuDl3HmMMiBS6UDJNc24kwcVkKTYgPUfNfN/rkmq4bdtdKA5jm+yjWGyWsTv
	 vHXdhp1BHUFoVuoBwYtvdJJlTd5gDxiOD/uwTB/s/Aopv1b9FQIrJsX+ZXI16r1G8Pgl9
	 zd84nsHbxCSzq0Gkvag9zz++868eD99y6S0fGe1YVjzYXxmhj4AJhwBvZDa39skRfrBHH
	 oC0j7dOSxA1tXKrccB7IAZp3EUmidACT3JEuofpu1S+YTqGwkeaA7xEpIgnWcKkSkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692668;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=cCGg30UmX5BF2iO0z5x5TPCHdXBqH3YYgiPBIUEk5Fo=;
	b=Cvcv1wdh4KC9Dqh9Cwd3Iy/q0Rv3juJ7JoiQGW42Rod7NpJx09gOuWtkgJ1nXFkidBs4
	 9XkzAT9V5V1F8gldxQi+Fg51yu2HRk/1Tkgzyh8K8E9AM7IKZBpRDOd3q0QlrizzF1RD6
	 o0luwaS2TLydDvsAoiARPEoxxTyyoX/USCxghvVoOoAvAwRrcdO0hjxTqyW8S4Qp92ZnQ
	 1Ovk49LgkbUE05Zkkwsg8U3/ra/T8delKdaIOl04sin6qQPR5qVe5CwsCGeWfale3AcIK
	 fv3QyIcPu5VoYWBLoMoRVJp4ABe4sh1f2s13Huqc0FYf1nEiq3tkjuvFdJ3TuKSQr9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vgv2USOj;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58973606A323;
	Thu, 26 Nov 2026 11:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58973606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vgv2USOj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 40DF4C2B9C7;
	Thu, 26 Nov 2026 11:31:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFA8960237;
	Thu, 26 Nov 2026 11:31:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5E9511E6B302;
	Thu, 26 Nov 2026 12:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cCGg30UmX5BF2iO0z5x5TPCHdXBqH3YYgiPBIUEk5Fo=;
	b=vgv2USOjIop5CgroQo4QLy0vc98I0O6jX9jtdl+ZfSu3OV9DExOtCP957DoVEUZ3auC7q3
	ifCUgGJlQxIYwnlKdaY4TptJGL9WXdwGBp3PiPpGDeU+fzew3Pmd3S6cv61j74/wq5nqJz
	VGILipgl9/gi2li4OLr7b8oUKhQuy7sTkVjJ5yXyQZBnd/f1A3Qx+JIvtaotSAEYcXCyEJ
	U6imkEvvWiwWEWV+Gd+mWYy0OjERD9hRu7wQE42yUwYF6Svi4c0LK8sCLn1rGj/BgjhuRn
	W4yqX9s6b/i0golTXRd+np71uNeQY3BYoykMRTc0hwYHMZSuX3yuJZB3OjNS+g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:01 +0100
Subject: [PATCH v7 18/43] drm/vkms: Use plane folder name as plane name
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
Message-Id: <20261126-vkms-all-config-v7-18-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
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
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

The plane name is now directly derived from the configfs folder
name. When a plane directory is created under
/config/vkms/<device>/planes/, the folder name is used as the
plane name via vkms_config_plane_set_name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 3 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 26e7f81b5b7d..55e4183046ec 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -98,7 +98,8 @@ Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
 Description:
 	This group contains attributes corresponding to the
-	plane <plane> of the VKMS device <device>.
+	plane <plane> of the VKMS device <device>. The name of
+	the directory becomes the name of the DRM plane.
 
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
 Date:		Nov 2025
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index c57791df72cb..bbfc0c8a922c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -375,6 +375,13 @@ static struct config_group *make_plane_group(struct config_group *group,
 			return ERR_PTR(ret);
 		}
 
+		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
+		if (ret) {
+			vkms_config_destroy_plane(plane->config);
+			kfree(plane);
+			return ERR_PTR(ret);
+		}
+
 		config_group_init_type_name(&plane->group, name, &plane_item_type);
 
 		config_group_init_type_name(&plane->possible_crtcs_group,

-- 
2.56.0

