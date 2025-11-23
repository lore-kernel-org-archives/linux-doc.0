Received: from mail-m49243.qiye.163.com (mail-m49243.qiye.163.com [45.254.49.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBEE22CBC6
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883924; cv=none; b=fYPumZE0kBEe4EmUGSldfjF1pK4MZlB0mlfJlWFA5Llb5JamgKa7Byd6T/HzQNTtMjtWmRpBch0I/4noQD84Wqf2FgCd98cVnm7PO2bs54c+bgmgyfGZj8k5VnNPiToxqZNYknXDovgYXrXAaNA65mvDtkoiNP8YN8jFTOSz3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883924; c=relaxed/simple;
	bh=/KPO5BxO0Vdiirq/lA6YXlb0WrxQUt8NGZdfOhzfT6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QF//WJxBpP9QWEuBgCsg1iRDzILCctLB5DRJ79tCV1CNoBedaZwPVzhcfapS/Bb65cg8zkCEVUBSyHKihYud8RnSIctSesfJVd5BOLmzyCYtqohwqqgjKLFsIvw/bayHZVFoMU5ZBhlPtOl85PYW/xtNA9ik0P2mCcoL3saSYZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=gJudUlCi; arc=none smtp.client-ip=45.254.49.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="gJudUlCi"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99a7;
	Sun, 23 Nov 2025 15:45:10 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 00/25] *** Add Chinese translation for USB subsystem ***
Date: Sun, 23 Nov 2025 15:45:15 +0800
Message-ID: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafac868909d5kunm0cca71982865ff
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkhIVktCT0kaSxkfGkxMHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=gJudUlCi74vwfnK8tqFpes9e6lUmMa9t4jjiVzzJ4kjDO3X6yWKk0WweIFD3iagy6s9XBIEjcqME73gAvaxIvxoqZ9nHWpWEHt5NA6umigUOAUOstmPSmr2+x7b/o5nAdY4DXiCyRKpvr3Y+vXZflmdQWSemRO/cr5uqwZCr/ul1jaM7/xwhEwOeX/EV2PKzxgx0DU5RrDz6YKCNyjaHLS25EurmluQ52bW2ADpsDVkD4ImBBE1Bckw44PDzj6OKl59gl6eLFzO2XdkcMdiPcGyyj0cBkQFhISC124S3zRjHnK6Ym1vnt4PKXRyio7+HtvALuHT/XIdl/A1J3a5Lpg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=ax4358LQy4K7sXJxWK3TccpwjV/KTzBtSey6zdL/blU=;
	h=date:mime-version:subject:message-id:from;

*** This patch set adds chinese translations for the USB documentation. ***

macrofun (25):
  docs/zh_CN: Add index.rst translation
  docs/zh_CN: Add acm.rst translation
  docs/zh_CN: Add authorization.rst translation
  docs/zh_CN: Add chipidea.rst translation
  docs/zh_CN: Add dwc3.rst translation
  docs/zh_CN: Add ehci.rst translation
  docs/zh_CN: Add functionfs.rst translation
  docs/zh_CN: Add functionfs-desc.rst translation
  docs/zh_CN: Add gadget_configfs.rst translation
  docs/zh_CN: Add gadget_hid.rst translation
  docs/zh_CN: Add gadget_multi.rst translation
  docs/zh_CN: Add gadget_printer.rst translation
  docs/zh_CN: Add gadget_serial.rst translation
  docs/zh_CN: Add gadget_uvc.rst translation
  docs/zh_CN: Add gadget-testing.rst translation
  docs/zh_CN: Add iuu_phoenix.rst translation
  docs/zh_CN: Add mass-storage.rst translation
  docs/zh_CN: Add misc_usbsevseg.rst translation
  docs/zh_CN: Add mtouchusb.rst translation
  docs/zh_CN: Add ohci.rst translation
  docs/zh_CN: Add raw-gadget.rst translation
  docs/zh_CN: Add usbmon.rst translation
  docs/zh_CN: Add usb-serial.rst translation
  docs/zh_CN: Add usb-help.rst translation
  docs/zh_CN: Add CREDITS.rst translation

 Documentation/translations/zh_CN/usb/CREDITS  |  152 +++
 Documentation/translations/zh_CN/usb/acm.rst  |  137 +++
 .../translations/zh_CN/usb/authorization.rst  |  125 ++
 .../translations/zh_CN/usb/chipidea.rst       |  143 +++
 Documentation/translations/zh_CN/usb/dwc3.rst |   59 +
 Documentation/translations/zh_CN/usb/ehci.rst |  217 ++++
 .../zh_CN/usb/functionfs-desc.rst             |   43 +
 .../translations/zh_CN/usb/functionfs.rst     |   94 ++
 .../translations/zh_CN/usb/gadget-testing.rst | 1068 +++++++++++++++++
 .../zh_CN/usb/gadget_configfs.rst             |  383 ++++++
 .../translations/zh_CN/usb/gadget_hid.rst     |  462 +++++++
 .../translations/zh_CN/usb/gadget_multi.rst   |  154 +++
 .../translations/zh_CN/usb/gadget_printer.rst |  535 +++++++++
 .../translations/zh_CN/usb/gadget_serial.rst  |  259 ++++
 .../translations/zh_CN/usb/gadget_uvc.rst     |  372 ++++++
 .../translations/zh_CN/usb/index.rst          |   50 +
 .../translations/zh_CN/usb/iuu_phoenix.rst    |  100 ++
 .../translations/zh_CN/usb/mass-storage.rst   |  196 +++
 .../translations/zh_CN/usb/misc_usbsevseg.rst |   61 +
 .../translations/zh_CN/usb/mtouchusb.rst      |   89 ++
 Documentation/translations/zh_CN/usb/ohci.rst |   46 +
 .../translations/zh_CN/usb/raw-gadget.rst     |   91 ++
 .../translations/zh_CN/usb/usb-help.rst       |   28 +
 .../translations/zh_CN/usb/usb-serial.rst     |  451 +++++++
 .../translations/zh_CN/usb/usbmon.rst         |  379 ++++++
 25 files changed, 5694 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
 create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
 create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/functionfs-desc.rst
 create mode 100644 Documentation/translations/zh_CN/usb/functionfs.rst
 create mode 100644 Documentation/translations/zh_CN/usb/gadget-testing.rst
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_configfs.rst
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_hid.rst
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_multi.rst
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_printer.rst
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_serial.rst
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_uvc.rst
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst
 create mode 100644 Documentation/translations/zh_CN/usb/iuu_phoenix.rst
 create mode 100644 Documentation/translations/zh_CN/usb/mass-storage.rst
 create mode 100644 Documentation/translations/zh_CN/usb/misc_usbsevseg.rst
 create mode 100644 Documentation/translations/zh_CN/usb/mtouchusb.rst
 create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/raw-gadget.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usb-help.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usb-serial.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst

--
2.34.1

