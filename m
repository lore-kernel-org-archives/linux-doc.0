Received: from mail-m2430.xmail.ntesmail.com (mail-m2430.xmail.ntesmail.com [45.195.24.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC77A13A
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 04:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.24.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822869; cv=none; b=CbJ163wC6KLCbqp3pds9/h1EiiaNVCk63t/X/u9V5RDxZN21kHU+OnsxlFUkPqHh97IkYGHSY06qCm6h/zCJaTAnJmCSN+4dHBMpEnh0DT4G2aPZWuH39u5axafU4qsToW5LhD0s8G0E9OyukwZpIi3fOXqrirYKINlc68lk2ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822869; c=relaxed/simple;
	bh=0t0O6Wd3cfGS8SlujhENSm6yYjv2rTGYL5iuNQVLpSE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fBg9IIGbIvUTnrXrjqNsNchsXK42M81SjEdPFhrze4wAKhqViQ3loRjQmBSiafwv6bQxaQpc/AFDMMOWxY7nBiJoncwDyf329RRt308aIK5VFgW7ZJds9Mg8oKKVzxo24pdr41YlOHkgGFbFl4PUqJZ6xmvJTqsAzTO7VCbLcFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=XZFbpcAT; arc=none smtp.client-ip=45.195.24.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="XZFbpcAT"
Received: from localhost.localdomain (unknown [120.246.23.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22b62fc45;
	Sun, 14 Sep 2025 10:52:09 +0800 (GMT+08:00)
From: doubled <doubled@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/7] Add chinese translation for scsi
Date: Sun, 14 Sep 2025 10:52:01 +0800
Message-Id: <cover.1757686158.git.doubled@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a994623187b09cckunmff566153890525
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTElCVkkfGRkaTkhKHk8YQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUtVSU9NVUlIVU1LWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=XZFbpcATGwl5C1Rgqnd7CDPbWm0OC6m9QGS6kjZsUzef2FKfSPrnkqmzAN6gV+3SCBdGyaP8GDYpSDZej86dVeBDlLv7XjQHXNowNO8pf9xvB1sspNgvxCjEUuKcDBSv60E9rapanl4fEdUEuy1Lh3gG9XcdgMA0/kfkVg3LaD9BXDYZS77UBY3yRp1NAZX5ibTwKiO2oTUEl5egfxKkJ65SD/j0VeY1tJtiu/lgMMqxwFBwKks14GPoL1Cyn8O0vXkpS7SyEaguClBs4fYoqN1GURFB6iTBdvio3JUZJpedzgzzse1unBkzU1h8kxGImFvB7Z6TqeKYqJ1ME1rqNA==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=1I25hbjUf8hjd4b/OoeLScJChHqDX/zjSCIJAQE3qEs=;
	h=date:mime-version:subject:message-id:from;

This patch set adds chinese translations for the SCSI documentation.

doubled (7):
  docs/zh_CN: Add scsi/index.rst translation
  docs/zh_CN: Add scsi.rst translation
  docs/zh_CN: Add scsi_mid_low_api.rst translation
  docs/zh_CN: Add scsi_eh.rst translation
  docs/zh_CN: Add scsi-parameters.rst translation
  docs/zh_CN: Add link_power_management_policy.rst translation
  docs/zh_CN: Add sd-parameters.rst translation

 .../translations/zh_CN/scsi/index.rst         |   92 ++
 .../scsi/link_power_management_policy.rst     |   32 +
 .../zh_CN/scsi/scsi-parameters.rst            |  118 ++
 .../translations/zh_CN/scsi/scsi.rst          |   48 +
 .../translations/zh_CN/scsi/scsi_eh.rst       |  482 +++++++
 .../zh_CN/scsi/scsi_mid_low_api.rst           | 1174 +++++++++++++++++
 .../translations/zh_CN/scsi/sd-parameters.rst |   38 +
 .../translations/zh_CN/subsystem-apis.rst     |    2 +-
 8 files changed, 1985 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/index.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi-parameters.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi_eh.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/sd-parameters.rst

-- 
2.25.1

