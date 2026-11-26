Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699718;
	b=H4av0qFO8HzfA2AqGvmSyBvf2r0d1in1FuEmAOQl5sXlHOGYWSMw/XaNOxCVP3Eh8Rrr
	 yzZ8qYk/RlDEvO/jRR446Qgjq1UEbwh0F0uB67QoSJ12CG8n51FymQEsBBe3ufyT6E5Sd
	 E73kUH88Nje059D2nJVYHmH87MDqS7mxWcBwum661ACXpUIH7XKX2KaOn4lNd8hknuXsN
	 R2QGeNMqp5Rt90+tLEazEHYIfrysIaKauQBSk4olZ6hSSQyyLbAdLcyluHbDaPJ5wC2K8
	 lF6axGxAFVhKEzkrZ9RjcB6Q9IuYXS4ISlaabKFupcdHYRD6SCbXzXvsQtint7JmyCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699718;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VoBEgiO3LGgFu0I+CoPOV18doel8Lm5xFkwPKKF3UjA=;
	b=DICF32iMKeOIu0nZkRNBaRMGTL0Q2WhvLBRrJzoGoNpirtAjOgdKJgt5RHTeDu+meMVc
	 mcyPhU37LWi45acrRqkkAVHU31/9IeFtfDO/aHbgxwDjwAFrp2GscutRJnurInC2pmpd5
	 DiCtMQ6Q15LCip/0ohC3rhc969G1VSo7PKznbdIp/PaWu4zZB4FGnjcWry2HbYSGeNbTU
	 lu7prAWmmupA/RIKgLp5yLauVAzXnhgirLQYrizUcuAl5Rzh44qVRxgpDAhdYI14dsQtw
	 fy6Oo5O4VemTfJCd3QTK3UAo3PL1J9WuROgW4uKKwK/DabICK7KSXSvu/SkwvShTJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OFtnkHjf;
	arc=none smtp.remote-ip=95.215.58.248
Received: from mta1.migadu.com (out-248.mta1.migadu.com [95.215.58.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4020606A33C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4020606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OFtnkHjf
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mx9tj3Sgy8Z6jSByFbEw5wqlOsU+YsRRPEnrf0b0edI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795699715; v=1; x=1796304515;
 b=OFtnkHjfnwOSYdkdS6zezG7ItoYWbgP4Xc8DJCeZ3mZphCrZP/t3psPIe11pHu3rc+hFJNAe
 GMJ0j5mpqtwAucXO4vAfzW1BjSMlcwpV5gjRh6Q7llFpYV+T2hu93Pznf4lNohwGdVwU62wmNBx
 hxE8Uc1SEbji+ZOBe703VC6g=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 119e08eb7c1d02f1;
	Thu, 26 Nov 2026 13:28:35 +0000
X-Mizu-Trace-ID: 119e08eb7c1d02f1
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	wy@wyuan.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH v3 0/2] Add RCU docs Chinese translation 
Date: Thu, 26 Nov 2026 21:27:59 +0800
Message-ID: <20261126132802.6627-1-xiongwei.song@linux.dev>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiongwei Song <xiongwei.song@linux.dev>

Changes in v3:
	- Some translation improvements.
	- Deleted unused label.
	- Fixed indentation warnings.

Changes in v2:
	- Fixed build warnings and errors for both RCU/index.rst and RCU/whatisRCU.rst.
	https://lore.kernel.org/all/20261118131636.5131-1-xiongwei.song@linux.dev/

v1: 
	https://lore.kernel.org/linux-doc/20261113013054.5662-1-xiongwei.song@linux.dev/

The following 2 patches are adding RCU docs Chinese translation for the first
time. 

Currently, RCU is not listed in TODOList in subsystem-apis.rst. I propose
adding it.

Thank you

Xiongwei Song (2):
  docs/zh_CN: Add RCU/index.rst translation
  docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation

 .../translations/zh_CN/RCU/index.rst          |   50 +
 .../translations/zh_CN/RCU/whatisRCU.rst      | 1218 +++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |    1 +
 3 files changed, 1269 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
 create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst

-- 
2.52.0

