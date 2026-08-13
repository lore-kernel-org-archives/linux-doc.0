Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E35468C2A;
	Thu, 13 Aug 2026 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634368; cv=none; b=uo0hTgLGhRPWAnmD4f0doUB42iybdqAjv9/S41KFr9hmwIKJB7e6fS+EP0V5HgBEkJ+a1N2+aG6LWwz3AXrCz0NCPIWWH6uJeVDvbL8IaWp/+3cNSy+T4OiwRP9b0+ElySf/bQIg7DSXKjJP7JSA5Y4bbjT8WsPnOUsUwt04bCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634368; c=relaxed/simple;
	bh=hQCh243CzeE7OlkXWD+eu63lmLPFuhabgz3yPKuFcys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b1Bw7u3KEe8B0saLmVixWz0C95E0m7kYwiCb/qMIq4Jj1jlWNsfVIVDfzEGBO42Vwi6GCfPsx04nxKsOWooYvjKEdwnluKpIRaznQ8HY6zfmbZvGeXZLSyZI3XHYAGAncIC7JiglvjcPjUaPlZ9KaqfWh1QD/9Y/QTRTln0iyhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E63Cm4gB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E63Cm4gB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD9D44E41208;
	Thu, 13 Aug 2026 15:19:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFA3E602B8;
	Thu, 13 Aug 2026 15:19:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99E6311C4E06F;
	Thu, 13 Aug 2026 17:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YLDqk/bqSDIAyWjdkMIjNYxbTc6b188ttsVKaz3CO/g=;
	b=E63Cm4gB4Wk9EQG+s8wh+7Vf9rLMbIpHCVNevklBRMc3Tb4UBIkkPMbCssXFAswJhzlNxs
	xGOv+pFpcT0nXlI34ermOKx97+v59knWv/7kPS8T5vX4sR/sfl7lrRtXELx/sBMgMTBb40
	+CAxRdkRp+frvCuEAk2Qx6MKKeccqGSrtA4EVQWoJbZyhtomAm6kxj9esREqwEDoc3x+IC
	Kmu+wp3vk0KyMVvxSTY0ZKqJdZQPxhz2WyOzfAvGyFp2zblvWIbihg2HdHb/ja70d92dim
	W/JN/B0vdSiwVbrNyVsc4JSOwiOkVb+a2Q2iwtlDb9oaHv/BlLSYVKWVba647Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/23] mtd: spi-nor: QE handling cleanup + fixup reworks
 + Winbond RV chips addition
Date: Thu, 13 Aug 2026 17:19:00 +0200
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42PQW7DIBBFr2Kx7kSATSBWVOUeURcYxg1VDC44t
 FXku5eQRVupiyz/SPPe/1eSMDpMpG+uJGJ2yQVfQvvUEHPS/hXB2ZIJp3xLBd/Bh/ND8BayBAZ
 pduBDhJhBW+uW8gwGNR/ZyIQakBTMHHF0n1VxfLnniO+XYlruRzJhSrqa+mZfRYqK/0VvGcwZt
 b/MkAVQUJK3CoWUctcdhhCWs/MbE6bnm3nQCaGEyS19k+WGQzSM3DqcXFpC/KqrM6slHh+YWRG
 PrUamBOVW6N/iis/8B6mofADJC7JskNuO29F09C9yXddvmh7BnKkBAAA=
X-Change-ID: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
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

Hello,

Following my "software protection" enhancement series, there were
several comments about the need to simplify and reorganize the handling
of the QE bits, which is strongly impacted by the various read/write
status register capabilities.

The third patch is all about this. It is a massive cleanup, everything
is explained inside, the how and the why. This is a commit that must be
tested, so if you have a SPI NOR chip with one of the not yet tested
SFDP QER configuration, please consider applying that patch (just patch
1 is enough) and boot. If your chip is recognized, it's probably all
good.

Since it was pointed that the legacy .name fields were part of the ABI,
my previous deletion was no longer possible, so I now propose a
(writable) indirection for accessing this field, which will allow
developers to hide that name using fixups.

