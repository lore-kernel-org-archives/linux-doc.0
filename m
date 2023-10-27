Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589893D70
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="b7Cj+99t"
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84721AD
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 21:10:52 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4a13374a1e8so725836e0c.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 21:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1698379851; x=1698984651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zr4CMcCNr47rtjiMtOCR5BoD+5ICiNMzRi+m+m3pAJU=;
        b=b7Cj+99t/2Xz4C9BW/aG3jMDxNB/SgDgYzK4L3pb3wHP25t1GB6fnHZuKTfBC/J2Qb
         yUVe3s0B8/JBhBVITfm4DFurdlujX0edwXsRv1r9aOfQepQyRp2i+iI9GluK3ZQs+WxV
         WizWp/Fgudueod5HFA6OvZoQbv1Hge2cV285xmkhbuO2k/S/AdIFTXKjYI2pemgGNtm4
         VLydMO0UsvuEmxS3Klq47KWUdKN8qUcPu4FLMt9dDPrsskutkLz9BJuYqn/tQ0Brxp4+
         TUqVwU++JXBrWwNxpbWXa22ofCBPI33O6R8GCKkeULGpl03uJq47dEt5pVRKyxAS5zV3
         KqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698379851; x=1698984651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zr4CMcCNr47rtjiMtOCR5BoD+5ICiNMzRi+m+m3pAJU=;
        b=OJhvxXoPMKuRC3qqAJaqidTuTBqPjeiR+WghLx2LojTesR/MK+JNj+Ib7EuXer1fIG
         2Ux3Cuqe636rQYGfQmXpEUnGcdjqN1pxA+5TAUZhCjvHkv1xtHJZRDj1KSGQziOEcOMk
         KO3ti6GelACI88Q87HGQ9KYtJjzkhLRmYf8sT02c36KVwpxG0SE4t18wz9OFShKOVXfc
         4T1SBaeopzUNSoPuou9x59T4ygfgmZR/xcCv4L7A+pJ43Ckc46yLeR3oFH5eog44lL11
         nzFi6KI3ZY7LT6H30L4szERSQwzMR4GsVdcxPVD690DL1GYKr9DKNz3Zq/CVxXPglbHD
         eOvg==
X-Gm-Message-State: AOJu0YzHiP1l8Ck8Ugr1Abo9BEujAYs6GJ7D/eJZHjBuF7gFxfG4AQwv
	sFZJ+/6EFg3MasM4bBfAmaC9Shs0gF0NItqMrno=
X-Google-Smtp-Source: AGHT+IFuIH0D8qnD/TEk+G6o/eEOdZFxXdS6a46+3qbM5nPvY63SW/RuIiGz41tyWDVAuRagP5tCSw==
X-Received: by 2002:a1f:298e:0:b0:49a:7a5b:dab2 with SMTP id p136-20020a1f298e000000b0049a7a5bdab2mr1866912vkp.16.1698379851468;
        Thu, 26 Oct 2023 21:10:51 -0700 (PDT)
Received: from fedora.hsd1.fl.comcast.net ([2601:580:8201:d0::6331])
        by smtp.gmail.com with ESMTPSA id z194-20020a814ccb000000b0059f4f30a32bsm354190ywa.24.2023.10.26.21.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 21:10:51 -0700 (PDT)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hunter Chasens <hunter.chasens18@ncf.edu>
Subject: [PATCH] docs: admin-guide: Update bootloader and installation instructions
Date: Fri, 27 Oct 2023 00:10:23 -0400
Message-ID: <20231027041023.16681-1-hunter.chasens18@ncf.edu>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates the bootloader and installation instructions in admin-guide/README.rst
to align with modern practices.

Details of Changes:

 - Added guidance on using EFISTUB for UEFI/EFI systems.
 - Noted that LILO is no longer in active development and provides
   alternatives.
 - Kept LILO instructions but marked as Legacy LILO Instructions.
   Suggest removal in future patch.

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 Documentation/admin-guide/README.rst | 71 ++++++++++++++++++----------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 9a969c0157f1..fba66f909f98 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -252,7 +252,7 @@ Configuring the kernel
     - The "kernel hacking" configuration details usually result in a
       bigger or slower kernel (or both), and can even make the kernel
       less stable by configuring some routines to actively try to
