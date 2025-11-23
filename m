Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com [220.197.31.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E354A35
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898967; cv=none; b=TdJcOv0ENfDcqmHeOF870P0bvxYb5yrSYCbjRRC6B4hUNgKBtlk4JSCRSet8ft7N8fzQ7LbqXIRkwpPqhBV/23K3CrTsRvDRFTSgaaH0V4ctn1FO6OwhaoA/Sgf6SdxzsSnlT2+lfJczXPgTxixa5wM/8g/vA9lCku2FgIJwby8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898967; c=relaxed/simple;
	bh=EkmlMt6TmPaJgAfmLTt3GXfYHMcxCvYPySJ5Cq8RdG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbuP7pjRTmJBCL655PCLzldCmjtTOP+vzvXaqpqhiEncA69u9UyA1HiTV3DZEU9DHns3VamLsg7inIJF308TYYicheTjLNmIgm7jMlhM3C2h+Hg2vhzy+rGhsWKEp0N8B823k/5m+KFCaucpEvVjj3KJTrCiwnrivtq71elT3Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=RamzK5xZ; arc=none smtp.client-ip=220.197.31.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="RamzK5xZ"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a90290ed;
	Sun, 23 Nov 2025 19:55:54 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 00/25] Add Chinese translation for USB subsystem
Date: Sun, 23 Nov 2025 19:55:58 +0800
Message-ID: <cover.1763897036.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab092118409d5kunm2b5c8c0429ad7b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUJLVhofGhgdHRlJHxkYSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=RamzK5xZjdMu7+sLpzjI994kOcvKf8FjzAZpe26lRCsj90qAO1hnuWRejOsM7IkpKShrZTJTEdaS5isJ4r3ERJjJqKRma6OQhXECGO/tIUb3hfPYBJdgm8hirJLNzLj8Sw+gNYU0WG/PiroepYskAnPoshpQjhkow9k9r3W72ylAMas0GkYLyI2ZN4MpPsylUyjrm3DNdbVKNoHJ+yzBO8m4bDtHrSSs5RR9oIo7qhKc0j5RWDRXRnQlvVT7XHzCqhmToHNkXD5rBmnxxdsp8V+AX1kgSqXm5JA3raZ0FEYdYNEPU9zuSPB1b3oUSD49NQW4ThT0luT4JzEgP3xCew==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=9ijWiZHw/TC6UXbTHQwoOp1rxxzpAcCZZPP7oZ0/Z2E=;
	h=date:mime-version:subject:message-id:from;

This patch set adds Chinese translations for the USB documentation.

Changes in v2:
 - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
   to include corresponding updates in
   Documentation/translations/zh_CN/subsystem-apis.rst.
v1:
 - Link: https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-kernel.com/

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

 .../translations/zh_CN/subsystem-apis.rst     |    2 +-
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
 26 files changed, 5695 insertions(+), 1 deletion(-)
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
2.52.0

