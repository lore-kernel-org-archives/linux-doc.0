Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D441F4168
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269394; cv=none; b=DrDDxzuhJNOQyITfBor97YjvEvowgtcBku2VgWGE8Djo08ni3Iu524b/WPQiaLS4RyUnL68XNFso6fbff4WRIH9FnqtI4D1hxwP2P6v97smPzBuL/wxO6tMSkFyRmYW1f/4QHZvh7B0bU/4A+KAjncgrbGfSqleyy1hurc/aR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269394; c=relaxed/simple;
	bh=7gkiFUdcb0gYKQOEYScuWQUf2plqI1v9qKLm0MkxY1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L6W8vc+hnxxwPORwNbreaVCQqntVE/R/Z7qxIWGuZIrTuGgVlUzQclcKhwS/GmqkuW8/ELoMqm+WQx2nZsm2ClwbVytaat0dBGmuFNPFfrK1T1uxN267xK/oz2lO6aqjLgyD+jfm3R/QYmpZG6EwT+CJrejrrTMnQJsOLdcxMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7GcGDY2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7GcGDY2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa21145217so8439763a91.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739269392; x=1739874192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNUSfX7eO+cmTPTl6G2d4kERHxGcLvqZO8iyv33AFPY=;
        b=K7GcGDY2dMaBEYOcbRW/gy01hVaomOJssxRPkgATA7aa1DFR0JyyBVVheqtHAG3mZX
         6EQplg2jym/a5+Mh8+eydK8nmNpeJC8FijwZVzph6JjoyG7SxE5haiX3SGBM8w+2VnXg
         jIfkiULGK9HaCDepgDnP7V9VIFpdHgMFoFHWUR72hs4GakwcQoFGFV4JTKAxA068IKR0
         uE8A0bmA2eaHnQfFg7HOtxiEgbtcDkZ4SyPUofJ34XHXAg/jEZWFSRVzCCWOK5Jd2IxH
         pV1CVOzJPjcj8Zw/YwIltellCcEHRuAHv9n1CAGuyOUfA7tBCCkxdlh6TFNXyhyGfzSi
         kd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269392; x=1739874192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNUSfX7eO+cmTPTl6G2d4kERHxGcLvqZO8iyv33AFPY=;
        b=aVbtFb/srVfuL5GNB9Kiar0sbpF/h1Sbma1TYY38iGKw7hbvGHH+b9huUjO0/xdvyc
         2Vp6GbuCvNIwby7mfnDtTE+/s2UAdtht8sTx5J11mxJ/w4GG4IvKK9lrvKhWwnFVIP9U
         R0plWdZKgjs3cpZfYhYvejO0FZKn+IIuvDpZ/4KpZcjunHB7nvtlHX5BUkNSHWmlHe5N
         18Z70u/dcN3ZGHHwm1xNxh4EAmPzRxYZp/IDjovpIB30r829DIPUKcHqi9kr5UCiScuk
         gP+xVRzyX1EkM2nfRdxqJO62s+kvlbeCyI5nkDgog20srCEth0ddd2fJ5v+nL7xxTgNG
         gaHg==
X-Gm-Message-State: AOJu0YwdZ2/2OZAB9VEX/Gb9ZqkzG2Q9C+yRNN8OmU7P9XL1+rXLFBHO
	RCNzmyL9BRR7BblyrYcUL1NTyk+LkstugxHcSc7lrDtSyKqManI7
X-Gm-Gg: ASbGncv31RT2iWgTpNiCxZD9ZiQWVsxSkQry1oqzkffALuHe0sQDT/1OW2bJTyfBR0I
	Yf7qdsIH2zOJD0815B0l+qT5riJIAlOU34B8lFIyRt4fRYv1krlNfPwjyGm2m6wA5/chPzazMO0
	JNKXh4elOYglUThWR29fdj4MKD0rT+x0TW32LSopkbROYuHTJjPvvb+7EDF+8oDnRncZaQE0BU8
	bT9It+9/u7lCqrjwMRbH49P8a/Z3TwdiZ59fGLv7jBmdTE74HGrPWD1sb/1/pdkKC+CXN2wWrFK
	uK4vs+pcU+X+UoQgKYA=
