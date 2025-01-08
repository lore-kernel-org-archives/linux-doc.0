Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA2719D8A9;
	Wed,  8 Jan 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336556; cv=none; b=TDakm4BVuYQgRd2/Qdz/z+dwcfJtXtaqqoObToBJErh++XVe7KDu4hLhq1pvUsaGuwZSOpMfIRO1HXaBC18qIyiCtYxoWSt2vZfUSxEWeuxFFvWbzDBHtmhE9iTe08SdtmE+3PZZUJNyMzDhEjAk74pFc7RUNSZ69Sr0otKKtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336556; c=relaxed/simple;
	bh=5y4MEftMijF/5b+Wou+mz5/zFh4LhqCK1ZL7woXu6i8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B24MGctE60cQSyIlDsSfN8kiM0p2wW5DYR1T3vR1XpOmRCUU8NbnKP8GbwwIk0eAt/cuARAAX4xRZo7DUJgwe7vwrm27YnhZh6uk6WrnZ9t+K5oTpPliPEzoz9FD+m9d2n7IKQiGpviAXnOKlxjzXZZyEr7dcp8XwUGvPrVu6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=BuKfb0Lk; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="BuKfb0Lk"
Received: by lichtman.org (Postfix, from userid 1000)
	id 20D781771DF; Wed,  8 Jan 2025 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1736336122; bh=5y4MEftMijF/5b+Wou+mz5/zFh4LhqCK1ZL7woXu6i8=;
	h=Date:From:To:Cc:Subject:From;
	b=BuKfb0LkdU3LIar6Sk8TGQMtbF4fTC2Wni/y4JCGY5mmyMRc+Xsp1sqtsrN+k5k0R
	 P0LMnDq6E8e31o8ApXxj9N95sZLiL6ZhlpA3+ITt3g3O+orbgQhmtUei5AtKTyhFnJ
	 2zDErr97/eI9bsdokQzhYr8fZ+W2L0EF3Gydy1AJ2ofhmbhW2aIuON6rdj21/+AF2F
	 CheXp+qAv9zcOIIl/p7kirA5B0yjvLBMmxyQVOqPaiky1A4itmlYtbKycy3uaPrGO5
	 9Znpf2lVGJnTicWGIf34WXx2WKKvOJPEkCSTVjHZPzVulybGmcxlfDjhvwtHe6ybDV
	 7/bpQinr3j+dA==
Date: Wed, 8 Jan 2025 11:35:22 +0000
From: Nir Lichtman <nir@lichtman.org>
To: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Cc: bagasdotme@gmail.com
Subject: [PATCH v2] Documentation: Fix x86_64 UEFI outdated references to
 elilo
Message-ID: <20250108113522.GA897677@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Problem: The x86_64 UEFI doc references Elilo which is an
unmaintained/orphaned bootloader project. Also, on x86_64 a bootloader
is technically not actually required since there is support for the
Linux EFI stub.

Solution: Remove the references to Elilo from the doc and refer to the
EFI stub doc page, update steps accordingly, and add more details about
creation of the EFI partition to improve clarity.

Signed-off-by: Nir Lichtman <nir@lichtman.org>
---

v2: Fix list not rendered properly and minor wording fixes (thanks for the CR Bagas)
Also fix to use shorter lines

 Documentation/arch/x86/x86_64/uefi.rst | 36 +++++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/uefi.rst b/Documentation/arch/x86/x86_64/uefi.rst
index fbc30c9a071d..3949d83a9915 100644
--- a/Documentation/arch/x86/x86_64/uefi.rst
+++ b/Documentation/arch/x86/x86_64/uefi.rst
@@ -12,14 +12,19 @@ with EFI firmware and specifications are listed below.
 
 1. UEFI specification:  http://www.uefi.org
 
-2. Booting Linux kernel on UEFI x86_64 platform requires bootloader
-   support. Elilo with x86_64 support can be used.
+2. Booting Linux kernel on UEFI x86_64 platform can either be
+   done using the <Documentation/admin-guide/efi-stub.rst> or using a separate bootloader.
 
 3. x86_64 platform with EFI/UEFI firmware.
 
 Mechanics
 ---------
 
+Refer to <Documentation/admin-guide/efi-stub.rst> to learn how to use the EFI stub.
+
+Below are general EFI setup guidelines on the x86_64 platform,
+regardless of whether you use the EFI stub or a separate bootloader.
+
 - Build the kernel with the following configuration::
 
 	CONFIG_FB_EFI=y
@@ -31,16 +36,27 @@ Mechanics
 	CONFIG_EFI=y
 	CONFIG_EFIVAR_FS=y or m		# optional
 
-- Create a VFAT partition on the disk
-- Copy the following to the VFAT partition:
+- Create a VFAT partition on the disk with the EFI System flag
+    You can do this with fdisk with the following commands:
+
+        1. g - initialize a GPT partition table
+        2. n - create a new partition
+        3. t - change the partition type to "EFI System" (number 1)
+        4. w - write and save the changes
+
+    Afterwards, initialize the VFAT filesystem by running mkfs::
+
+        mkfs.fat /dev/<your-partition>
+
+- Copy the boot files to the VFAT partition:
+    If you use the EFI stub method, the kernel acts also as an EFI executable.
+
+    You can just copy the bzImage to the EFI/boot/bootx64.efi path on the partition
+    so that it will automatically get booted, see the <Documentation/admin-guide/efi-stub.rst> page
+    for additional instructions regarding passage of kernel parameters and initramfs.
 
-	elilo bootloader with x86_64 support, elilo configuration file,
-	kernel image built in first step and corresponding
-	initrd. Instructions on building elilo and its dependencies
-	can be found in the elilo sourceforge project.
+    If you use a custom bootloader, refer to the relevant documentation for help on this part.
 
-- Boot to EFI shell and invoke elilo choosing the kernel image built
-  in first step.
 - If some or all EFI runtime services don't work, you can try following
   kernel command line parameters to turn off some or all EFI runtime
   services.
-- 
2.39.5

