Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449184;
	b=xeaJKoXEaP/oraMh1Fy9XsMj/ZInydWcrU4DbzxL4SZW65OO1TvVEu01uHxM5aDp6YYn
	 WBSyhIuVlq1T9356qjeqtboQRk4Ljdnj/iR3eNQjUg5UkZFQgHVKJVnAwNcDjmvgzFMaj
	 tr1TjTmoCyvbdI+TVILH9yTfph/OpvrUPvD/0iSZLvr87VlhLypFISxUjP01sUiOpgTmk
	 8lwS0bx0xdFRguxKnooOT9W6WJPXxVBBj5KWXk0jxM/dAbV78s/X2qIG3ByinLUY4fAJn
	 s/EnSq63iZ3p8LUNwg3/EAR/rU29UDsjLweSPdfj2bhVdOYX0COQJ3DkSwH8N+hcu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PSpHWfHbUQIG3jx3ObKDcv5uRfpQODJi2pWjJnhhS0w=;
	b=Js5bprTUPpbsI2jQmtnr/+suLI2p7DlT/Up2QUNfy57VSrNi7FR9PT24eZ1+BFd1l98T
	 XxLHqDMsUuoFWXoRoGlwBpf25v0YFXGyXTD4PcFAYgo0nPRGaZEqDADnCLz2uA9GpyVYN
	 i/N72O+UFHpf2QrYOJF8i6SXO/7WaIugf0pORZnmdtOCWcHIRoSj4ZkVe4LSy2IMHnmcu
	 7+JKu3MUEsU5y9oNKLw7ty6g6S8IBrzlIK+NkAGICpO4JDJFeXm+X7xTIog8dKFt0N21q
	 SNWTwOkdq1RLy4zj1zLxeGZ04TpGIr2Uye40B8yk9tFhCAunzHb3Emv9T1yjl/oyhRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwRs8qNn;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3AF606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwRs8qNn
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso2473012a91.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449183; x=1796053983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSpHWfHbUQIG3jx3ObKDcv5uRfpQODJi2pWjJnhhS0w=;
        b=UwRs8qNnEt2Qjt77vZmeJR/wZ9osqFbOpX4n+bGrK97PAqtti65W73nc0kS16pVGr8
         9e5MOy8l+wGgfDsWzbTppU1CPJGe9EiHYczxZv6L4uNp3jd53zE/hcupmFL5T3qC1Wqd
         LNWpCSSLWrVgPKfI3ARkkwlGRQNeBhLePleT/5mKHt+wcRETDAZKWhuBJrfZzRq7PzVF
         DXEgUwVrFC6pszjoM3LjakxZhbou3pVlNqmLrHrz7eZRmcrjcegqWyQkvJ2q3NB7DhvV
         KLJkpnhp7zghipS0A92L+GKyndphofIZTQdYUeh4M+PlrVXLsShLKLlU4AKHfowkmasE
         BgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449183; x=1796053983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSpHWfHbUQIG3jx3ObKDcv5uRfpQODJi2pWjJnhhS0w=;
        b=WXenZC8EhJ/fWW5QHvZGBdD78M8UNwjMpI69NWmJNjtwoO+dDa8uC5+m2hFJ0NsrJK
         gC35gJZoRPuoS8O0JsKi/4Aiy3WAUcoYPzqlnczXCFTV9fplmgi6Dg21+dsOe/Ke91oR
         NNi9mGUo2l/ktXIYbZzVMwh2PhdWVDsHBcsN2gqCfICsZCqiabS2JFtxTEoRgftpjB/b
         pkjQ17K6RTRcFL5fK+0jOf91UcrYI2EqDZz94FD2q6HnY71D7crrrjPb16tdtYyvz4DT
         +Re3oZrbinEsdjxiotEpoQ+AFPXKQYJVkLB3FXlBegRRg4SON9QW3w2hrRRq92Z9WndJ
         OknA==
X-Forwarded-Encrypted: i=1; AL+hErGct6Y8Bw8vm1g8g1ie217areXJjx4dkvysVaIKOBDjNB8ETS/Loiwk5ZMrqZuX0ZzzVuTB7O5R8jc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mGAN6jQkikPTBTy/foa3YduGiftl/49cogZOi+2RsNOy5FNfz
	eWrbCIhf0fmt7fLmRgIQ8wXuSaYsqd4e79bw2d21mitheBGSVYicqKQ9
