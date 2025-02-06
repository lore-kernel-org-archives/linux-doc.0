Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com [220.197.32.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB252E64A
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847263; cv=none; b=U4FcS4ce1ApeiMqfzBIlr9iztwdtfDRqY9YoKddS8DfkzIQiy0ETUVFqZdasLB97Rux/IvMb5l8fPENJrElKDX9fuBpshnCSKrtIhmv1revdAKBGqz6HaU+lpP85P+ubRjcsqPjUZzfStwP7KjRK6M6CT/9kL+p8RKk+tUT5bnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847263; c=relaxed/simple;
	bh=KipU9XjZ8yTvZ0XJzTdqYoybYHiKw8JeKOKyjBKOcFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZKvdkMm+XsXwour+BeJ6wU5M0Wk0zSZzRdLiER7o1qhqantGHLdAbRoxwMzJBvBccn8ZogksKDpvJ/xeuTnIBjRbg1vnYTeorTpiuO2SGyyXiWbWFLxiJSM/WNVpIm1tXkmoc/X8tmv8Miyvffxr6lXTzRU45ASeKC4n/4TMjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=jDWK8IbF; arc=none smtp.client-ip=220.197.32.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="jDWK8IbF"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a51dddb3;
	Thu, 6 Feb 2025 17:38:18 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v3 0/3] Translation self-protection.rst into chinese
Date: Thu,  6 Feb 2025 17:38:03 +0800
Message-ID: <cover.1738833098.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTRlDVkpIGEpDSUgeQkhJGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94da9fe1d903abkunma51dddb3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSI6NDo4KzIXMAhCQjEaPxU6
	T0wKCklVSlVKTEhDQ0hPTUJCQ09OVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBQk9ONwY+
DKIM-Signature:a=rsa-sha256;
	b=jDWK8IbFBWMZbOPmHYTx/XARcVGCY+C3qdHFFcvA6t1Vz4+/JlAg7cDtN0u1r4I49m0m+/4UN62P/0/xqbmMh9nomg6Pu5SMHAVEwDui+Pu4eKWOyE3xSNM3Umu2G5sACQn/TSY7QD6cGl2zOiK3HJ3oM60IkEHyGCfCIfs+U20=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=YrUyH10sAYaXhIAU3xVaZiwAqtmODo7/CINxzJ5YQBY=;
	h=date:mime-version:subject:message-id:from;


Translate self-protection.rst into Chinese
and add index.rst under keys and secrets

Changelog
v3:
  * add index.rst under keys and secrets

v2:
  * fix remove the unnecessary blank lines

zhangwei (3):
  docs/zh_CN: Add self-protection index Chinese translation
  Translate .../security/keys/index.rst into Chinese
  Translate .../security/secrets/index.rst into Chinese

 .../translations/zh_CN/security/index.rst     |   2 +-
 .../zh_CN/security/keys/index.rst             |  24 ++
 .../zh_CN/security/secrets/index.rst          |  18 ++
 .../zh_CN/security/self-protection.rst        | 271 ++++++++++++++++++
 4 files changed, 314 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/self-protection.rst

-- 
2.47.1

