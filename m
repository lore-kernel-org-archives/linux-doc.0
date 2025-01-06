Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F56524B0;
	Mon,  6 Jan 2025 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736203340; cv=none; b=T4Q1Bc6JOCQhMjDGE1oKZ2bfWEz0KvXMUZMKYAi7lbe4juByMOzKXSlw3b7vC78dWki/Hs8kaQu9uy9IU3szgaYUio6yjPgiZNR5sjiXEe9Yvm+phuP+Kd1hSgaEsqQFeRguXPn8x2+PyhQy3k/j4zdmvbVoBFhZfopaW1Dr79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736203340; c=relaxed/simple;
	bh=UwT9oUDeBx98DMq7VuA0bQ/j103lFhGCHweWdbPm6Gc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DUqMOWQnjth7G190VENYa8kWm72tWSb4JZz4zz+f5I+Zd7AX4/V3Y+Vb3hHJmKjUmvCUIcouyRxtDaERxMGCKcb+m6vcO18Edds9VZJ/1hQyj3TlnPUYxET8wyVcL/8V3oUo+/hkrnjvWDqBLgZkJ7zD627LBfTX/TlMazFKAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=Q2/zDoeX; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="Q2/zDoeX"
Received: by lichtman.org (Postfix, from userid 1000)
	id 0B6601770E1; Mon,  6 Jan 2025 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1736202927; bh=UwT9oUDeBx98DMq7VuA0bQ/j103lFhGCHweWdbPm6Gc=;
	h=Date:From:To:Subject:From;
	b=Q2/zDoeXGLnRpIfzD3MunSlVNqya4J3auAM7TqJnTIuCQba75EwTe4AEkpJN9GitV
	 K/p7QZgBGJ0V0nYA98BZCm4MvXxqTlBymQ/ZoXOzZpYSkXFt+nGhJ1XxW+UViArPfL
	 9lAGeXlQmGjEHpgL96alVJKD1fJYNLgNZ2kUuINpARwxQc0rqOA0marpr3WYyXIzrl
	 uR94ce789+h/8xD4ThJa7uEEvYvyGGW0FPEfnWGAwIapg18RGBDrT9Byft6Mr8ppGC
	 tfscqj2JI9W26g50Lpa7kXJp256D8PWzOWtJBDT1fOYnI7L5zqqQGdZhHfmAIKI6+N
	 Qy2RRsI8pXoXA==
Date: Mon, 6 Jan 2025 22:35:26 +0000
From: Nir Lichtman <nir@lichtman.org>
To: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: Fix x86_64 UEFI outdated references to elilo
Message-ID: <20250106223526.GA877278@lichtman.org>
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
 Documentation/arch/x86/x86_64/uefi.rst | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/uefi.rst b/Documentation/arch/x86/x86_64/uefi.rst
index fbc30c9a071d..c056063f49d5 100644
--- a/Documentation/arch/x86/x86_64/uefi.rst
+++ b/Documentation/arch/x86/x86_64/uefi.rst
@@ -12,14 +12,16 @@ with EFI firmware and specifications are listed below.
 
 1. UEFI specification:  http://www.uefi.org
 
-2. Booting Linux kernel on UEFI x86_64 platform requires bootloader
-   support. Elilo with x86_64 support can be used.
+2. Booting Linux kernel on UEFI x86_64 platform can either be
+   done using the <Documentation/admin-guide/efi-stub.rst> or using a separate bootloader.
 
 3. x86_64 platform with EFI/UEFI firmware.
 
 Mechanics
 ---------
 
+Refer to <Documentation/admin-guide/efi-stub.rst> for general setup guidelines on usage of the EFI stub, the following are setup specifics for EFI in general on the x86_64 platform.
+
 - Build the kernel with the following configuration::
 
 	CONFIG_FB_EFI=y
@@ -31,16 +33,20 @@ Mechanics
 	CONFIG_EFI=y
 	CONFIG_EFIVAR_FS=y or m		# optional
 
-- Create a VFAT partition on the disk
-- Copy the following to the VFAT partition:
+- Create a VFAT partition on the disk with the EFI System flag
+    You can do this with fdisk with the following commands:
+    1. g - initialize a GPT partition table
+    2. n - create a new partition
+    3. t - change the partition type to "EFI System" (number 1)
+    4. w - write and save the changes
+    Afterwards, initialize the VFAT filesystem by running mkfs::
+
+        mkfs.fat /dev/<your-partition>
 
-	elilo bootloader with x86_64 support, elilo configuration file,
-	kernel image built in first step and corresponding
-	initrd. Instructions on building elilo and its dependencies
-	can be found in the elilo sourceforge project.
+- Copy the boot files to the VFAT partition:
+    If you use the EFI stub method, the kernel acts also as an EFI executable, and you can just copy the bzImage to the EFI/boot/bootx64.efi path on the partition so that it will automatically get booted, see the <Documentation/admin-guide/efi-stub.rst> page for additional instructions regarding passage of kernel parameters and initramfs.
+    If you use a custom bootloader, refer to the relevant documentation for help on this part.
 
-- Boot to EFI shell and invoke elilo choosing the kernel image built
-  in first step.
 - If some or all EFI runtime services don't work, you can try following
   kernel command line parameters to turn off some or all EFI runtime
   services.
-- 
2.39.5

