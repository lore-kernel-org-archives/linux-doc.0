Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954F2BEC27
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531076; cv=none; b=ew4C6+U6Yxy2i9z6emmkRKBGFhDk66ocyvCNrqcHoMGtao2Ryu0I7YMtRHHSlWGRsTqNYCIkxl3DzU5mfvXBPPTum3OQLxw45PJlgupLesAE4FeXFcI/nfTP35iQpdDXXe1mmNM9GCIejlTXdUAX/wYKW04qx4mzZ36fRaOrPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531076; c=relaxed/simple;
	bh=PCNURSQ9M9oEzGIIEaJ/g5ssiOcHUDqMsXA3szlQsCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UyUsGRhWUhmuY1R2Kdm+GzGY+HurkDb8dq2hnx4roZwceBiRM6IBQ2h6GNpcwcP8i7PGhpfQSfMZWglRGiGoTEAVR+ZgWLkFIqlPFPse/Xa4FfxT0t80CfBiYrP/ibxhdFHn4JGa7A5ziPBwQdOL7i+TiGqir5NUImgwKWI16/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r9ETZTt7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r9ETZTt7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E285C5CD79;
	Sat, 27 Jun 2026 03:31:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F27D260233;
	Sat, 27 Jun 2026 03:31:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A54D8106F1172;
	Sat, 27 Jun 2026 05:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5pP7gDXVS4IrT1SvopOsJfNSDHDebsaZJuiZb3S1cf8=;
	b=r9ETZTt7SudsrQQVhRgecGfJ7kZObA3GWuDWyPFqgunvL5gmZYW2XDRwPq+8wqrmR4CDB9
	MOOLQBdYy5/FSGnmgYmAWHLCYhVJzYNXwR+dB1Imq7CmZVNr/KzjzfhODpMPETyCl6SVgd
	OV9QxGCtL1skD2x3tGD2zIJ5jSGigEBhAP1g56wOdEsrLX2Rjt04JWRCT2KeYLI+MWJqUM
	ptWwjAEdk9iHDNOnBcgee5rnnNvgNZSHW+alt/U2PLTMDrIYkNZmcrsRJeszwc9gqNWkqU
	1+gNB+6PpGaXwmpZ4NjyvY3dWjszxMg+CQRiWmgvapy9q/Zvy5HJw2KAXILJtQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:26 +0200
Subject: [PATCH v5 09/38] drm/vkms: Simplify plane_release code
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-9-854aa0840926@bootlin.com>
References: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
In-Reply-To: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, victoria@system76.com, 
 sebastian.wick@redhat.com, victoria@system76.com, airlied@gmail.com, 
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, llvm@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PCNURSQ9M9oEzGIIEaJ/g5ssiOcHUDqMsXA3szlQsCQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PdflV2+zO2tLPFL1+kWYMXXpx4JVWS2ITMT
 CC5S0J/j3qJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOKYdhAAhiMSzJqKUAr/maJwuuGBbh2aQDKXiR4
 86PS/C9R2360gzD8tp2xjapD6qPprh7Fz4f3gOUvtSuU8iYbyvN0iqAd3qjaI1JJY/tu3o5Oqlt
 7bDJNWeemLX1Jvjr9pH0vEx7xHBw3aEGQg0MZTuabT/c4jGQnPFgqYxdWCoYp1bwvOJyHIiIZde
 CNqh4cn/E4m4JlHPw1rffcX/CPvHSauqJ4VyUl29Hp3EtjwSISmIZ5ZliLeEH7mZC/Kpv1vB9wP
 ebdWWE0MbDuZAnHy3PgcQ/x4GXpPeLDcUqiR6PE3Z0RjU/xYZ3oy+/o9aFSiWMJf+fElV4ibvdN
 lJ5ughbF9zV+/OXAQQSfZ17uAYxtLRyZKXr3fFr6wME70kyl/rtPaWFw2Mur7pOA1zZOd/gFl6w
 5K7ebrwAK+/5H7d4hJFTxo/L9NpSVukEK2FZL8QsB8v89fOH/lPEtZcH+Sn+fdcbVyDQ6rhgmhv
 FKZsAHwYeGofUUTATI5DMnPj2469ryZThpbbg0KMY70rNkqXzeJVOID9qVb8ZF68sZwUlT/YLbh
 2iTXGkdvVg1Fxvf4UMv6u/cTql/+ZgdPNB0udITV5cxUiLvEGoj1p3l8peEUoxcOWsvfNnphW7+
 OerIjkBJzgnNeTIL9wXBiAtxXxC7a2hmRM2SDQX7zB3tIU/wrhE0=
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
index 7551b8c7766d..97f87a53d202 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -333,13 +333,9 @@ static struct configfs_attribute *plane_item_attrs[] = {
 
 static void plane_release(struct config_item *item)
 {
-	struct vkms_configfs_plane *plane;
-	struct mutex *lock;
-
-	plane = plane_item_to_vkms_configfs_plane(item);
-	lock = &plane->dev->lock;
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
 
-	scoped_guard(mutex, lock) {
+	scoped_guard(mutex, &plane->dev->lock) {
 		vkms_config_destroy_plane(plane->config);
 		kfree(plane);
 	}

-- 
2.54.0

