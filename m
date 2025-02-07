Received: from mail-m3297.qiye.163.com (mail-m3297.qiye.163.com [220.197.32.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE1680BFF
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923563; cv=none; b=OKQMxyvGAJhVJOe5CwkZ1dCmxQmgbdA/f5lH8YpqzoUdeaLEHkyjVF8Gy3KpsnucOHWSULvesxvzfkltEpq6wVreHY72cG4z+iou6eDRSe+pqorpD2sJOdYbxTXWpiVAWTrJLmgWO4ZNt1XReu2y5CvJhPy5IxEbjRNiV/KtM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923563; c=relaxed/simple;
	bh=uKhU4rAtHhSg5E3ytndUS8pUt4nDxwCumdN2QRXJo4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSbwxuJpJClC6neXGLccxdQIeciT8a4jbYmiVv5BMlZIfpAoplHITR8caYZqhtAZ6Wn/VwNbusmPVZtbrEfz3mwSF1gLmwvSxQky6CUw4jamsjgS8uDvjb0RmeSOGHzsezLeoGzBMXYvH8d1K//VH5AOYEjRVC46QF6AhxKIDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=U60QhnaI; arc=none smtp.client-ip=220.197.32.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="U60QhnaI"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a6b57c95;
	Fri, 7 Feb 2025 18:19:12 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v5 3/3] docs/zh_CN: Add secrets index Chinese translation
Date: Fri,  7 Feb 2025 18:18:57 +0800
Message-ID: <57978b69f643c1aacf78804affde4c819960fd3c.1738923258.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
References: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGE1JVk8YSkIeSB1LGBgeGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94dfebaee803abkunma6b57c95
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTY6Txw*PjIPAgw4LiotDU0t
	TTkwCRNVSlVKTEhDQklITk5ISU5OVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBQkNONwY+
DKIM-Signature:a=rsa-sha256;
	b=U60QhnaIGEYtlVRDUBITZ8sHlw+4JI8zg5dYXVdd37ptw52sIMil305+KIXbkui8x2eHfxpVGTDVXnvssiRKm/E0bC4wH3rMdFLiMyeCSDrUnWjRWZzh11KjHT1Dzmv8qBAZ+Vac/TntEN44xB28okmZP1oy9DP5tLVU1yxp6X8=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=aGoHrJYYgTiSqoKF1U5UZ4f6QUCAp3cHLbKr2tOj0GM=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/secrets/index.rst into Chinese

Update the translation through commit 7419995a331c
("docs: security: Add secrets/coco documentation")

Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---
 .../zh_CN/security/secrets/index.rst            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst

diff --git a/Documentation/translations/zh_CN/security/secrets/index.rst b/Documentation/translations/zh_CN/security/secrets/index.rst
new file mode 100644
index 000000000000..5ea78713f10e
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/secrets/index.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/secrets/index.rst
+
+:翻译:
+
+=====================
+密钥文档
+=====================
+
+.. toctree::
+
+
+TODOLIST:
+
+* coco
-- 
2.47.1

