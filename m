Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3347946A;
	Fri, 20 Feb 2026 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573524; cv=none; b=X4bWDGl27X6cio8U+XOqjBEXOh4R1fbGHapYgGZ/HihxOYDtHMU+WqzEaEMOaJ7ywfGf6Lnw2nDHh0NV0hfhcCuNG5he7MZPjJl6Cz1GeASSXgVGmq9Mav+KI9RM8mMWoZc736KqbS6VOcGRkstS7iX7JegO4DN+bdKVeQu2q6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573524; c=relaxed/simple;
	bh=7Pgp1ZaqnxGQ9t96OCfLnIauK91ZCwkC/SMIUk7+h8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LJsgJygWrtV+/j3FtP24agPHumPDmMbOF7P0Ji41s8yhhrE9wnZ3+Nuu8z9WgolpDCL0gmuOFOF74VjRy9JFhbUV7WBMTKuIjlQZbO7GYkvB3U7xI4Jq9d0qOa+wYfWUfpG1gB9Oj8ao1B3ank8Wd/SCPZoAxW8HxfshgMXHdhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com; spf=fail smtp.mailfrom=mssola.com; dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b=b3IWYsKb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mssola.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b="b3IWYsKb"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fHMjM3FbTz9tSb;
	Fri, 20 Feb 2026 08:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1771573511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n4eMS6/Net3WxTG0smxuB9tYPb7LU4qNNJlcQmsg+TM=;
	b=b3IWYsKb/u5z6mIx1FGeMyLA5tLQYSoZK96te1TM8fd50AsZrT1a1ds2/aX4nLlUBCyf2v
	Wrbg+mE2W3gOpqSyuSWaQot3DwZejB6P15NU6d/ul6Ss2lj2rBjybjjwuNwXVfqyLfCaha
	bN+IL8HRrKqir+66+MrurphTWJuHcqsjCakzoYo+HprMob/4d6nXZ/6U5zsj8gP7jmk6So
	fcIA6Wn01JjwNydCM2CaMrqW2xOzsqyuHxKe9v9BYgJf8c5suSt4bO7D18mpjZrD2gdql8
	jTZzguHyVisvphpbdi/PlNqLP/8wNZ7GwAEBx2Kag9O5uUGNouKG6t1BObotbQ==
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	alex@ghiti.fr,
	corbet@lwn.net,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mssola@mssola.com>
Subject: [PATCH] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
Date: Fri, 20 Feb 2026 08:44:49 +0100
Message-ID: <20260220074449.8526-1-mssola@mssola.com>
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
I have built this patch with multiple configurations and ran it with KVM
(the VisionFive2 board that I have lacks the needed extensions). All seems
to work, but I do wonder if we did not enable these for a reason or this
just slipped through. So far in the code I believe everything is in place,
and I haven't seen any commit in the git log stating otherwise.

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
index 7e76b6316425..7c6726a8d738 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -151,6 +151,8 @@ config RISCV
 	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_DOUBLE if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
+	select HAVE_CMPXCHG_LOCAL if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
--
2.53.0
