Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4151B4244
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156429; cv=none; b=QZ3H0RXqiwGXkx3wx2epmIL3J326OaLX+cW0ApdHGb60NrgUcdz2q6YNS9P27HtonbIX0im46NZ0bfs9xyCFgHIj7x8nUdjsHwcWFYY/N6isGC+2TckOxK58htlqNzkucavpqe2h6IHPnaoQyh+7FKMiOCpjuEdEGmZmQqsOzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156429; c=relaxed/simple;
	bh=BwdmtiiwCQZdCIYZ+Xa9EGPRaSo1H5OE8vTk3OuEV0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pb9ZiV8345JfGPi//QUoSmmZY1HWcMuJncqR0veKwGUAKk2jVGpC+FG/zTUp1YOaOKbXyX2dqq+3JERshL9pDz0nLzN1j/VP9uNnDdUawF0Xhb9S+sNAcMkLU9oCwYKJbeEf1RfV83K8B/27Mk/q7zJw3uzLnWPfezLA9WLOniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J7PhFZR+; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J7PhFZR+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743156425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+DgigYgkageH1pes4Xqaz0l7TuzYUSReul3y8RgcKgE=;
	b=J7PhFZR+qBWmClqDMahFdRqB4KlZAGmTUULW6/HNSMHJRd5MHNvXufS7kJNwXra2VsWMWG
	vgpTdXdQPDDB0vEhrEHzwLJQaoIjfFXzcO9D6zxHoA6efmlQyvzMbSbThwJarXUtsPLSqu
	ISzRHYvAruMR5VH8nx1rd87zKYlzZ24=
From: Yanteng Si <si.yanteng@linux.dev>
To: alexs@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>,
	corbet@lwn.net,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2] docs/zh_CN: add Chinese trans guide and change Yanteng's email
Date: Fri, 28 Mar 2025 18:06:42 +0800
Message-ID: <cover.1743156287.git.si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

v3:

Since Dongliang and Alex have put forward a lot of constructive
comments and added some content to the chapters, they should be
become Co-developers.

diff:

---
- - v1.0 2025年3月14日，司延腾参考社区的指导意见修订了部分内容。
+ - v1.0 2025年3月28日，司延腾、时奎亮、慕冬亮共同编写了该规范。

+您可以先发送给自己，尝试发出的 patch 是否可以用 'git am' 工具正常打上。
+如果检查正常， 您就可以放心的发送到社区评审了。
+

 
+新手任务
+--------
+对于首次参与 Linux 内核中文文档翻译的新手，建议您在 linux 目录中运行以下命令：
+::
+
+        ./script/checktransupdate.py -l zh_CN``
+
+该命令会列出需要翻译或更新的英文文档。
+
+关于详细操作说明，请参考： Documentation/translations/zh_CN/doc-guide/checktransupdate.rst\
+
---

v2:

* I adopted Dongliang's comment and revised the repo address.
* Change my email. I'm really sorry for the long delay.

Yanteng Si (2):
  docs/zh_CN: Add how-to of Chinese translation
  MAINTAINERS: Change Yanteng's email address

 Documentation/translations/zh_CN/how-to.rst | 459 ++++++++++++++++++++
 Documentation/translations/zh_CN/index.rst  |  24 +-
 MAINTAINERS                                 |   2 +-
 3 files changed, 472 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/how-to.rst

-- 
2.48.1