X-Google-Smtp-Source: AGHT+IGTWse2dOartYTkk3C2PWo6EDO3+yLZq21aVlgmvJwCW1e/Vx5WpWj7JQ1Tn8qEgiNu/YLRng==
X-Received: by 2002:a17:90b:3dc3:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-2fa24067d7amr25467131a91.13.1739269392236;
        Tue, 11 Feb 2025 02:23:12 -0800 (PST)
Received: from pop-os.. ([2401:4900:4e6e:cd6d:2732:b5a2:e46f:2ac5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa44aa6657sm7300372a91.38.2025.02.11.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:23:11 -0800 (PST)
From: Aditya Dutt <duttaditya18@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH] Documentation/driver-api: fixed spelling mistakes
Date: Tue, 11 Feb 2025 15:53:03 +0530
Message-Id: <20250211102303.197763-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed some spelling mistakes identified by misspell tool.
The example code in Documentation/driver-api/nvdimm/nvdimm.rst contained a
misspelled identifier (paramaters instead of parameters).
This typo would have caused a compilation error if copied as-is.

Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---

This is my first patch. I was sure to make patch against the docs-next
tree.

 Documentation/driver-api/media/drivers/zoran.rst            | 2 +-
 Documentation/driver-api/media/maintainer-entry-profile.rst | 2 +-
 Documentation/driver-api/nvdimm/nvdimm.rst                  | 6 +++---
 Documentation/driver-api/pm/devices.rst                     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
index b205e10c3154..3e05b7f0442a 100644
--- a/Documentation/driver-api/media/drivers/zoran.rst
+++ b/Documentation/driver-api/media/drivers/zoran.rst
@@ -222,7 +222,7 @@ The CCIR - I uses the PAL colorsystem, and is used in Great Britain, Hong Kong,
 Ireland, Nigeria, South Africa.
 
 The CCIR - N uses the PAL colorsystem and PAL frame size but the NTSC framerate,
-and is used in Argentinia, Uruguay, an a few others
+and is used in Argentina, Uruguay, an a few others
 
 We do not talk about how the audio is broadcast !
 
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index ffc712a5f632..ad96a89ee916 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -116,7 +116,7 @@ CEC drivers		``cec-compliance``
 .. [3] The ``v4l2-compliance`` also covers the media controller usage inside
        V4L2 drivers.
 
-Other compilance tools are under development to check other parts of the
+Other compliance tools are under development to check other parts of the
 subsystem.
 
 Those tests need to pass before the patches go upstream.
diff --git a/Documentation/driver-api/nvdimm/nvdimm.rst b/Documentation/driver-api/nvdimm/nvdimm.rst
index ca16b5acbf30..c205efa4d45b 100644
--- a/Documentation/driver-api/nvdimm/nvdimm.rst
+++ b/Documentation/driver-api/nvdimm/nvdimm.rst
@@ -535,12 +535,12 @@ internally with a static identifier::
           char devname[50];
 
           snprintf(devname, sizeof(devname), "namespace%d.%d",
-                          ndctl_region_get_id(region), paramaters->id);
+                          ndctl_region_get_id(region), parameters->id);
 
           ndctl_namespace_set_alt_name(ndns, devname);
           /* 'uuid' must be set prior to setting size! */
-          ndctl_namespace_set_uuid(ndns, paramaters->uuid);
-          ndctl_namespace_set_size(ndns, paramaters->size);
+          ndctl_namespace_set_uuid(ndns, parameters->uuid);
+          ndctl_namespace_set_size(ndns, parameters->size);
           /* unlike pmem namespaces, blk namespaces have a sector size */
           if (parameters->lbasize)
                   ndctl_namespace_set_sector_size(ndns, parameters->lbasize);
diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index d448cb57df86..8d86d5da4023 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -358,7 +358,7 @@ the phases are: ``prepare``, ``suspend``, ``suspend_late``, ``suspend_noirq``.
 	is probed against the device in question by passing them to the
 	:c:func:`dev_pm_set_driver_flags` helper function.]  If the first of
 	these flags is set, the PM core will not apply the direct-complete
-	procedure described above to the given device and, consequenty, to any
+	procedure described above to the given device and, consequently, to any
 	of its ancestors.  The second flag, when set, informs the middle layer
 	code (bus types, device types, PM domains, classes) that it should take
 	the return value of the ``->prepare`` callback provided by the driver
-- 
2.34.1

