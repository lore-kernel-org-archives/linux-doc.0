Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973534;
	b=i3hHVDDuYPcBVQq5nMeYbzeXgGJ15pFYkhRts37iELzK2MJ8KtjRbU8jBOe08fl43qQk
	 mXgkchvxl2fdKvySa0LlHp9dHCc/3euFl7ca01MZlTF3moxVUKbnpqhETSpE/9yzwczVX
	 MEyV3H3T3MGXKkzq3azZWGAiETpwKYfZOFp0xWDpIZusW8ib2R41hfNSohAP9WF5vhVCF
	 qTciSd39Me7hNk0+Yf7APA2jgLJjRkAz9O2asEevNiVRBMnbVwk1a8YCD3ag+cZzx/PgW
	 dptbSbpgJKkc5vnmbTPL8ablzzadm4Ya3VMaf3RO61FVNZqjetpLRbgOSzL23mSd6VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z2AkjhN0vu7z8IdZXbynrd0h3RzJFiI/Xv85qagqDOM=;
	b=vCzC2SyGYmBRa9jh6Nycbj23Kjbc01NYjzJxr8SBgFVxjVGS1kxWU1rNCLSqaq23lyIB
	 5AAHWOk027OUASw2YvF7AJYJlWbmgMMEAQgqx3qbjxIT3AEJEt1Etf0k9leWM+PjPMECI
	 AsxxGqbKnbnRicU4S+mUVQoQXXZVfLuKfTCyGrEbsbw3Z1+4IruXLGHsqrsLlWhLJTAJV
	 Xz67Tl23szZ+V4buECsWgKt2RRXDsX5rDbslXO5At9FNIybEIYoJuBn02nYhYbDK+JS7B
	 lWOTPWCt3ryKzQKGTWClcY1+dFJcy6NVHz5K/4LG8iengnDFl9yDiyN01Lanh2xMw1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPvN6mW9;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323FD606A331
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 13:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323FD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPvN6mW9
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so379234eec.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 05:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973533; x=1794578333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2AkjhN0vu7z8IdZXbynrd0h3RzJFiI/Xv85qagqDOM=;
        b=HPvN6mW928ycuDMcBjjVNvGKHBgJeGw79uKoH02bKVYjig+ECc1+S+QQYFIYm4RdBB
         mrPrF9jRDvlhrBvvIH5cxpITgkuwZQRvL+KW5HiPNX4vmyNmISvP38XkDIMpli2NrOnH
         Jj/akKklvfSDdQkBi2rLPzb44aJ1M+zytxOp2u+zp23fo/p2FpKVTtxT6OWPAZ3gvLG6
         oE6jqR5d3TdWzmTLYQKdP9uwSqXOkP6g4ALedlE3riXd1QoeyhgEIWZvXvL5k1BvoyHo
         mFnV5TLoXNFsFAPyjl5qhntChhk/4auHMqSiHurU6BtEZVERnImRI7Wqoj7buVg4DbfM
         kbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973533; x=1794578333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2AkjhN0vu7z8IdZXbynrd0h3RzJFiI/Xv85qagqDOM=;
        b=1e9lvQZMb4+sTUNC8LAmRMm99aaFvNlstCIV7ssCjO3WlJV28U71/ah877JP0jJdeh
         /ZvSkMmmg7lhCDJL+tr7Cfykd34H/sw7daxyHKW8e4k77/GsKPRSvIvvgG54Bi22pywE
         frRcPi9tkTvBJBtp+gDjwq9KzueySDyxIz6u5C0wIDkBxHrHgPol3gakKpHRSi5LB3pR
         HCypTgA275aPb4Vs2l+2YdHUOliLa8XI18ZRGpB67bADn2B+oeI4cKD3b1iRfK0LZ1hs
         +hH0UA9+LHQY5VndWkf7xWlxD4lJ7r1Q36Z7HnGpRF69snQr0eMOixMPQbdKnbUtaj9N
         QI0A==
