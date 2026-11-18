Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007823;
	b=sBnw1cHEIQyKIrr3VT+C7Cto2qxojSMFwwbUkHFPnZlVi8NBGPysbNVzFp5VjFwlB7tl
	 cmnftXrK2MZvt/pDpEFYJMapnAlzqcv7GhlYIyoN68zAnyUoB78i80hEh2dRg3fixko7Y
	 j7rhGh140Sf4e9Whdo2yYAzr9G4ULr6AZmpmiyZET1wFHp3p8ma8Jisg2ACbYoQyC9HDD
	 CbPlGjVoNA+PsKJoSYqFKoaDrRc66wnA+T1u1eoG9kU43Op19GRQ/bUCD/d5Irg/UECWz
	 11UoI3LE9KYKjKqPL8gvB+fyqrQgJqpgGeVVP4HljHiCmnY2x7mgnLlfkuSr7esW9Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007823;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Zmfk0UiuIYcl8UbsrERw8AcNgTEWYppM5yTU6jwtjIk=;
	b=DOIyT6Mu6y9q43qPK3zwqFq4eIwolNruNQOI8W5XymQJPIq9ZXLDskbkFdS8SeLTiTLd
	 q5HFQ/VZgPhrQlcdGqrby6f7mxPVC4EWMNY/DuJUSghJEuy5bIQ+zShbXkqD3Hz6CQqBC
	 h/29GX4EkrwTORteM1fAECpJK7zmJ3qm0oz1w9bAv0TqJDibN3yo+2MVeODL0I4QcKzBW
	 AOB+87qVw1mAi67wUsIp5QKxWl5zs2QumHZH7dq1q5nRskJjsnfbFTlVe86EHtMgem859
	 RtGjxIsRtMoPSdHBWX+x+ET0WZP9X/s8DmRSrWC/ConNDp0HmbiAQ0H2el3kL4GRCPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MKArAhwW;
	arc=none smtp.remote-ip=91.218.175.202
Received: from mta0.migadu.com (out-202.mta0.migadu.com [91.218.175.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFAE606A31C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BFAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MKArAhwW
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AMzdrRLfDWMyU7UGPCZYwpksO2SRu8ahw0yiAFS/GEo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795007820; v=1; x=1795612620;
 b=MKArAhwWH781JhqEUl4kvHvV3QaFt8DM8XQ0fFz+W516O9rJzBvpronubTanVVVpTtG/OWVJ
 oYCcROeaP+kqfv8atHT9qCCcQVOMigJ8JNvsrYnW2klrdC7pBiUhJK68RgJ9j7/n8OkVybVofRo
 bvd7mFwl9tXf/9tTg57sVxXw=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 268c1a0a607b1246;
	Wed, 18 Nov 2026 13:17:00 +0000
X-Mizu-Trace-ID: 268c1a0a607b1246
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH v2 0/2] Add RCU docs Chinese translation 
Date: Wed, 18 Nov 2026 21:16:32 +0800
Message-ID: <20261118131636.5131-1-xiongwei.song@linux.dev>
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

Changes for v2:
	Fixed build warnings and errors for both RCU/index.rst and RCU/whatisRCU.rst.

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
 .../translations/zh_CN/RCU/whatisRCU.rst      | 1220 +++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |    1 +
 3 files changed, 1271 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
 create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst

-- 
2.52.0

