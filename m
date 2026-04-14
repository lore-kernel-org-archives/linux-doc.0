Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78C35DA4F
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156359; cv=none; b=HjwrQOQtM+G5xF/3g71NpxVHX0HDu8XbOJ6wiLoPd3u60kMGfhQvMywAaHD/EpUkTyZWcGdxRZx12sDcwwNXQ88XKIcG9A2qQzdzeJAUKMwIwr+J1Gqv5lToBQQo+YEuFzsXi69BlBaf0Br5fCtMolZ57gCmHjOt/i85rIhUpBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156359; c=relaxed/simple;
	bh=BRYJ6uVsCDThFB8tCgwITIWz23beoie3cE00ovg/BdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IIQpt5Pa8F+6bsBzf1SzeFVbDlUhaQXCRNXEf65zKVN3k5Wsi1t+kVVVoQrJR4ajdGXQbsBmxaI6cGNowInJJ9YFFFXqJc0LWIras1lcegxe2NeKWQrUZNf8UtiSvTKBRjZhopnJBsVVkT/L+BZ43nghMVBzhxIq4Z+la1UIjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF9l/6+W; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF9l/6+W"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so2136821a12.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776156358; x=1776761158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JDvFhDFcx5e4TCyjA1q7jKK1ch2jNHgdaQYFkQOXvbM=;
        b=nF9l/6+W1nAZT1kkqRflI48a2RZOuZiZhHZZARMpuOJ/HnLvCL8n4cN6KX1Oac0tqC
         MxTDnJiwy5YcNBkhyD9T9iJh+svq/qtMKdSOn7hK9iJ/4ndQqkNsyL7vb/kn9RQR8LJz
         CENJBYE274/44gfEtjlz7EOVQEGV7IUUd1Cnw8o+F+Iss86rV6GpQw9LukgpaV7yjgBe
         3vzSiIgdzYnSdI6U/2i4lHplL7UhyLGSfE50BXrg/ZFUh7xLGCfeMqsqnfia5Hfs/cRY
         +534Y69wVm0hoX7XBSdiEmN5L8bna6FZSf7e+oMg46XyPRjxhJKZB0rgzww3EZ9twdfK
         OyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156358; x=1776761158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDvFhDFcx5e4TCyjA1q7jKK1ch2jNHgdaQYFkQOXvbM=;
        b=AztmD5WtJt5ry9mB2CE4hz/ZiIgm9iff+xIq6wH24HzF/HauFksmEUhNVeqmDqtpmj
         NwIQr2O0966V87tJLWEB/uLRRTaBXBoEqqzKNBZwNnVCzxZOAEZX//PGntfGs7KTVfPT
         BbPtnXK1MRV4alEso4ENQB9pXqKsyh9FAZHD0k4j6WkTCEYVSVREbLSHqhMCzVJ0qlY/
         zi9kH0MYIaoeZOhkfoLLjeWOC3O5q0vNgpaNcggzClCtJLHfU3wuETFPTvD19E0vREWm
         bO1gayKHSHkpiUbm6O1aucH5ZmAdlC/0nhsYRHaJ1sly3CkUmLNTq2hHkR1YhJ3lqHsJ
         Z0Yg==
X-Forwarded-Encrypted: i=1; AFNElJ+5AxIowU1NGugikdEdtvqwNgPdrPhLd/JwyuIaFJwqECVWMFWcwyUMM6a57hOusMV9I1YgpHOOt3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjvErUDIcJsx5RXZaGEaPjP0QcZjh9Lb4anf+/CRTWqRhoMH6J
	bGBp8kr+R5FNkM86Kzu1RVoS4QGeZZBfw3sU2nDzT5YgBtAFKRJ3u7LMbbIdXQiI3Cc=
