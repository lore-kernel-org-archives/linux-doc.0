Received: from mail-m155104.qiye.163.com (mail-m155104.qiye.163.com [101.71.155.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E3306489
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991235; cv=none; b=Cj29DQ9oDikLeAz39LhpTZUjcxr+o4YTkwAiCv8KjnrOP+SrBg1TCUD8NiiW+FYUEj+rYWEyjw0TJyat6o62mJWEtXZaPn+XaNPc5F+ECxgK3csI5vQJ3GOB84Zg+O0oRBLHMYhrInIOy6HpEnJnygGHp0FV4WJDOvM/2Oi+0s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991235; c=relaxed/simple;
	bh=yc2kzaQ5Vx/J0cUBhhUPuHlQRJSJBAkC3y+UfLHFlHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4B8wAjZp8wOye7QmNxE7AXvEvq+tIpr8gc1k55sT839s0SYJ1sbe49+vSzBq64mbDzvQmtSe/BN5T/lJIAapghWbbZ9ms2PGHRDUa+n5sPh5xv5Gl/nFCazF9ut3wttlHEAb/17PleLrK3b4ft+/48drZN0w9FrwaCiWVsKOEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=rIL1EwOq; arc=none smtp.client-ip=101.71.155.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="rIL1EwOq"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ab2e0356;
	Mon, 24 Nov 2025 21:33:40 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v3 0/8] Add Chinese translation for USB subsystem
Date: Mon, 24 Nov 2025 21:34:04 +0800
Message-ID: <cover.1763984424.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab611f06b09d5kunme2b32dc6369ca8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0xMVkNKGhgYTEweSUofH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=rIL1EwOqpzxBdPfcZxtNOdCPOA09ABQc9JRWtfLbpQ8spzS+XbPj7dvK1eimP3JB0AKV5B4opd9Dn+qILIFXtzbhI2Ck+PM2irtmCqlbcf2Me4fXfI75SPmAu1caR79xyDMSzAiOXDvSc0vInXRYz+TJi4V5AG+hW/Xatw5AwoVXSiaQJfzsDZHSLIqXuhSYsre/N/kvJTfoLBCPpZub2fHRnDIju+cqXoRHku4LT3KbZeKauwg9jOR2ZiBl4PCxHudzXR7hcS5ZsorBuVs2hUd/LqRO/LCyxU3CGfSNT0QD7Hq5K4fhDiYKailwXi2ow0NPckyo0qfBMenjlkdRlg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=z9jrufB3+pEQjczSvC6LS/Yc4AQZsWntGBmiz+Ku7Kg=;
	h=date:mime-version:subject:message-id:from;

This patch set adds Chinese translations for the USB documentation.

Changes in v3:
 - Updated the signoff to my full legal name,
   as requested by Jonathan Corbet.
 - Reviewed and fixed the RST syntax to resolve the patch issues
   noted by Alex Shi.
 - Kept the number of translated files to eight
   to make submission and review smoother.

Changes in v2:
 - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
   to include corresponding updates in
   Documentation/translations/zh_CN/subsystem-apis.rst.
 - Link to v2: https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io-kernel.com/

v1:
 - Link: https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-kernel.com/

Kefan Bai (8):
  docs/zh_CN: Add index.rst translation
  docs/zh_CN: Add acm.rst translation
  docs/zh_CN: Add authorization.rst translation
  docs/zh_CN: Add chipidea.rst translation
  docs/zh_CN: Add dwc3.rst translation
  docs/zh_CN: Add ehci.rst translation
  docs/zh_CN: Add usbmon.rst translation
  docs/zh_CN: Add CREDITS translation

 .../translations/zh_CN/subsystem-apis.rst     |   2 +-
 Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
 Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
 .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
 .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
 Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
 Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
 .../translations/zh_CN/usb/index.rst          |  61 +++
 .../translations/zh_CN/usb/usbmon.rst         | 380 ++++++++++++++++++
 9 files changed, 1275 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
 create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
 create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst

--
2.52.0

