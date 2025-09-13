Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47F214B977
	for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725120; cv=none; b=mDmxiFiJ6zH/P4viiUuOMsQeUGu0gliGPkvhI1BFTQU0l6f+XqVhY/nfGAl83gsnqeAfmF8gKDx63m8hamcOpiVupOpkTN90QD1xlq6jbMdnF2by5lgX7rmJdUs71Hb4WDxucyaXifNGGnnGEoD698T9qQZKMWO1lEawoh/jWt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725120; c=relaxed/simple;
	bh=riLYrwvey4IG1vm31BCl7axPrjxd4nPuzw1Lf4FnM3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGSuhcjSgG8aCBm8gn5I05Ep+3Z4xoRo87m65D+kPz31NinbPd3wae5htKAcMHYWXMMchEx/TIWKPU3e7P0MC2XULUc2WmvuO2WVYZW6TE67RWMwdZn2Pkl728MRL7fWRIzAeg+FyfCZwwMUXNl18UXq9O7EIVsus1dzH84CLbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKAdVg/A; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKAdVg/A"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso3671087a12.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 17:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725115; x=1758329915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BXXMTZbWkKZqT8QgJ9Z777RqiFOaP2Wc1It8eJXku8=;
        b=hKAdVg/A1cgqKS6p9i2KuodzZogaEVcz6+R6REIkiNiIbFfMinE02lC9EOoe6YQ662
         QoLR9T6aT3+M7BjTiV7UHhhnL8XkKjyZyIXFiPtCqdXyqRhXZQVCsC5d/pExy5n63UVD
         aP3IcvsxqqlBvJIhGWqLfrRjmqsx4H8gcINoCK2y+hNmwLXGrio/G7e159/gpZcMF69K
         kaZmEu4fumfSdszmb6RAwXH0qFnnNqWRKA9VZMV1du0FKs+yZoo8fyd8Vjq+UH3lzPCr
         jJbdtu7AJXlgY45fa3FMZxSgib30KPPXZPVWOybYPPZXcTs7CcclB57K/d1DO8TrpOBv
         6XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725115; x=1758329915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BXXMTZbWkKZqT8QgJ9Z777RqiFOaP2Wc1It8eJXku8=;
        b=TZiblfdTS1GSy9OXSpxNduIo+tEsjnXVsCQaR0CTmSbiSgS3pnfp335FnWHhGgA5pa
         erIUvLtffO5yjbsLQkyKfQXMMPALiKs2lrQBXssQUgheDR3AXKTwodoHFQKI4gfjamUk
         epGzjLjG8Gj+Rk+n4TCVRyt9nGgCnEAi0BezsTUYFsh15L8ty830vtFqlhzKFuu+LT1g
         DV/jEEptQvhwuSGBc17c/Y2Q5EdlU56NDBwxE2Q1UNnAm4MSXZjlFqfXO1TtfffOEC+s
         NLcOKy2OlbnjjhGCim+YN5HIFClbrRKjsA+AB6NP0rI/1AoHA3OpECtr0Bu/J/l6MV3U
         BVng==
X-Forwarded-Encrypted: i=1; AJvYcCUAqybGa+cUzdp+rUiQqEvgbnKrBy9ky+BIjr2mBOy5Womtecn2+PkuvouQiP9UgOhpxGTpc0qAeR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOgoLZb+GyRVZjFT3LrSBvhSi4AERlifHNZfwtluYPRo1ETgj5
	AgdcUL+2CySTiY5cJPych1zL7nhLZ0fwR0JVnpQ7m7Lpwj24HmVy06KC
X-Gm-Gg: ASbGncun0Dv83e89TIWF0LVcOCJXlV2kQyswSAq3pXUY190hYui0q7MXZ9YFcNdc4tt
	2zGAxu9DqydFOOrPH0BfP3DVU4OPUyAkwtQPeVWCcCMEkI6cdNwkHGdmVpAa9jXK6cQkUSHehvR
	ZlPWZtWOnJNfxzC4/iINajbePm2OgNIpBU5WTql3cELp7iZVz6vThhZawRUPtAXosyR4g1D+p3i
	HLpNf5KsB1U3Yt5h+Es3ZRmg/pOT7OggKIDx9K1fI7a/YEgJDBPrIHt/YvCzghyp+VjPtC4bDds
	jlkyQWqy6L+3IxMpVjfwR1AY1P4Nd2EAXQ2o5iSOfjGdrT3ac6WXZu7X3jLj0X1tiNOxEBZqZaq
	lN6bFKq0cp114N/ZtHGQH/Qt4/J+lLg==
