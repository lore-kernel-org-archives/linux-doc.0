Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com [45.254.49.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51851CD15
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 03:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265351; cv=none; b=ksG+ku0QvW4Et9cJQBy5YD3QMxxmoLBlWjCrFZAbxomnyIOH1HJNh+bEzLUT87LLseCjaL/XxbwOcQ4gR+4mlkA1GEngXL2XvesIDIn6zemDKFQqHKvlpmPyNViNEjhAgcZ5gbOP0511G4KYPAdW4hmHrDSms3h0LjtUiOUoq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265351; c=relaxed/simple;
	bh=wHui5JZDGhQ1C/sOx9ehm1/cduer590m+WFUt/ogneY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ejjg87TWVaz77cJ6ciopcbrSv8iuHPhY6XupMSF7odbDPMhpN7vszZPP13GYz97jZVzWawlwWiVuOaAmGP8YtAcTY8+ZqzLAHcpvGNasqrlKfvzUFqvbU1CkT9jt3w+QA9idAqehcvTKkdTyMMP0JbsN7SToa/yEJno4oI3J7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=nimB8HIt; arc=none smtp.client-ip=45.254.49.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="nimB8HIt"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29b70741b;
	Sun, 16 Nov 2025 10:40:05 +0800 (GMT+08:00)
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com,
	yjzhang@leap-io-kernel.com
Subject: [PATCH 0/2] docs/zh_CN: Add translations for libsas and wd719x
Date: Sun, 16 Nov 2025 10:40:03 +0800
Message-Id: <cover.1763112421.git.yjzhang@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8a88b1c909d6kunme87d206954f590
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGE9IVk5JGElOQxhNSx8aTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=nimB8HItM63VQx6aTcElTp6E3lRugWAT2S0Q9TLNvEgKRBKjgemgAM2Nrtd/KAgFZ3N2HBmEHdj4Iwj+p9R2Yw54tBsLgJbCjGgj0dH80bcso0Ib4B93ClCZATlpJdOwQ9qoV42ZY8ldTM77TVjrlupQiSQOJO0HnqQvQ2VYikERsKiZ/wveC1MRV/Yvcf1d2AfZtk/K1RuU3On7niNaHlHcOiv+oL3ZrtEyT35t+MXxZMH4k2W00DhYGdTMzroN7KEkAc7DD5ff923aQVBLfhZ6/a6V7swyhoTlMWgioKbXnujp0OHWUZNO780NoB738ZZV6XJS4KPmOOwmgnKuxw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=fDJmCb8/6groKMYKByP6rOIsrDVGXRIbkoclCVx9eXY=;
	h=date:mime-version:subject:message-id:from;

This series adds Chinese translations for libsas.rst and wd719x.rst
under docs/zh_CN.

Yujie Zhang (2):
  docs/zh_CN: Add libsas.rst translation
  docs/zh_CN: Add wd719x.rst translation

 .../translations/zh_CN/scsi/index.rst         |   4 +-
 .../translations/zh_CN/scsi/libsas.rst        | 430 ++++++++++++++++++
 .../translations/zh_CN/scsi/wd719x.rst        |  36 ++
 3 files changed, 468 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/libsas.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst

-- 
2.25.1

