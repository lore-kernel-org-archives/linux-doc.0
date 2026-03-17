Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE8D3AE187
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743089; cv=none; b=unAglo3wctSSwAPx6BgzT1D2nJZ2SUA0sYVdqJ51s28pzJC2La7JILA+cxGdWI5iMdzFXzesXTvf7mpk7v6GbcZvi/QnGcXwn10UDNv8FLFCDm6JdsnRLaU2g7f5ifiqZyG0R2zUAwNwQ1Y+tauThObAYTfhrgg30w9CBW3G7cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743089; c=relaxed/simple;
	bh=CfDGuastMJOuxN8t3uMRhNG36tz6y42aN0NN4oRj03E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9SRxre5yfg36gF2CHv/9iTCOUhRO5FC4ZhzEpZ6zQ0QlF+81ElPtye1lpWK9hNaElhjdkuukJ5mQfD6SjnhxnnhEa5j7wWJc3uEVH/TvsIOj1d1M5Z0eWue6moij4/9yMw3rtNgSxbxObX9M8sk4nLo8CWHbmiUABxmDrMHb1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YGaLsNL5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YGaLsNL5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A6A1EC55056;
	Tue, 17 Mar 2026 10:25:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB1815FC9A;
	Tue, 17 Mar 2026 10:24:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B55F104503A6;
	Tue, 17 Mar 2026 11:24:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hhd+i0LUsTLSToudA1/3v4V3xTFwJTwzl9JTAHOOnfs=;
	b=YGaLsNL5NIap9iJ1S0r4MDPPQyM4yW3tvARWtSPoLGp7oBcSOQHGKEdjs8dBc8NT7sg9Td
	jHT1eGTci41sGihzut70/oo+gvNhCs7KKXfuBtxnkPdgr0jD910EU+O0WqkWbMUocXbPfv
	ury0q8crVqgyO9tjDzYoEAgMYDFnjCfFhGvlwfE9YjD0Q3xyd3WjVgc15qmmnjxVuTAdq4
	arQs3W8CKLVqKHRPkBjcm2yMrrFTS098b17VDReWK1anQW6LgCKTzd64CGv7AsdgzW4QSz
	iSA7B5s4dA1mLblunUtMpu0j5nqksF1DM3JtX0qDIFkyULbVG/7tIz+IChoK5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:22 +0100
Subject: [PATCH v3 19/27] mtd: spi-nor: Add steps for testing locking
 support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-19-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

As recently raised on the mailing list, it may be useful to propose a
list of steps to go through in order to proove the devices have been
described correctly, especially since all the block protection
information is not stored in any kind of table and is instead filled
manually by developpers.

Use the debugfs output to ease the comparison between expectations and
reality.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/driver-api/mtd/spi-nor.rst | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 148fa4288760..4755eb75fe5e 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -203,3 +203,131 @@ section, after the ``---`` marker.
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
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
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
+    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read2
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+    root@1:~# sha256sum spi*
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read2
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
+    bea9334df51c620440f86751cba0799214a016329f1736f9456d40cf40efdc88  spi_test2
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03ffffff |   locked | 1024
+
+   Once we trust the debugfs output we can use it to test various
+   situations. Check top locking/unlocking (end of the device)::
+
+    root@1:~# bs=$(cat /sys/class/mtd/mtd0/erasesize)
+    root@1:~# size=$(cat /sys/class/mtd/mtd0/size)
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03fdffff | unlocked | 1022
+     03fe0000-03ffffff |   locked | 2
+    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03feffff | unlocked | 1023
+     03ff0000-03ffffff |   locked | 1
+
+   If the flash features 4 block protection bits (BP), we can protect
+   more than 4MB (typically 128 64kiB-blocks or more), with a finer
+   grain than locking the entire device::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2**7 * $bs))) $((2**7))
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-037fffff | unlocked | 896
+     03800000-03ffffff |   locked | 128
+
+   If the flash features a Top/Bottom (TB) bit, we can protect the
+   beginning of the flash::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 0 2 # first two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0001ffff |   locked | 2
+     00020000-03ffffff | unlocked | 1022
+    root@1:~# flash_lock -u /dev/mtd0 $bs 1 # first one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0000ffff |   locked | 1
+     00010000-03ffffff | unlocked | 1023

-- 
2.51.1