X-Google-Smtp-Source: AGHT+IF4XezAq8wXNO6voYrJeDnCFhU1tJ+TfyE7OJRqFWOCMlq1YMWoUA8uaJ4xPb3fA3w8qZjP4Q==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4961876a12.1.1757725114882;
        Fri, 12 Sep 2025 17:58:34 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b16sm4143925a12.24.2025.09.12.17.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:58:34 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 17/62] doc: modernize Documentation/filesystems/ramfs-rootfs-initramfs.rst
Date: Sat, 13 Sep 2025 00:37:56 +0000
Message-ID: <20250913003842.41944-18-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update it to reflect initrd removal.

Also I specified that error reports should
go to linux-doc@vger.kernel.org , because
Rob Landley said that he keeps getting
reports about this document and is unable
to fix them

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../filesystems/ramfs-rootfs-initramfs.rst    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/filesystems/ramfs-rootfs-initramfs.rst b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
index fa4f81099cb4..38a9cf11f547 100644
--- a/Documentation/filesystems/ramfs-rootfs-initramfs.rst
+++ b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
@@ -8,6 +8,8 @@ October 17, 2005
 
 :Author: Rob Landley <rob@landley.net>
 
+Report errors in this document to <linux-doc@vger.kernel.org>
+
 What is ramfs?
 --------------
 
@@ -101,9 +103,9 @@ archive is extracted into it, the kernel will fall through to the older code
 to locate and mount a root partition, then exec some variant of /sbin/init
 out of that.
 
-All this differs from the old initrd in several ways:
+All this differs from the old initrd (removed in 2025) in several ways:
 
-  - The old initrd was always a separate file, while the initramfs archive is
+  - The old initrd was always a separate file, while the initramfs archive can be
     linked into the linux kernel image.  (The directory ``linux-*/usr`` is
     devoted to generating this archive during the build.)
 
@@ -137,7 +139,7 @@ Populating initramfs:
 
 The 2.6 kernel build process always creates a gzipped cpio format initramfs
 archive and links it into the resulting kernel binary.  By default, this
-archive is empty (consuming 134 bytes on x86).
+archive is nearly empty (consuming 134 bytes on x86).
 
 The config option CONFIG_INITRAMFS_SOURCE (in General Setup in menuconfig,
 and living in usr/Kconfig) can be used to specify a source for the
@@ -222,15 +224,13 @@ use in place of the above config file::
 External initramfs images:
 --------------------------
 
-If the kernel has initrd support enabled, an external cpio.gz archive can also
-be passed into a 2.6 kernel in place of an initrd.  In this case, the kernel
-will autodetect the type (initramfs, not initrd) and extract the external cpio
+If the kernel has CONFIG_BLK_DEV_INITRD enabled, an external cpio.gz archive can also
+be passed into a 2.6 kernel.  In this case, the kernel will extract the external cpio
 archive into rootfs before trying to run /init.
 
-This has the memory efficiency advantages of initramfs (no ramdisk block
-device) but the separate packaging of initrd (which is nice if you have
+This is nice if you have
 non-GPL code you'd like to run from initramfs, without conflating it with
-the GPL licensed Linux kernel binary).
+the GPL licensed Linux kernel binary.
 
 It can also be used to supplement the kernel's built-in initramfs image.  The
 files in the external archive will overwrite any conflicting files in
@@ -278,7 +278,7 @@ User Mode Linux, like so::
   EOF
   gcc -static hello.c -o init
   echo init | cpio -o -H newc | gzip > test.cpio.gz
-  # Testing external initramfs using the initrd loading mechanism.
+  # Testing external initramfs.
   qemu -kernel /boot/vmlinuz -initrd test.cpio.gz /dev/zero
 
 When debugging a normal root filesystem, it's nice to be able to boot with
-- 
2.47.2

