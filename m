Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52418DB37
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 16:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947220; cv=none; b=RpSPCEi9xEn2oiZyU+rjZC5Nl+E/dcdRRkCzHb+SE+Bbn0kVI7KFG0A8FoRwNbO7Y4LLhHthFEc083TcucUSYmeB5RBR+xlIsSB1gstiOOsnPfwSSy5jCamLW42KfKMYpXadtQPuP4XgN8Rkc5AoJwVa7ylkqrFrcboVILJo8VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947220; c=relaxed/simple;
	bh=lzZC7nwSzDbj4fR9zSQyo/j1VaKH5TZnWQewenU65gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8UTERlJRKIxg//eHBO/COP6/zVmrUUuSz5fSi32pdyUQGSptEUyGkR+1khzMgLL5y+TRSyCBve65WmcPa/trueXv5hssKJnHkvCGRVNVOX2BnMw0LTD5Dv21qNFvyqRTz6NVTLCqciT+8Xd8wN0F+f3o3FO0Zb17NBJMJmaWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdODs7cw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdODs7cw"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so3171258a91.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 08:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738947218; x=1739552018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=CdODs7cwSFgWaOpwl47nvj1zRPsjYE4cpK0UI5WkfqQlDpqOvyKdCMdbY74kd4ZP91
         psNlKD7jcH8Om3NFhAuHww8eeEdP5Zvj6RBgYc4NjYSUHoAsQBxP3dM0fiAkCHZBz/Dz
         wfOXxejQeUpxMDZ6IMRd79Tx61+j1jX1T86XCXRWqoF5pkijIr3mKq+TJLWXnoHJdrZt
         Kh6YuFiV/9pa+PzhTeY42AkwBsIAsqD8P8rfrkC0iLY1C/d9oS8dqbYhRbkCSm+zmEOf
         yEaygMcUnMnTXZl/YG49+gO5raxDEb9Lz03GbHFcwl4DS++PwNB6x9wPm2ti/JkLdDX8
         uONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947218; x=1739552018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxFFXjBXPh0mZXgN1D7X6dwazx3m6suk992pVSePYAI=;
        b=qNEsQAkf5qbtijlk+BXCv1A9UQR6l92hvzcsVHlHYv8+lXyT9T3OE2Y3uIkxuH77+U
         UYtEj7SZSGgIJiZ2pJcSqNA1SpzgfiQLMZJHVBF66BtSOqjPvEjZmAeXy9HafXm2qyPf
         BOIsB5YSB3V3dzkKw8er1rIXwuC0t/LtbJ7BXk69v12ZYahAUPMNj3wKz+ZTCvAqZ1Xw
         y/nn19C2aJIxYZ4pFklOHMwE06Qc5D/lDpJVhFo7l9BdTPPl19o4uG3EfXRsQ5w62YuL
         GdoPFKKfvlN98R82ZKIvDxuxBVlGr3///DKBTXzUZI/pNfZcw3jlZ7I/h49wtUKPNhCF
         gUhQ==
X-Gm-Message-State: AOJu0Yzit9Lt/2Dp82pzFnOQbZzJW6PkBD1biK7baEUEFWWeFTMV/kvN
	9rP2vjkGvf6grVHibr5hYacYsQzh/xHgNliW0saoBa97b51FMxleiyA95CaD
X-Gm-Gg: ASbGncuuewgNZ6ioM0MS0BwAQ/OWnHefJJs4NTa8lluAaJBMR5iwCd2DUrpoIDRPgDJ
	pQ2ECY/Xn3MMa+a6Nm8P07wX5m6JSNNLAfgfMYCOIEnogOIK6z6g1LQrNFjC40Rqgs7nqIB26Z5
	eQdwjlDZD1Oq0NLgqE+hSyugW4EwH9bGsLSRX9OrICtJS2gtTwvDZQPR41k30MlxePZHwIc2ThC
	UOTLEXaAK61Kz1QOlN5fOJ6QLAT2UrkNy2kt8mK+5vR6j78qvAzVg5rTyqSiseN2K2SxPJKncAy
	TvMNRqIz/6sZ0SdZKqr/QZIfI/JyOTKnQmYxyA==
X-Google-Smtp-Source: AGHT+IHloNittrDbs5jUYxV/yVOfttQCzuZ0Pek25uqtlRj5RWlIk5xsGyjvZADLruZUGFUmfRvU7g==
X-Received: by 2002:a05:6a00:9286:b0:725:322a:9438 with SMTP id d2e1a72fcca58-7305d4135bemr5871199b3a.1.1738947217412;
        Fri, 07 Feb 2025 08:53:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c15baesm3205820b3a.121.2025.02.07.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:53:36 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] vgaarbiter: documentation grammar correction 
Date: Fri,  7 Feb 2025 22:23:25 +0530
Message-ID: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
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

