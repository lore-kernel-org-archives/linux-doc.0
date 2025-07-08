Received: from va-2-31.ptr.blmpb.com (va-2-31.ptr.blmpb.com [209.127.231.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AD421CC60
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 02:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942554; cv=none; b=rdmDNUOvoUEbXAxehR6zCTQ+nV4gARTioahSaRZE4j3UqjcYFiExQgZ8Lrlxry1AuzLWkK/qGY3ajCrE6SpXwMbaFh4yiGRiGEoFB2Ngc14aNI5NKwMJynZVqEVsVVDLVPtYIqY0qvzynOjeJNluT+Fg5STMXmoaRBvkqPZGz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942554; c=relaxed/simple;
	bh=Gq1YqCT2qL1Yi952Nh7ZsJjUccYqZyrHmT76Ak6Ws84=;
	h=Cc:Subject:Message-Id:Content-Type:To:From:Date:Mime-Version; b=ZZyY0H6hrODCHkRlfJoLZ5p7EL5x2QMG5fRnsrO/sFw/jZgywrMess5dAoD2oXtqBHLFzNQRtZsbxb7bw9OU2mMKBUjB5Iobn0ArAolFXdW3hhczCCqJcgQi9bkVgDx1HXOVhCe3HKhqPfYkd6Eo6tzrCtNPGhLaN2RCo2s+t9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com; spf=pass smtp.mailfrom=leap-io.com; dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b=Dsp4oSTq; arc=none smtp.client-ip=209.127.231.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b="Dsp4oSTq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=leap-io-com.20200927.dkim.feishu.cn; t=1751942502;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ooO20KNRshO/CWIHUNJnzfkec3pTS8RpjcC32Z8x18E=;
 b=Dsp4oSTqvNEzuZGlQ2cuxKmEHoM2gd7Bisb1ZXd7IlDYgZzNaw/XSAIggHe3Cs0q2RIBc0
 DVhKMmzqE7ub3M5YE3A2zVvz8SwEr8RoY+7dPvyBt6wyGLNPUOrqMsfMaeyy0rgiozAHHi
 18oEmBBjKBRdl6fRcx6/5VCF5BexgPLX4UziyiYdrXhayfNyOWCtTriBH6/PmKU884yvtK
 WHpsXKV5W1AztuJN8D78XhQTGA2AyZK8r0a2qb7WqdvlOKTwokSR9JlCmkXLIn6zxvP3Pv
 rg4NjRAd19zo+lCzwakJjUFhWLqQuAwrGYT8NM1Wwvh1lDVdVr205LXNibYsyg==
Cc: <dzm91@hust.edu.cn>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Subject: [PATCH 0/7] docs/zh_CN: add chinese translation for scsi
X-Mailer: git-send-email 2.25.1
Received: from localhost.localdomain ([210.12.5.226]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 10:41:40 +0800
Message-Id: <20250708024139.848025-1-doubled@leap-io.com>
X-Lms-Return-Path: <lba+2686c8564+3a9e71+vger.kernel.org+doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8
To: <alexs@kernel.org>, <si.yanteng@linux.dev>
From: "haodongdong" <doubled@leap-io.com>
Date: Tue,  8 Jul 2025 10:41:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: haodongdong <doubled@leap-io.com>

This patch set adds Chinese translations for the SCSI documentation.

haodongdong (7):
  docs/zh_CN: update subsystem-apis.rst translation
  docs/zh_CN: add scsi.rst translation
  docs/zh_CN: add link_power_management_policy.rst translation
  docs/zh_CN: add scsi-parameters.rst translation
  docs/zh_CN: add scsi_mid_low_api.rst translation
  docs/zh_CN: add scsi_eh.rst translation
  docs/zh_CN: add sd-parameters.rst translation

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
