Received: from mail-m12861.netease.com (mail-m12861.netease.com [103.209.128.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F59B1EEA54
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 03:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.209.128.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757819259; cv=none; b=L2kkPF0GtVLyDLzmcjLqS638X0gymb29YAYrcbFLxE3BH4UxEjEGEPFOngFzbrZMgBHttglCZLU8q715ncjT2IbR5PiVzMuj59RsrPJFlJP6ly52BVwIMNnwvkUCYN21EMUFsSLddZl9Cun2p1n9CI1oEHP5gnyxmEfYICsWC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757819259; c=relaxed/simple;
	bh=TM7Tu/NeVL/socabeecEnQGQN41pZUmfnEFN0aXgXB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FTgiS6dVQMn95QNTRnR5wxj8nOIekH6TpPidkQtOxa3cezWkAb9L0+mf2mqUFZMfml6WLqXsxg5NhAtmDO6uKjT86/DuT79UIPQXpqc/Pf657rwSTKk2Q6OQy7xhqq+fE2PXmolDTwBXBFBy+rvxR36KLcpAYIohTlePGP3uBEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=ZIQ0kxZS; arc=none smtp.client-ip=103.209.128.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="ZIQ0kxZS"
Received: from localhost.localdomain (unknown [120.246.23.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22b62fc46;
	Sun, 14 Sep 2025 10:52:10 +0800 (GMT+08:00)
From: doubled <doubled@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/7] docs/zh_CN: Add scsi/index.rst translation
Date: Sun, 14 Sep 2025 10:52:02 +0800
Message-Id: <e83c0c993642dbb0a4530c8aa557c1436aac6152.1757686158.git.doubled@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1757686158.git.doubled@leap-io-kernel.com>
References: <cover.1757686158.git.doubled@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9946231c8b09cckunmff56615389052d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBpNVkhKQk1MSU8fHh4aTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUtVSU9NVUlIVU1LWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZIQ0kxZSHoKmdmPmjtkgqCbKKwU3C2yhtMtsNtl+2Q0kmTqD54Dqc6dLy8y2tg5ODAWJCVLot2HPvVRDniufk8/pwEZBdhAPYBy394XJI1NZoQklNUwXO7iGDwyMFs/HJqiNOGf/0J8P4pglJZZFwOw8UeTmYNMYUQUas3WdN82/LU+hKQz0iEpeX7MStv62Do5EBPpE1LP/i+yBTj88DKSNQ9tuwxxizAKUcsbklm8LzcRX1XflWyVOuUJO8bPP0A+JMDVlRPYFSSuGMWO1vYJ9AoYY+m6PSYy/9Y5MYvsqrFpFHnkgLtCEeFE6F8dBZvUx4VBYXExQjnbKYZtf4g==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=83si3Lw8rmd277KPNy5BSpnH0smihGQIlEoAnsfDHp8=;
	h=date:mime-version:subject:message-id:from;

Translate .../scsi/index.rst into Chinese and
update subsystem-apis.rst translation

Update the translation through commit 682b07d2ff54
("scsi: docs: Organize the SCSI documentation")

Signed-off-by: doubled <doubled@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/index.rst         | 97 +++++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |  2 +-
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/index.rst

diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
new file mode 100644
index 000000000000..9126a642e43a
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/index.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scsi/index.rst
+
+:翻译:
+
+ 郝栋栋 doubled <doubled@leap-io-kernel.com>
+
+:校译:
+
+
+
+==========
+SCSI子系统
+==========
+
+.. toctree::
+   :maxdepth: 1
+
+简介
+====
+
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+* scsi
+
+SCSI驱动接口
+============
+
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+* scsi_mid_low_api
+* scsi_eh
+
+SCSI驱动参数
+============
+
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+* scsi-parameters
+* link_power_management_policy
+
+SCSI主机适配器驱动
+==================
+
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+* sd-parameters
+* 53c700
+* aacraid
+* advansys
+* aha152x
+* aic79xx
+* aic7xxx
+* arcmsr_spec
+* bfa
+* bnx2fc
+* BusLogic
+* cxgb3i
+* dc395x
+* dpti
+* FlashPoint
+* g_NCR5380
+* hpsa
+* hptiop
+* libsas
+* lpfc
+* megaraid
+* ncr53c8xx
+* NinjaSCSI
+* ppa
+* qlogicfas
+* scsi-changer
+* scsi_fc_transport
+* scsi-generic
+* smartpqi
+* st
+* sym53c500_cs
+* sym53c8xx_2
+* tcm_qla2xxx
+* ufs
+* wd719x
+
+* scsi_transport_srp/figures
diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 8b646c1010be..0f121f9b0f70 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -71,12 +71,12 @@ TODOList:
    :maxdepth: 1
 
    filesystems/index
+   scsi/index
 
 TODOList:
 
 * block/index
 * cdrom/index
-* scsi/index
 * target/index
 
 **Fixme**: 这里还需要更多的分类组织工作。
-- 
2.25.1

