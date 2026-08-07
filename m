Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A242CAEF
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 20:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133217; cv=none; b=u1aMsXnKUr5UK1pzp3Y42rXj0foMQvukFMPLx0QNe2erIRSe+xZgTAQtqNJdL/KUPUZEX0VPUjm91m0G4xx/npj0BdwtsvOqAAzMbtAnlJ/ktEXMR5q0n6HuUF3oXUY9IkmKoiDRraknoMcJUNGQxuySjSq+2OBzMDpeVQ+Pr8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133217; c=relaxed/simple;
	bh=B5vjso3WytCS2+uPX1Twai7hqC7D2oi2pc6SW+aJLrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=f46QxN7bGkUkKrCryx0UkLF17BeSDAb9e2T/TBiB2F5O/tkLWFBUEr2iClo6IFi8kPKIlLLSwl40N7QJztT4r8hFr5lJvcHCQhwXdLWB8bJ36NqJGk1KbKuGTDZuzW391CYU+I8bz+73ccNJWA6Rpd76C6HGwDoPJLlqW77X6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZQKkV94; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZQKkV94"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954aff6088so37845275e9.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 13:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133211; x=1786738011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcvzOP3DsrMH8W1cQwtr2Rj2FiH385dungW6zjf9cLs=;
        b=VZQKkV949n273BG4gXlIn4lK8SKiJQdTRJ66S00hwyWyaXEM6oo8E+9BbjylltzNX6
         BxHn1U5qkrB3iT7+Bz9sRKENtoFkecTPAKngE6GnqSoSNIt5jK7AiFkfUGgJQZvrPj9I
         z7aQBZj8wafowKCCEev0/8Wm0diPQuRt7M0+2u0SFTLsLuemq8T0qil978fDmN1V17wk
         Lzu1uSir6npK3VTTwnXZog+hbJxMvTLhSaNw0u1TqdLDiJtf0GPI0mos69feucKNgSL9
         HR63Y1dCH5GnMhKCLvJxCIMGDrZ49UnzvrNCsH0oJ7IxRMFmI55w4QkxUMLIhJ9KPsQD
         NxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133211; x=1786738011;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcvzOP3DsrMH8W1cQwtr2Rj2FiH385dungW6zjf9cLs=;
        b=AlOVsy8jS33BsaUolQ7PL1kcmZd6B2EEs8yHXLJwRLlYMHbSFC/zJ8673S/zRNe0NK
         dagqTaPGl202Z7NSf3XRyiahWfGFb0bj0gbiTJx6IwDjIEk3vkbUSM4nx3fiaxJWruXL
         brVsW9iIP2jsBtEd2IUqpVzQlE279lX0pJkuYUIiOMDtrIJfP+zettmRgGzPO8rFK8qA
         u/6ngKKEpieogAOD4neFBZ46Jy8mBZrFnmBT91xXfjSjWWuSf058piavlL828Yw6C5Fr
         wRAw+cp8W/iUWt112u5GEjiUyTm2JSL8NvnvriZTlzSLAZIpMtYCRf/GJ/NcwCPw0abR
         R6Og==
X-Forwarded-Encrypted: i=1; AHgh+RqmmeVyFg5vv5Da0QWFmg4VbkazxZ/Rfe/H837Cz36NiiPLHdvS1JltiyvwjC11NbsD1U/D2ERPEo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7jrnEs8e0i0AF3JiZ2Ynm0JXWWSXhvcBbCGgH+m4yByLztPB
	UInO7i9PeQ7bPsuz2iM6F8ohDPgLU+HiNIzyMfTeZ5EFr/3YdaZDR577
