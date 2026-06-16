Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D212E1DC
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612156; cv=none; b=KvoJV4Od3IWCpuV7RiDTrtieS/NSJbVdfGGXgm2cWjRmH5XAgGxs38dzXtPzPErySUlr7macF5w1Ebd2MVhOnzsxavAxJ8mpieLR/5M8BoI2ep+z/KAcipmVX9Tu/GVQ8XLredVycyN2bnS8LZQ3s3re/6cGjBYcgedRHBDP7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612156; c=relaxed/simple;
	bh=eROihqtSnVRRTnPRiNwcXQwBEC82Y0qvpzQ19rl3oHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dM8t5VmWoftAxQTWJNcCb9XAm0P+8pOC8B6bU2rZrKeHDbwCL/B4g8NkFfZg/eBcP5MHkFVRPisEMm1j+LQezH3DXvSIF4YA+0HHPN4yofyq8EzyQzWITnus9G4D8k/CCcqi5P0mo6yqVeF1lhG1udl3z2teN1cP8iqcjlIhQzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZDoSKCZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZDoSKCZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac357c55so42969425e9.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612154; x=1782216954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5P50Gb8tDfM/qjpqyYI/u9pHQU6TkAQoU3h2mNWI58=;
        b=MZDoSKCZCg05zr/LC7Nnpldw2XaqQvF89kHInnMScM2zkoYto81BuUHIwJcYL1OgTr
         qkGo6x2sK5FJQIuNVsawMVBF2Av3i/ujd60ATKhTx9PwQrHMSvXkqPANt/UAxIuL3APN
         MLRKTQzXdi5OdIvnFGa5m42ZVfWxHjj6OmweLNv64qm3mR4laSFUTvSuk3xLW+yGWgWz
         D2aFyFviJg4ScmV9a599P6KaMP9jVoZ5uvpf302gRTqkBz1bXlZuNSzLAqj44Ug+Sn3q
         yecaPKScoWHPFrB8T5RlDIl9wIpFLM1yrgqAQfx12FxThUbKPwMmWfpbbPfzVjISh8L5
         p4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612154; x=1782216954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5P50Gb8tDfM/qjpqyYI/u9pHQU6TkAQoU3h2mNWI58=;
        b=qxTuI8x/pyyR3J4MGz3VPSD48/fQclkuhcd16h0rp+zmWaVjSrpRT7qxJTaU6DsZW6
         jEkMk9QDiL2DmZW45vBI20ax3joUy1zWkrqofJgHVkVv9YgMohkZ9cqMDMPHOidMDySG
         iCe/PzLT1nCH2vMIx/8a6ZaFy7Jb+LWVJAdhooVTFjYCmn6xQKX80HTeOhEYAcREd9eC
         UFCTAMLHfF/j3/zCmvyv7Kxifdk8POobu+OlfY/crY72a3P5a1RvS56PVgj3veyJ2Qwr
         r8iffDNra77lQHu/GKJNKRTIVMva0DJbDLDbghXRRXlv/H+q6ZAwkDWTKNk51NeyDlTa
         n58w==
X-Forwarded-Encrypted: i=1; AFNElJ+lIhsySMyVar4kW/pah5dH8hWx9mDGocQS7u8odDTiuVVuqlXlorGpu3qSBtLQqfHXDomugCarTyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YypgdWGmJJA23YlPj+HjJGI2CWSfQJXUD5YM2OZ00uQUXZ7c/sf
	7fKXoXx+Frv5610UmZTNUMCcBxG7zc5opmGLyJBw8Z5trU9a4VwmC4qR
X-Gm-Gg: Acq92OEmTtDeZGMc6tiON5uRlUOWga3pGIoMlb5KjoMzNyFfPjr/4oytUhe2xKni/2f
	Wiwykmox/iTb2PnK7mQS+X94x46d2zyhBUtpPp2TL0lGNaJaYNEFCoWXpZMNuS1wBn1l1DFoBDY
	kb6b6ztZ6mx6C5yMp11AECRQH9WXBcJBjnW/eNzFSBnk7szsiSWUc46BUBCYm+WHvB1S160lSnU
	+JTUSnc5WoCPAwfHvinGbLxmFsK+YV9xuOkoM0B0sCn/dV8SoyirRAETg8noJXWTPW/XQpbrd9K
	IMRbQ6PLqUC3vyV9s6rZOdKyozfy4bA1+KM2663XDlnhT6Eaq/tcOa5d1+GfTKSog53to6ZNGwY
	W8JC+Gy6MJEg15+25uVvRelaDRQziWPALheSeuSKLJqtJEZOuXp1/NXSOZIIVyEZ21KHT5Ou0J3
	TuynTz5WnCmLbKQdLJJT5+19gPzqANYLelkCgtxZdvhQ==
X-Received: by 2002:a05:600c:4f8f:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-4922ff938d6mr53775145e9.10.1781612153890;
        Tue, 16 Jun 2026 05:15:53 -0700 (PDT)
Received: from xz (bba-92-96-19-210.alshamil.net.ae. [92.96.19.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8ebe3sm47684655e9.11.2026.06.16.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:15:53 -0700 (PDT)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ximing Zhang <xzhangjr@gmail.com>
Subject: [PATCH v2] hwmon: coretemp: Fix documentation wording
Date: Tue, 16 Jun 2026 16:15:49 +0400
Message-ID: <20260616121549.29484-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two minor wording issues in the coretemp documentation.

Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
---
Changes in v2:
- Capitalized "The" in "The following table" as requested.
 
Documentation/hwmon/coretemp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index f63b21f24d42..349301683381 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -44,9 +44,9 @@ Temperature known as TjMax is the maximum junction temperature of processor,
 which depends on the CPU model. See table below. At this temperature, protection
 mechanism will perform actions to forcibly cool down the processor. Alarm
 may be raised, if the temperature grows enough (more than TjMax) to trigger
-the Out-Of-Spec bit. Following table summarizes the exported sysfs files:
+the Out-Of-Spec bit. The following table summarizes the exported sysfs files:
 
-All Sysfs entries are named with their core_id (represented here by 'X').
+All sysfs entries are named with their core_id (represented here by 'X').
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
-- 
2.54.0

