Received: from mail-m32121.qiye.163.com (mail-m32121.qiye.163.com [220.197.32.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489B1F936
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 13:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764681152; cv=none; b=fevNWD6EZOgFYPFFc6Qlr1VsWDQTAcD7XTPhjeNOXsm3A90aNnlwlk+cTqPVRzE14tfKhP+KGfh53Lpt544ra9Up0raFy8W029Jm3ZSiqtBezs/ZZP/5pl+qVj+LiUtSj5lyzqNZfRZOFp6bf3xPL8kTfFb8gAesmuxr9JMv8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764681152; c=relaxed/simple;
	bh=Qc4t50tYaQ/D5pbg7PKgNiL/CUavzBk0gsK3ZtnGRaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUfGOTzjgbk2hlDr+tRCe0uc2+CoC60TBaH5rN7foQe57SPbWH74kTVy3MoCURxN2AAmTRBBl97EGO6M4f7KJQIzT4bAwFypM/pQi+Mgee1Ba8ZKO4RSUunwjn/uAP6c1rA5PH2xEZmxpy9d25nuObhxtLiWohzDyFiC1MeaYSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=lgP/cryM; arc=none smtp.client-ip=220.197.32.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="lgP/cryM"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2bb0f2e5f;
	Tue, 2 Dec 2025 19:56:45 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v4 0/8] Add Chinese translation for USB subsystem
Date: Tue,  2 Dec 2025 19:56:33 +0800
Message-ID: <cover.1764674650.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9adeec14bb09d5kunm0f4dae893d3eb8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH01IVkwdGhkYSBofTR0eQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=lgP/cryMoZe1efgzZhmfvis2QBz5UJep695hUadiEGGMYwEw00BsB9+mcwhbO8VsWUSDoaPvHhqqm6h1h32qv1y9VPHkUuJzrHJlXuSJt1UD2K+341mnVFImMxSF/hnlxka7f6nBzl2xfj72H9wYc7mBzsU/bXrs9RVusw63xu1INwiggu4cxZxoPhzQcrDGt4MtE5aCn8tvCrAJmtxyvh21REv1yp5n3lT7a76o9UhH1xNzg7YDcG/1ugDFX9VwiiZRgiIHKpsbeiANCfMU6vEIDUR2iWRAjjRT6v27+2RenPGuRRBX25ob/uR0dxGZN02XlyZn7w5Q9cB0BrPQtg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=mdAZ3kQpOfjD7lAgvfxWvHE1iM3D6+OX/ZthgEu3jRQ=;
	h=date:mime-version:subject:message-id:from;

This patch set adds Chinese translations for the USB documentation.

Changes in v4:
 - shorten those overlong title underline/overline symbols
 - Remove CREDITS section from index.rst

Changes in v3:
 - Updated the signoff to my full legal name,
   as requested by Jonathan Corbet.
 - Reviewed and fixed the RST syntax to resolve the patch issues
   noted by Alex Shi.
 - Kept the number of translated files to eight
   to make submission and review smoother.
 - Link to v3: https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-kernel.com/

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
 .../translations/zh_CN/usb/index.rst          |  54 +++
 .../translations/zh_CN/usb/usbmon.rst         | 380 ++++++++++++++++++
 9 files changed, 1268 insertions(+), 1 deletion(-)
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

