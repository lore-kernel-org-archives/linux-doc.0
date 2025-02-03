Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA59209681
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599571; cv=none; b=cob15c98rwIuzgHLiqVcszWSs7vSXcXIOAvpc7WRIBRIRIrxqUWEgTgRU22V+Z/XfTQLXcd9OqIUwSOWLSt8lKHWCv6U9ZZADkj+NW41J4EMKeHseoBcXpCSSwkXmJojcfpJSKwUQATWrkEvHK0e7/0mfRY7tinM874McRYOhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599571; c=relaxed/simple;
	bh=qinQt7wASeFf0Havw9p6QcLUlC/f+ZP2hKrK/KzcsvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxA1kOZB9t2O7DziCna0cfHfPqUoCJZ76x/jyBoCvbmcobb27dft41OFZlnQjMHluMEa8gWgDP5DzSkLAXPDNuuB01WwS0F7UzlDq6C2BWAFCX4pxeN79vJU2zP9H0zC/hYqHAmRG7JxtIS5AUEA1649lDhsNjmD8sQZrrBrPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5Yz36Bc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5Yz36Bc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21661be2c2dso77328435ad.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738599569; x=1739204369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7X6yE+z3+YM3voKFI7mGJEh5PgUIAgLmSw61EntbZ4=;
        b=m5Yz36Bc5aF57jXOgm85a/lqa9+cYhlSFGoZxAAHha7fhvKp7vNTWFi13f0GALGAgW
         xx9v+Y9fB2dUbDaWbWu0Bx4n14neEvQvubBzo2sMFeybvhuJJnaRHnOQWu6S22YTq1mo
         KVfTojRryuHb0q3T8Oxq3LxWvZGhwA1IHus1E2SYTmsNyGzCq3kOPfrW5Xazc0/Meceu
         R0Ej+jro+cE6Oo5eImk93rKsZrlIWQc/+Xa7q+M0gfbEkUD5PNz025o3yrkTcreqx/2m
         cQaDhWHrcAGuKzMwkuYITul2cJl8EpOaSESaGhY+bIk99KA4r+ku0TQ+4EgZ6UiQ9xrV
         cBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599569; x=1739204369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7X6yE+z3+YM3voKFI7mGJEh5PgUIAgLmSw61EntbZ4=;
        b=mxJhEtzPkGck0XB1VngosAW9/RsD8isckS2g1fUDDiAVNVYDC5yvtwAqDJeDMQ83rm
         XOBwaUPlccWN6dHPaAvLShqoHuV6ZnChE1E1cugdqt4X7X0shSCQcb+uwLpIM0dzJOFU
         FGTBbfsQNf6TexeaY7Yvfm58ff2m6UGPyuRlXmwv4bb8Xtc4p8ZJR/Jy0v8jqimLrCuc
         wWRCwd21J1oV7ay8xbinWMezOadpwtSHUT/x7fEBqcUdBLq4E/kd0z2XRFNHsOqM1OVq
         4ywDaKYhSksMK4gIjDSez110Z3Jt2DRHARgiTM3WgiZnYRiYXQ+rw76y1axi4ZJEkoy8
         uy1Q==
X-Gm-Message-State: AOJu0YxfYICRLbS563+JkaUu1rtaJBDHPjZI5cg6Ta5yV8FAvgaTyYqM
	/Y/2bP5ep/jzAWsr9Bo0m5wNRN3j5Qy6Llj8s6RxVfAEysi5fXi+m9mzlVsY
X-Gm-Gg: ASbGnctOoOHJpT5SvrMTp+lTk+Ju9k7GEhG1TRUoBSNMPMtG8fIqLS9THS1ibCB+v5g
	7fDDgw1gNEmZEB8jKaF6oCRshC6LJa7J/lUteO+nmKJSn8AALrbcjJUYhMfY3jz3bc3s03pZuYf
	ur1tKsYQoPMQveieP8kA/BSoUIOdCWWZ/Wsa+XbeyKiPNz25+FIC7S9VyCcQSfwxx4P4VjNBSwK
	BexduqwaV0BCXGKgX0Nyo0Sioq3ataQp2UUUHHhW64pa+S5SF9/HSW9kr+S4AoP0JlL5Encg+nP
	f8tFRz1VDXyYjSPNTBXmORk6/NR/UfKI05XW7Q==
X-Google-Smtp-Source: AGHT+IHckQx32NYfV0RKRBmdLVRCT23nHFajVlPXzIw6gASBnxD79fm7Ls7sHjEWDzSmoJQPb/n74w==
X-Received: by 2002:a05:6a00:3e13:b0:72a:a9d9:5a82 with SMTP id d2e1a72fcca58-72fd096a1bemr32480223b3a.0.1738599568921;
        Mon, 03 Feb 2025 08:19:28 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba47esm8849887b3a.96.2025.02.03.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:19:28 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] documentation grammer correction 
Date: Mon,  3 Feb 2025 21:49:20 +0530
Message-ID: <20250203161920.14028-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am submitting this patch as a part of lfx mentorship application tasks.
This patch contains grammatical and spelling corrections in the linux
documentation. Please let me know if any further clarification is
required.

Regards 

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