X-Gm-Gg: AR+sD13mL3d5+tkAWtQpQgap8oDj+ZYi+4feICOAm5iVhlP5nHR4qZ+O6bpVcRQ3s7q
	g2n/0Lqj2qieXQFRO5qI/whb+pHsTUQ4gbzF3RF8tw/D2IBsJaC8sTdkApuKZl2r3rPnL1Jod++
	GWFABcCSP/eWPrH/ylr5fcK+YY0Ju4ie0KRs+uh9wLEueDwVPttlQzqWqFhEWsUXR/uvxnVXT7v
	VmYHnwn84gfJ2lbbUt8HiiAG7wAPXO4lGTkj0RxgSyWh1VMRxmj9LcDQSW3Q7UcRnQwuuVUR5oJ
	g3FSS440eubDJRH/p+UAVQ+Lf0bC/bv6eJ69ucg00hQQGbgWjKSUFo1FPkUlQ/6xQ7xNm1pWr81
	PYoMXwuAXIGzqiCJG4hJkg0lQv30Xsc5QRg8LKFSGYJ6M69/kLE/HFyl768AxyZ0eUWv8CbbWMZ
	pnh3L/2QCTmNFS3eJ8lyPclJrYv7Nz2SDZBRdZEXZZqYi3a4k0ccenOCvaz/Iq/cuetRKHNzvqb
	eT5yAHs6FQQR49nbR5G
X-Received: by 2002:a05:600c:1991:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4994e7448d9mr312485465e9.2.1786133211126;
        Fri, 07 Aug 2026 13:06:51 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:848a:c270:b637:504d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9eb1a0sm67283895e9.5.2026.08.07.13.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:06:50 -0700 (PDT)
From: =?UTF-8?q?Christian=20Melendez=20Nu=C3=B1ez?= <chrismelnu@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	=?UTF-8?q?Christian=20Melendez=20Nu=C3=B1ez?= <chrismelnu@gmail.com>
Subject: [PATCH] PCI: vgaarb: Remove stale "not implemented" notes from docs
Date: Fri,  7 Aug 2026 22:06:39 +0200
Message-Id: <20260807200639.172487-1-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vgaarb kerneldoc and Documentation/gpu/vgaarbiter.rst both
describe "unlock all" and "target default" as "(TODO: not
implemented yet)". Both are actually implemented already:

- "unlock all" is handled in vga_arb_write() via the "all"
  strncmp branch, which releases both VGA_RSRC_LEGACY_IO and
  VGA_RSRC_LEGACY_MEM.
- "target default" is handled in the same function via the
  "default" strncmp branch, which resolves the target to
  vga_default_device().

Drop the stale disclaimers so the documentation matches actual
behavior.

This is my first submission to the kernel; happy to take any
feedback on the patch itself or how I should be doing this.

Signed-off-by: Christian Melendez Nuñez <chrismelnu@gmail.com>
---
 Documentation/gpu/vgaarbiter.rst | 9 ++++-----
 drivers/pci/vgaarb.c             | 7 +++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index d1e953712cc2..c3a728130b54 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -65,8 +65,7 @@ write
         unlock <io_state>
                 release locks on target
         unlock all
-                release all locks on target held by this user (not implemented
-                yet)
+                release all locks on target held by this user
         decodes <io_state>
                 set the legacy decoding attributes for the card
 
@@ -74,9 +73,9 @@ write
                 event if something changes on any card (not just the target)
 
         card_ID is of the form "PCI:domain:bus:dev.fn". It can be set to "default"
-        to go back to the system default card (TODO: not implemented yet). Currently,
-        only PCI is supported as a prefix, but the userland API may support other bus
-        types in the future, even if the current kernel implementation doesn't.
+        to go back to the system default card. Currently, only PCI is supported
+        as a prefix, but the userland API may support other bus types in the
+        future, even if the current kernel implementation doesn't.
 
 Note about locks:
 
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index c360eee11dd9..4ae96ae60d8b 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -1008,10 +1008,9 @@ EXPORT_SYMBOL(vga_client_register);
  * poll         : event if something change on any card (not just the target)
  *
  * card_ID is of the form "PCI:domain:bus:dev.fn". It can be set to "default"
- * to go back to the system default card (TODO: not implemented yet).
- * Currently, only PCI is supported as a prefix, but the userland API may
- * support other bus types in the future, even if the current kernel
- * implementation doesn't.
+ * to go back to the system default card. Currently, only PCI is supported
+ * as a prefix, but the userland API may support other bus types in the
+ * future, even if the current kernel implementation doesn't.
  *
  * Note about locks:
  *
-- 
2.34.1

