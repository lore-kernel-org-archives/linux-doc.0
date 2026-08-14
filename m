Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A273EB0E6
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 21:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743870; cv=none; b=hQi3CXEcnxsnVg1oex+H/9pVqBdMN3Lb1OIVVWpJ3OBTS2Nkb+QjIsT+SwnBDIgHTrDAchddWy1mJnHkINPYesQBNABej+ij8sxEiTSZ1QoQrw2mmWygMAlKyw3rTNCtWwCK9KOW/r7hsNJTFz0iKBJJ7HyI+wXQDPMTXPbiztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743870; c=relaxed/simple;
	bh=gl9Bp+T9IR62gDv/ZH8FLwjcyBWVgUs4yKNV6NvxQtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LvljClsHOtL3BL4/z45RS+OvXPbCBXR6E2L/hnmreBldTmQRSDuV6Y5cbWRgEN9CMzDIWlt/ZU01G3qKWgpthVoA4rCl5TQ5KSX8AbRQtXKdaHMm6Qyqb2qVwIvUNhlms7bYbPET6XkhYVrdYVjwQ7q5eZpHWusgK7Nc7/Y8R4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzwpZrEm; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzwpZrEm"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1160568a12.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 14:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743868; x=1787348668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxxPj2RnZfWyelx/ME1+AGAcE+ggP9cZ3PfrXCXxSRM=;
        b=HzwpZrEmiwS6uLxfZlLLXqysGU02aeBp2X/THCuNZS27GtAX42oBnpCR0sqF0PFBV2
         DFApGGkDIz/MYF6f8i/29IQU58Fq5x+SrEuwmraksYidbvSX4h2pvPhVNk3CyUqYPbiP
         5faj2CA9glCECTqovgwarJImVLhWGHGhzVlJ4yEyeNvDU/C0aHs2A90a2FoHfxKvVWsb
         y2n6n43QdJHW4bv3ot5duuZ5u2cU8SG3/oHforW7+ABMUw74QKcdcf7hWKEFmgL3YP2f
         j2htBi/m3YL76lfvb+Wxcvtj5DlPXUVmgIOwcmYsXwUgkkUK0Gqsqodj3pL0VjNSc4gM
         rgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743868; x=1787348668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxxPj2RnZfWyelx/ME1+AGAcE+ggP9cZ3PfrXCXxSRM=;
        b=kjH9TYW+Y6S5bpc8j6K9idVTak0IoidDTUKQiQ45xxfu9xan7UCzWVLHF2BbvLi1lY
         mFieo1/XR7/Sv63/4sapzwlsmk01OU98gBZwjE0WtxBqUGbYS9ZHGb8Po8lVVYWFw9XO
         zCrmxTx1Tl4naIqnEjtzKjKksAMf31NnGG4kDmE9Cxt7yjZhD/tXS+0nhnwkRJpuw5QP
         WtrSB4l95xht4JlDZxzWOWQ/Zw5Zcf66ihIlB1k/cxAWFn/wsLvqy0CYWuZ9pVue76Oz
         DP38UTt71+z2/ip1h5YUKiSFP0R3Azw9R5lTYTLcOfUkzlwKGheD2HI6qWNg3goZJfCp
         ccvA==
X-Gm-Message-State: AOJu0YycJGPdjw92H0uLH3gK04WkRcV38WsIAa4hO9DkwqOp3kcGT7Iz
	JSibI0RXvyEJuCN3djCJbtaqOq8nbWi+AzNHggOzhupm/IYc9GFD509T
X-Gm-Gg: AR+sD12bPuuLrGvZJ4JpsjI6DmHFi0rslF82HQ8yIRkkai1/CuZaGd7gbqWNCADQhgd
	4DRHKq3IlSditiRkzpIlts+bMFglZtU+FK/EbGRtJMdz0KmfY/MEtEDpcOLJiTOnDgyUW2a0+ff
	YzeRxCOOhu8xFpR9gEut4QlxDEHrGsy2YHjFIHsM6fJMCz6XXD9Id0525h8VZ4Soid22Yp3xZ5X
	UHuksy3V6NYnYdgavHVAS+DwG43Rt9XD8LwU4iXP5qhB28/toEApkyMtjPWKFoXo9vaMuU7498E
	cg45wIlGStoEuQYGVYDbGwtNaFHFwIq/lFnPuRFBGiBe7pERIrFM1UebLH7HmDX6j9mJIUnQO2W
	eH1BYRJZZ+aeZNtt3FeTZiMupqDmUEvVxyHW0nX9GJxAV+H/X+z3VowdVG4hNGmhRWXtvv3tQND
	kcmU2DCzVbYRdwEaMLlXqKy8+xYWd+D479r4WBu6Z3EjGODOBmO+jpfXsrtDamZ9iNVvKwJ9Opo
	FA=
X-Received: by 2002:a05:6a21:7a9b:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3cc71d45a9amr10743258637.16.1786743867872;
        Fri, 14 Aug 2026 14:44:27 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm8083617eec.2.2026.08.14.14.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 14:44:27 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org,
	wy@wyuan.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v4 0/6] docs: sphinx-pre-install: improve dependency checks
Date: Sat, 15 Aug 2026 05:44:12 +0800
Message-ID: <20260814214419.49925-1-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The Sphinx dependency checker currently does not provide useful
installation guidance on macOS and only checks whether a make executable
exists. This can leave macOS users without a clear setup path and allow an
incompatible make implementation to pass the dependency check before the
documentation build fails.

This series:

- documents the case-sensitive APFS volume needed for a kernel tree on
  macOS;
- adds macOS/Homebrew dependency handling, including command-line-only
  MacTeX support, required PDF font casks, and a PATH refresh hint;
- checks for GNU Make 4.0 or newer and honors an exported MAKE before
  preferring Homebrew gmake;
- teaches sphinx-build-wrapper to select a compatible GNU Make lazily for
  Info and Rust docs; and
- updates the zh_CN documentation in separate patches, including the APFS
  guidance in the contributor how-to.

Changes in v4:

- always pass LLVM=1 when invoking rustdoc, since Rust documentation
  requires LLVM even when the outer documentation build does not use it;

Link: https://lore.kernel.org/linux-doc/20260812182327.53694-1-chenmiao.ku@gmail.com

Thanks,
Chen Miao

Chen Miao (6):
  docs: kdoc: add GNU Make detection
  docs: sphinx-pre-install: add macOS Homebrew support
  docs: sphinx-pre-install: check GNU Make version
  docs: sphinx-build-wrapper: prefer gmake
  docs/zh_CN: doc-guide: document macOS Sphinx setup
  docs/zh_CN: how-to: document case-sensitive APFS setup

 Documentation/doc-guide/sphinx.rst            |  20 +++
 .../translations/zh_CN/doc-guide/sphinx.rst   |  17 ++-
 Documentation/translations/zh_CN/how-to.rst   |   8 ++
 tools/docs/sphinx-build-wrapper               |  20 ++-
 tools/docs/sphinx-pre-install                 | 120 +++++++++++++++++-
 tools/lib/python/kdoc/gmake_detect.py         |  62 +++++++++
 6 files changed, 238 insertions(+), 9 deletions(-)
 create mode 100644 tools/lib/python/kdoc/gmake_detect.py


base-commit: 8492d4e6bb7b9b1e78f2d17c4dda5272f25ec118
-- 
2.50.1 (Apple Git-155)
