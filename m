Received: from mail-m15590.qiye.163.com (mail-m15590.qiye.163.com [101.71.155.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883D835968
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357992; cv=none; b=rtdsiXNGpUGvvsny1kICKQcth1N5oupkQoOalO0dStjIODSJoAIhzkoXCjHljT6sqMTxe899qGXwap3m1zJFgJnUc6oArJw4U1gw54ZREgyJsGo12cVyET6KnoodNjns0SwAzKcFmCoQxH6rnxEB2RuW9vJorekchx8MvnUNCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357992; c=relaxed/simple;
	bh=qziJo4QS+ISV2b2lNicMHsAdawU2OiJ0TXqWdtlWAvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgyzeSNcrjbxP0hDzss9myAfaA3hHVxz8L+gtq3fXiSYEhRShYmQyX6+fGKDd5WrLNQTOnd/vB37Q2T+gyE0Mj7nJcr8C2fearlQKeTDLvDvAwzrOstBC5cYECO7/60quTs96p57d7p4TI+SzFU2OdCNvFW1A3hGHsyGJjafnlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=F3rVdnUk; arc=none smtp.client-ip=101.71.155.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="F3rVdnUk"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92a3cc5f;
	Mon, 20 Jan 2025 14:50:55 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/7] Add all Chinese translations in the tpm directory
Date: Mon, 20 Jan 2025 14:50:45 +0800
Message-ID: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSU1CVktPTR1NQkxOGUpLSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94827a87da09d0kunm92a3cc5f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDo6Pzo6KjISHjcSOjgqHz4y
	LBQwFDJVSlVKTEhMSE5OQ05NQktNVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpNTUw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=F3rVdnUki2bhCoq3SsgLKmL74pBfQB0C1NUY2IFIHAfVy/TpZ4BDdEk5taib22+zQGqEll4abQPhPqH1r+FwCUDA/jwLZ75kYUwU8CMQ0mtNf3EU6v2ejV+WTke2OhpbHRnXT6Eqfsz7KijUMYtsG5raj7DYZHrhgA5ewGRFNp8=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=mgXiC37Yjj035FVsxx3um8IWE7Py5YGG/AxghMq+Vaw=;
	h=date:mime-version:subject:message-id:from;

v2:

modify .../translations/zh_CN/security/index.rst.

v1:

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

