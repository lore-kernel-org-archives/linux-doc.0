Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34627E056
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760491782; cv=none; b=oBswrr9JFSOKUxFnI3BW4k/tTlyRV9FvuKjPxEHUtdYMGEEoshVJiCWaJmgW45HqMTudPSah898Fd0l20mdZs92s0WPs4vAI5rJhAROCHyvHCpcrngW+yHN2ktFqH2Dh5XzHbEwOj295HK4532Nyd9C3OU8NIHdi5GOQzmeP5Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760491782; c=relaxed/simple;
	bh=EkDTdmk7VtedbDx8TuiDmQUnQUo94nagjsaRQEZkOHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N2tGHGJoubYTuDIePu14dX4m0UFaBhaBs0KHrD03arjnadslfO7Tq/5C4P3quKgvHjw3/kxsjHHJhap/AYhbt+xyi4ZwCnX52ow2qSuA5rPs0EHb0EjwfgTGiu6yD2Hp4G5S7x+nVf7kQqDMBfYHWwTWicA7NHN3jsvZZtyxhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wlx1tl4h; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wlx1tl4h"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-269af38418aso69419635ad.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760491780; x=1761096580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fvYbXimvUZhpQiNzNTlCeS9B/GqAi72nC59INjCGqc=;
        b=Wlx1tl4h/Qv9WqX9xaAg20hc84AIE4gnWq0jAT+Uq4GdyRwdJUQ9UNC8Lpahizjt2N
         smvNiPvztxGXTEfH6leWPntx1a/GPQsdr/5NHquuk5Mc55iEyYDbMCba/lMjbXPFKFCo
         kV+NDJr3m6yM9BPFZwC20QPlMwahCj8xxzNQcKfj75vmxo5sY6Ap/CVzPeXgHJKr3iUV
         hLxO4xv+/M5l9JdWMKC/g/PuGKWNWG9YkuPK3FbureJU7/yfQ6Xfc+eU4IONhxG+QRRg
         Gy51yWv6e2HQjN8gonJZ8n5dJSR+u7YRC6AsSa/6HiPkHs3gsWXFMldABlkIx9wg93a9
         rsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760491780; x=1761096580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fvYbXimvUZhpQiNzNTlCeS9B/GqAi72nC59INjCGqc=;
        b=IgPvp2FAiLABAnIbCeJ5Oh0jqqWw9RWNzfNCHlKDI7DTnqvg3elDyphDoZnLotBGtd
         lfNxV/z5cyDgVPr6V2n1ljK3uzH9koG6tPsgGUAuKa+wrcIeRUx0DI+Jk4uzYWiYPkSj
         tXubAyqUhue1n4ruuoJ6vspv2aTmbFVz8TrcDJiquNfHvDCs8qe7ZBcjVKWYULzkx6eE
         wn8IwosSgV0pjIhX+xvaR9PEH3kN0eFl46b0tQWDH/ivoQfURTbxbiWo1rRLKwxnOeY1
         5vTnNoWMymVVfVcmuZHo8wUokzMj8X7akferqFAEjZHVVNLEsdyYbdWHUsPP8lzhMaMi
         qMLQ==
X-Gm-Message-State: AOJu0Yy3+vi9yylWmuIouLSciqc38WEd4/5/6VuMxrXWCC0IVN/QFb8v
	LX6XBdXtJE/cw1JKblB73tG4kwDrXn6vfMJLz9M8kCmQZVv3QIMfmTRjgGR4GqwT
X-Gm-Gg: ASbGnctwSybs+ZcVaAyJodRfVBlsRzWPswmg+rlCX/AE6/8H1Ir2ruAhU5aW3P0TnAA
	+HtwwwLhOT58+qRSYrKe9Ar9bM9MFZfrz8Wsok5FqjDZugJcT2tUHwsgrIBwyZ2KV+Y9bYqYr8l
	hfL3Bh474Oa6nYQCLaclSUNv+eyfR8ZiHSZaynSrBY1vtb48jYdPIPUzOaGRv/R3Qrzpm8bmubv
	GtAFbbQLz1pZEIjo+HWkgYX6bwyMR3muKMCsj+xxpvw9RIL903lr5nuUo17AyrRv6Ww6XdOCUtX
	DD5DrRssg6LsyyNroC/jG/7y7srRyNMWTLpOOHoM992/UlgLz03H21xTVOV8nwAjCajbkW2U1+o
	jN1N9pNoA2ko+mSgGfLL9NfVyHwbf/FywabSTRJC8zSd0BvtbeuyaT1kK3JnPLJwxe84/JWAwg0
	w4fth+2A==
X-Google-Smtp-Source: AGHT+IETwzTDN79xce98tBpGmn6d5BjHIybgvoONdJrdp+zyqvV2gOBUk6dEmaq5sMqA1PTfzaY8Iw==
X-Received: by 2002:a17:902:e78f:b0:269:74bf:f19a with SMTP id d9443c01a7336-2902735639emr331745545ad.11.1760491779973;
        Tue, 14 Oct 2025 18:29:39 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.123.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034deb0e7sm177275485ad.11.2025.10.14.18.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:29:39 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH] docs: Makefile: Sort Documentation targets case-insensitively in make help
Date: Wed, 15 Oct 2025 06:59:22 +0530
Message-Id: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid case-sensitive sorting when listing Documentation targets in make help.
Previously, targets like PCI and RCU appeared ahead of others due to uppercase
names.

Normalize casing during _SPHINXDIRS generation to ensure consistent and
intuitive ordering.

Fixes: 965fc39f7393 ("Documentation: sort _SPHINXDIRS for 'make help'")
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Notes
 - Patch is tested with make help command.
 - Verified case-insensitive sorting.

 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 3609cb86137b..00c81e7947a9 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -23,7 +23,7 @@ SPHINXOPTS    =
 SPHINXDIRS    = .
 DOCS_THEME    =
 DOCS_CSS      =
-_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
+_SPHINXDIRS   = $(shell printf "%s\n" $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)) | sort -f)
 SPHINX_CONF   = conf.py
 PAPER         =
 BUILDDIR      = $(obj)/output
-- 
2.34.1

