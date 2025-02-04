Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2020E305
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738678121; cv=none; b=YonK5QNyzlbqGcH6YeM04C3UZ5/i5/fRiit+9tBDUeny34AcBVwRnXMaXTJB2LgZTPhDs3jP3bVpiuqnrTlARtpQILLVcpSmBoFVyZKBN+bYskxS0Eseeg34tBdlwin7gyPTYNYbbtI7kx1DY9dHd5Ju3FD+Rri18p8GYdwDhLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738678121; c=relaxed/simple;
	bh=lzZC7nwSzDbj4fR9zSQyo/j1VaKH5TZnWQewenU65gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j3jzl/oKcmfjr60DdQjEZ0kGBiBRYT9WJ9vFCqMs/T1FHCQk/Qfa6NX8RD/81sYbWYehJimYahuGNJ25RX4fiAeoy7C3ufMcrZOKH9CsTumGqn8KjGqkXN/KanlpDR6yKH325VK6RhbLPKwNRtJQN0DrCBweOtMJPqPRGYxav90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbv0Oomu; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbv0Oomu"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216728b1836so96178455ad.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 06:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738678119; x=1739282919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=cbv0OomuVrfQy/HrMnZC/KBOZto6pLNtIjxFBOOTVPHd4Kh/tDhG+pthsUO/IzT4Xs
         N1QgB1IdR3YzKtywD5qWMQPZsV5smbeeSVrhJu6HTfyZHtqVnrb5kdHPEvIEzr31s2KT
         VFXH1GyNEk9gdOMJiIgIekE9bhtLPQDpAEJYDO5vGBnZbThU4KqR+YfyehtfaF+/OoiW
         /aeWU1BZKBT1TOM+BaF/0zLqEILdK16j3oMnN8/pocHjQ324sF3z9podybnlwzhjOi/s
         89x1wrUu05hmdAtp1VmiXOvGirU4omn5zyQqw4WjO8irJsjq32G7E2syUQcHsk+/xHvU
         FHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678119; x=1739282919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=scXs3l5KALvdhwQ93dms2nXNH3S+PqT2CpkW8VRgAeyJvQ/0//CbNzzi9AuqDkF4hu
         BBKSR4IYV1ZTANeLVZZMr8skaX8u3bhcew2IaVE5cONRBOixb1umgpr3iITv+QlaF1wW
         yskkMpDeD6r8LAK2KJi4Br9fx1nfisQcFuWgSXqs2RRTA1iOX/6tw8ccgeHR+Nt4LXYA
         3nL0+dS7IJkeinvQjqc3vJ08hTxALrIgSNhI9ADvrPSqO2iZ2RzEU1oyWXJHHQDy77jP
         a5/x8aU+86juYcNJgTKFxllvc2N4ey/XKMpsj73GNhXmIrQfwA5h/3LSm/L1vFEgNzqd
         Fdbg==
X-Gm-Message-State: AOJu0YzdgT8pLCusi52lCVWAJBhYQxOQSPWt1TnGNfFx2IXeFckeouEL
	c88yW+8eZT8NpmQxJBO6gZXz5fvZ7AX8J1qhsrJ9pcd4aeLtO/uRIyY2rNYg
X-Gm-Gg: ASbGnct5Sp+zpYbmkfPwdonBM4OX3YdUrd6zKE5s5kNLTntE5eZPnsVeKbA80nC46Rv
	+B0SM9IFzSclF8BkFI4LoQnhRDaUJfeIL3qz52rPRe6WCdhtbWFT34TdFVhso4C0SQgg5XZ5v0/
	iZ1XJIBl2HYqed8/UC5WrVvMbPff0udgewOTanLrVT5HmuIgSPyBgb79ExgIAmCOzD1NFkmnTnr
	XLahvAdkS7GjXXX3+JDH4HJV7tQmIfEgc1VINOazT3CcPXVMuHbJLw8U7BBtSpdq0CFZ7id3+Cg
	zsRKUHBb5rZkSdrGHmzcrbF9pA6flS/15Nf57Q==
X-Google-Smtp-Source: AGHT+IGmJOJKIJz8LAecFRFuK1DLTcWKV9FPgCagpZN4eNuZ/47DsGbKgNgNCBUMJ0+ep2xl2FiMWw==
X-Received: by 2002:a05:6a21:8dc8:b0:1ea:ddd1:2fa7 with SMTP id adf61e73a8af0-1ed7a6b8105mr42979558637.28.1738678118422;
        Tue, 04 Feb 2025 06:08:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec096c62bsm10039452a12.67.2025.02.04.06.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:08:37 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] vgaarbiter: documentation grammar correction 
Date: Tue,  4 Feb 2025 19:38:29 +0530
Message-ID: <20250204140829.7649-1-pranav.tyagi03@gmail.com>
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

