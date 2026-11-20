Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197849;
	b=guBTF/3Qu6q0UsOgs0lVrkrHLV2p9rH/pFWRxrQDk0dNAkY1v2sv0UOGiy8vm1gOfYHT
	 Erx88aH5UCQOwZ7ZK61qGGazAG5h9cdkCTC7pmLVxApexx/sEv83DT9/J+OgWIsvqgzXM
	 4Hi9f1eRoZyp0q4YRa3V1v5hhKOW6dytaKuH3KzVMuYcxndKvBgbplsu2OZ5Y9DP/Bz47
	 BpH9nchlfx56WhfVJD4r0lAopwmrgXmM3FYm9GRJ3dY1dOjzG/ecymlnFMZ9XR8d5fokN
	 p0x4cLUgiKuPzZFoiN+rO5jWbcBk7+Q6Ctlp+foBG5l6ewLMrLvRi4TrIasMg2WPyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197849;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=cb/Z49GOdF0yhnrGMPBIli0QFaYOE4T0zI22A2vgSV4=;
	b=GTEwpxiCzD+8QN/2dbUVuPcpMd6KBKYpy9c0KXCKYNmLj7eLNpzG9SyDwwreY93nYwGC
	 VQ1YMxHKRaEs9/I0tj/FxiZI5JTN/sOHitdWCRY6dEhiCJN3YkjbRwa1daqba8EcZkYyD
	 6YGBROKg9xhhCXqKdWzxTzFJ6wlZHgQXxXvrBchDpH6oHYpu99Y/bPnBg3Mb3cFUJYvx1
	 754P1/KHfU7dSW2Xj8oIhbzrr3VSfznbqcRAtu3sm3thCV9qBfVKfncmN1bJNyLa6HiRx
	 PMMJ9c4IztBnGTAbZkv9LGo6qm00jJ27dF7+pHUN9E3UOry02MIEllAbtvXrWoSMRYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="NsTyS/Z6";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC7D60A260C;
	Fri, 20 Nov 2026 18:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC7D60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NsTyS/Z6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 15A5A4E41690;
	Fri, 20 Nov 2026 18:04:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D84A7601B9;
	Fri, 20 Nov 2026 18:04:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D67A611BC0627;
	Fri, 20 Nov 2026 19:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cb/Z49GOdF0yhnrGMPBIli0QFaYOE4T0zI22A2vgSV4=;
	b=NsTyS/Z672Ga97LeNAcqGw2xk/9+aqknpMHbbFqFJuzj0jYKXyjTT51ndif2xvJIOsJor9
	EJmvl0xKRWgSgRo0TSHnbm6/eOhYQ9VldDAcsJEZKyQzBZrtLSyAoMwW/4zmYuJNcO4RPb
	88jj4JOnM8jQY7/JUUgZXXnI2hfuoRaWh2Bs/IUy1MJGdL4aKSUck4J/sFZH/+iQinxeJT
	6JaIjYClkrsH/k5mqkBL8PEM6zA3I63Fw/4UMyqDfVIJfqCtmcip9OIODgcY8B8m0+YjG0
	EIXc9BAwuh7b9Dunu3Ha5vYoxY6pJ1BMlp6re3MT+IdH6exrDWQGEbCK9NYq6A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:57 +0100
Subject: [PATCH v6 15/43] drm/vkms: Simplify plane_release code
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
Message-Id: <20261120-vkms-all-config-v6-15-78ace90f4fc1@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=B5PM6W0vulahUUbfuhv5KpB093DKmScfUhoYA1BRCRg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr/R7PpFpksTfLgK4M1WsKIZ+X/fHJw4Eo3k
 BptWgtELfSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLjSA/9G4BWoCRvV7ItG+o3suAYmXVBO3mKIP1
 8lGsPLIMnO6rOYDQ+nIenc8oFgVcG987eX7ZNvFRYl3/TIEFOJ6VlKrkS/cy+GKRmZ3Lz7T33uo
 F1F0N/+wNDrJ5f62JYQSdU3aZhNG5XQ8/vJK5EQBXHQwvq3GavSvdp6hycJpyVoFTG9O3ooqKDL
 H4spwX4GVBEB1EpTDhRot71sfH2T1mFgJ0/FcLmfvd3FlyZnYHizXbZ8buSbsLQoo4hA2tSx6mH
 n1JEd0tAaOL5f/LqiqUHWgmGRxgBfIIQWOUbLCsKJwOMcWmgOFHMIKryJqzd8VdA2iiLxMDgfZ6
 oaod4upZewUA5SQo0cvJMjG7nBebj8B3Hr6rnM9ujrSrHa6tFZPfk2JhUeO1IO3oQLxhSli3n5p
 Ulk9KKLdJqNoGlvI4riaFBjiCN91fM5EoHKeBArbOo/sJxlYaT11LTv9zOoCBPvuMt3pupyfhkd
 0oB6ILATTqGuvvOI6dM2cv3sV3ppJx1F5uceGxHrcRWtUDYhl3IzUryQKrj2AJDEl/Awr7wIFhA
 XB/8QBVVS3c7m0yExDht+/0Vr/sUzQKHmCJozkfscLc0hJmw1+TN18IIpbST5Dd2XnMywIoJi15
 k3le8BhyxZ5faMbjkoVpK8kgk6E3MSaQ6NQSONYJBI2VhCcu4jfA=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

plane_release  code used multiple intermediate variable, remove those in
favor of direct access.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 5f5aa0a1812b..a7ddcfd4e86e 100644
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

