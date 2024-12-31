Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8811ACEC9;
	Tue, 31 Dec 2024 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735666321; cv=none; b=Ppmcrkx4yeN4yVx7Nag0PUDTgPq4gdfry4AatRalPIdORBwxMs2qwonHj3339VthJuG5AVcSfRnSlLVNwQuX1tHwoCIZEufcc58L5p34GbR4EhVQoM6D/WrfCWxtm32f4Kz9PUbJ3xqSRNvyPI8xM3u90kSpQquQCuqNvKMAj6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735666321; c=relaxed/simple;
	bh=b1MaEq8Wi18MMzTH/To81KOKPxEOU81QSPjiKxYPkek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eq8XoCm4p0c7XppzIKfQCiwKVT/AyYrnjOWGu0LwMpLz2a3erAE1ACPhwvupXUyj0rMUfZTVS7e8WNuWfYYNcLCUiTbjTuYuzkezr1W13mkkNL2ScXS7pAfbQhIYEBLjDOv6D2PvPtAy+9N2Uksh9pTBjz8nhny1Nb9p1++/Q4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EiesN0VM; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EiesN0VM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63E6BFF809;
	Tue, 31 Dec 2024 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735666317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1roDM4z3PzoAc0FC+uMQ2aY2OcRduLc4tYzeHMaTk+I=;
	b=EiesN0VMzCSa7SzpI7m5X0t5TPr2YH7D50rJuLPCM6i4Gxeco3tCyO6+smOp/Hxyz6D+RK
	KbW6qOxuuOg2jQhifQxcoLTSSV1mAqvinpdUJuE1X+bSTul5Fc1fidXH65Utq7ES17nB/p
	e8CU+ON7WpSoCdxV3mO3ulEsM5AoRih8nkpYxxRqWIqi97321FRcFj4SolVvL835FGjUvr
	Kcsl/XCo8jMIuFfa0ww+LI2eMC5IHH23Ir2n04bP/XSZlrGWHJDFOHP7HFz8Od/Y6CPJN/
	qb07cMjDeNLyI2R7ZFAKtMNV15vzZcR4iBRuWGBO7GwwA2cNUIwz75HfLBRJ0Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Dec 2024 18:31:46 +0100
Subject: [PATCH v15 3/7] drm/vkms: Drop YUV formats TODO
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-yuv-v15-3-eda6bb3028e6@bootlin.com>
References: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
In-Reply-To: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=scn5WH2D0SZUmHmqTUnLEUslGEChLv0xkTXLyc9tyEc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBndCqFr0s8fNyXsNU/yrBFIHH44ffPHI1kv8imD
 pdemdpDWHGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3QqhQAKCRAgrS7GWxAs
 4m4kD/9ESc4kdRTubOQVYgm5LoxsJmN2yGuZpuxY0JNE4Trj++fEiHCbYY/qo5AbxBQoVVTkCM7
 yXva1Ok91va07PPWDtjOacFTd72ImGv9otkMoABkDczOIp63VFOlssausngVUQOo+lGaCYihF6/
 ac294LkAkj83IAxL5DqCzGAPEY0pmNGacIbOfgWnBt/7OsNni4Znj27H1IVEZ/Xkf/nvHnbmAIO
 YZYNF7WnbCsL4eGPDanjOqpySgtHseIKMCqxC7dSr4aVEPu0QrG2unt4n5ZZ1UyNKPINQm0gRgh
 YVH69aBYRo+CvOXutIjqmDaQkrX8YI8JXOIYRUTTXnqZeHpa57gEFcP1bk79ZqJy0EFIvWLv5xO
 8tyP1Ya3GEwsAPS9zx7bWwgePboz0fxYZf+IIlwBf9bx4X6Ee1MH6WHW32l/ui78zYjQ4OI2w7N
 gdC0RArcebcU+YbXmekSzZGEQiNLGytS/7DDSlzG38KPLSHCK9zi8UJZqMtbNO3Lz7qYE2QPfKQ
 NelFvsauin5Kl/CNLk/LpwcUl3n7TaZd+AL3a2dlbQvzXypT/nO6tOFkxTVdxBzuPhbjjFnYSg4
 BUOJ2ZgeafQJ7g8WirlBNZ/VVsrt99n39eBmfj/W9UDWqZr3FsuYbQ6a8cQxShU52PU3Oe5Gzhi
 8A677OE1GuZLqRQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

VKMS has support for YUV formats now. Remove the task from the TODO
list.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
 
 - Scaling.
 
-- Additional buffer formats, especially YUV formats for video like NV12.
-  Low/high bpp RGB formats would also be interesting.
+- Additional buffer formats. Low/high bpp RGB formats would be interesting.
 
 - Async updates (currently only possible on cursor plane using the legacy
   cursor api).

-- 
2.47.1

