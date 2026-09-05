Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08F4379EF7
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 01:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570440; cv=none; b=Z6Or25sSqIZvuo6FPB7EIv/7nVR+TvyYXThlMA+BrQQ9hr9AfecOaSo3XlRHSFX4WO1Rt/NGm5n625UrS3N2UbiGo8iaePTiwxtXU38y4onAI/b3wp/hcLyNfehPfCo/b0AThlUtqrd7rTppwBEWdQ9dqWTtJrIxSaI1cIFU7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570440; c=relaxed/simple;
	bh=EglbqXi5LkNp5XA0SdAdE1SDNtn/R/F03DiG2hMoAMc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HqsMWVBqdbxPQh/UploAg5GVJX9HiB6mP/yfHG3m4wl3pXGK07jJ1c93RBsLZmm6baNsBcbSdyAPwNUMPk+BjpEQD1qStU86Cg7EIpdcRrGwk/5guEriCAHw18GuZyA9O2iCz0vqrDGiLHDGJ+5Eq1wvyq16TqblqgV1zl+yma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRdmouKW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRdmouKW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so14710865e9.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570437; x=1789175237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zr9fpDIO6FHp21CzkCP2RgEnzt+svRUnC4ckIWi1ofg=;
        b=WRdmouKWyohjJTz2OkrmjAfof7MvG1MiMudP8rxj7YDvbvkYXI3RaOIJMDmph4+x8M
         /yQuItbIWe0u3jmCbL9L5eSwvXuPyPtEQjTz95GJNHpFUKp4XKjlZvjSui3wLliC8+iE
         HrkBfwN0MmE80ETdBRFAXF75wd07RJVq6KcQErNdWu8zP/IdSl/i72CB8NyAtNqCw058
         Nx4xBoY2Eb9nJww34YlB/WNBk4tphDALAJDSeFYZFepZ4b1vRS8z27uLpFtbNPy3FFHi
         Wjjy5VtbJOEPkC5q9Q8Hu7rf/vQPzjqROvzxp3wZMHBHPOtjpdSxONWG6M098umufEoh
         PN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570437; x=1789175237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zr9fpDIO6FHp21CzkCP2RgEnzt+svRUnC4ckIWi1ofg=;
        b=LpMzqXrDRZej+ZGC9SJhKiapAdqvY//w73jW7wc6ekgomt6GN3J50ZvGqHFRzvzaTa
         klxm9ftX8grgrWWIrrTctFRoufvHszNfAniTBCUlYJUFpZylgNf4rv+wIVGNpqyj/o/h
         Pq1x3X3oY6M1qtbtyYuKxtOYPLPbDrLQYFM38e0FYfJjugWrwoiJf6NYE+Cm6Mg1B6Rv
         nXIBbxNiFQ3HIxbf2AN3ipXIpP+oEgfcpfioJ5BF9vw3XxBfo+X4A6CyvnV1UDl2Fn+B
         S443am/DQYQIyNRkmz5bctWWLOELewsUkwfpG+7xshxXx8TtAIRdxt+U/yXZaVav+G5Q
         9Iiw==
X-Forwarded-Encrypted: i=1; AKwUvBxMgUbap97FXCUwh4gj/HfsuyxX+M8zm56jySQQDj9JppYvSwq2/8jpaJPDIcv5zKLLkqw+9GOOM/k=@vger.kernel.org
X-Gm-Message-State: AFuF++k8EHm+zdivy3VrEdmwe9St+GCvGb+r5bLsG6Z2hU/Q2D3/Nj0b
	G9exLS/MX0B3azkKz7Su6aRo3LCvr1tq68dzRGq0APXnv6MKGqcdTnmh
X-Gm-Gg: AYBFou0l5AOLXrajLuY+I+wgtBp0TEXwZogLVHYwd6VUvJ8JR8cGRIPZGWNPVy4iDk4
	2gsCM99eyWg1S0e/zDk+infz0vWtSN4GN7L04tdmV6/WEwRyO6bHVPbhmvvDwmcqfFpvv0iEKuB
	0hlybPjWf/+nm8OszM5kyIeAWp8UA01qSjX+KC22hH/cd5EYRxjZwYFvwm6Np7HKUxXMgL85k7k
	pAoz3IgCndE7+k1gL/4eKhXvipxcV+wUmTMMJacjir34rafKA7fOzkXO46/0X8PUqi5piQULkz0
	VVW7z++qN92WYDw2RVqPgoTSJ9M6oOCiN0JFRC6lH5Ame87Xx+REQkA3fmYq45tiuR84366Xs7l
	YpLN54Bck1vm9fkOdUKYZvVA4cSgSl/9Vh7ZRm4EP+IEJdO+1V9+g/mR7ONOpY/bykk5bobJldN
	86li1oh2k8FinwbggBqOfgg3Kxhr4dsPwo2/jUKo/mT97SVmdXdpCk4l48T6hpbtO7mhIp2kQYT
	TQl0H+0TKRDnxEme/n9pLe8B6DvR+oYIabCVNdvojHjsrvYoCJAbrZiruzs8dxOj46memqEbBuA
	zmsXvbtPqCv2fJbfTxVZ7SbDj74yK9bF7km6ave3nXLapRxXwCZgYAguOPPjALZqoH8=
X-Received: by 2002:a05:600c:628b:b0:49c:fa21:e742 with SMTP id 5b1f17b1804b1-49cfa21e956mr66582325e9.24.1788570436399;
        Fri, 04 Sep 2026 18:07:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4f2-6901-14a0-23ad-a35e-aa8c.310.pool.telefonica.de. [2a02:3100:a4f2:6901:14a0:23ad:a35e:aa8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm195777265e9.4.2026.09.04.18.07.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 18:07:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] cpufreq/amd-pstate: Remove obsolete amd_dynamic_epp documentation
Date: Sat,  5 Sep 2026 03:07:06 +0200
Message-Id: <20260905010706.57380-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amd_dynamic_epp command-line parameter was removed. Dynamic EPP
is now selected through the per-policy energy_performance_preference
attribute, which is already documented.

Fixes: 32692fcf61ed ("cpufreq/amd-pstate: Remove "amd_dynamic_epp" cmdline and "dynamic_epp" sysfs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 Documentation/admin-guide/pm/amd-pstate.rst     | 6 ------
 2 files changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4a12805a50ba5..1fa37bce5bb3a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -499,13 +499,6 @@ Kernel parameters
 			disable
 			  Disable amd-pstate preferred core.
 
-	amd_dynamic_epp=
-			[X86]
-			disable
-			  Disable amd-pstate dynamic EPP.
-			enable
-			  Enable amd-pstate dynamic EPP.
-
 	amijoy.map=	[HW,JOY] Amiga joystick support
 			Map of devices attached to JOY0DAT and JOY1DAT
 			Format: <a>,<b>
diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index 6fd72ba52df20..4c5d3d8acf645 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -481,12 +481,6 @@ For systems that support ``amd-pstate`` preferred core, the core rankings will
 always be advertised by the platform. But OS can choose to ignore that via the
 kernel parameter ``amd_prefcore=disable``.
 
-``amd_dynamic_epp``
-
-When AMD pstate is in auto mode, dynamic EPP will control whether the kernel
-autonomously changes the EPP mode. The default is disabled. It can be enabled
-with the kernel parameter ``amd_dynamic_epp=enable``.
-
 User Space Interface in ``sysfs`` - General
 ===========================================
 
-- 
2.53.0

