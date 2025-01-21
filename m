Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47831F0E4B;
	Tue, 21 Jan 2025 10:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456499; cv=none; b=TqhVFyH04EfRQJpKO85mWYBiynXV/AjRf4RuNr9U6+VDHi33UYdedV1oiz6ek88s1iYoWxUGIvgX4vibY3tGgvqrNb6dFlZ9byby7c2ejOr2d2vHiYrMbkXU4MoJX+5BfLV5CO7tY9FXTFiVpEtBPSA+yiVAyHNBtMtF3PipBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456499; c=relaxed/simple;
	bh=b1MaEq8Wi18MMzTH/To81KOKPxEOU81QSPjiKxYPkek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l96haYGlUch9fMwuqDUC8eGudPpLeEKQW1gNyMOqgipFz4eUkJaCh/B12Pg20DgkHMzcX63jtK5r0dVhKlYmOKjO3CNRtk994tM86mSopreH1092D8cej9nl7EISFf+VzsXPrXgPI1p8StSj7K2jR0OZbQhy0Pv1UPMS187iKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M2k7HUdE; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M2k7HUdE"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34B9F240009;
	Tue, 21 Jan 2025 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737456496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1roDM4z3PzoAc0FC+uMQ2aY2OcRduLc4tYzeHMaTk+I=;
	b=M2k7HUdEgyX84G1K0FTG1rrt87WWPP8FEYtTEOPil4B0BICDM8OMFVrUeqXk4u+PRmNeSU
	8NE0sG0V3CVUSUIV4R0paB+0VwQZkC+YK+FQU/pAMhdbqvojLbIQrIzwjPpssqx6+Q5OgG
	4ULQLS4c5XTYI0SzsvjMs2/U5zVNUEyt/x3x5hINKKEu2xIGDIn9/wCZuyTiAGiyFazwUI
	vrgW7l/yNnV05kYeDCm9a/D9GJ1UqNVnABXTnPzogTdx9YvcacsgeSazKGfvvIvzZjruqG
	LFDusiHFPIbkJdTSS45Kw3dHBhwzU9fmI6R7IqEAtGrl8JdKnuibZwBm5//kOg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:48:04 +0100
Subject: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
In-Reply-To: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3to4dmmxlUDJZaBX3HNhTfZeE3zHyl7fjgpN
 FXw8uoq1jmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497aAAKCRAgrS7GWxAs
 4ms+EADQVhm1y02fdmCDSmHyne8/ol+zTXYiPs9S1CftZn/s5SeosxJILJUAMn7gCPJdyE1NRhD
 EUksDV7hJK0C/aqKqrw9YISQC4ryf7EEJD4epxCZONsQCYBvwA3MpRXpWryuUCi3TN2rtyZeCOb
 XmuaBnV+MR4GHQ84PO78Q6Ffq7QxcPmjQHTOlaifjVuAxAyW7saIOtMZn7AL1U7Z99c7bJZeREw
 OmEQBUg2+Q2u/Go7jf8CDJalX5zQ28UgQGog4q0pX/Iso57n0gxY+D2iW9AHB1hNKE/2tL6oS8+
 neH0B20aj1FmUIqN7+nrR4EdcQqYmf3m5hSOpmb8FqY8DScq/F8lNyi0jPj17FApE6fZvkGKFXq
 9MkNPE0iteAawcQL3pPuxgY942MTt64myX0kCbU6yE2cvLU8C9Xm8NM8Uvt4bZ4uLFL8HvgnmjZ
 fZ1vFIISRrHfjiGJqhGS3q2CsiQ0g/lq7irUU5G634ohhULEBbxwSFTRaCvs86IDO6f1/6gbvwJ
 2ekMXeIGrhjvWyn4jQLaH2IbbsoKiJYVMDMaaqCMiUhi3OLUKC397TqdsjhUresMqRxWop1hzuv
 7QHuTRkhvgtUoEnQ8OlejjawtZrATUvjycSEnql72Lf+vWTj2ejDEezDVubkpVTrCEBSre2VXgK
 rd+ZibCEJ4JE7vw==
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