X-Forwarded-Encrypted: i=1; AKwUvBxS76yQWKTiXi78nvhMqfiVqsHRD4HN+Y3dEJ6TvNsNWNUMrqfk39e0pIyOZHdZ5bCDwGYUIgqGi94=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hsT5DQAbSgTG+JBDWaoUixx7Jxee8cdABHZyQ6CSn8ZCVYCKY
	wxmEYnq95ZLrVwJhkVdUioDxlZyQNDex/OMdsk9PSVAsOAfpWxyDkXJH
X-Gm-Gg: AYBFou0HlimsKjN5QrOf36QeRu1MUPjvstG5tjS198/1xta5tb6ezH7f8+Hh1mfE0U9
	mEy8pFctjckE+Zoe1+tbakHz9RIl2SywKhWcCfE734HbNwS5FclEmOZMMWYj61UFPxChmv+f893
	EL5xkZXYZMzj8cDankwpKj8r6VAK7+uz/Trtj1oWcudQCBvPsFClnciuqh6YrKPFD1wALGFdbfG
	mxdBQtXO0hO7YFd4nC9m5WO04yZfEQtQc4x2opuFbS9Hqoaam6NRXdx0KEzUqy56G7xcsYkvmDO
	TzGpcRJgH1TAAMefgXSfF68zfq2T0Cz6CU/cQYH56m1tuXZUBBlYrhcC76vvAOiulWOP6YEa0k5
	NdLca4O2B+FDhvYqC9MjDX31VYaJMZB0n3kysCIX4DblvYxPFflp38f4gB3F/+VKjjrK2MzKILA
	ySYUsykGB8elkL6q1/KG+f1CcnnJbqJ1Ny871ccfYqy4eo0Wx5yzdIduQLQ3ZzV22euQpce+7Mk
	HBpZwF4AacCili4vbBLJlCGMhDwlGNy4uDsLdeQlEsBtn4VnucVOCQwSiQYsr+gUZ/LSa/7uB3H
	ifG2ak/2+GeNFrpWiGRvegYAl1nZBU5frKaeLy5PY7CtsYQLLMSvFJyJYuffzQ==
X-Received: by 2002:a05:701b:418d:20b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1b25d35531dmr3162580c88.28.1793973533048;
        Fri, 06 Nov 2026 05:58:53 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e056:a8e3:ff2b:1543:5b95:16e2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407cd1sm6754973c88.3.2026.11.06.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:58:52 -0800 (PST)
From: Vikash SS <thisisforspotifyvikash@gmail.com>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Vikash SS <thisisforspotifyvikash@gmail.com>
Subject: [PATCH] netfilter: conntrack: document sparse hash table eviction
Date: Fri,  6 Nov 2026 13:58:16 +0000
Message-Id: <20261106135816.391285-1-thisisforspotifyvikash@gmail.com>
X-Mailer: git-send-email 2.34.1
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

When nf_conntrack_max is significantly smaller than
nf_conntrack_buckets, the hash table can become sparsely populated.

The early_drop() path examines at most 8 consecutive hash buckets
when searching for eviction candidates. Under table exhaustion,
this bounded search may fail to find an eligible entry even when
evictable connections exist elsewhere in the table.

Document this limitation to clarify the implications of configuring
nf_conntrack_max significantly below nf_conntrack_buckets.

Signed-off-by: Vikash SS <thisisforspotifyvikash@gmail.com>
---
 Documentation/networking/nf_conntrack-sysctl.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/networking/nf_conntrack-sysctl.rst b/Documentation/networking/nf_conntrack-sysctl.rst
index 4426cce2a..fc07a950b 100644
--- a/Documentation/networking/nf_conntrack-sysctl.rst
+++ b/Documentation/networking/nf_conntrack-sysctl.rst
@@ -99,6 +99,10 @@ nf_conntrack_max - INTEGER
         the reversed address). This means that with default settings a maxed-out
         table will have a average hash chain length of 2, not 1.
 
+        Setting nf_conntrack_max much lower than nf_conntrack_buckets
+        may cause early eviction to fail under table exhaustion, as
+        the eviction search may not find entries in sparse hash tables.
+
 nf_conntrack_tcp_be_liberal - BOOLEAN
 	- 0 - disabled (default)
 	- not 0 - enabled
-- 
2.34.1

