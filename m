Received: from mail-m49218.qiye.163.com (mail-m49218.qiye.163.com [45.254.49.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A289629
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 05:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737609513; cv=none; b=IySOTnDX34lIrbLEOIX/WwPy0aybo8rKYehsHJ+KRJU4cTo3mkGk1sh3Yh6IMoaSEFCxh9fH3v3CzE33NorKdNTpziW85ouEBa+a/vO7CTtUsVUgHZR07z24ddsG9/LodFTXEbTNAhieIwqqiuQ4uqEzXbk63zpZGJTX69TC51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737609513; c=relaxed/simple;
	bh=7AQ3NZUrcN8igVu3oJlyAvbvGK/HvHmHoC1K30TXO9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pFG7m3HGZnG+07MtCVt3m//q75u6Ej1AthgK2d1HYqTIvWf2Us+pGyWpkxbWNm6BricK/u3PbVSbxX+Wg1SnvFma0qE4K5ZTJVrvUx/Ay3DxXIPRsHlMGPb7+eVcTnSHS/qUpa8Qmu+XxvmbGXflkduthPaxqtSHjm4DAZ75KU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=SoC6LvVP; arc=none smtp.client-ip=45.254.49.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="SoC6LvVP"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 979244ba;
	Thu, 23 Jan 2025 13:18:20 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/7] Add all Chinese translations in the tpm directory
Date: Thu, 23 Jan 2025 13:17:38 +0800
Message-ID: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0gZVk1OT0kdGh8aQxhPGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a949198d6c809d0kunm979244ba
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OC46MTo4HDIKTy0TChgvSzMw
	FDEwFCFVSlVKTEhMTUtCTktKSEpCVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpNS0s3Bg++
DKIM-Signature:a=rsa-sha256;
	b=SoC6LvVPZZr+HaBMoXMxh0ZEgL3eak5HMm3R3r9eYYSWDZutdo81cFsh6HQzAZwowyqp7o6skCBC/5tugUi6LE0qO6QqNq6AbyUcgyhCeak5PncNeprU7qk7QvHjYbaFaAM1qeN1bRBahv1TF9b/Larjyuwn/2WlFs3RBmereIY=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=2Nn5ncZ74Qf6nnQv3h5HTawFYIkNZRM5cx6wJj4Aon4=;
	h=date:mime-version:subject:message-id:from;

Add all Chinese translations in the tpm directory.

Shuo Zhao (7):
  docs/zh_CN: Add tpm index Chinese translation
  docs/zh_CN: Add tpm tpm_event_log Chinese translation
  docs/zh_CN: Add tpm tpm-security Chinese translation
  docs/zh_CN: Add tpm tpm_tis Chinese translation
  docs/zh_CN: Add tpm tpm_vtpm_proxy Chinese translation
  docs/zh_CN: Add tpm xen-tpmfront Chinese translation
  docs/zh_CN: Add tpm tpm_ftpm_tee Chinese translation

 .../translations/zh_CN/security/index.rst     |   2 +-
 .../translations/zh_CN/security/tpm/index.rst |  20 +++
 .../zh_CN/security/tpm/tpm-security.rst       | 151 ++++++++++++++++++
 .../zh_CN/security/tpm/tpm_event_log.rst      |  49 ++++++
 .../zh_CN/security/tpm/tpm_ftpm_tee.rst       |  31 ++++
 .../zh_CN/security/tpm/tpm_tis.rst            |  43 +++++
 .../zh_CN/security/tpm/tpm_vtpm_proxy.rst     |  51 ++++++
 .../zh_CN/security/tpm/xen-tpmfront.rst       | 114 +++++++++++++
 8 files changed, 460 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm-security.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst

-- 
2.47.1

