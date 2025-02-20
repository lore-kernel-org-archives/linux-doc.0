Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305521323F
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070215; cv=none; b=e+jYAhSNLMVf3+Eq59Bk/vnmyxVYhu1HGAocBpCXuPW8uCc7ZMso73A3zT0X7IqRfpNvni4mYKVOOnOAYd/CcWGNqCYWGZn5/qqM6hB2WaaEdXBb79Npn9Z4HSlggjv3kNL4cCBoHrv3g92exnQszGjLSbnV4PLxG4b4dDp+ZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070215; c=relaxed/simple;
	bh=efaP8RPJNTtPf2+MD0d2dGXodyx0d/UHarGAgn6cO44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PAnPBn6hhTwPYGKHdl6KxZHB/uZVuh6mzUYS7eJRAsoF5BDqRCZ2iskWZ/zO18N2di1QNoegI9p6akja+n2d9Pby43Vyh7HXMyHNC1CRgCHFCKoqyJZ9I75XVUHWJXm1Qulf7QJAfK+cCbASeBHRfeDPYUP7qNl71KKwBGt/uA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWSpkrqM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWSpkrqM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220c8eb195aso24521885ad.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740070213; x=1740675013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DmhWr2QmVyeGuDS1oXG9gsaDbVa/o2rG7jKNkrjMRs=;
        b=LWSpkrqMyCgdglmabz0oG+ZDRhBLIE9SCrOr/qxiLFmwA29ttD7BhTbgBx2gQHYoXd
         yaKmI2g6LKa5NDXS8m0l+H+QMSrpCLcrXwFbakv8zjCUJj9dOSv6LgPCNhoZJh9xc8wJ
         uk6kxdmGVsi1WtOdYAiENJ5dFpi+ePRozZTnZ+cedTMX+r8HJqnqPhUaacdnteE9CmJ3
         jlVlqvV6KfdBjCNHDfYjVFZne7fg9/q5+oCIPChhnjX7jrCSuWXUBcv36Gnvgre23BMA
         wjizfPymoQoWTPDdE5ea7vdMz2Ng90dHh6xkVIp/MnLTbZoI6xh5TzvfekH+En3CZ6m4
         k/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070213; x=1740675013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DmhWr2QmVyeGuDS1oXG9gsaDbVa/o2rG7jKNkrjMRs=;
        b=NfTEC+duvfy8oXc0/ribCLnEsyIXcs4xT7POpDQe4vbkI2Q5TNufhD9JyfHfDJgz9l
         0zdM8BiPtaFmZqlJpcBNSRGlN+2DfE2eZ+C4FKWMCcQO1QsrSPEzAQoKZVP58qH8KcKD
         qzOhIcKquDMS8EfsxGiWC4pvF3yYpMv1pL+gTH/9MnZJ6Pw2ar3g/J+jXpvSNIlHJR3L
         NohckKpkG3ShgaLj7BYr/Jm7EgtfnDIBiEnvTxqXBRP9VV/1wwLm7qcok/tGR+NAotAt
         DRTGo0009JyZS9rnpPjCHqYQ8ZLVJzyA/zljdIYmhbDw8P2LuyYdEy++Ba6IEO53TUoi
         SIPw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Z5GayPv18H13jGRDF1JpUhcpLM+FHRZt9B04OFjXktnXNqBrJYvpC5HStbX+FX6Wcbd9pR26EeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfElGFOtlNH8wvRwXjO+1+Byfj7WADYks58m5ThF9V0IUPleK/
	uH25/CHCXUs+79Y6JSei7ur8yxr8VP0eDak3uxJq/+xL7rcmVJwf
X-Gm-Gg: ASbGnctFM445pT5Z8mPzfTZU64wgDqfxvLgOUXo9RnqwwTZ5te9bf6B+n+Qc9g3fKD7
	pfqQoQ5DiAu8w4AXEycADkK+dzfo6BIfAzEIXvIfhFo0z+/WYnBFvoEjrE9rk5MHhH9BZb7l1sz
	Wt/uQqLDcSYDig9PiMyFR9+ZuRNmgm6YIkP1mPSnkPOwJPssT7p9wfNFvMsJcb18gj5LW2nun3U
	iQnjBpiu43fZNO9057+O5Efm2NofrV9QyF4uEuMWyPhneurxkOc8TrPf7Rb2E6oMnLgVikzwZW3
	KQFCxStyHw+c3de+PoHDO9XSeckb1LWUsd6A
X-Google-Smtp-Source: AGHT+IEZEJ5Vx0cDfop6Q20EF8DsuK+QyG7/1ZeIrNw7H+oUSeWhjSyHlDH+GyEOp57VhYxnE3uFtg==
X-Received: by 2002:a17:902:d2c2:b0:215:5625:885b with SMTP id d9443c01a7336-221711c2866mr129989005ad.52.1740070213205;
        Thu, 20 Feb 2025 08:50:13 -0800 (PST)
Received: from localhost.localdomain ([106.207.145.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73266fd6438sm10619451b3a.142.2025.02.20.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:50:12 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	bagasdotme@gmail.com,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] vgaarbiter: documentation grammar correction 
Date: Thu, 20 Feb 2025 22:19:46 +0530
Message-ID: <20250220164946.18007-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects the following grammatical issues in the VGA Arbiter documentation:
- Fixes subject-verb agreement by changing "co-exists" to "co-exist"
- Corrects pluralization by changing "server" to "servers"
- Improves sentence structure for clarity

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/vgaarbiter.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index bde3c0afb059..d1e953712cc2 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -11,9 +11,9 @@ Section 7, Legacy Devices.
 
 The Resource Access Control (RAC) module inside the X server [0] existed for
 the legacy VGA arbitration task (besides other bus management tasks) when more
-than one legacy device co-exists on the same machine. But the problem happens
+than one legacy device co-exist on the same machine. But the problem happens
 when these devices are trying to be accessed by different userspace clients
-(e.g. two server in parallel). Their address assignments conflict. Moreover,
+(e.g. two servers in parallel). Their address assignments conflict. Moreover,
 ideally, being a userspace application, it is not the role of the X server to
 control bus resources. Therefore an arbitration scheme outside of the X server
 is needed to control the sharing of these resources. This document introduces
@@ -106,7 +106,7 @@ In-kernel interface
 libpciaccess
 ------------
 
-To use the vga arbiter char device it was implemented an API inside the
+To use the vga arbiter char device, an API was implemented inside the
 libpciaccess library. One field was added to struct pci_device (each device
 on the system)::
 
-- 
2.47.1

