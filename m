Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC42E7BCF
	for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760905306; cv=none; b=a9FqJdy5v7sjg+yBRkI2M8qKyxOKhXFTjXo8QNszxPkNJ/IRjLUIeF9qzmb/EFJj76wb8CtVPRO6snDbmbOsu3PBwy5+aAlgagRUotYAY9Pfk3xoVolPBiHkXnoDgm6mv1xSab7oKA3kRShEm0aRCNMs5K9JQuYyonsd5Tf7jzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760905306; c=relaxed/simple;
	bh=gGu2YtK+1Y5nFXjuDa3Kb9xwoFV9zRmdc+Fveu4vvOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozz2jdv/HN0hyOcwgIjiJIAsf4mJ5G0x7YGXBCdSnt7XJMvPaGywOLzW621Xf9m4LRJk2GnMOTPuJzyxPIyTmSMsj1eazpdcBl/iXfEFU8j4RR9/CDZpzbgGlpofzjl5vUpkmSVEasGYtP3GenvsywASXvI8P6X/9j/+o/GkRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXxwW3T/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXxwW3T/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso3251849a91.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 13:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760905304; x=1761510104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7hB+X2cZMccNnKRizXYDot4taZGWIkTvEwSaVJ3T+pA=;
        b=QXxwW3T/7hzKiFi3wfqSWZZ/MKx/VUvJ/mJFBhXhlxISFTKb3KgPdZLQePxGiuSkAG
         UBPf9GNkRF7TAUzuJdo6CP8vyNUNnVi9ZyKwg/GEdbYKWVOyr7WPT5ZAnHlqxv4sfs0h
         w+9T6hiDepANPCzx7SpXmHPq3rZaKCiShqEImEzX/sLrOZZi/W6rXkCAtmBcPv15iglY
         guwAlSLSmoxy++Yuspwoel9vurZR0043fhJZ7dKUJfCjcYAmU0QQ8HctoXJddN1jn/gX
         8g8Rn47m9Uxo6hMHgJZiJQMTTFHY0EdyyU2zsRHTRAepLQKT2dGSqAuxrmtZE5f6TKmJ
         W3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760905304; x=1761510104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hB+X2cZMccNnKRizXYDot4taZGWIkTvEwSaVJ3T+pA=;
        b=dAO73borZFHmcLJ4pRByxcwUAjiBHbUs7TKMg0/wt9edq+hLduindlIMc0TbvLSUSf
         vEBeAZoe2d/t0DUBlu8hsgif3nYjxhLYch3iqNLqzwrCPcBlqN7uxbJLuBJ6e215nK3X
         2QW4JwLgs1IHPgnVoU32Xekg1sE+J0SWY478H7lIqMtoSp9ilevCsut1hBPwrSf/WSga
         7rbokZR/A/RzDI7Hlv2ODw82CQ3CtXO/GoVcWARcQ3oSnRJtYCPW8QsVcggulrRj42mq
         yqwoPrHqZU1lRHYR5lu8Ws3gGtoAfX9eq9pgQ21/t35nZy3ekVO1nPY+vKBYVDnMyEjc
         2Bmg==
X-Forwarded-Encrypted: i=1; AJvYcCUfFy65yfY8FT9L3VeQG3a+liPQSyBQ5r+9V+SWiftgtzMM9wHrnIXQedxFEpeXFhpeNHvWmyfpGfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQXzKSaC7uTcG4tNe+KsZDmtClWrW0ywX0UqPPGsjRBGEO03A
	iCwlIEiTzKNCVK/Kh+dG+piLyyQVxp/hYk6W5OGNKkEF4XxLX+G995C8
