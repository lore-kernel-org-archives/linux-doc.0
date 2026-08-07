Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D33646E003;
	Fri,  7 Aug 2026 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097700; cv=none; b=BFfs9s2Q26JtfFhFGJNCRMc8jl8AnLtIHFLHo0ZzIW5adHtJBABtue2FzXncQdQABDzuiAe1ScMoOd13R9e6qrAdAwWf2MOyglK3MZ8SBS5sVQy6uOpTbScUXfxgaNXjaGwXx1HkHgTh/hS2iKTMkojfZCx0ceSSkQTd8crWCQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097700; c=relaxed/simple;
	bh=Yoqm+oQ9EChw00qkT4Emfk5tUGpLMWBRUKvnmLm25Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pORwTKJmPKAOSQtNPsl9RPBWKGKxzcWqweLYou9c6MoW42gRdSd5gSGI3ARuvN5T4/4n+nbUBMs4pj85OrmaByFuPuAAH6HnxSvM3im9ZTtbJH1jYnibFjZ/Apxa3/tXvYXiT+pXsQpbsWBoPHf1rLPPHfZvbO7zehQn3WUAX5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EXeUl/N7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EXeUl/N7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E96F44E41138;
	Fri,  7 Aug 2026 10:14:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEB4D603F0;
	Fri,  7 Aug 2026 10:14:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FCBF11C37528;
	Fri,  7 Aug 2026 12:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TwEo7pYtTlcmMY/OwQ1tl+YaMb/sOYDGRqXYr9hb8r8=;
	b=EXeUl/N7YmgOcsVAWoGP8lWY9kXWGJ83XMAHpXNonI0pp25peSWwT3RiXI26nkPp9iUEin
	pQuEcPv0jOeR3yeyOrPIYl5g6Ht4LT3Jw/z3pRIco59Pj6tCE+cOwzBiI3e9Fayydf/EKr
	Tcy+/pT3LFIlPvf/Mh7vRFDavTbdV3vYCJoyKSSzYPEyhqgycDzo/X7a9++T4TTT2iDGkR
	PHU2QFXdSbXYZloHHGkGTSZuIyKfr/D2CE6S5VxV8Y6tljORPxiAXzWRn1rkBReeKQ/UOT
	HwAHRhzU6QyYwctNdiIdeY0Q7x/H1n2Wu56rJ+Dima8cs7hZXKEQB44V4Iwfng==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 12:14:04 +0200
Subject: [PATCH v2 12/18] mtd: spi-nor: winbond: Add support for W25Q12RV-M
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-12-7797642dfc40@bootlin.com>
References: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
In-Reply-To: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is an ID collision with the chip of same density from the JV
family. Both chips are very similar in practice, it is mostly a matter
of electrical differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
the new SFDP (rev F) field which forces an alternate write SR2
opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef7018
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0100ff00080117800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0344eb086b083b42bbfeffffffffff
0000ffff44eb0c200f5210d80000142a010186e114c1e96376337a757a75
f7a2d55c39f66dffe930f880000000000000ac0000000000f7f5ffff0f00
0000060d44bd27ed080d
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
94b52d6e903a2046e144eab0760384b6932c6fdbfec17eb7336f1778c3898daf  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x03
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3b
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbb
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6b
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
 1S-1S-4S
  opcode	0x32
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 70 18 00 00 00
size		8.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xeb
  dummy cycles	6
 erase		0xd8
 program	0x32
 8D extension	repeat

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (8.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-007fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[   28.249430] random: crng init done
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_read
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 8388608 (8M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x800000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_read
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x800000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_read
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_read
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_read2
48b1df493c0c35b1c6c8a50880c6e10adcd103c383a7324033cb760d20d9acf0  spi_test
df6c52ecc59473c5ed9bd10a0479b52ee248adbf7d032aa7cde35e86acd461ca  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=8388608
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=131072
+ bps=2
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 8126464 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007bffff | unlocked | 62
 007c0000-007fffff |   locked | 2
+ flash_lock -u /dev/mtd0 8126464 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007dffff | unlocked | 63
 007e0000-007fffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff |   locked | 2
 00040000-007fffff | unlocked | 62
+ flash_lock -u /dev/mtd0 131072 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 1
 00020000-007fffff | unlocked | 63
+ all_but_one=126
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 131072 126
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 1
 00020000-007fffff |   locked | 63
+ flash_lock -u /dev/mtd0 131072 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff | unlocked | 2
 00040000-007fffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 126
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007dffff |   locked | 63
 007e0000-007fffff | unlocked | 1
+ flash_lock -u /dev/mtd0 8126464 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007bffff |   locked | 62
 007c0000-007fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 0ae16f5b0ec0..0746e157713b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -316,7 +316,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q128JV-M */
+		/* W25Q128JV-M, W25Q12RV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

-- 
2.54.0

