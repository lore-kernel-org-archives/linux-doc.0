Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926621EF0AF
	for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2025 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345639; cv=none; b=bvXouBPatk+6HAx1k9xedWUL3aRnYSxqLrjGD/mfBoVyCK/t0//kp22qAtK5FKvFa21xKn5Gm1i19s4E1H8TdC77ljBFSSaDXLVSKiUkSgxSUnhfZNuYRPOu4QwY/BSaNHZpoSP8BAwsy4fukn4xgSj8Q0bZtQUdPBRsyVyqvfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345639; c=relaxed/simple;
	bh=aoyjvtNcT8MbEevAje0oGmQYgM7ADSBPecevEok87Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQRgPTrIo4MHOaomZzFu3j7LFZlY94dScG3ry5byHiDqb/v5cFkhHrE40OTiK6oSseAl6D3kGitCXK9qvGdNCnWAfpTASeYI8pgGGw7ceuqF3vJNIeEFJ9hlojtN9+FsS9zY8MIy8RzYJAmSUmJELmQsQ8jK8yBJ1GmOwST8QdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6lT6ZXh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6lT6ZXh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21636268e43so51168855ad.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2025 09:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738345633; x=1738950433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7YlXdN8EH6kD+0yxUGaKa6fqOZSgCi9IOU8Ql/cpYw=;
        b=k6lT6ZXhHAUfKuQkiPNhY8zjGSocxrsUewYjIZO2byzH7cxVmjp4pgbZqpd2/p5waz
         RXGEQ3FHzgTJWyPjytdzE/3N16qANuDGAUEr8dr4OTfKy29TXro+FufFe0GMwoJRyydh
         LjvjAMU1irSqbjU8oG0BuNAk5VYIo92Hi5kWrUKqpfbqjJZgqfyNUTxmgDhnci68iPKG
         VPctFwr0yXB+X+1zClnL5meIqNTVaqsHkOQdOaK1Kj8QQMAaoF8UGp8o62IS4+NnllW2
         xf/lKBdXaHUpU/hs3A9rmX/sBFLN2M2NM0XBo0Kxc/sA789AfkSIYNYQwz06aE/fEmia
         a9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738345633; x=1738950433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7YlXdN8EH6kD+0yxUGaKa6fqOZSgCi9IOU8Ql/cpYw=;
        b=MCbRt+YXrvbREmS9kWQ/Q/MfNM6qbATmYpj44vZfuGpIjVy0qt+8eGOUdiS+hv2e5H
         BZN9+Xxd0zo6jAwGFQw2vgZ8dmP5U2+F/naFb1m5WZtAnJkBa58AARNtAvnSy7HXCPYg
         bBLbYVlrwEe3A6s/kP+l38xIKbtG8klAQbiXiReuhd0IHX277rIppkQDuI78Zp+1Vgvf
         fRtSEkr8ceHFPy55dmDemcVbf8yUz0nLa0anczsrWtmAhz+pCuStDbcDh+q8gv98rMi2
         RNoT5SfoFreELEpcuu4p++KvSIvkcC4c54h5PWbws4bcQPyEWdDZsIBhUOna6FUhSkLM
         KsBA==
X-Gm-Message-State: AOJu0YwT6XA1TSSH7uVCCMZ0CoczdSOTra87wnbwY0y+/dCLYgLeXEdf
	aR4WJbpv9v/r4SZTfXAlh7xCC2aigeqdngVg5yIwOXV5vBI/whYgCnh1hmam
X-Gm-Gg: ASbGnct4jvf+mcURSJBjQh2sTWCNJSl3uZontDFgGLWkEWINAoDwLom6rz1oep7yYHu
	Kep9BL/o73ZwbRtw88DLxO3ZqKw+JLGZvZYT+oRKaWQFxQRz+RfxVINOm88vhj65DZMncadarsP
	UyiviLsRpcoIb76YQAj3NMibzBGO/43VJ+osbIqe1qc9WlBVtnzlXgE/C/tIi3HTbjvBY8YOZgu
	2QPpvtlZj9YW0p117UwxYAfehNE7oBBtAR1x3oRImwmq9u9Et5Ndj/8HALl0WMWgX00CbCdiiv5
	seDHE/deMij17vVpC7qKGIGK6qzqApfmZNUfxA==
X-Google-Smtp-Source: AGHT+IEm5jy1kLtVHI3l7PHXPWmuU4lPhbHbDIuUMyizg7hcBnB4M12yIiy6xO+22RLDVTeT3CltkA==
X-Received: by 2002:a05:6a00:244b:b0:72a:8461:d172 with SMTP id d2e1a72fcca58-72fd0bcf0a3mr18874603b3a.3.1738345633163;
        Fri, 31 Jan 2025 09:47:13 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:bc01:38de:cff8:1fb8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69bbb7esm3704010b3a.106.2025.01.31.09.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:47:12 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] documentation grammer correction 
Date: Fri, 31 Jan 2025 23:17:04 +0530
Message-ID: <20250131174704.12501-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

