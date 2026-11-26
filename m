Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692639;
	b=zJ7VXqoDoxGshebBz7zCH3ggC+SVaqgIV/ab+bP1qgaBnw7pltRREBSvy2s5dPCetF5E
	 k7mslUuUaAUU4nb6cCvu3U+QikGKagrYLm2bqIXUY8EYTuiwk5DWMv02q5T4W2GUdzEW2
	 6I7CLdTOujwlJf2rduMO0J/+Yl6ienFZvhB2QWVopYETCN1OJA4t3dszmROjEEF7h54GV
	 s4Zzi2ORjDLsgBLrbVjkOmhUxZC5W1vZMOhRciGCkM17XQ1iH3YSMDVPSnLjib84N8DkI
	 rQpeLi6GQwFwpoe9lrC5KxAndButKhi/llvHtuuHAc7b1J3JD2+9rnEirhn48mKV0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692639;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kNWbgG1NcKqDCdeyb2r5j7Nmki8UuEQN0RHaJLzY5Nc=;
	b=O6c+7T82413hfN6UUdSP563U8d37XjcayjeDfysa68LRhz2U5hkHXcGXi4dqC9YUMvTJ
	 LJdPacBqN42asdXkKJ0wiojESiVMes3ZvwjRj9uvNPBlpUGQggSft05MmFH5hiYCBWa0T
	 QZCTeyhF35S4j2y+U9lirD5dtz64JWZYd+iG8QY/lDxuo3YWYkrnzy2rx6fTELJ5WyYXK
	 T3vAcQtLX+oEcAxeBUmx/ZZxU+vgvaIopigeT0q1PCbzJTYqAOEASuwKaxYT9vBPBFz4U
	 +0YLZMTF/FMUyuHJfObAM0AG/jDvyFEkEtBM5Hv62e0wz4d+mi0gWYqiYQd7i/JVhag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BXE6u9DJ;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA7606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 11:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBA7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BXE6u9DJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2218C2B9C9;
	Thu, 26 Nov 2026 11:30:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D99660237;
	Thu, 26 Nov 2026 11:30:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF63E11E6B302;
	Thu, 26 Nov 2026 12:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kNWbgG1NcKqDCdeyb2r5j7Nmki8UuEQN0RHaJLzY5Nc=;
	b=BXE6u9DJFOFCR9Rjn5UFGe3N3tbbehfthjoDA5iP91qY0pmSn+VttOc7k+J8pD1qHQLkZ+
	AM7WTBLkcY1PjmUK0TR1rsAT1F8qTn/25E1I3IG/bw6SnXMvctdMJ/oxXUB0erGamxcBv6
	GHXd5NOgmHSy+NnGr0EUVOy11Cc1CXsTtH5Zm01uAJtlSV4As+ASgdwzxbhF5rNog3XWeV
	kjPWArbHUegUMuNFiYbz3UMNFkH2VNK7Nd1BMsiKGaVzAQ1iF5t9BZfO7ElEcZaa86bWcG
	3P/EFyoVn9KEFUZKpYkzbekNhm6YGhdAJb5Gr9qMRFAI4hPaV1WOtBoOzdFpYQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:57 +0100
Subject: [PATCH v7 14/43] drm/vkms: Simplify plane_release code
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
Message-Id: <20261126-vkms-all-config-v7-14-21194cda2468@bootlin.com>
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

plane_release  code used multiple intermediate variable, remove those in
favor of direct access.

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 6bb24f5835db..c57791df72cb 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -331,13 +331,9 @@ static struct configfs_attribute *plane_item_attrs[] = {
 
 static void plane_release(struct config_item *item)
 {
-	struct vkms_configfs_plane *plane;
-	struct mutex *lock;
-
-	plane = plane_item_to_vkms_configfs_plane(item);
-	lock = &plane->dev->config->lock;
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
 
-	scoped_guard(mutex, lock) {
+	scoped_guard(mutex, &plane->dev->config->lock) {
 		vkms_config_destroy_plane(plane->config);
 		kfree(plane);
 	}

-- 
2.56.0