Talking about fixups, I continued with another rework that has been
asked for: changing the way fixups are listed. I am now creating a table
of fixups, which can be matched by ID and/or with a match function, as
per Michael Walle's suggestion. This cleans quite a bit the fixup lists
in the winbond driver, especially because of the new name hiding fixup,
so thanks for the suggestion!

Then I add support for JESD216 revision F and its new QER field.

Finally, I rework a bit the fixups in the Winbond driver, which allows
a clean addition of the new Winbond RV chips.

All chips I will ever be able to test are now listed and proof of
testing is below the commit message.

Thanks,
Miquèl

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
- Added support for two new chips that I could test (W25Q51RV-M and
  W25Q02RV-Q/N). Edited the last commit which is now only adding the
  256M-bit densities without the possibility to test, since I will not
  receive any of these any time soon.
- Reworked completely the way fixups are now being applied.
- Re-instated the legacy .names, created a way to overwrite them and
  enabled a fixup for that.
- Link to v2: https://lore.kernel.org/r/20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com

Changes in v2:
- Added support for more chips that I received and could test. The main
  logic in the first patches is completely untouched.
- Fixed the name of a parameter (s/sr2/srs/) in the low level read status
  registers helper.
- Decided that there was no specific handling of the WP pin being
  strapped wrt the read check over the SR content. This would be new,
  and I don't think it is wide to handle it in the verify helper, but
  instead this should be let to the caller to decide whether it needs
  to hard fail or just degrade into single mode (typically if the QE
  bit has not been written). But this would require an extra DT
  property indicating the WP strap state which cannot be read back by
  software.
- Created a structure to store the flash specific opcodes.
- Proposed a rename of BFPT_DWORD15_QER_SR2_BIT1_BUGGY in favour of
  the _NO_1B_WR suffix.
- After checking, decided that the .name field is legacy and not part
  of any stable API, thus it can be removed. So added back a commit
  for that, removing the names for the whole JV family.
- Exposed all opcodes through debugfs, including the QE bit position.
- OTP and SWP writes are now read back like before.
- 2 known deviations are now explicitely stated in the commit log.
- I changed a little bit the QER field parsing in the sfdp.c driver, to
  limit deviations, as much as my understanding would allow me.
- Link to v1: https://lore.kernel.org/r/20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com

---
Miquel Raynal (23):
      mtd: spi-nor: Rename BFPT_DWORD15_QER_SR2_BIT1_BUGGY
      mtd: spi-nor: Create a structure containing the flash opcodes
      mtd: spi-nor: Refactor Read Status/Write Status support
      mtd: spi-nor: Add support for the new JESD216 rev F QER field
      mtd: spi-nor: Create the concept of fixup table with match function
      mtd: spi-nor: Create an indirection on the part name
      mtd: spi-nor: Move the SFDP header structure to a C header
      mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-Q/N parts
      mtd: spi-nor: winbond: Add support for W25Q32RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q64RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q12RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q51RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q01RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q02RV-Q/N
      mtd: spi-nor: winbond: Prepare introduction of W25QxxRV-M parts
      mtd: spi-nor: winbond: Add support for W25Q32RV-M
      mtd: spi-nor: winbond: Add support for W25Q64RV-M
      mtd: spi-nor: winbond: Add support for W25Q12RV-M
      mtd: spi-nor: winbond: Add support for W25Q51RV-M
      mtd: spi-nor: winbond: Add support for W25Q01RV-M
      mtd: spi-nor: winbond: Add support for W25Q02RV-M
      mtd: spi-nor: winbond: Add support for W25Q51RV-Q/N/M
      mtd: spi-nor: debugfs: Expose SR opcodes and QE mask

 Documentation/driver-api/mtd/spi-nor.rst |   2 +-
 drivers/mtd/spi-nor/atmel.c              |  75 ++-
 drivers/mtd/spi-nor/core.c               | 875 ++++++++++++-------------------
 drivers/mtd/spi-nor/core.h               |  94 ++--
 drivers/mtd/spi-nor/debugfs.c            |  22 +-
 drivers/mtd/spi-nor/everspin.c           |   7 +-
 drivers/mtd/spi-nor/gigadevice.c         |  13 +-
 drivers/mtd/spi-nor/issi.c               |  25 +-
 drivers/mtd/spi-nor/macronix.c           |  35 +-
 drivers/mtd/spi-nor/micron-st.c          |  51 +-
 drivers/mtd/spi-nor/otp.c                |  16 +-
 drivers/mtd/spi-nor/sfdp.c               | 114 ++--
 drivers/mtd/spi-nor/sfdp.h               |  21 +-
 drivers/mtd/spi-nor/spansion.c           |  61 ++-
 drivers/mtd/spi-nor/sst.c                |  16 +-
 drivers/mtd/spi-nor/swp.c                |  58 +-
 drivers/mtd/spi-nor/sysfs.c              |   4 +-
 drivers/mtd/spi-nor/winbond.c            | 106 +++-
 include/linux/mtd/spi-nor.h              |   6 +-
 19 files changed, 802 insertions(+), 799 deletions(-)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
