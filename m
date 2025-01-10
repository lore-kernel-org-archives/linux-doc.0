Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F8228CB2;
	Fri, 10 Jan 2025 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534552; cv=none; b=oTpgr08SiBDwsIHilNQSbS5JhRhf/crWBpFkCTVBEjZMssEyDRgy7zrVrHnirNygZAZFzIwAqxCobdpRbq4V2n7ncracF7RruSl+PW8FnZhNlpUc7WUCkzh9QZNDek/ScC+1pLol8KwJGKmOc4flO/ZFXpxLDfLHrfdYJTlBfXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534552; c=relaxed/simple;
	bh=SdFQiP4d+QszeFpRrRoCrs964GB089GLpVTQ/LOPWmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R1TJyggN3+EFFaNYGq5GW8ITWVRbnir7Wk94vnueHXSJoJZ3NrUaDeY5gLJ9Wc3GfPQ2e5V/y2YUYODVf2Jbb4Yta97P44Yb/i/cQL2NRPhX9FnOfmqGAeZSFJlgmUl09H20lnUQ5dl7axrxABpkqbfz/UKvsV0LHAZVS9FMpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J/OindhY; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J/OindhY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0815E1C0002;
	Fri, 10 Jan 2025 18:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736534532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qe+z4JpLJI/XG4+PN4oYdf6UrrKyXrpjTJ0h8CG+Zsw=;
	b=J/OindhYZyBexf+vYGoKlLAoRltKe4F3W6nHP2Pcbj6MpYxI4xjGtN/8Xan4kS6Od72srG
	ArWNJOyAsNqMgGSBwF/O29AcITc8geL2HpZ3kH+bUNJb408xa1l5eu1OrsjMdr+/7MHa9w
	bLG1XInga3SWPgHlWpiC4lqLcGBO3Vakiu5es+vBkendILcYrTofnTqjvfbtqFK+nq4DF0
	fJ+2WIXDqVvhsFEEqQNT4Z7jGJ7o97HEIc1CqvM1C6R0sn3YeEeCT+UvtbKjTj9RN0H7RB
	EflrDBcHIbqmkiGd0dUN+krRsIeu6VzMZe6nPtsSEvknLhfmjEiu/X4jozyFkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] hexdump: Allow skipping identical lines
Date: Fri, 10 Jan 2025 19:42:03 +0100
Message-Id: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxpgWcC/x3Myw6DIBCF4Vcxsy4Ept7SVd+jcYE6rZMoWFCjM
 b57Kcv/JOc7IZBnCvDITvC0cWBnY+Atg24w9kOC+9iACnONmIuZfHBioL1fp1lURqm6LVRxNwj
 xM3t68568VxN74LA4fyR+0/81SarGUpdRLGWVF0oLLSb+rjRKbw5rxmfr3DKylZ2boLmu6wcC2
 eHrqAAAAA==
X-Change-ID: 20241224-perso-hexdump-7a008b5053a2
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com

While working on NAND issues, I used print_hex_dump() a lot to compare
data. But I am mostly working on embedded systems where the kernel
messages go through a serial console. Sometimes network support is an
option, sometimes not. Anyway, I often print buffers both in kernel
space and user space to compare them, and they may be full of 0's or
1's, which means lines are repeated a lot in the output and this is slow
*and* hard to compare.

I initially hacked into lib/hexdump.c for my own purpose and just
discarded all the other users, but it felt like this might be a useful
feature for others and decided to make it a public patch.

* First patch changes the "ascii" parameter into a "flags" variable now
  accepting the value: DUMP_FLAG_ASCII.
* Second patch adds a new flag to skip the identical lines, because this
  must be an opt-in parameter, I guess.

The patch series has successfully gone through a round of
kernel-test-robot.

The Cc-list, as provided by get_maintainers.pl, was returning 330
e-mail addresses which felt to much, so I ran the script only on the
second patch (the printk/includes/debug/Doc changes). It gave this
Cc-list which sounds more reasonable. Hopefully this is a smart move,
otherwise let me know what you think would be best.

