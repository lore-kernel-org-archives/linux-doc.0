Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DDF436356;
	Tue, 26 May 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807449; cv=none; b=Fjobn55NBjIA+3Oh57FhGF/B5bVrelUlkJ0EZJbGkF0IsYJ4USohtYWlUZqmYhHhwpZMOXtS+kR5+mdzH93ZN6ZG6Ro0cNnFD0L+ISX1TorbzjtU0QL4vlFRZkseAr9ggikmpytAy8iBvZ8ipU7ByjPQ5kqfjJW+B6jq1CerB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807449; c=relaxed/simple;
	bh=mlBLPRnofomQXQ7VlmqE6AP6P55p2Q8cQuc/SMoBn4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKyxkrMuel1HBJDq2m8Hh2Cst7DApUveFyds0eWGK8P2ATDE6urU+c/9xUrbdAKJH0BF7BVfpNHLZa7sORX7SSayCFb1WgvkngeUifK9gLlaGbeieNbgbpvskKkvSo+Oeju9mEYnZfokIpHFIbE4zuZqvq3ueh23yvEd39i8PbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XpGTWwEl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XpGTWwEl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 89B531A36C3;
	Tue, 26 May 2026 14:57:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 572AA6011D;
	Tue, 26 May 2026 14:57:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF539108888D2;
	Tue, 26 May 2026 16:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VIcGQxZz043Ie3D/UVGzyJT34QqlodCjDzu+nxXRD7Y=;
	b=XpGTWwElYmjs3ldNXrnxb7J8asYtiaNTsR/e6rJpThWFJv01CHUJ0eG6czWF0iBUzF22xc
	bBLsUdfq4qtgloPaALcE7xUMjkGHVrHL12Ll3KCjXrKZVK6aINsibLs40cSQTnYEf2o2b7
	arvMUEkqxPbHVWBPR1WXnC1dfrineMdeTLi1V7QMBKbVl9rxIvUiAgGXHRPMJMx84Fzedp
	j8meqNy1PckF2kE9RLnTvUd/q3oLPzTofL7ZtRHZCl32YhVtWE+ZOFvaSYPEnwINczTTex
	ONjYF7SIGNMdwxpwjAJLBHS6S2zj4t9YVdf6m/VY1sQwSU1saIbEs2UwwHNEGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:44 +0200
Subject: [PATCH v6 20/28] mtd: spi-nor: Add steps for testing locking
 support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-20-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

As recently raised on the mailing list, it may be useful to propose a
list of steps to go through in order to prove the devices have been
described correctly, especially since all the block protection
information is not stored in any kind of table and is instead filled
manually by developers.

Use the debugfs output to ease the comparison between expectations and
reality.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/driver-api/mtd/spi-nor.rst | 132 +++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 148fa4288760..9cc7e4b2c809 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -203,3 +203,135 @@ section, after the ``---`` marker.
     mtd.writesize = 1
     mtd.oobsize = 0
     regions = 0
+
+5) If your flash supports locking, please go through the following test
+   procedure to make sure it correctly behaves. The below example
+   expects the typical situation where eraseblocks and lock sectors have
+   the same size. In case you enabled MTD_SPI_NOR_USE_4K_SECTORS, you
+   must adapt `bs` accordingly.
+
+   Warning: These tests may hard lock your device! Make sure:
+   - The device is not hard locked already (#WP strapped to low and
+     SR_SRWD bit set)
+   - If you have a WPn pin, you may want to set `no-wp` in your DT for
+     the time of the test, to only make use of software protection.
+     Otherwise, clearing the locking state depends on the WPn
+     signal and if it is tied to low, the flash will be permanently
+     locked.
+
+   Test full chip locking and make sure expectations, the MEMISLOCKED
+   ioctl output, the debugfs output and experimental results are all
+   aligned::
+
+    root@1:~# alias show_sectors='grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -i /dev/mtd0
+    Device: /dev/mtd0
+    Start: 0
+    Len: 0x4000000
+    Lock status: unlocked
+    Return code: 0
+    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
+    Erased 2097152 bytes from address 0x00000000 in flash
+    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
+    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+    root@1:~# sha256sum spi*
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03ffffff | unlocked | 1024
+
+    root@1:~# flash_lock -l /dev/mtd0
+    root@1:~# flash_lock -i /dev/mtd0
+    Device: /dev/mtd0
+    Start: 0
+    Len: 0x4000000
+    Lock status: locked
+    Return code: 1
+    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
+    Erased 2097152 bytes from address 0x00000000 in flash
+    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+    root@1:~# sha256sum spi*
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
+    root@1:~# dd if=/dev/urandom of=./spi_test2 bs=1M count=2
+    2+0 records in
+    2+0 records out
+    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test2
+    Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read2
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+    root@1:~# sha256sum spi*
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read2
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
+    bea9334df51c620440f86751cba0799214a016329f1736f9456d40cf40efdc88  spi_test2
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03ffffff |   locked | 1024
+    root@1:~# flash_lock -u /dev/mtd0
+
+   Once we trust the debugfs output we can use it to test various
+   situations. Check top locking/unlocking (end of the device)::
+
+    root@1:~# size=$(cat /sys/class/mtd/mtd0/size)
+    root@1:~# bs=$(cat /sys/class/mtd/mtd0/erasesize)
+    root@1:~# nsectors=$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed -e 's/.*unlocked | //')
+    root@1:~# ss=$(($size / $nsectors))
+    root@1:~# bps=$(($ss / $bs))
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $ss))) $((2 * $bps)) # last two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03fdffff | unlocked | 1022
+     03fe0000-03ffffff |   locked | 2
+    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $ss))) $((1 * $bps)) # last one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03feffff | unlocked | 1023
+     03ff0000-03ffffff |   locked | 1
+
+   If the flash features 4 block protection bits (BP), we can protect
+   more than 4MB (typically 128 64kiB-blocks or more), with a finer
+   grain than locking the entire device::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2**7 * $ss))) $((2**7 * $bps))
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-037fffff | unlocked | 896
+     03800000-03ffffff |   locked | 128
+
+   If the flash features a Top/Bottom (TB) bit, we can protect the
+   beginning of the flash::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 0 $((2 * $bps)) # first two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-0001ffff |   locked | 2
+     00020000-03ffffff | unlocked | 1022
+    root@1:~# flash_lock -u /dev/mtd0 $ss $((1 * $bps)) # first one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-0000ffff |   locked | 1
+     00010000-03ffffff | unlocked | 1023

-- 
2.53.0

