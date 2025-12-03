Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615F423EA8B
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783066; cv=none; b=kOVD7A036mLPXkCHD62V+h3XVD/B+8zEzy3kEWwKoF2yrdqTq8MES0IGh7Kdc/t3eh8+WiBkm0SpImg3rlceetlKi39ohBqSVMpkgKq+mIA8dskKwV3K6iEi0evRwVTRn1l1FRB7JLE2ADsp/VSQkXkW4gIY+X58beGs73zgzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783066; c=relaxed/simple;
	bh=X5to5kJ9QCcHakcSKKmToFYntzDovncX5FCHRRR/eSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mzg+Fy1TQcdR4XVcKrCBAfS+krxgaXMiQUNgqbvBNkAY6yM8cXrc7nmAHlpB6ZX8DS+mWqfahbVIDXcqbLeYm9dT1/hgMvBGwg6QXD60TCKg3QPqvvWYbc7Rgr8oxUNIUYwZnvH9tkr8xddMnzGw3sAJGoRsVHErwfKn6nwef8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/ovXIf4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/ovXIf4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-299d40b0845so58795ad.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764783062; x=1765387862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL2LiGMIjzcKPs2iQRcmiYPq/BCDQfmJT/ipwX2Yjag=;
        b=Z/ovXIf4rg81ny1SY4HzCTxI09VzAl+wys/yEQ+jUQUH/Gp7sXOALW/HZF3x5ivpdo
         wQxd/oCkkpe0VT8t8+/b/YDY6R8qIWn5Psb99LdkYlvuC3h1At1ux+ZWLfflioVFdrOP
         J9OSMx9IFKNARkQxLEhHqoPwmhcKH2drmRXRHi0yitVZ6+eEPyqM9yjbwFNkUcLHRJrj
         5kNzUMHU8dg8YqTwIGshxLkL3ArhpSlpc3WwchG94iwWXzG4dEOsVE711M3yLge0enjJ
         7juGJmYJFBwIcWPpuEoic888BQquPIS8ADzs0iAL0JgKigYhI2PN5NChAbPiWbXMin9C
         h1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764783062; x=1765387862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL2LiGMIjzcKPs2iQRcmiYPq/BCDQfmJT/ipwX2Yjag=;
        b=mspcpT4XKNeqsfNlkYwIJ0ByeC6MmLOnKV8SPe65cSmamsvFi72Ejh5+FDh2M/mR9j
         6o7lY8jqcwos58HyMvNAKgOWv7hIzNlDQTwFuAKGCCqZc3zIzyUNnftfeJedtf7ki60D
         9Bk+ZAHfzZZw4uN+3SNbFMNm2n4z+wQLBS+ViPLsBa94Ppv1AhhlDrYGdCiKB7hrMRnW
         vusrCby2MekPeUK42dwrI74qMaUhY5tsxXkzQ8Z4EYM6azYcD+URssGMbE84DtFyZ1qw
         q+qcwZXojYlEHndh+VDYyxs8BS/pRBITmw5UMlU1birzS7GDsd4Ch2JVVnGseico1E4S
         Elwg==
X-Forwarded-Encrypted: i=1; AJvYcCXdwrCCYU3rgNlzW6FJGxbr3ItANIwdbmBd80yTKyh34me+pm0sWmNdzmo2jwzJQXb4RU+atxfEDyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu2jxMt/lmZX369DRvL4wM6/C/xb80JJmV6STbAZxdvFDitoUz
	vRLdCZyeYwnY1jpYO3ZGGJJH2WTzuw70u/jTWotA8XJOrQRm1uFHFyUH
X-Gm-Gg: ASbGncsiLz1QLXjlALI+NiNR0gx8Ru5Ld3qtIiHv0mHjLbdOLMomWrKqOaCrgJH0I15
	c0ZFEwvFQrZc1VjEOSeetTjTTFb7/M+lx12f3C82xLwX6oBZlPsvh2GS7sHhv5jnfZJGGuNClSK
	zPxyyDqPMMgsHGzlb/Zgic2t+RxKsPYb8+LlOzVItBOopee1o8aY2RnXMArA3JYB4+21E5+mx6A
	EayTC9/wAFXWGTPFf6rwHoP6Y8oWmlYjJalt7lCeKMe1KbNCn2XB3CN6VLwtl0EgkExeTref4Rm
	J/gKmx7qqOMeQKAZKgEh4Cjm5iyBCtFMMtAeM4RNlf2wyoF6oyRT0HGmROXDj3kkwmxbfO4/hQR
	l19lqP6FBhdlhQyD3n/sdfewv3CCVPcQ5F7L+jFZRMpIm1tzFqZF0JCrPu2tNwgthcxor262oCi
	ao3JY14eT6OQeoGkmi/9w=
X-Google-Smtp-Source: AGHT+IHwfzwNo3WgDLnMeITvwxsyF3Nm4DygMY+CPGD0yFiQOw0cFmDuP3b3Ag4gofjD9EGiOYdB2A==
X-Received: by 2002:a17:902:d50d:b0:295:8da5:c634 with SMTP id d9443c01a7336-29d9f67d5cdmr81995ad.9.1764783062301;
        Wed, 03 Dec 2025 09:31:02 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce47096csm190177005ad.44.2025.12.03.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:31:01 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: hwmon: g762: fix deadlink
Date: Wed,  3 Dec 2025 23:00:18 +0530
Message-Id: <20251203173019.46928-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding file 'g762.txt' has been converted to a YAML schema.
The current binding is located at:

    Documentation/devicetree/bindings/hwmon/gmt,g762.yaml

This change was made in https://lore.kernel.org/all/20240604164348.542-1-ansuelsmth@gmail.com/
and merged in 3d8e253724170ae9c8948c36801204fc2aa53682

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/hwmon/g762.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 0371b3365c48..f224552a2d3c 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/g762.txt or
+documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
 using a specific platform_data structure in board initialization
 file (see include/linux/platform_data/g762.h).
 
-- 
2.34.1

