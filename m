Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6697631F983
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172420; cv=none; b=vAcwyuKgoGMMnW5Fvx7JjNeS5krkgH4LmwssfEmXjt1+KQcRsJ8u6vp9BHzqr/ojmI55ZePlSm81e7RSrq8tXbfJkaxqHfuy6TpL+ujBHFwOLUn3qUijDPLNEn95FK8wu3x4YKoVWJV00hHtQ+4aSOKBh9tdG1eglRu74xaCHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172420; c=relaxed/simple;
	bh=NM2J54S9rt1rDkUoxTt39MCtsfZfJD/uxQArOC9cST0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qxdTKGQA0j8os/51WsVmpRdCFr+sSEePeOGcKPzEQslbHKYQjr11tAsiWN9lhX8A5rB7Lps4Cj885vnP22vm5X9Ok2hLOMF7x1VqQnwQvUP6dgH9SulzYDYzKG8F6jQcSdBuy9yj+fWW9RfMxJZyF0hw1h2bON+IkWJIZ2vTmFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rqymipg9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rqymipg9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BAB544E42C13;
	Thu,  7 May 2026 16:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79DB2605CF;
	Thu,  7 May 2026 16:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF68E108194A8;
	Thu,  7 May 2026 18:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8ZjXYHxFLpGqdP6xSDXPObLI6FpFPItAK6zPqiXuvb8=;
	b=Rqymipg9qz628HCteGa4XUtrSWNtK/JLDRHCulUJeqnsGCwqz+DtBoPkL05xddaHd1axHK
	7Z3ofX2EFRmCLZ/P+OEzbcLf026D/AI0ikfnDsfxl372I3uuXpCIV/5OoOPjVV5b4Fs/zS
	axK3HjQMAbutOMfY/ZYjnLOM8mHqYIHjozCwDDQEk0vWdUx5gMDDZfevNpZpvGJZfJn8zH
	RvaUMsTTKWpw6cjd7ONwZOI/dovK7iSNf3h9l4mZ4Abm/ZMBsVPMvcS8Y7UMxO71/vWxse
	HCR2x5wUbquPHTabHXhDx2eU7Y0ox7O/tcv2csBwW+v6YpvPX5voOhEYHqjQSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 00/28] mtd: spi-nor: Enhance software protection
Date: Thu, 07 May 2026 18:46:41 +0200
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NzW4CIRiF4VsxrPsZPv5x5X0YFwPDVJIWJmDQx
 sy9F02MaVxMl+9ZPOdGaigxVLLb3EgJLdaYUw/5sSH+NKTPAHHsTRhlEhEFXGJyOY3QFKCB4hH
 qHCHlAvUyg1Fy5GoSk7KSdGMuYYrXh3849j7Fes7l53HX8L7+V24IFITRzmtk1nLcu5zPXzFtf
 f4md7uxp6coUrPmse55oViYDFXI6bvHXx5Hvebx7jE/2DCIoJ117554eYLyNU90z3A+Dk4GzYz
 56y3L8guw+TOhvAEAAA==
X-Change-ID: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Hello,

As recently raised on the mailing-list (link below), it seems that the
"locking" support in SPI NOR could benefit from some enhancements. As I
myself had to dig into it recently, here is a proposal.

First issue that I see, the MEMLOCK ioctl is not behaving correctly
in some cases, as addressed in:

    mtd: spi-nor: swp: Improve locking user experience

Then there is no clear explanation of the shortcuts taken by the kernel
in terms of uAPI, so there is an attempt to list them in:

    mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour

Plus, Tudor also asked if we could cover locking in the testing
procedure, which is done in:

    mtd: spi-nor: Add steps for testing locking support

In order to simplify this procedure, and because it got very helpful
during my testing/development, I want to propose additions to the
debugfs output:

    mtd: spi-nor: debugfs: Add locking support TODO: make the captures again

Finally, I am providing an implementation for the complement (CMP)
feature in order to allow finer control of the regions locked. This
feature is for instance available on Winbond chips:

    [core] mtd: spi-nor: swp: Add support for the complement feature
    [doc]  mtd: spi-nor: Add steps for testing locking with CMP
    [use]  mtd: spi-nor: winbond: Add CMP locking support

Disclaimer: it was much less straightforward than I initially thought to
get the CMP feature working correctly. I tested it with as much focus as
I could, and I am improving the test coverage for the new cases, I am
also providing extra test cases in the metadata of the commit (which do
not make sense to test for chip additions, but may be sensible show when
making core additions like this one), but honestly there are so many
possibilities, I may still be missing corner cases. I hope this will
anyway be helpful to others!