X-Gm-Gg: ASbGnctg8k5vcAG0mAKI+GAaaIi0F06nkfw3qooZ44PQYVVw0O+dZb1a4ghEnm4j8nW
	qNRluF5xOL3lgyaAuX1AMnAlrH/mFhZzylkhdbkx8w/bE8Lh6xCTOUfBKz1FUhJ+JOdnG6RWFg8
	ZGYikJYl2UDk0teene8Smb3qDGh1Tg7XP53kTzMtzLz/Dw17J2uN1VcB99CRCd2w49R7oW4KJYd
	misk1nkgMXRm+AkAJ/H9ykg/uKYWd/pGAd7A7oL3WGnLR9XzUBQCKIjTp0kSThQW0ybKwGDvulR
	JKZpnPzZ2vNDaZwqLFxKWzs+YdR9RyCpyNQqda6ji50VebdfPt5QakGnSAxwuNGzkA8om+PI4pS
	i1q1laQ0TJ+MIRQCje9LME/MZ7B2kenHaJg0Znj9FTD91RdojFLOPDy+XZmgDE1l9HwPc3PETsZ
	d7vWeta244qs5u7UpssbrVoVQ+FqJO
X-Google-Smtp-Source: AGHT+IHwV/l+fanQwGducXFLQEk6QG9s9UbeNxJJ798QkPYS0+g1yKsDg6/EIQaYLLJzyIqHSsDEfw==
X-Received: by 2002:a17:90b:2789:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-33bcf928b12mr17093893a91.33.1760905304309;
        Sun, 19 Oct 2025 13:21:44 -0700 (PDT)
Received: from clint-Latitude-7390.. ([110.226.183.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b33bf3sm5894346a12.19.2025.10.19.13.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 13:21:43 -0700 (PDT)
From: Clint George <clintbgeorge@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] docs: ktap: fix minor typos in ktap.rst file
Date: Mon, 20 Oct 2025 01:50:53 +0530
Message-Id: <20251019202053.285723-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix couple of grammar and spelling issues such as:
diagnosic -> diagnostic
Cuurently accepted directives -> The currently accepted directives
It's website and specification -> Its website and specification

This patch aims to correct these issue and enhance the existing
documentation.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 Documentation/dev-tools/ktap.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index a9810bed5..155d792cf 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -5,7 +5,7 @@ The Kernel Test Anything Protocol (KTAP), version 1
 ===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
-by a number of projects. Its website and specification are found at this `link
+by a number of projects. It's website and specification are found at this `link
 <https://testanything.org/>`_. The Linux Kernel largely uses TAP output for test
 results. However, Kernel testing frameworks have special needs for test results
 which don't align with the original TAP specification. Thus, a "Kernel TAP"
@@ -13,7 +13,7 @@ which don't align with the original TAP specification. Thus, a "Kernel TAP"
 This specification describes the generally accepted format of KTAP as it is
 currently used in the kernel.
 
-KTAP test results describe a series of tests (which may be nested: i.e., test
+KTAP test results describe a series of tests (which may be nested: i.e., tests
 can have subtests), each of which can contain both diagnostic data -- e.g., log
 lines -- and a final result. The test structure and results are
 machine-readable, whereas the diagnostic data is unstructured and is there to
@@ -94,7 +94,7 @@ keyword preceding the diagnostic data. In the event that a parser encounters
 a directive it doesn't support, it should fall back to the "ok" / "not ok"
 result.
 
-Currently accepted directives are:
+The currently accepted directives are:
 
 - "SKIP", which indicates a test was skipped (note the result of the test case
   result line can be either "ok" or "not ok" if the SKIP directive is used)
@@ -237,7 +237,7 @@ Major differences between TAP and KTAP
 ==================================================   =========  ===============
 Feature                                              TAP        KTAP
 ==================================================   =========  ===============
-yaml and json in diagnosic message                   ok         not recommended
+yaml and json in diagnostic message                  ok         not recommended
 TODO directive                                       ok         not recognized
 allows an arbitrary number of tests to be nested     no         yes
 "Unknown lines" are in category of "Anything else"   yes        no
-- 
2.34.1

