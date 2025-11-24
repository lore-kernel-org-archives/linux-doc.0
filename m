Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com [220.197.31.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000AA2DC32C
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763966035; cv=none; b=br2EHRrqcR+7oK7sD0+tHKQeiwbtNEBE07jCESe5JMoc9wPagp6IozAFJMJDusHYDIZ/7GPhpkrRhyX1WxJ1J0OTSea5GMnjtf1cpQaKfiRy4h6FQxUcJEhEzoxa9wiMZul6uAgCrlcyjdSGf30XAzVP9C081XZnasbnVqSVEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763966035; c=relaxed/simple;
	bh=6ZVdS3O7xRmPnjOKaNo3VgfCFk0lm4QHvfiWwW965RA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rlWdg/3Sb4mZQ2wUuKcLXTYje+k4fM+HTU0zTj5Zpr/dPo5l3NQ/QZM3QGdnAAFjXtF8nx+moIbY0LxIlmdYLU/ok2X5IKQkLqLYkuGGWc5ZPlDpTkpIIuZd7s+0lrwtNkMnDTe3PrLJuyzsZsBrRWYJPZcAuaHJSyhh1Dh3pQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=V+8/1IG3; arc=none smtp.client-ip=220.197.31.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="V+8/1IG3"
Received: from localhost.localdomain (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2aa428be7;
	Mon, 24 Nov 2025 14:28:40 +0800 (GMT+08:00)
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com,
	yjzhang@leap-io-kernel.com
Subject: [PATCH v3 0/2] docs/zh_CN: Add translations for libsas and wd719x
Date: Mon, 24 Nov 2025 14:28:38 +0800
Message-Id: <cover.1763964599.git.yjzhang@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab48cd89609d6kunme0000f0039ce31
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSENPVkhDT0xIGBoaHx9OT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk9ITFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=V+8/1IG3GoUlYyCT1t6GAjiiMrWmMW6aoX3YmoNAiixhp7oGuo1dEQVI/13JYoYf76Gm0ih/rO6R5vEi21svQJa/4qtO00J6Qz61TVujay255oEJV+WEywpkNCioQe74x2LEtLjPKVKYwA2T/MxvS7aJICqH18g/dkBnOkhKXvv0Bd1auCcx6a/iQ5fGK4U7iNJVj0k0R3ZbHrkq3mCULu2p+YardF41DjjOzL0z3WdEo39kEkacqtork0bbd/nrNWccFcQ3amBprX6HTtxYx3yf/alVtA5X6405/u6KErlM8LMlgyk9mkEElAtZXoEvN0loc55wwcbCuC6hM1pyOw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=i1sG3fFMg+koYSBsfl1UgYnp7BnlsK0dUDWpGduPDMY=;
	h=date:mime-version:subject:message-id:from;

This series adds Chinese translations for libsas.rst and wd719x.rst
under docs/zh_CN.

Changes in v3:
 - Fix extra '=' in heading
 - Link to v2: https://lore.kernel.org/all/cover.1763886358.git.yjzhang@leap-io-kernel.com/

Changes in v2:
 - Adjust document to follow RST syntax
 - Link to v1: https://lore.kernel.org/all/cover.1763112421.git.yjzhang@leap-io-kernel.com/

Yujie Zhang (2):
  docs/zh_CN: Add libsas.rst translation
  docs/zh_CN: Add wd719x.rst translation

 .../translations/zh_CN/scsi/index.rst         |   4 +-
 .../translations/zh_CN/scsi/libsas.rst        | 425 ++++++++++++++++++
 .../translations/zh_CN/scsi/wd719x.rst        |  35 ++
 3 files changed, 462 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/libsas.rst
 create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst

-- 
2.25.1

