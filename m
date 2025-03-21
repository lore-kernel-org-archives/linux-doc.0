Received: from mail-m32112.qiye.163.com (mail-m32112.qiye.163.com [220.197.32.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADB826ACB
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 07:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742543391; cv=none; b=iJHmFNVqyPuo4y5IYeSY90FZcw6maBvHuJ0nAO6ztLEx6jqyunP6ImuqE2BpNewN1YVAr1Ywt+GsTCtTLLtZz7fS+YqxWdO93lJjXOy1myah4LomD3VV3nxDRWIqNIFJ39/CKamavW/8dgF/UE0IAV/oz9KDMbVCdakgoPLsmfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742543391; c=relaxed/simple;
	bh=KdIqM6ip4LtU13KaQm1OnttoLzFjSDd0xXgfodK68HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/0sTkHtw5c3v3+kqPEp6JCz+KFjkJ9jPuNAbRZrhfgpOIEUZGhgS8fMJujHkEQ4Keeji0tDYkmWYJA4yTz6VcJgqaeCRndqGEG4O2eRuSFsWD0KQC+56OeuQsAiYCIxthlsTP9SJyjdy7KWz5uWW7hh0N/xPZzVJMwIMOSl8j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=LffwP4VM; arc=none smtp.client-ip=220.197.32.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="LffwP4VM"
Received: from fedora.localdomain (unknown [123.149.251.253])
	by smtp.qiye.163.com (Hmail) with ESMTP id f1170619;
	Fri, 21 Mar 2025 15:49:36 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] Add security lsm-development and SCTP Chinese translation
Date: Fri, 21 Mar 2025 15:49:31 +0800
Message-ID: <cover.1742542887.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHxhCVktIGENJSh1DSU0YGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVSk9CVUlOSlVJTkhZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a95b7add1dd09d0kunmf1170619
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PUk6Aww5UTJNSD9KCC0RIQ5I
	HUwaCxFVSlVKTE9JTk9ISExDS0lOVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVUpPQlVJTkpVSU5IWVdZCAFZQUpKQkk3Bg++
DKIM-Signature:a=rsa-sha256;
	b=LffwP4VMLVZfFVvz+R0RKuGhNaFov34W1mzt4yTFeDbsnRFHPs916tPHXs/kMcDHif8KW6e+UevykGSlVvs+bsIkVR3KgqBs8eqxXh981eIQgcf3nBth3GldZHZbRVaJX+UzLkgTPm67cgTQaDFBzrpiBvtT7px+MRcV6g12TcY=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=+s/IWXYEkP8Y7FG3T1y1/QKdpANJNkox814nPDPg4XY=;
	h=date:mime-version:subject:message-id:from;

Add security lsm-development and SCTP Chinese translation.

Shuo Zhao (2):
  docs/zh_CN: Add security lsm-development Chinese translation
  docs/zh_CN: Add security SCTP Chinese translation

 .../translations/zh_CN/security/SCTP.rst      | 317 ++++++++++++++++++
 .../translations/zh_CN/security/index.rst     |   4 +-
 .../zh_CN/security/lsm-development.rst        |  19 ++
 3 files changed, 338 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/security/SCTP.rst
 create mode 100644 Documentation/translations/zh_CN/security/lsm-development.rst

-- 
2.47.1

