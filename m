Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449173;
	b=xBncVUGKuzxvVwXIIdyn8JaXRk9jZYIUML3ci4c9KMCunzET4bn2R80d+n9keNvqSsjM
	 V2sYyA4OEmmd9rDVnXCi/VaXMv/zwPMcNHRcNBxoKxGcbHaMtFG1uXVQQEEaP6TLga/2r
	 D/6iLTaPiyuOBSKCm6qyhZ6ECEp/PtXvLNcVHyG+7s+Pt44Dk3uyD1+A7mh58YM4rVXAF
	 Or6FmI0igQSXnvEsNGqVcwR0PTTqeGyAi2/nQJ1GTB5klYHPZxjf/AaR1wFZRwW2Weuky
	 oGZVLoIj4KXzDndYS5NmIzNjo1Q6H/UD/bXRBPsQefesW4wn1/RIcuEhftQaoc0mtug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=guIdQE/iqDvGoyLfjM4Tr3vD0fnxKmiMHHuG0kl8J/c=;
	b=BufmL4LFbV6lYHRGtudHS4tJcr5dF5tNZt2p7DVs7ItSFej9Uu//Zxhb/z4hRwVz9GqK
	 IT+HrFflLGI9CZdJTFCEDripGHNmgtFdbIzm/kJHg8/FwDkrGbO1w3QJNakWcvQaM67dz
	 CjIFUuPdicP2GrjyI2u1SWaW8ki1qa7ST2WpSFEtL2ufz07bpz8OAAhV1CXjG4O7yQ4Sv
	 Mi/c0ai4hp75Qv2RbmLvU0iZuJhTYf5OlrmqCdTv+XtuNXEl0dYpse8OsMALWTAfNz3D7
	 4+QYKz9oZjxp5Zu4ig6MBMrPRkTQ3fWW90HfqC1Phbl8fhCm0JW3o0eyI5xQF7enhOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOP7+Gnq;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E2606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F7E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOP7+Gnq
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso2191648a91.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449172; x=1796053972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guIdQE/iqDvGoyLfjM4Tr3vD0fnxKmiMHHuG0kl8J/c=;
        b=LOP7+Gnqt6kSwTzsIN005aK/objY89TCZs/rRJHOb26cCZXu6c4Li0tMy/tbzdnF2R
         NnYX9jVQcVPf9FgzEL6Q7yIFoFnum741vL9tAcAVsrEsTiom0OHiuAH5BVtynIeKTLg7
         vSBqKgbqTBENtUXGZZ5NXAjkqXq7QqM8ZMBqyT1Zjf9PGgkFj/42ewbfpQa56kNDBAls
         4DKEecZVq55oIEOUO9/pb9nJjZ1xmOzU4xwU61itjJOuQK3jkGsgEX2ABFeOp4oFXK2Z
         CFagj0MXbRjLBG4NmdbyU6zvJCL5MP49BKIQJLu3lHCb6Box0iEYTcSJG0rA2yp0j3Hj
         N6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449172; x=1796053972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guIdQE/iqDvGoyLfjM4Tr3vD0fnxKmiMHHuG0kl8J/c=;
        b=FVMZQGYGIOdzHozoNj447U/5TA+a2iDov2eGUdIdGaIkrSb+Y+mGOFKwHqUPcksGOX
         J9749FVJdZj/GBVzpzv94pKEHFPZUDFQCOiPxNEZ0OAaKggrQIIsqFNVFJWgskbWrnjM
         c7BH8ysZiISkjC7MF8IK80KsIj3ByfIQ0RV9gUv2ByqUwLPDpOkYQeRrzC/EC9nMh5Wk
         WuF4KfLrhtVKRDjumbjJsQADaE7Nzpf8aMD421nuS8swjFcEYImbxNaEdRCPqZm+7kGH
         eZYAEdOgiU6c6e5Vh8LyCVJG2Q7mui1R5PiQi5eWqg0vOyZ1TG0f67bNqSMYfRx6boc1
         9Idw==