prerequisite-message-id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
prerequisite-patch-id: b4c64eddd0cbb8a67a3ceb3d5a8fb7118ee8bbd3
prerequisite-patch-id: ea4fe4b14c3613b81a14c7af7ef5b7783c8cc633
prerequisite-patch-id: 4386d6ade3a3cd161669fec71550a9ccd96313f1
prerequisite-patch-id: c8a25a85853dc662591c1099350a37ff842d072b
prerequisite-patch-id: 74656376c96b96fc1b3cdc7074de6b3cb87d9ca7
prerequisite-patch-id: 90271b7e055db3079d3897546c3480a285b740c8
prerequisite-patch-id: 600c72d0a18dc003917f774209625f24c37d11d5
prerequisite-patch-id: e4543f8bf8f0fc69ce6dffc1b18858cf9ba6c04c
prerequisite-patch-id: 260a5ff56d2e5fc5583b875e0e0eca14786f23c6
prerequisite-patch-id: 2895240e7ee5b7d3f0792e7c964be474c583a4c6
prerequisite-patch-id: d429c7951d6bc134fb9f8990d72ff678b55e39d2
prerequisite-patch-id: 4733bf85a0015bf832f46909518c5c3b291824ff
prerequisite-patch-id: 876879d9ca584afcfda5ea388a39f71ba5e88847
prerequisite-patch-id: 849e3782c7a6263bce97a359f1e8521dc2b2ec77
prerequisite-patch-id: a4d9ceb8d99e527d9b9b184cbb1923c99e15fe1a
prerequisite-patch-id: 8c9246e1485d06429b1caaae7a1efb7af5122723
prerequisite-patch-id: 66880ad35a1681b724b51cb40e591270a65429ce
prerequisite-patch-id: a750eb3c350e1a88aef8749506332663fb44e007
prerequisite-patch-id: 6e9d4b20e02afb09defda703c74d56ea222d10c1
prerequisite-patch-id: 808ce773f9ecb493ba9362e088453638ee93b222
prerequisite-patch-id: 462a6751e3e9074102e8d31b23bf06140f6ee6e6
prerequisite-patch-id: 309ee450a2ac8eb24516c6839b944bc5f36a6db6
prerequisite-patch-id: 07059d14bb516ba19fc0a678a96b3224f91caf24
prerequisite-patch-id: 1e221a9bbfb1fc53982beaf75bccf48baaba491f
prerequisite-patch-id: 20ce5105adc4c7f8ebc6c779b107fd54def4f1f8
prerequisite-patch-id: cd8fddc6d97316419b52997207a198037b41b32d
prerequisite-patch-id: 759f747940c26df6ec85fecb4779fd54e0ea3735
prerequisite-patch-id: eaeebc9df5221bab68a6cabc64a97e9c2608899b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