---
Changes in v2:
- Rebased on v6.13-rc1.
- Manually fixed the diff in many places to fit Andy's requests.
- Added a real life example (code diff and output diff) with the
  modification of the API as well as the use of the new flag introduced
  by this series in the cover letter (at the bottom) as requested by
  Andy.
- Link to v1: https://lore.kernel.org/r/20240826162416.74501-1-miquel.raynal@bootlin.com
---

Here is a typical diff showing the code change with a perfectly equivalent
output:

 print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 32, 1, spinand->databuf, mtd->writesize,
-                     false);
+                     0);

Here is a typical output of a NAND buffer without the new 'skip' flag,
ie. with the above code snippet:

00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 01 00 00 08 00 00 00 10 00 2b 10 f1 92 00 00 00 00
00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 db 93 e9 fc
00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000001a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000001c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000001e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000220: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000260: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000002a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000002c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000002e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000320: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000340: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000360: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000380: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000003a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000003c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000003e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000420: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000440: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000460: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000004a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000004c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000004e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000540: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000560: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000005a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000005c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000005e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000620: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000640: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000660: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000006a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000006c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000006e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000720: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000740: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000760: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00000780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000007a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000007c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
000007e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

And with the new flag added the code looks like this:

 print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 32, 1, spinand->databuf, mtd->writesize,
-                     0);
+                     DUMP_FLAG_SKIP_IDENTICAL_LINES);

And the output is easier to parse and also faster to show on a serial
console:

00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 01 00 00 08 00 00 00 10 00 2b 10 f1 92 00 00 00 00
00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 db 93 e9 fc
00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
*

