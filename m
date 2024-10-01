Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973B33F7
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727745397; cv=none; b=J/uu3mSL+ZmfN/RLQ0uKCW+6z/LHz6kIvWqVaLIYR57fvfagw2ltPgLZ0nK2GLUDjpDMiX6GVwRh3lHk03Xyr7fRaSpuNBEzKDsjC6g5FqOuMy1ZkioTiFU1mvt4KcmnO3aLk9Ul+g/3rE91tY2qy9xdBQrLdUVOUioKa/XqUCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727745397; c=relaxed/simple;
	bh=Zu6cgo/Xo6ZKx870GI3TUoBzinzwawYyCgh0RUs8DL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfvYmaKhO7A5mYn8oWEO0Pzl0T+YGsBykcCAeno6LBUJc05f0ZRuCLnhuoriHin0UR/PzD/KLg+cNX99CByRKrbMM/qJgOVjzZ4zB7SQ0xuhLB0wSPum1bMPNHSryUb5b9KjG46pu07nKbcvCgpGDwvvrO0HS/3zn2GaPdQK1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=xAM1UiF3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="xAM1UiF3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-208cf673b8dso50474165ad.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2024 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1727745393; x=1728350193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nbwMiFAr+Z16mU53YheZTsxf4FRwmHNw4rDavq7J5XU=;
        b=xAM1UiF3bdrCAFeaoWv1mQgHcwvCymGU58lgSi1Zg+TJWloc6Ia3Md4W8iEnvfvOiL
         3V9bxc4lq3ioBfJvTF/TKAtXXa0HGnkCMZrB/JUld8K1M+X4x37VnaXbsvEsyQSFbNz5
         y5t2lfIrX9AcHa/ETqxTuH3SdrG3sm3KSIMif4Z1VkHd/A4ZI7Wyl5/0irgPuDEUx2lk
         Ac0gNGlRjVJ/946GB32qh6kB89D6jA+zpZRjdcFriVcqj1l5LDI4X6iHYRefqWYuOYC1
         7h2uSWrIB2i2BJzIrPsHpxmcmZoBtufRHYqbcdVICnsgCIjrVz7bOTnASEY/iVELVJrg
         Vc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727745393; x=1728350193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbwMiFAr+Z16mU53YheZTsxf4FRwmHNw4rDavq7J5XU=;
        b=my/xQb8KgQxoF5Y5g7FougJM2ilHE5dRQneEvbSTjR4w2FnT/8zVR07i5jOySmdVR9
         xqUqJaqL4gIcgsl1MRzYqXOX5909kWt7gKpFgLAIXpS2yu2w4ufmqgAAr/W4quM2v9LU
         XmS+Ydw5NdrCuRS4nFg3IXO7UMAZI0QFCBAZ/hqsY85fM8DfetGBIJIMSuX9Y9RvI9Pf
         0vOkGw7n5ZMhjTlYAHxuluGTjCb88PVOdfuCdV9WGkNAKed1PNpPKnrigsrNZEKGWPHj
         xauB3mOt4SiIWBUbNaMP6lrS0GnGeq+ryqf/VQLhWAocki9r1Dzs5yaB5aP1cF0q6WOt
         CtWA==
X-Forwarded-Encrypted: i=1; AJvYcCVfubl9YeVjzQEa0pXDLb0ctGExtqNVWCZTtJpBTdzUt3LAWkeNOBo6YPpW4Ln/gN2AhBvj3VTWkAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoiXMCaXEAbjZKEPOATjTOqCyKDaweEJAWBPOoJLpv0cwvMa/
	HuubGbz/5/rrmbwwTdOf/TzRfwF3Z7KvL6iyiF5F3FFAaXSx4ShrQgfwEUQE+IE=
X-Google-Smtp-Source: AGHT+IHAHjzt4edcj+TAa1QxJwtc9AoYzlGYgtCj4uZZGhnsYdVKDndWfUc1uSZJwqwm96AY9Xla4g==
X-Received: by 2002:a17:902:e74b:b0:202:508c:b598 with SMTP id d9443c01a7336-20b37bcfa36mr234462425ad.59.1727745393080;
        Mon, 30 Sep 2024 18:16:33 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20b37d5edc6sm59922495ad.28.2024.09.30.18.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 18:16:32 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (max31827) Fix spelling errors reported by codespell
Date: Mon, 30 Sep 2024 19:15:17 -0600
Message-ID: <20241001011521.80982-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Below mentioned spelling errors reported by codesepll
were fixed:
	respresents ==> represents
	signifcant ==> significant
	bandwitdh ==> bandwidth

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 Documentation/hwmon/max31827.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31827.rst
index 9c11a9518c67..6cc5088b26b7 100644
--- a/Documentation/hwmon/max31827.rst
+++ b/Documentation/hwmon/max31827.rst
@@ -136,7 +136,7 @@ PEC Support
 
 When reading a register value, the PEC byte is computed and sent by the chip.
 
-PEC on word data transaction respresents a signifcant increase in bandwitdh
+PEC on word data transaction represents a significant increase in bandwidth
 usage (+33% for both write and reads) in normal conditions.
 
 Since this operation implies there will be an extra delay to each
-- 
2.43.0

