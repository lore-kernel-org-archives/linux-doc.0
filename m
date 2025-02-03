Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859A1FFC58
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738626044; cv=none; b=GqitCAnTbfsDLqbAODFtQnEiFcHhhPwlxGiUmMFqbduGZQKGaRw4F5ZfWAGaQ+ytnRiTtMbXFc7wvpWx9ONr2/1XUmPsakCQfxB2F0E3GJWzBmjJbaw4sXIA28egH+jx4B8R5Gy+X1Umw0LSvwzjIoDesB9gx8p2HBvD74rEM3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738626044; c=relaxed/simple;
	bh=f3BsEEtPPUV+ajFRLRTMbIpW7jqTWCoT2L5deZD8hy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0XU5t6nx+ogoMhgbjUo6QcvGLzCI76xoRYfXmT6TKYpDAF6fz7KYlb8+rRZ3N1/iouaaqwxlMvzhGGVAVvYTP4fvRjlj9442R+WEKPK4By1lfvzA09XlA/0E13L2cm1wuLBG5OiQaCMXTHqZoWQaYwYj6jczaRQHpuumWiIllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3wl4VBb; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3wl4VBb"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467a63f5d1cso42019661cf.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 15:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738626041; x=1739230841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkxWJ8w08nwsB8NMEk+hWG04tNJwNZf28ywWg6CGAzQ=;
        b=S3wl4VBbzNlbKvLxgsj6CihK402HHHdmnr2GbdA6dZ/2RU3B0sLvtmCiYdrK2kj78Z
         YuXClHbH54G4l4QcSc1+5jyYz9iG17r82G20a5oyNUeZf3Ln0c6kfIvfC0LEWFQOQfxq
         RPEAJeWFVDTtTQk3QIVahvFCv3so+45eoCt7W51qbre3V42u20hai8fxZxO28FBKeaXf
         y2jQoj5qKbPWsvW/9xqvfCAqOzS8gKcXYcyRqM4sq/epmXZn4G2v9rmwCqlACPAG1hxN
         VzcF+2QytaMMZB1qzoXnDceXjHhwth7SIalCglaZPB2jua++C56MbDJzzwK6HJ7Wmlbb
         MVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738626041; x=1739230841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkxWJ8w08nwsB8NMEk+hWG04tNJwNZf28ywWg6CGAzQ=;
        b=caTwDKa7VrvmRXD64BAwV2PCC5cEg/Mj3jtlhesBh9nf8hlneZh2GexmZ0gPGy3xmF
         TC+Dw6wu6bKEMbrYSiOxShkwCGEIztU0Fwa9n2o13AK+Q9yQgUjeX+6fFeHQa0X1N2r/
         JvsUG5vJodAzHfOPR2qLiLO1Yw/04Fxe5aBbDRq5ZMDbanjkPSgtetAUpqciY0RE4oBO
         WAzMTxE5l1hTOzkVNvqPte2UNcFPeKOzGaap80/AD5EoUVgn4a//a3FQO5v9jxUKCoXR
         Q2zdbltNvUhXXtha1Kjho8yBi4GwGwc1IAvedNYg0q5UyiVVN5nqBAlMK7OGCI+itm0T
         C4LA==
X-Gm-Message-State: AOJu0YzUXXVC97wpTOtyp4yGDy2rZUHnf31UJD5mSuNmF0O4oGJCy0tV
	QhoudyELIrJLmSTUj78OkcCt3W0bgO6N4JSlIKTLXUsnjSsiL6x2qLXndluR
X-Gm-Gg: ASbGncsvhdlNvA8HSZdnJ/w4WEI6k6p19BhdWODKR93f8RCkEvtaRMqveWPc8GFnLnI
	vaI4CqfDtUNoFSPJbsR8/FEwJUorPfiK9XfHHhc53EpZ+wcgEIX2K8X9ewY1MlbQPE3qUr0vtmj
	EJtoewBuhNPHOV7k5H/dxXAh/3XyLlhxypbSdgZTYnf6e/y0GsdGpbIPTiGWmYGO07E7M8XsP2F
	OY6EslARTrd4n9AacQ92CfJT0m0Ya3JMNdLY1DcoS+gLKqzBhsQQgkE2uS2D8a+gmIrTocBvSt4
	L3w2WGtmHTUc+bkBEExmGKsdmu7aie4DHUrF+yswqQ3U7HAR2OZFa49uSAMhlWg=
X-Google-Smtp-Source: AGHT+IETJWugQz7QeyhXOvh9JlbRz1lvTUvihDHYshGyEt5A6lRN2z6punlbA1cqEUr6X+bzpD5+KA==
X-Received: by 2002:a05:622a:143:b0:466:85eb:6123 with SMTP id d75a77b69052e-46fd0ac0867mr253104261cf.22.1738626040692;
        Mon, 03 Feb 2025 15:40:40 -0800 (PST)
Received: from localhost.localdomain (pat-199-212-65-31.resnet.yorku.ca. [199.212.65.31])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf17409csm53556071cf.53.2025.02.03.15.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 15:40:40 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: linux-doc@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	corbet@lwn.net,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] drm/doc: fix minor grammatical issues
Date: Mon,  3 Feb 2025 18:40:46 -0500
Message-ID: <20250203234046.5114-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following grammatical issues have been fixed:
- Corrected subject-verb agreement
- Replaced incorrect noun "setup" with the correct verb form "set up."

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
 Documentation/gpu/drm-kms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..6a3ae069c829 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -6,7 +6,7 @@ Drivers must initialize the mode setting core by calling
 drmm_mode_config_init() on the DRM device. The function
 initializes the :c:type:`struct drm_device <drm_device>`
 mode_config field and never fails. Once done, mode configuration must
-be setup by initializing the following fields.
+be set up by initializing the following fields.
 
 -  int min_width, min_height; int max_width, max_height;
    Minimum and maximum width and height of the frame buffers in pixel
@@ -253,7 +253,7 @@ rollback:
   should not interfere, and not get stalled due to output routing changing on
   different CRTCs.
 
-Taken all together there's two consequences for the atomic design:
+Taken all together there are two consequences for the atomic design:
 
 - The overall state is split up into per-object state structures:
   :c:type:`struct drm_plane_state <drm_plane_state>` for planes, :c:type:`struct
-- 
2.48.1