---
Miquel Raynal (2):
      hexdump: Convert the ascii boolean into a flag variable
      hexdump: Allow skipping identical lines

 Documentation/core-api/printk-formats.rst          |   4 +-
 arch/um/include/shared/user.h                      |   4 +-
 arch/x86/kernel/mpparse.c                          |   4 +-
 arch/x86/kvm/svm/sev.c                             |   2 +-
 arch/xtensa/kernel/traps.c                         |   4 +-
 crypto/ansi_cprng.c                                |   2 +-
 crypto/testmgr.c                                   |   2 +-
 drivers/acpi/nfit/core.c                           |   8 +-
 drivers/ata/libata-core.c                          |   4 +-
 drivers/ata/pata_parport/bpck.c                    |   2 +-
 drivers/block/floppy.c                             |   4 +-
 drivers/cdx/controller/mcdi.c                      |   8 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c  |   6 +-
 drivers/crypto/axis/artpec6_crypto.c               |   4 +-
 drivers/crypto/bcm/util.c                          |   2 +-
 drivers/crypto/bcm/util.h                          |   4 +-
 drivers/crypto/caam/blob_gen.c                     |   6 +-
 drivers/crypto/caam/caamalg.c                      |  59 +++++-----
 drivers/crypto/caam/caamalg_desc.c                 |  32 ++---
 drivers/crypto/caam/caamalg_qi.c                   |  30 +++--
 drivers/crypto/caam/caamalg_qi2.c                  | 104 +++++++----------
 drivers/crypto/caam/caamhash.c                     | 129 ++++++++-------------
 drivers/crypto/caam/caampkc.c                      |   2 +-
 drivers/crypto/caam/caamprng.c                     |   4 +-
 drivers/crypto/caam/caamrng.c                      |   4 +-
 drivers/crypto/caam/error.c                        |   4 +-
 drivers/crypto/caam/key_gen.c                      |  14 +--
 drivers/crypto/caam/sg_sw_sec4.h                   |   4 +-
 drivers/crypto/ccp/platform-access.c               |   4 +-
 drivers/crypto/ccp/psp-dev.c                       |   4 +-
 drivers/crypto/ccp/sev-dev.c                       |   4 +-
 drivers/crypto/ccree/cc_driver.c                   |   2 +-
 .../crypto/intel/qat/qat_common/adf_mstate_mgr.c   |   4 +-
 drivers/crypto/marvell/octeontx/otx_cptvf_reqmgr.c |   8 +-
 .../crypto/marvell/octeontx2/otx2_cptvf_reqmgr.c   |   8 +-
 drivers/crypto/sa2ul.c                             |   2 +-
 drivers/dma/loongson1-apb-dma.c                    |   2 +-
 drivers/firmware/efi/apple-properties.c            |  10 +-
 drivers/firmware/efi/cper-arm.c                    |   2 +-
 drivers/firmware/efi/cper.c                        |   4 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   4 +-
 drivers/gpu/drm/drm_edid.c                         |   2 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c           |   2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |   2 +-
 drivers/hv/channel_mgmt.c                          |  11 +-
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c         |   3 +-
 drivers/infiniband/hw/irdma/cm.c                   |   6 +-
 drivers/infiniband/hw/irdma/ctrl.c                 | 104 ++++++++---------
 drivers/infiniband/hw/irdma/puda.c                 |  28 ++---
 drivers/infiniband/hw/irdma/uda.c                  |   6 +-
 drivers/infiniband/hw/mlx5/cq.c                    |   2 +-
 drivers/infiniband/ulp/srp/ib_srp.c                |   2 +-
 drivers/input/touchscreen/melfas_mip4.c            |  17 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c   |  21 ++--
 drivers/macintosh/via-cuda.c                       |   2 +-
 drivers/macintosh/windfarm_smu_sat.c               |   4 +-
 drivers/mailbox/imx-mailbox.c                      |   4 +-
 drivers/media/common/tveeprom.c                    |   2 +-
 drivers/media/dvb-core/dvb_net.c                   |   2 +-
 drivers/media/firewire/firedtv-avc.c               |   4 +-
 drivers/media/pci/saa7164/saa7164-api.c            |   8 +-
 drivers/media/pci/saa7164/saa7164-core.c           |   4 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |   2 +-
 drivers/media/platform/ti/cal/cal.c                |   5 +-
 drivers/media/usb/em28xx/em28xx-i2c.c              |   2 +-
 drivers/mfd/rave-sp.c                              |   4 +-
 drivers/misc/genwqe/genwqe_driver.h                |   2 +-
 drivers/mtd/tests/mtd_nandecctest.c                |   8 +-
 drivers/mtd/ubi/debug.c                            |   6 +-
 drivers/mtd/ubi/debug.h                            |   2 +-
 drivers/mtd/ubi/io.c                               |   6 +-
 drivers/net/arcnet/arcnet.c                        |   4 +-
 drivers/net/can/usb/etas_es58x/es58x_core.c        |   4 +-
 drivers/net/can/usb/peak_usb/pcan_usb_core.c       |   2 +-
 drivers/net/can/usb/ucan.c                         |  10 +-
 drivers/net/ethernet/aeroflex/greth.c              |   7 +-
 drivers/net/ethernet/altera/altera_tse_main.c      |   2 +-
 drivers/net/ethernet/amd/a2065.c                   |   2 +-
 drivers/net/ethernet/amd/ariadne.c                 |   2 +-
 drivers/net/ethernet/amd/pds_core/adminq.c         |   4 +-
 drivers/net/ethernet/cadence/macb_main.c           |   6 +-
 drivers/net/ethernet/cavium/thunder/nicvf_main.c   |   2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c |   2 +-
 drivers/net/ethernet/intel/e1000e/netdev.c         |   6 +-
 drivers/net/ethernet/intel/i40e/i40e_common.c      |   2 +-
 drivers/net/ethernet/intel/i40e/i40e_debugfs.c     |  25 ++--
 drivers/net/ethernet/intel/iavf/iavf_common.c      |   2 +-
 drivers/net/ethernet/intel/ice/ice_osdep.h         |   4 +-
 drivers/net/ethernet/intel/igb/igb_main.c          |  18 ++-
 drivers/net/ethernet/intel/igc/igc_dump.c          |  10 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |   5 +-
 drivers/net/ethernet/mellanox/mlx4/en_tx.c         |   5 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/lib/aso.c  |   2 +-
 .../mellanox/mlx5/core/steering/hws/send.c         |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/wq.c       |   2 +-
 drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c   |   2 +-
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c         |   2 +-
 drivers/net/ethernet/microchip/enc28j60.c          |   2 +-
 drivers/net/ethernet/pensando/ionic/ionic_main.c   |   6 +-
 .../net/ethernet/pensando/ionic/ionic_rx_filter.c  |   2 +-
 drivers/net/ethernet/qlogic/qed/qed_ll2.c          |   2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c     |   2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c   |   2 +-
 drivers/net/ethernet/realtek/8139too.c             |   2 +-
 drivers/net/ethernet/smsc/smc9194.c                |   2 +-
 drivers/net/ethernet/vertexcom/mse102x.c           |   2 +-
 drivers/net/fddi/skfp/skfddi.c                     |   2 +-
 drivers/net/phy/sfp.c                              |   8 +-
 drivers/net/tun.c                                  |   3 +-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h         |   2 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c        |   2 +-
 drivers/net/wireless/ath/wil6210/ethtool.c         |   2 +-
 drivers/net/wireless/ath/wil6210/fw_inc.c          |   3 +-
 drivers/net/wireless/ath/wil6210/txrx_edma.c       |   4 +-
 drivers/net/wireless/ath/wil6210/wil6210.h         |   9 +-
 drivers/net/wireless/ath/wil6210/wmi.c             |   2 +-
 drivers/net/wireless/broadcom/b43/main.c           |   2 +-
 drivers/net/wireless/intel/iwlegacy/common.h       |   6 +-
 drivers/net/wireless/intel/iwlwifi/iwl-debug.h     |   6 +-
 drivers/net/wireless/marvell/mwifiex/main.h        |   2 +-
 drivers/net/wireless/realtek/rtl8xxxu/core.c       |   4 +-
 drivers/net/wireless/realtek/rtw88/rtw8723x.c      |   2 +-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c      |   2 +-
 drivers/net/wireless/silabs/wfx/bh.c               |   2 +-
 drivers/net/wireless/silabs/wfx/hif_rx.c           |   4 +-
 drivers/net/wireless/ti/wl1251/wl1251.h            |   2 +-
 drivers/net/wireless/ti/wlcore/debug.h             |   2 +-
 drivers/net/wireless/ti/wlcore/sdio.c              |   4 +-
 drivers/nfc/mei_phy.c                              |   4 +-
 drivers/nfc/pn533/i2c.c                            |   2 +-
 drivers/nfc/pn533/pn533.c                          |   2 +-
 drivers/nfc/pn533/uart.c                           |   2 +-
 drivers/nfc/pn533/usb.c                            |   9 +-
 drivers/nfc/pn544/i2c.c                            |   2 +-
 drivers/nfc/pn544/pn544.c                          |   4 +-
 drivers/nfc/port100.c                              |   4 +-
 drivers/nfc/st21nfca/core.c                        |   2 +-
 drivers/nfc/st21nfca/i2c.c                         |   2 +-
 drivers/nfc/trf7970a.c                             |   8 +-
 drivers/pci/probe.c                                |   2 +-
 .../platform/surface/aggregator/ssh_packet_layer.c |   5 +-
 drivers/platform/x86/amd/pmf/tee-if.c              |   2 +-
 drivers/ras/amd/fmpm.c                             |   2 +-
 drivers/rpmsg/rpmsg_ns.c                           |   2 +-
 drivers/rpmsg/virtio_rpmsg_bus.c                   |   4 +-
 drivers/s390/crypto/ap_queue.c                     |   4 +-
 drivers/s390/crypto/zcrypt_api.c                   |   8 +-
 drivers/s390/net/qeth_core_main.c                  |   8 +-
 drivers/scsi/esas2r/esas2r_log.c                   |   2 +-
 drivers/scsi/qedf/qedf_fip.c                       |   4 +-
 drivers/scsi/qedf/qedf_io.c                        |   2 +-
 drivers/scsi/qedf/qedf_main.c                      |   4 +-
 drivers/scsi/qla2xxx/qla_dbg.c                     |   2 +-
 drivers/soc/ti/k3-ringacc.c                        |   2 +-
 drivers/spi/spi-pl022.c                            |  18 +--
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |   2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |   2 +-
 drivers/staging/nvec/nvec.c                        |   4 +-
 drivers/staging/nvec/nvec_ps2.c                    |   2 +-
 .../staging/vc04_services/vchiq-mmal/mmal-vchiq.c  |   4 +-
 drivers/tty/n_gsm.c                                |   6 +-
 drivers/ufs/core/ufshcd.c                          |   2 +-
 drivers/usb/class/usbtmc.c                         |  12 +-
 drivers/usb/core/devio.c                           |   6 +-
 drivers/usb/gadget/function/f_ncm.c                |   2 +-
 drivers/usb/gadget/udc/gr_udc.c                    |   2 +-
 drivers/usb/usbip/usbip_common.c                   |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c  |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c  |   2 +-
 drivers/watchdog/wdrtas.c                          |   2 +-
 fs/ceph/mdsmap.c                                   |   2 +-
 fs/ecryptfs/debug.c                                |   2 +-
 fs/ext4/super.c                                    |   3 +-
 fs/jfs/xattr.c                                     |   2 +-
 fs/seq_file.c                                      |   2 +-
 fs/smb/client/cifs_debug.c                         |   2 +-
 fs/smb/client/misc.c                               |   2 +-
 fs/ubifs/debug.c                                   |   2 +-
 fs/ubifs/scan.c                                    |   2 +-
 fs/xfs/xfs_message.c                               |   2 +-
 include/linux/dma/ti-cppi5.h                       |   2 +-
 include/linux/dynamic_debug.h                      |   8 +-
 include/linux/filter.h                             |   2 +-
 include/linux/mlx5/cq.h                            |   2 +-
 include/linux/printk.h                             |  23 ++--
 include/net/6lowpan.h                              |   4 +-
 lib/hexdump.c                                      |  29 ++++-
 lib/test_bitmap.c                                  |   4 +-
 mm/debug.c                                         |   4 +-
 mm/dmapool.c                                       |   2 +-
 mm/kmemleak.c                                      |   2 +-
 mm/page_poison.c                                   |   2 +-
 mm/slub.c                                          |   2 +-
 net/atm/br2684.c                                   |   2 +-
 net/atm/lec.c                                      |   4 +-
 net/ceph/crypto.c                                  |   6 +-
 net/ceph/messenger.c                               |  22 ++--
 net/ceph/osdmap.c                                  |   4 +-
 net/core/skbuff.c                                  |   8 +-
 net/ipv4/route.c                                   |   2 +-
 net/nfc/digital_core.c                             |   4 +-
 net/nfc/llcp_core.c                                |   4 +-
 samples/rpmsg/rpmsg_client_sample.c                |   3 +-
 security/integrity/ima/ima_kexec.c                 |   3 +-
 sound/soc/codecs/hdac_hdmi.c                       |   2 +-
 sound/soc/intel/atom/sst/sst_ipc.c                 |   2 +-
 sound/soc/intel/catpt/loader.c                     |  14 +--
 sound/soc/sof/ipc3.c                               |   2 +-
 sound/soc/sof/ipc4.c                               |   2 +-
 sound/usb/bcd2000/bcd2000.c                        |   2 +-
 sound/usb/quirks.c                                 |   4 +-
 sound/usb/validate.c                               |   4 +-
 tools/testing/crypto/chacha20-s390/test-cipher.c   |  33 +++---
 tools/testing/nvdimm/test/nfit.c                   |   2 +-
 222 files changed, 680 insertions(+), 761 deletions(-)
---
base-commit: 895c43eb1fd8424a06812d56722ed7c340394e27
change-id: 20241224-perso-hexdump-7a008b5053a2

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

