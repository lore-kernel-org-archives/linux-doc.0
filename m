Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692595;
	b=bCO7aJF18YR6kUaMzifgc/5LF5TK1GwKzSvVgiHCK/5l0ul2de/zKQMW4Rt/h6PG9+hs
	 W37vw3Fzg13hpPn7Ft8Mxc/seMg6AMkjAAcpRJSUKTKJLeVBORJRI38w9x79v99tIy3Vj
	 g9kHH8paU+5lZzBb1MODM2qJdDuNwiYmOnDw10IttYvp9d7ImsuQKNctZ08lXSYSIkoKA
	 lG7QDrcQ+LIKnQrCiNyxVUoR2itSXvq5oOjVv9fPcsiR4itnhkHhgDVun8HKwE1NMb0IX
	 2QKE918k7YpifJ/MQgb9yz2igWaW93ydN/ldTgLZ8WxmAN2mNp638FYuK9P4gcoqoiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692595;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=tsyT9UkgZUnEvtl0GenIXAAo6A0yW3kqH8gwmnKsbqo=;
	b=zFYDCEwj+cTNmym/nF8RIjKGdP76ApkNszCikgJPRUpQMZHZf2YXV1MdQb3CNydE7BEK
	 gDO8S9hd7xYZNM+nlC4N3eb4aH+kVdFtqeYIn1F4jYH2Yw+Q/MXQKtHg8r1UHggs18Xrx
	 0maHVeXm/T7zVf4MZ7HiBBXibGalvLASVnyNzMVJcWSrXJCLhbo8+l6HbgP0a9Kws6nzN
	 sagQr+hGmwX3N2RHXYebdQjyhA8LAmXQH63s7G+pxFFbdYUqwdGBR/+gIr8RHkxEmJcYU
	 eWimm4ibew/WZ6lL9qRVWPJsXy7R6V13d3DG2+AvOZ9kgeWrjLDlhP7hpITc/Pdhftg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oo+vzrfr;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBE606A31E;
	Thu, 26 Nov 2026 11:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBBE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oo+vzrfr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7BED9C2B9CA;
	Thu, 26 Nov 2026 11:30:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 360E760237;
	Thu, 26 Nov 2026 11:29:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61D7811E6B363;
	Thu, 26 Nov 2026 12:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tsyT9UkgZUnEvtl0GenIXAAo6A0yW3kqH8gwmnKsbqo=;
	b=Oo+vzrfr+EIEdn/udL8apUdq5PIyceDGawnKgKUgjmwMOV3lONQKgV2ph6IOdFGxZNzJ1J
	9mWSIE0fkT3eSraZotkZBGC21UaOIl1VriWJ5iQlSxluflON2yg2Hvdz6Ps3sd/ODmbMQa
	fPjm2jrON2Sztqwqbt36b5+xrce9+ktqTntguYMmeB/l8rKNv5iiTTwJmmlATrHn3EC/mi
	awN2ncfcEXUvlrCTm5yC6TU9gyNAWoIslbfc8MDdHwMdFsnQT18EwM4YfqTOlCrlCN9qK8
	Bk7Ff+xFpAVvOJTy08Namb/MOZVD9nVYVl0eysO1EAHRbWWcy7hllOoxdCPGeA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:50 +0100
Subject: [PATCH v7 07/43] drm/connector: Export drm_get_colorspace_name
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
Message-Id: <20261126-vkms-all-config-v7-7-21194cda2468@bootlin.com>
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

Export drm_get_colorspace_name so it could be used by VKMS

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da0b16f25ac4..e604d9ea3058 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1531,6 +1531,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
 	else
 		return "(null)";
 }
+EXPORT_SYMBOL(drm_get_colorspace_name);
 
 static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |

-- 
2.56.0