All the other patches are misc improvements or style fixes which I faced
and fixed during my development.

Link: https://lore.kernel.org/linux-mtd/92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev/

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v5:
- Fixed the writing of SR2 in the locking ops for devices without RDCR
  capability.
- Moved the ioctl comments to an existing comment as advised by
  Pratyush.
- Changed the documentation to use the concept of lock sector instead of
  block because on small density devices, the two amounts are typically
  different.
- Renamed the debugfs output "#blocks" -> "#sectors" for the same
  reason.
- Added a patch to make sure the QE bit is not badly overwritten when
  using the core's SR/CR status write helpers.
- Link to v4: https://lore.kernel.org/r/20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com

Changes in v4:
- Make sure we don't try to show the (SR specific) debugfs info if the
  chip does not support an SR based locking scheme. For this, add a new
  helper to derive whether we are using the default ops or not.
- Fix compilation issue on arm32, by using div_u64.
- Link to v3: https://lore.kernel.org/r/20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com

Changes in v3:
- No change at all, just rebased on top of v7.0-rc1.
- Collected 2 R-by from M. Walle.
- Link to v2: https://lore.kernel.org/r/20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com

Changes in v2:
- Collect tags.
- Add missing Fixes/Cc: stable tags.
- Add a comment explaining why can_be_top && can_be_bottom is a specific
  condition.
- Fix commit logs following Michael Walle's reviews.
- Amend the documentation following our discussion with Michael Walle as
  well.
- Cache the SR register for debugfs use.
- Create a locked sector map file instead of dumping it as part of the
  `params` file output.
- Improved greatly the output of the map as suggested by Michael.
- Add a patch fixing a duplicate dependency in Kconfig.
- Add an important comment in the doc about the small 4kiB erase size
  choice.
- Add test runs for each and every chip for which the CMP feature is
  added. This prove me that testing of each and every chip was needed,
  as some of them seem to feature a broken BFPT table which does not
  advertise a working 35h (Read CR) command.
- Added a condition on which the CMP feature is enabled: RDCR must be
  possible.
- Link to v1: https://lore.kernel.org/r/20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com

---
Miquel Raynal (28):
      mtd: spi-nor: Drop duplicate Kconfig dependency
      mtd: spi-nor: debugfs: Fix the flags list
      mtd: spi-nor: Make sure the QE bit is kept enabled if useful
      mtd: spi-nor: swp: Improve locking user experience
      mtd: spi-nor: Improve opcodes documentation
      mtd: spi-nor: debugfs: Align variable access with the rest of the file
      mtd: spi-nor: debugfs: Enhance output
      mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour
      mtd: spi-nor: swp: Clarify a comment
      mtd: spi-nor: swp: Use a pointer for SR instead of a single byte
      mtd: spi-nor: swp: Create a helper that writes SR, CR and checks
      mtd: spi-nor: swp: Rename a mask
      mtd: spi-nor: swp: Create a TB intermediate variable
      mtd: spi-nor: swp: Create helpers for building the SR register
      mtd: spi-nor: swp: Simplify checking the locked/unlocked range
      mtd: spi-nor: swp: Cosmetic changes
      mtd: spi-nor: Create a local SR cache
      mtd: spi-nor: debugfs: Add locking support
      mtd: spi-nor: debugfs: Add a locked sectors map
      mtd: spi-nor: Add steps for testing locking support
      mtd: spi-nor: swp: Add support for the complement feature
      mtd: spi-nor: Add steps for testing locking with CMP
      mtd: spi-nor: winbond: Add W25H512NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H01NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H02NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H01NWxxIQ CMP locking support
      mtd: spi-nor: winbond: Add W25Q01NWxxIM CMP locking support
      mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP locking support

 Documentation/driver-api/mtd/spi-nor.rst | 169 +++++++++++++++
 drivers/mtd/spi-nor/Kconfig              |   1 -
 drivers/mtd/spi-nor/core.c               |  78 ++++++-
 drivers/mtd/spi-nor/core.h               |  25 ++-
 drivers/mtd/spi-nor/debugfs.c            |  69 +++++-
 drivers/mtd/spi-nor/swp.c                | 359 ++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/winbond.c            |  41 +++-
 include/linux/mtd/spi-nor.h              |   7 +-
 8 files changed, 656 insertions(+), 93 deletions(-)
---
base-commit: 2df04c01437d44ea7cac641cb4d0c9fd1275df45
change-id: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

