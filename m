Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692648;
	b=yMIWtxDaScj2XzS0fAenX6HOKtEabYi9uxPV669dHZIWptgXieiH90fPuIZ/mpdlSyF1
	 RfWX348pBjGhRRAC8gklaNPza5RV5ZV4rBldoMPQKoe2hkA7bPm67KlI9c5QsSAHmot+h
	 m8Yndikk8Gu9HxvldNDRH6qQLFZSJeYjLYikWL3b6SowkLm0JUZiY02NO08WgyethFmUt
	 vzj7DePP0RqJ0VpXTDkqE6Ym8Gitoba3tOTdUah1+VX7K0k+VqBN7ne6tig6VfJ+UxxeG
	 3sIQF7K/pxwRQmhN8n3pgOiqaVZYcFj6etphG444tINYElxXYg1+v7rE4NMO6+c4hgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692648;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=/7MS9J+9UjzSfC1l1hCVLtNdoQD8d0wRm2L8O23PiA4=;
	b=dNz9yXCL/HVqeXvcD+jwnRhDDV5tEvMhURrtkO07jA+k92D/78EXk882qF842GOQDF6t
	 GaE8Jlva5Nyr6hIVD0zbd6rwirmH+cOU0QyFJ+IyRJUNou2eegNywDukWYTq3ZrciSw9l
	 elaN94OIQ6AL2j98oN8c1ZMkGQiVZqYxJc450ru6CK/dQWJdisE3D1ANVX3JM555pY29g
	 l1ikESMV6jgDaYgojGC/uvMPOg+nIVrITNjbKxLoBG27vbyA27BffDWxKcsCOKYZtdCmp
	 n8lhHJtjvq4BHeX9S/tjp0+oyezlvMbUr0nuwTWQQWxyOAlBvzBMNVgXhtr2BqX5ybQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HcGuaTJ6;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F25E606A330
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 11:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F25E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HcGuaTJ6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B886E4E41693;
	Thu, 26 Nov 2026 11:30:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B0C560237;
	Thu, 26 Nov 2026 11:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 402BF11E6B324;
	Thu, 26 Nov 2026 12:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/7MS9J+9UjzSfC1l1hCVLtNdoQD8d0wRm2L8O23PiA4=;
	b=HcGuaTJ6n6oDtDGuxZ0SQ6kQ3dUru2+qHG0DxR6aRfEui7QL3gTx23iZYKZpQ3CDK3D8vK
	mEkC5HkSsbUu9XFWtb9p5XOpwB1wzPGPvik+iJarX6aJGiNqGiZVFDEu1/XPlE4x9YrNfw
	pxpsqkV++11Vn7oIo+C86YwLZo3IAQ96gNJHaruz1Q/TM/G4ls1MLZDElaPQDEDFwQ7/RD
	4mq06iCVAjwSrGRE2ph+jzH9f9N/6rFAZvQ5iE537LAtDyG/kKBgr3tmMDDEZAWRJSISYN
	zVhA9E15nB+4yk3IvdGpv9AtIUAZ+dYakEwYzNFEHWTLs7KdJpvg8+CeLZukqg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:58 +0100
Subject: [PATCH v7 15/43] drm/vkms: Explicitly display plane type
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
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
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.17-dev
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
index c5d90f7e934a..e933d61cb526 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -388,8 +388,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 		vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
 			seq_puts(m, "plane:\n");
-			seq_printf(m, "\ttype=%d\n",
-				   vkms_config_plane_get_type(plane_cfg));
+			seq_printf(m, "\ttype=%s\n",
+				   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
 		}
 
 		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {

-- 
2.56.0

