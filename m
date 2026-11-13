Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533390;
	b=hsD6wfLm7MBn59T0ZEtU/NLGm8kUyTvyNQ0dLEsww5dcPCTczmQglgwXBBGwFEF4+P4k
	 rvWA5WPO5Choj1CBkSwhAuz7g4Odz7yE9u7PKUsURdZB540KjcSUpZ2R2LFLq8lua/JLc
	 ox8xo5KcilkbnAVMFwK4h+wReNzIeU9uXbhMUX62lQmy8lri0xHMeXNT6B5A3DLI4moWm
	 Fw8XxRSuBjEIZYTCUCC0phroJTcW51VtmPDdZR1/5j1m3Ae89OGE5jvM9kcqMq9fDgfjw
	 Uuh5t/5DAajDWZtJGiUAVQRTXIz+TgI8bKsJsomn7oESMQiidUVlDPxE75gu97gq8fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533390;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oqyJWamYBJxq+jEb/AG04JWYCWpTDYqf7zDMnJ+2noc=;
	b=XI+lc8mgkFHs2v+YPkVWnwyHI02syc4Kvi68n2Xm5pGPMYK58CtySAKmgiWzlBL/pglB
	 GJxqG85RWoj+urkK9M5S3lY6Ybi+x/df7vqspGRozQGegIblmfFeAjAStXq2WOMTigSDV
	 5a/6YijyT+eisEMti2CgJ13rVROBZUNOrIugWmQwZGXdgnDyJS85wYsonPuBQxYuCn+ss
	 DHwhhrbx75rYYiT14Ks0d/gRcenVX8NCAPV6l/ICYaA8OwWnUgDFERyrP0pKK6umdta1L
	 QksckBiPNAf5h+yzQbSNpTY1pD3P6WaLctWp+CMLYluJ43DArsTMkY0/wufsLHQX3jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hZsC7XUV;
	arc=none smtp.remote-ip=91.218.175.222
Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09C4606A31C
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hZsC7XUV
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4mNA24lWFtHkqGkDQ70hiaByiqDolVJTxo+Az4AGD24=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794533386; v=1; x=1795138186;
 b=hZsC7XUVp8t5bMTEMaUwtWeQAeOkNxNPFvP7K13k5SCghCHWeYVynsMeSTMD5Shcqjlc4Ulf
 WDhVC9Z7iY0n6CGrK54D8xzFlepbra8aUl/ITL0jbBZwWn8bUo8NZUxxTojPISyfc4COEwRwRPB
 VppQ3iB2gBg8DjjvxwlFmo1k=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6f6a5250961c57b7;
	Fri, 13 Nov 2026 01:29:46 +0000
X-Mizu-Trace-ID: 6f6a5250961c57b7
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
Subject: [PATCH 0/2] Add RCU docs Chinese translation 
Date: Fri, 13 Nov 2026 09:29:16 +0800
Message-ID: <20261113012919.5631-1-xiongwei.song@linux.dev>
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

