Received: from mail-m32124.qiye.163.com (mail-m32124.qiye.163.com [220.197.32.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382A6FBF
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763283377; cv=none; b=pSgtU6LnycFbRI8DF1JXIw7nHT12BKLfCQs6ittNNR30ybTN48cL7T880bO2BFPjzexv20BgKq2J91nztcND09RlU2af9Ey72NmabrqAEn8LqXRmGRRyrOAOPwpKhdpyEMStmIBslA0UCF5kvXrnWK0ztxmgkuKTYCYF9BvdgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763283377; c=relaxed/simple;
	bh=C2xsmL5bH+8CkFWkuHry3z2ElIXPFHHpG8npGc7YLBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pMj1g1WuHaKX3jjvKMbH2zE8VfJxFC/0JkdErH1EZEaTO7qSdaUNfxLY3ounzkwaiCq2279irgvVlZ/2L4042XEzy+7f/0DWAt/RIoIogbSCukeqbKv5rvo1NCSiKP0vH1dPMrE+rjK8X9TNBQ+r19/jt7Ss9O6xq6JlupsffqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=iCqDIGuj; arc=none smtp.client-ip=220.197.32.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="iCqDIGuj"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ba25733;
	Sun, 16 Nov 2025 16:51:03 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH] docs: zh_CN: scsi: fix wrong reference to Configure.help
Date: Sun, 16 Nov 2025 16:51:01 +0800
Message-Id: <20251116085102.1740613-1-kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8bdc514309d8kunme4efcb9e325ef90
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUpOVhhCQx8YQ0gYHksYSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0JKVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=iCqDIGujfzLSMaNqZdzj8XFkRx6s253wrLVPzMgj8KlV3YFPdBJYgrYlj6iZtuYpVguJf7Czkyi+8dqUMdjD0JEabjR/TMKsrMHwav5A3v+0HIqegc0BKZHA4Snc37BUxSbTSGqUa4e+s04i1rCYxo8dSIxFqHMiVtVHQqxSY2ceOQjBMc3HkFRl9Lnin1PbUyBL4QA4kcmeBGO08Pp53nTxT0U6YXhHhLTySRySYTDN8iRuipE/XuyqZ3rRj3eB5mFLJORCj9FfUrH++O/LDubd2fdY52it4eXzVeVTi0gKoX8a5PtELNwQGxva2gyqb+05PL42uhe2ZAGe9uzrDA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=C2xsmL5bH+8CkFWkuHry3z2ElIXPFHHpG8npGc7YLBM=;
	h=date:mime-version:subject:message-id:from;

0day CI reported that scsi_mid_low_api.rst references a file
Documentation/Configure.help, which has been removed long ago.

The documentation text should wrap this filename in Sphinx literal
markup (`` ``) and avoid producing a broken file reference.

This patch fixes the incorrect reference.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511130032.gevVvSte-lkp@intel.com/
Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
index f701945a1b1c..30ac3bb5b57c 100644
--- a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
+++ b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
@@ -1144,7 +1144,7 @@ struct scsi_host_template::use_new_eh_code标志
 也已经被移除。

 在Linux内核2.4中，SCSI子系统的配置描述与其他Linux子系
-统的配置描述集中存放在Documentation/Configure.help
+统的配置描述集中存放在 ``Documentation/Configure.help``
 文件中。在Linux内核2.6中，SCSI子系统拥有独立的配置文
 件drivers/scsi/Kconfig（体积更小），同时包含配置信息
 与帮助信息。
--
2.25.1

