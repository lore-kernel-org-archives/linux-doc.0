Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950026;
	b=MDMYyV4JG7bKcAaukx5FELY/ziUSWDJXV6XAeb3oAUs61lLkrFjETYwP71pqeujfmMNj
	 C2SPU+r+nmFVs/3pCzNxGUuCDwQ58ByZa3+tuJPHCiZxM2++KKSKvw+TAbpfIZ0gW0Aut
	 y7ntWmcuC7YrS+a921DWsEOc5G4Bt81J72GWE1RzyFTpGwbnY4nCVNep7uzZGqX+QwxFt
	 +qU/HE9zbVKXF2G0hnxPv6qtwdUpIFLrpl9KcNFO5XwPBtTguUgRST9E3nNkKW5jJmmHD
	 uDhMJDl7vObCCgTUzmDsc0wNLREMY0VykgSrbgJEvLiePcbFfbFOnBpYcRsH8A1s0Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
	b=tjNyaiFi2hadEo07TwFcxfyOWGs61qxKbS7jg176HWTDu+U65/0dj3voAyKZ7jVn0O6r
	 eDBNeda4CcNPk3QZ1aomYfCHFiQ+Aq/ox4OLR37qcOIdD9+Xh/y9S5mPhtYn3O5tYQY50
	 XIm677dpagbrM3k71SNUTWkElwm3na2cjDVIbaUQDbuPKaRsZYVUr5L0pMsFn5YRP9Eme
	 0uOquhqczo864H4ZhTbwbrb5MZFJwTvfLnek+Zqs6c3PxQ3/AN/e6VwSTUpYYz0h/l5bm
	 6hE5CFRlEmnBZPrNX40TUtNBOzcsWl5Wp7tcECmc/7g9oxvmIceXizJE7pwGgpW40jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DctjwVz+;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C56606A324
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C56606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DctjwVz+
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso770705e0c.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950025; x=1793554825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
        b=DctjwVz+9328llN8524p+Cmds/Q+140TdZ6g7BvRcUzBT+WE6FsC0MGdxSUJJONf3L
         JzYBygsyhxXZIUqBri5ZQbsJn1fxnKYmhZr9R6WDH0QceOPsk5VnfbFCG+jZpal6U7L4
         njmvCvamubQ0hOIMW24r7QhKqNBczi6DAV27yhHPnArpdhRPlUkeSV9UCJlDrNYp8pc8
         Ywd93CR+ptwXQY7Ck2Xca5L3oD2bXvekKoIaz09/rFTR/yoI7n1VXvVRDfKN+f/Nzonf
         9WpyxKr/YRx/PtrWLwG8+q5AmVbj1tuX9xcFnPxOwALjB8mSjVLBsSMsCnrEeUw82W1P
         M/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950025; x=1793554825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
        b=yKefkYU+6vQDR2PrMFs0YI0DRVmCZUTZcmR6Rk/CeSbrc3VLToeBIleF+PyYC8jzCP
         Yi8z0NPFcuBk4mdXtzDmGbij7Nd83x6rIltjRAzesgE0YtyEkwLZK+SDQpfRpgt2k/kW
         B7NjB7uMk9XKuJX32YWFdKqQQ2YHpIBF43Oq6e31hkJz4h6XxcNZ4w+fZ1Y1cDjMcyWO
         2rGAj1y2J2//BCpYprX1fM4ttc9UWHAn9MUaUDOGK11B3XE0A/DA9y3YXWeCdsjw6wTV
         U9INoku6ngSWwz4PrLJsq0GNyrv4sxeRHshrnIK7wcLmHpXhI+48ojC3riFLOgKZkpwj
         vXcw==
X-Forwarded-Encrypted: i=1; AKwUvBwUv5SMuO7NcI7ichcIn4fcvJXuHqjP4IRCVcgkxQO5e/O/n9KAv25rfkUm0T26Nn0MZD2JIo+6pr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwMNs2iQ+y835m8hO45Rl9QsEfEbJnFpaLtukeeC0fWK/1nnXo
	Jdhw7C5raoNWv3bpcmXnCMFuRhXsBy42ybqL+lYDSseHFAT89wtlUBiJ6k7ihZ8RLi0=
X-Gm-Gg: AYBFou0GOMRXR2YroA324NHxoRY0a6bdQOA/bfbsWj+bALHi8unCN4ixLGcJbJRo870
	qh1PIOTrZqoSOoBB0MY6TKeTEBNGZSy+drCIpsVyaUOgRQz9i3MJPoCRWQhYuYiP9qji1Ckj8OY
	tI+WwFZy2MxTDsypR/gPNC8FJbR7Yp8ffyHQSPzBrCsseoVE90BuYff5fWeg1KZLuIEOxDqvQ45
	/ZSQvrz0ng/oJfyo856Eu3bsMm7U25zuUR9ZNl/4juv89yD2bVUAsF7vkH+qBqv6xDxXtSyS8oK
	dmE350exJ1BtGszaNquMd9S5vckd/HBBDxmv1RIhHbW+I1PfWus9JeF5olMMcjoMTaNRhShTkM5
	eh2084qnbHWETfd/vptKndocHfZvW4hBo+mXYgeje76Ktyr8ZuU/FPCI/5kA04VdNMi/z47HqVz
	QZJz21uGKEli2bs0XuhcmtwzgxQYX/iRojPRQQR97onh1ik5w10dCuno/DiWi7ZDlIfCsGFPo8x
	PXztMxYQ7p3TjHvQTDMXdMdjlFL3vmT5V5XQaE7e18FHNz0gpzR5VVHx3lARcxAl0VQHYmdsNM2
	qvXtGs1yAoOgTx25VxAAwghgg3oXeNMqiZ13jhkK4DO9GOXz7lrDqgZmBt6owqMisSwA4x1fY8g
	k
X-Received: by 2002:a05:6122:83c3:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ec2332c72bmr1427722e0c.23.1792950025414;
        Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 4/9] kho: do not modify incoming serialized blocks
Date: Sun, 25 Oct 2026 13:40:11 -0400
Message-ID: <20261025174017.3870481-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

When restoring an incoming block set via kho_block_set_restore(), the
physical chain of blocks is already linked and bs->head_pa is already
set. However, kho_block_add() unconditionally rewrites last->ser->next
and bs->head_pa, and kho_block_set_shrink_one() clears
new_last->ser->next even when operating on an incoming block set.

In the upcoming KHO read-only mode, incoming serialized blocks are
mapped read-only and must not be modified. Guard the ser->next and
bs->head_pa updates in kho_block_add() and kho_block_set_shrink_one()
with !bs->incoming.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kho_block.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..a4e945f28fad 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -93,10 +93,12 @@ static int kho_block_add(struct kho_block_set *bs,
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
-		bs->head_pa = virt_to_phys(ser);
+	if (!bs->incoming) {
+		if (last)
+			last->ser->next = virt_to_phys(ser);
+		else
+			bs->head_pa = virt_to_phys(ser);
+	}
 
 	return 0;
 }
@@ -133,10 +135,10 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
 	kfree(last);
 
 	new_last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
-	if (new_last)
-		new_last->ser->next = 0;
-	else
+	if (!new_last)
 		bs->head_pa = 0;
+	else if (!bs->incoming)
+		new_last->ser->next = 0;
 }
 
 /**
-- 
2.56.0.307.g5fe7bd680c-goog

