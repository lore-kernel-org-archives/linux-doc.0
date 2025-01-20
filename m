Received: from mail-m49240.qiye.163.com (mail-m49240.qiye.163.com [45.254.49.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D2818FDAA
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361140; cv=none; b=tHfSFudRqGVmMLtbpT63IXkzq7s2P16Cr5SjUnBYqDkwPtvLnLL6jD24K+dJEGHIEEk9kXPLV3mCqsghWSLoLugXlsq8D6ToY4lrJgTu5P+Ppk2x25bZItBY27HyH88jDCvUqjUUIgtxoNg7oLt1OnLcU/Vk/Q0LIgjjPpBxzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361140; c=relaxed/simple;
	bh=6GCfzAT4j6aA4tuH/jegcE2PRlCI8YXDUivIR9+w4YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6QkVpy3oF3/sa/X7rXSl9IYaunMU/hf6hGmZwKmia2CrwRwKDUxN5N4P9YoYo0fHMKkyj3cKdBUn8m8etL+0bSPVREEoJBnElAEVHjM5xOL7ULBZCzdvQyqBdF3LFvsDIQEWg52Gbn8mUNf5pFPPar1ewp3/5J8uJWbPToau8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=SH8KlnSe; arc=none smtp.client-ip=45.254.49.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="SH8KlnSe"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 924e2b0b;
	Mon, 20 Jan 2025 11:42:54 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/7] Add all Chinese translations in the tpm directory
Date: Mon, 20 Jan 2025 11:42:45 +0800
Message-ID: <cover.1737344074.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkpMVkJISU1CGhhJThgZSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9481ce64a509d0kunm924e2b0b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NS46Mhw6EDIIDjA6EQ8cIzIe
	Fi4KCzRVSlVKTEhMSE9PTkxOTkNJVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpOSUM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=SH8KlnSeQrUhpOhaRR+PCmPrRayqDKJ0KsgvO8MU//rramwiw97L8k8E3vehrKMbYwWX2TdsGvl1iQ0TSWpbZY4xNtH8BacVTViWG8iuejDXjGeWqZV15AuB3YH92AdoC87npefvEKTwmKYdLlwvif4qKHBYCnccm+asgZvuUv8=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=276Wli1Ac5sDaIHbOo+ueSmL3USQQV6kvuZYCY+yDY4=;
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

 .../translations/zh_CN/security/tpm/index.rst |  21 +++
 .../zh_CN/security/tpm/tpm-security.rst       | 151 ++++++++++++++++++
 .../zh_CN/security/tpm/tpm_event_log.rst      |  49 ++++++
 .../zh_CN/security/tpm/tpm_ftpm_tee.rst       |  31 ++++
 .../zh_CN/security/tpm/tpm_tis.rst            |  43 +++++
 .../zh_CN/security/tpm/tpm_vtpm_proxy.rst     |  51 ++++++
 .../zh_CN/security/tpm/xen-tpmfront.rst       | 114 +++++++++++++
 7 files changed, 460 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm-security.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
 create mode 100644 Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst

-- 
2.47.1

