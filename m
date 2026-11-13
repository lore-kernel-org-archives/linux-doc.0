Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533489;
	b=ses1dF0mTo3etGGmJZE0hCyvlQNOS/9FnOZZv9kDdN3RfmuPNfmC0IGayAlkjz3ad/fe
	 9KpgBprfD1wvkWKYCWEntq6goLv9hQC2YI3oK4EbdYnd/FOd+1BrcWdEYvtl9jNM2fjiQ
	 /0HjHJ8JBce+6yMO+mwngV1sV4ri7giG9UiuHuIolFPFeSWRGo0CZYP2Pz9BCg0vCFApj
	 Rs6tmqYwS1//9IOLaxDSEWfCW/hM6b7ddE+wjOJgpOXSFI7AA8Vw3JQst7f0UmK6FxcgW
	 kmrHuvMycWTMeb1+ExoxYFzA8m+IvIfVI6vabU866k0gZQ90OQvokmFYxBGmr15hhXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533489;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oqyJWamYBJxq+jEb/AG04JWYCWpTDYqf7zDMnJ+2noc=;
	b=RpODwzdhZFmgQrzPC1BBf3AqeKHEPmZX8e+dSpZg1t4ineUeTo9ujyq5cTVHYXUpLyka
	 w/pfdZ61lx5omHT2cAJd+a1aor1w1qoCzkCOKwkfJ7Nx0RbdwYBWevHq8k2pGPW7XBWH0
	 QVi/b0fx7pFZiQ6UuSVvLskUJz7jqyeX9gCGCR+/tXT+NGFRD+a6u+9YWFSSQM1EBmjfc
	 ojzCcDtWsVRU+vvZBPCSqHgSEelEm1V/u3ANUYv9uS7LQI36DjnlzPyPHRr1/qw7R4jsT
	 d6sn0SVfTl+2H3eIc9G10V7n1HVJXQruP1XkSYwmPWXUFq+NANmN7LS3pH2HZuBlCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gyKQmLKu;
	arc=none smtp.remote-ip=95.215.58.48
Received: from mta1.migadu.com (out-48.mta1.migadu.com [95.215.58.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5D606A31C
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 01:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gyKQmLKu
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4mNA24lWFtHkqGkDQ70hiaByiqDolVJTxo+Az4AGD24=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794533486; v=1; x=1795138286;
 b=gyKQmLKu+ZboIgLBayNC9N0yjRXSsJoszFhKDbpjPeo1aUdrgiGho7y+1DX9hkPnVX0T2GHp
 zcpEJkT5Bheih/iNppTNKKwbJJC+ik80xd5M/r96vyu6jaRcpNoXasGzptNSwf0k6yXOyoeZ/5w
 MbkVS/m+GfVLgLOXi3UOZsSY=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 0c591094c78f7cf0;
	Fri, 13 Nov 2026 01:31:26 +0000
X-Mizu-Trace-ID: 0c591094c78f7cf0
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
Date: Fri, 13 Nov 2026 09:30:21 +0800
Message-ID: <20261113013054.5662-1-xiongwei.song@linux.dev>
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