-      break bad code to find kernel problems (kmalloc()).  Thus you
+      break bad code to find kernel problems (kmalloc()().  Thus you
       should probably answer 'n' to the questions for "development",
       "experimental", or "debugging" features.
 
@@ -262,9 +262,11 @@ Compiling the kernel
  - Make sure you have at least gcc 5.1 available.
    For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
 
- - Do a ``make`` to create a compressed kernel image. It is also
-   possible to do ``make install`` if you have lilo installed to suit the
-   kernel makefiles, but you may want to check your particular lilo setup first.
+ - Do a ``make`` to create a compressed kernel image. It is also possible to do
+   ``make install`` if you have lilo installed or if your distribution has an 
+   install script recognised by the kernel's installer. Most popular 
+   distributions will have a recognized install script. You may want to 
+   check your distribution's setup first. 
 
    To do the actual install, you have to be root, but none of the normal
    build should require that. Don't take the name of root in vain.
@@ -301,32 +303,51 @@ Compiling the kernel
    image (e.g. .../linux/arch/x86/boot/bzImage after compilation)
    to the place where your regular bootable kernel is found.
 
- - Booting a kernel directly from a floppy without the assistance of a
-   bootloader such as LILO, is no longer supported.
-
-   If you boot Linux from the hard drive, chances are you use LILO, which
-   uses the kernel image as specified in the file /etc/lilo.conf.  The
-   kernel image file is usually /vmlinuz, /boot/vmlinuz, /bzImage or
-   /boot/bzImage.  To use the new kernel, save a copy of the old image
-   and copy the new image over the old one.  Then, you MUST RERUN LILO
-   to update the loading map! If you don't, you won't be able to boot
-   the new kernel image.
-
-   Reinstalling LILO is usually a matter of running /sbin/lilo.
-   You may wish to edit /etc/lilo.conf to specify an entry for your
-   old kernel image (say, /vmlinux.old) in case the new one does not
-   work.  See the LILO docs for more information.
-
-   After reinstalling LILO, you should be all set.  Shutdown the system,
+ - Booting a kernel directly from non-volatile memory (e.g. a hard drive)
+   without the assistance of a bootloader such as LILO or GRUB, is no longer 
+   supported in BIOS (non-EFI systems). On UEFI/EFI systems, however, you can
+   use EFISTUB which allows the motherboard to boot directly to the kernel. 
+   On modern workstations and desktops, it's generally recommended to use a 
+   bootloader as difficulties can arise with multiple kernels and secure boot. 
+   For more details on EFISTUB, 
+   see :ref:`Documentation/admin-guide/efi-stub.rst`.
+
+ - It's important to note that as of 2016 LILO (LInux LOader) is no longer in 
+   active development, though as it was extremely popular, it often comes up 
+   in documentation. Popular alternatives include GRUB2, rEFInd, Syslinux, 
+   systemd-boot, or EFISTUB. For various reasons, it's not recommended to use 
+   software that's no longer in active development. 
+
+ - Chances are your distribution includes an install script and running 
+   ``make install`` will be all that's needed. Should that not be the case 
+   you'll have to identify your bootloader and reference its documentation or 
+   configure your EFI.
+
+Legacy LILO Instructions
+------------------------
+
+
+ - If you use LILO the kernel images are specified in the file /etc/lilo.conf.
+   The kernel image file is usually /vmlinuz, /boot/vmlinuz, /bzImage or
+   /boot/bzImage. To use the new kernel, save a copy of the old image and copy
+   the new image over the old one. Then, you MUST RERUN LILO to update the 
+   loading map! If you don't, you won't be able to boot the new kernel image.
+
+ - Reinstalling LILO is usually a matter of running /sbin/lilo. You may wish
+   to edit /etc/lilo.conf to specify an entry for your old kernel image 
+   (say, /vmlinux.old) in case the new one does not work. See the LILO docs 
+   for more information.
+
+ - After reinstalling LILO, you should be all set. Shutdown the system, 
    reboot, and enjoy!
 
-   If you ever need to change the default root device, video mode,
-   etc. in the kernel image, use your bootloader's boot options
-   where appropriate.  No need to recompile the kernel to change
-   these parameters.
+ - If you ever need to change the default root device, video mode, etc. in the
+   kernel image, use your bootloader's boot options where appropriate. No need
+   to recompile the kernel to change these parameters.
 
  - Reboot with the new kernel and enjoy.
 
+
 If something goes wrong
 -----------------------
 
-- 
2.41.0