X-Forwarded-Encrypted: i=1; AL+hErErq696KIU96dxbMoOWhyBm9qrAdVRsEvHzXfZzzWbMSped96zpbAzEqih1reBgKg66RANp8SUqkkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PtPA/w2+AGIBgsffC2ORPdBJPZLennCdRM6lrl/Km77K6ZLA3
	yyXxbQTCsdAlbQd+cjnZJqaXChS8cBXN9ontyN1XhI542ulUOFLHCPzW
X-Gm-Gg: AZFdTZcf5IOwcVxhlZLLsv089fUUMzQ+ndjRx8pmmcXjPXpOXGR1/JjTxFTrAmf76Bd
	Okmjt/RS7jRb+aLQPjC6JNREqVo8em8+08iS02zfK7v/gYTpAurOObkLZefs+ly/8ofbt5BYUSm
	BD1nSovzYBbzf9GSl7OEyAHNqqq7lEVuZhT48Gv4w7/p3rCZ8GgYdWaMOh62De9fkFx8RmMXcjr
	ybbWtHe3q2ZN9kY4CBMR69bncdmVkookQvO5PxQAri94wSixXAztDt0zolYzB4iRDAfd0Ra4m7+
	E3Tinjt2pa27btEKrQ0rYwk6Tcc8+iPcCBItOopSYfnNSsybXJ8P23kedf6U5kdkBlMNYG3W52r
	luaO7X1owEeFM2jT9TvWRFBTi5pe3PkrsynRGaFGs6l7tOJxLPow39osi3leVFdILeutMaHx+2o
	O4FIv3B1Ws5BhbldrYRa20NManpbEE0t2AU9GUtVwP7TQEx4mC/9ApvVYajNmcXG7noucxaHMQY
	hFvvJbTSZlsriWOqT9D46kqaBycPYGu26qCGjSlEj4CoVDgMCzsCakNdC2skV/Vi0sh3kqE9jCx
	oNo3xUrDFj5M5xl1N+Y22ZJUdMPHFes1kDyfNY4lC3g=
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr10884695a91.23.1795449171734;
        Mon, 23 Nov 2026 07:52:51 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([113.11.180.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm21596601a91.12.2026.11.23.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:52:51 -0800 (PST)
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
Subject: [PATCH bpf-next v2 0/2] Documentation/bpf: Fix stale references in map docs
Date: Mon, 23 Nov 2026 22:51:58 +0700
Message-ID: <20261123155200.16676-1-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two documentation fixes for the BPF map pages.

Patch 1 records which program types may still mutate a sockmap or
sockhash: tracing programs attached to the sockmap iterator, sock_ops
(delete only), sk_reuseport and sk_lookup. Anything else is rejected
with "cannot update sockmap in this context". The kernel-side sections
of map_sockmap.rst did not mention this. It also drops the reference to
progs/test_sockmap_update.c, removed by
commit 5de7a6eaed89 ("selftests/bpf: Drop
tc/xdp/flow_dissector/socket_filter sockmap mutation tests").

Patch 2 fixes two moved selftests paths: test_lpm_map.c, now
map_tests/lpm_trie_map_basic_ops.c, and test_xdp_noinline.c, now under
progs/.

Documentation only; no functional change.

Changes in v2:
- Patch 1: narrow the note to the sockmap iterator, after
  commit 18f6c47d1097 ("bpf, sockmap: Restrict iter-context sockmap
  updates to iter/sockmap") (Alexei)
- Rebased onto bpf-next, which now has the bpf tree merged in
- Kept Jakub's Reviewed-by tags, as Alexei asked
- Link to v1: https://lore.kernel.org/bpf/20261114170117.196552-1-supersonix03@gmail.com/

Ahmad Wicaksono (2):
  Documentation/bpf: Update sockmap docs for mutation restrictions
  Documentation/bpf: Fix stale selftests file references

 Documentation/bpf/btf.rst          |  2 +-
 Documentation/bpf/map_lpm_trie.rst |  6 +++---
 Documentation/bpf/map_sockmap.rst  | 18 ++++++++++++++++--
 3 files changed, 20 insertions(+), 6 deletions(-)

checkpatch.pl --strict is clean. make SPHINXDIRS=bpf htmldocs gives
identical warnings before and after. Documentation only, so nothing to
run-test.

base-commit: 2bf3351c5f894697e8443eeef5333d4c4ce90cab
-- 
2.43.0

