Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057240E8DB;
	Fri,  5 Jun 2026 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668799; cv=none; b=JrHiMnNVMK/HVbvvBd97I96TgweDUeQlwWfQzvu6opxbSzKt5InK/OpiQpu1jEqUD+mBuMpgnlQeWsI1tp2fS7As2hRsmdgFZJ3sGYOC+hmR6+EGC2oTIq2fcAPHVbPi3Ftpwib0R2Z3YTK14iMV1lu70T4DJ6rXj3hfu/6hzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668799; c=relaxed/simple;
	bh=T6uDSlpUhUJ7rbiXsbEBTdjQ9rISWfcCaiz+sFbZ4ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r58EOkVLnpjSihOqilk3bXuf3weh7A9VG+KvAH6b8+yg8W+ypsyQcuYkPi2E4WT8P7yAR4E3HkoOwwpb19+E4qkSCbD/taD8OYWVLSH7KdPcbJAlz+ZlYZ2v8dyv+b6JZypbsraby2E/xojGOdE4MB2SaueJOzdH11ZJRUXQsx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com; spf=fail smtp.mailfrom=mssola.com; dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b=Fgj4wnTQ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mssola.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b="Fgj4wnTQ"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gX3LZ6Zplz9tnp;
	Fri,  5 Jun 2026 16:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1780668790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BeU53WTNN3WRgj7/DWG54MEURJQ3xLzp3W1oAv5adgU=;
	b=Fgj4wnTQMvTy8ameFzuUpaaHw4m1N7KuhhNtaStri9JqxuCsajEz69l2YEAI/r49NqejZx
	gsMq4+h9dNpHgYV44nULWPh70IJj3TQ5Mt6H2qQcIj7QyzNSePGq+VfIPX4ZbiXTjG0CtX
	Tu/Sqf1DvsiqH3FfMo0JApv1LffrQ28gQocxnTpggdVpg/NbJvGWAmmcTVwPiH00KUYEcy
	vqrq6Yn5jcxdFijYCtDfenyZ2YsNSUzyRDAdTjtaE3RCV+vZ3TPxJ9ANQXKMHZ7YWPMJUy
	P3UecSD0pSdJ/vKLRNomwwh8Jp+FJVoxJk5BfL3o50LMFFVpLBBja17mlOSyxw==
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
To: linux-riscv@lists.infradead.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
Subject: [PATCH RESEND] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
Date: Fri,  5 Jun 2026 16:12:47 +0200
Message-ID: <20260605141247.253315-1-mssola@mssola.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Support for atomic Compare-And-Swap instructions has been in the RISC-V
port of the Linux kernel for a long time. That being said, we apparently
never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
Kconfig, despite having all the framework to support them.

Signed-off-by: Miquel Sabaté Solà <mssola@mssola.com>
---
This is a resend of [1], rebased on top of the latest commit from the
for-next branch.

I have built this patch with multiple configurations and ran it with KVM
(the VisionFive2 board that I have lacks the needed extensions). All seems
to work, but I do wonder if we did not enable these for a reason or this
just slipped through. So far in the code I believe everything is in place,
and I haven't seen any commit in the git log stating otherwise.

[1] https://lore.kernel.org/all/20260220074449.8526-1-mssola@mssola.com/

 Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
 arch/riscv/Kconfig                                            | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
index 2c3a4b91f16d..28d5fa8c3b4f 100644
--- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
+++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: | TODO |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1955fcc5effd..b8ca5792a392 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -152,6 +152,8 @@ config RISCV
 	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_DOUBLE if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
+	select HAVE_CMPXCHG_LOCAL if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
--
2.54.0
