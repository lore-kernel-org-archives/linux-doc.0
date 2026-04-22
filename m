Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB4390CAE
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876563; cv=none; b=WhfaXkRASPJe9Q4PFVdGl0+On7dlFgjNEQz6fdJvxQVnLvDoqYt36ZoCDfEairrb6/svT9tKM7xrKTYb+NNhB+/ZD0T97ocUPdZWLk4AZZ0u6MkwbeP2HO295HPtO+g9pTzEWm0cRjnH4uEL58KOvsAFPpOaC+Zi7nuOxwLFK+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876563; c=relaxed/simple;
	bh=QatXxbwayl7ekIDPzWMFO8AtbyZH8hv2oADcMdSEKVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDtiyL55RinEQlV/LLH/Qg/Sgk8SEvCuztCzvDSPZ9ZRVpKQA63tTlIJdL+baKMAkDaYCuJu6AxrmoHY4edK0yHDvatdODccTktsFmYUqCbZgyWottDpY8fNtOIPyv9zmx/ENOKyax0Urbxij0YHcC/KgsWSNlUNZdua8In53Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uE3vKO/K; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uE3vKO/K"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC2424E42ABB;
	Wed, 22 Apr 2026 16:49:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90DDB5FA8F;
	Wed, 22 Apr 2026 16:49:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B2AF10460C1F;
	Wed, 22 Apr 2026 18:49:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ODS/KcKkaJlG9a45UpwMB6wA5ib5OPfBDYu35wZafPw=;
	b=uE3vKO/KnkrGUq+FuMZxB9LZ++ZsmjwURfTlrj/RADKRTjcgFbiNhK9h+VGSSzTnMuF89A
	qutgupIq05S1Ufvu7kU16NR1SY1SJnnEd1VcO8gP+93CSkEAFiZE+iuEgRk745XjcRLVQn
	lC7QkbH2aqpNR0xCYo1fv1q5LixVA+3rUhop6dz0HV1JYB89FuboZW56ZQRrloa7eksjBx
	C7kghHrJ+Zo2IBG3GrKSxhRLQMMAd07lPWKLWYwP8uPjCAjabsPZQQaOuPqf4SN01+V8FA
	PILAKo/POyy0b3ex0tZZadEsgHrSvFGgV9VenocxYZ6LshzjdT2RiSL5NIPzSw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:07 +0200
Subject: [PATCH v4 10/37] drm/vkms: Explicitly display plane type
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-vkms-all-config-v4-10-dbb52e9aadc3@bootlin.com>
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
 llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16-dev
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
index 1fd2ed1167c5..469c57c6d1e8 100644
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
2.54.0