X-Gm-Gg: AeBDiethKVGdO4Y39qFTbrf0EHn/RHodfWBwcrJvNiz8h9CZCkkKUfYcD4NW26ypxei
	ARBm7vMAyXRfzvCa0mWzEsWLLvWos7zZAJNAbv8k5Dt5h60y4J+mqC34xJ5Vw3GKyCzpm3dbljO
	mdbEQDllOQN4/H/7Drv2so2X8+W287H/sXSzYMl38XonhVurW9JMCZK7Dun3ouBUmHz4uaLjwOI
	QJ5/FAFkZ/sWBaYoYiIuGM/lSU6emQB15eeufZnxNmV7jrsgQ3a7xiPt73T9JRZuMNybhB2D5H1
	s/3rIfRTOZo1hgDImhCVss3+qaipzkMWqDxoSA3UEoQfUU2/p5LR27emcHxAk0D9pqT5MfhE87g
	esy/ZZMpnqeZGxnRSywcrFh6NTiWN09ozoFkv0zzjPLP6xp5P28iHsWx996DvZGzHyihYikpdlu
	5/8iEFqsEqM8kPK5gg5puw6/N28Th/RCCy85cc7maeJKfDuVi72Rxd6BermOP/uURNzg==
X-Received: by 2002:a05:6a20:1586:b0:398:9794:32ed with SMTP id adf61e73a8af0-39fe3c64b93mr18182309637.12.1776156357567;
        Tue, 14 Apr 2026 01:45:57 -0700 (PDT)
Received: from localhost.localdomain ([124.55.73.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b3dc2sm14010608b3a.34.2026.04.14.01.45.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Apr 2026 01:45:56 -0700 (PDT)
From: fru1tworld <fruitworld.planet@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	fru1tworld <fruitworld.planet@gmail.com>
Subject: [PATCH] docs: fix typos in kernel documentation
Date: Tue, 14 Apr 2026 17:45:53 +0900
Message-ID: <20260414084553.22762-1-fruitworld.planet@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reinitalizes => reinitializes
unpriviledged => unprivileged
the the => the (duplicated word)
sub-struture => sub-structure

Signed-off-by: fru1tworld <fruitworld.planet@gmail.com>
---
 Documentation/block/data-integrity.rst           | 2 +-
 Documentation/core-api/list.rst                  | 2 +-
 Documentation/core-api/real-time/differences.rst | 2 +-
 Documentation/gpu/drm-uapi.rst                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/block/data-integrity.rst b/Documentation/block/data-integrity.rst
index 99905e880..b7b10c8ab 100644
--- a/Documentation/block/data-integrity.rst
+++ b/Documentation/block/data-integrity.rst
@@ -154,7 +154,7 @@ bio_free() will automatically free the bip.
 ----------------
 
 Block devices can set up the integrity information in the integrity
-sub-struture of the queue_limits structure.
+sub-structure of the queue_limits structure.
 
 Layered block devices will need to pick a profile that's appropriate
 for all subdevices.  queue_limits_stack_integrity() can help with that.  DM
diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
index 241464ca0..4819343a2 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -752,7 +752,7 @@ This is because list_splice() did not reinitialize the list_head it took
 entries from, leaving its pointer pointing into what is now a different list.
 
 If we want to avoid this situation, list_splice_init() can be used. It does the
-same thing as list_splice(), except reinitalizes the donor list_head after the
+same thing as list_splice(), except reinitializes the donor list_head after the
 transplant.
 
 Concurrency considerations
diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index 83ec9aa1c..a129570da 100644
--- a/Documentation/core-api/real-time/differences.rst
+++ b/Documentation/core-api/real-time/differences.rst
@@ -213,7 +213,7 @@ to suspend until the callback completes, ensuring forward progress without
 risking livelock.
 
 In order to solve the problem at the API level, the sequence locks were extended
-to allow a proper handover between the the spinning reader and the maybe
+to allow a proper handover between the spinning reader and the maybe
 blocked writer.
 
 Sequence locks
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a59..14ecaf98d 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -568,7 +568,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.52.0

