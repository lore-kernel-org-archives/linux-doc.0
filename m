Received: from mail-m15592.qiye.163.com (mail-m15592.qiye.163.com [101.71.155.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBE23EA95
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763283077; cv=none; b=n8AL1Aq7/80lV7hKqSJn4Qne+bNl5+0dGwGn7tg6fXJ+pScCQOdfLoF2jOD2ytUc+tgzMtm2IOMvGq2pD0g0ASjkA9W7SRhf7pGPSck/RmrBmowQQ8yWBJe/1beTWCOvISVXikqnah57DFA8rJI8UuUZ56HcT507/YzCdS+GQEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763283077; c=relaxed/simple;
	bh=KFOOqqonmQshkmSToomFHPisuar2VI2j8xAV9tpr9ho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7k3udZ9rtC3WydQBlglkVQ4aefw0x/KDNt2qJuOirVf9PzhtgQv6kSiKPjI9VU0bllO14PjgIx4uWWgR7EPFik7icYvXg/SaslI9kRO3n7uFL81xNB+nPI8jQa65207f2z/+Nk5q5nFeCvdApbOO+Gvwk7kbey76WO2YXhKlfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=lS57NlXV; arc=none smtp.client-ip=101.71.155.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="lS57NlXV"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ba25734;
	Sun, 16 Nov 2025 16:51:04 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH] docs: zh_CN: scsi: fix broken references in scsi-parameters.rst
Date: Sun, 16 Nov 2025 16:51:02 +0800
Message-Id: <20251116085102.1740613-2-kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116085102.1740613-1-kezijie@leap-io-kernel.com>
References: <20251116085102.1740613-1-kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8bdc54ce09d8kunme4efcb9e325f006
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQhhNVhpOTUMfSksdT0JCSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0JKVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=lS57NlXV3/g0PN2E4wexiKpFQ3P7bZVEyN5ulKDxREvKoUMrFmOeA8nCMB2YDl2+SyrtGm0qbOF4/GaHE/vibLPaLciX3ttrGptTrGlz9sCggCPp6oLT0OYqXVANSZptXxKjTeqjZMV4dJmDfv76LTFYL15ksyDZ5tz3SdmQeL4Uv96AiPSl9cIkwWUrTpmQaV4PUhZZcu1TQSWV29QqbLbonQ8t1He9g+T6aYtVMZXAOpzrMod6G33m38GleSJ2tpnJICgA4S1djcMarlKq8xm/NV/9knb//Gslds7udKLQ0Juv5szlutt86kAOh7713kSqdmHfAsz3aGXcdpW/pQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=Kk6pZ2Auo5LbAzp2gZb/w4HYA9Nswbh9mg5IA/Vd2KI=;
	h=date:mime-version:subject:message-id:from;

0day CI reported several broken references under
Documentation/translations/zh_CN/scsi/scsi-parameters.rst.
These files do not exist under the translations directory.
The correct references are the original English documents under
Documentation/scsi/.

This patch updates all broken paths accordingly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511130315.WOiKJQTu-lkp@intel.com/
Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/scsi-parameters.rst  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
index 53cdc3094a9a..ace777e070ea 100644
--- a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
+++ b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
@@ -31,16 +31,16 @@ SCSI内核参数
 			请查阅 drivers/scsi/advansys.c 文件头部。

 	aha152x=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/aha152x.rst。
+			请查阅 Documentation/scsi/aha152x.rst。

 	aha1542=	[HW,SCSI]
 			格式：<portbase>[,<buson>,<busoff>[,<dmaspeed>]]

 	aic7xxx=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/aic7xxx.rst。
+			请查阅 Documentation/scsi/aic7xxx.rst。

 	aic79xx=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/aic79xx.rst。
+			请查阅 Documentation/scsi/aic79xx.rst。

 	atascsi=	[HW,SCSI]
 			请查阅 drivers/scsi/atari_scsi.c。
@@ -69,19 +69,19 @@ SCSI内核参数
 			请查阅 drivers/scsi/NCR_D700.c 文件头部。

 	ncr5380=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+			请查阅 Documentation/scsi/g_NCR5380.rst。

 	ncr53c400=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+			请查阅 Documentation/scsi/g_NCR5380.rst。

 	ncr53c400a=	[HW,SCSI]
-			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+			请查阅 Documentation/scsi/g_NCR5380.rst。

 	ncr53c8xx=	[HW,SCSI]

 	osst=		[HW,SCSI] SCSI磁带驱动
 			格式：<buffer_size>,<write_threshold>
-			另请查阅 Documentation/translations/zh_CN/scsi/st.rst。
+			另请查阅 Documentation/scsi/st.rst。

 	scsi_debug_*=	[SCSI]
 			请查阅 drivers/scsi/scsi_debug.c。
@@ -112,7 +112,7 @@ SCSI内核参数
 			请查阅 drivers/scsi/sim710.c 文件头部。

 	st=		[HW,SCSI] SCSI磁带参数（缓冲区大小等）
-			请查阅 Documentation/translations/zh_CN/scsi/st.rst。
+			请查阅 Documentation/scsi/st.rst。

 	wd33c93=	[HW,SCSI]
 			请查阅 drivers/scsi/wd33c93.c 文件头部。
--
2.25.1