X-Gm-Gg: AZFdTZcmmAFUSYB+DSXDimAEcG1LM24v3F1ZJ8b5E+qfm9gh7KgUYiwwVf03xFA7knH
	zTAWjYEO3N2R63aoiADWc9EsLsDm4twGJqdjJ2DHXQ2VTLJiALCciwE6iF6aOeaab6wVGPZOWqo
	/FsIrVQVezUP8cXzChM25Hc3BbKpytZjrqaQjY+QvvgHWReLxH5/m3VyvOsby03mxhqb8byRGRv
	kJAvUdtLZOQdh65AgLqIySuyI2cdQa9rm1dh5Jr+d/GkKcMEGfa0e7LjNx80xf7G/WjcX4D4bmf
	alaSb3M72ka9RcJCY7AhYaUW9ubPlecCYBoiH/a+4sj9qSq/xNRZ9TpZT8wLY0i7B7RhivTLgL6
	H2JuetxoVnSUJdS0/9HsgJ0zLGmagH/5aSZnG5npf0k9G4kvylKQFHo4McLHXbJvAY74Vh1Sd27
	1kENYIHVp/TxQ2q+s4ptd4WwEhESul4+4BXCEEzry8FdUFwF+3S8XYiLnQMtOIxoQ6gGFVyCsvN
	0rqIdqBnQlkg4HbvUO9pTPRpcpjTirzNPh4if1jYp0ZRiHFTaxy9KCmbCAH188blyau7Gah0PJH
	wPje8qJZRPtB/IpyiJ0hUSZZ438FC7n/CzikHcIRI9c=
X-Received: by 2002:a17:90b:4483:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b41c92cbb8mr11195881a91.35.1795449183417;
        Mon, 23 Nov 2026 07:53:03 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([113.11.180.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm21596601a91.12.2026.11.23.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:53:03 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: jakub@cloudflare.com,
	mhal@rbox.co,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next v2 2/2] Documentation/bpf: Fix stale selftests file references
Date: Mon, 23 Nov 2026 22:52:00 +0700
Message-ID: <20261123155200.16676-3-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123155200.16676-1-supersonix03@gmail.com>
References: <20261123155200.16676-1-supersonix03@gmail.com>
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

Two selftests paths in the BPF docs no longer exist:

map_lpm_trie.rst points at tools/testing/selftests/bpf/test_lpm_map.c,
which was moved by commit 3e18f5f1e5a1 ("selftests/bpf: Move
test_lpm_map.c to map_tests") and now lives at
tools/testing/selftests/bpf/map_tests/lpm_trie_map_basic_ops.c.

btf.rst points at tools/testing/selftests/bpf/test_xdp_noinline.c, which
is now tools/testing/selftests/bpf/progs/test_xdp_noinline.c.

Update both so readers can find the code.

Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
---
v2: No change.

 Documentation/bpf/btf.rst          | 2 +-
 Documentation/bpf/map_lpm_trie.rst | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/bpf/btf.rst b/Documentation/bpf/btf.rst
index b61881239..94a81a9e9 100644
--- a/Documentation/bpf/btf.rst
+++ b/Documentation/bpf/btf.rst
@@ -1148,7 +1148,7 @@ information.::
 The following is an example of how line_info can help debugging verification
 failure.::
 
-       /* The code at tools/testing/selftests/bpf/test_xdp_noinline.c
+       /* The code at tools/testing/selftests/bpf/progs/test_xdp_noinline.c
         * is modified as below.
         */
        data = (void *)(long)xdp->data;
diff --git a/Documentation/bpf/map_lpm_trie.rst b/Documentation/bpf/map_lpm_trie.rst
index f9cd57949..37ef39d0b 100644
--- a/Documentation/bpf/map_lpm_trie.rst
+++ b/Documentation/bpf/map_lpm_trie.rst
@@ -108,9 +108,9 @@ specific keys before less specific ones.
 Examples
 ========
 
-Please see ``tools/testing/selftests/bpf/test_lpm_map.c`` for examples
-of LPM trie usage from userspace. The code snippets below demonstrate
-API usage.
+Please see ``tools/testing/selftests/bpf/map_tests/lpm_trie_map_basic_ops.c``
+for examples of LPM trie usage from userspace. The code snippets below
+demonstrate API usage.
 
 Kernel BPF
 ----------
-- 
2.43.0

