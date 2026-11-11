Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389832;
	b=fc9AM88WDwbwKzmzjZOOkTuX/lCr7EwzebP1XxVeQL1mK1oya4GJ3KlxiF+J0cQzz4xN
	 EgZz0kkAPqAZx9rrfS0WFmAiBORPyfhotDMbvNJ3RlPxuY4pVbOw53WLoTwI2KNuADFgB
	 o1p+6MLVZX5eWYh/4F+sH43IstvgmR/i5uy8Dzg7NL57dlE1v9uM82EJ61k1j6uQL6VvU
	 6vjbH+5A2623X9Ul3oSBWaYt6dpI+LhnJg8F1r5w9aD9aItgXELzCkeLbdRutGQXCT/yR
	 JPD0nIuqFPnkrVQD5KVqoTvweUSerbQVBcxpT6qCsxpHPBlPKEOMudWil/NX4h5WU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389832;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fU9XfcyXyDYY96b4oLkbxP2QCB6xnQM84ny0U+EIIak=;
	b=nmoc4FgiuAM7AODWtKEj/TwUUl+e2KICur+vbD4b8ym7vQN5Iqvm+vZe67ppygZNGoSl
	 rRq+EZQ0oeQp+XnI0icAuXR9vscC1JAiN94uYdYXn4i4VshCf6D0ExQTme8r/dncX7AIL
	 Bou3kYK4gOmojf+5ZF6PvqzpIHycgm4AdVKS+0mSIugnFDHmjz1hAq5DkaPfp/ai3ww2d
	 7WZhm6+wkSzGLWBMehSbno/4C9/RF9hQ4KNQC+adqsST9IvP3cnLkwnCDm6BNG0Za9yAj
	 aV8cyLoQ6Ik4yWvmiiSlElrubAD6elt3OWrp6k40+HRJ1uytll7Rk7tAyeFdSAuODxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="d9Av/BHV";
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D3606A32E
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 09:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536D3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d9Av/BHV
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6wp3khVZFr9nCgPoeJN5KkCAJtgzTDUmCQsA5IU4RCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794389828; v=1; x=1794994628;
 b=d9Av/BHVMSaBOhJ9tQ4D+vWpZKoty1v3C0dRUpHbHptA8MVuGOCheqnA74/ZXe9jFnZ38cIg
 A/EmWY7naiTBS9B3vdzrolqw5pIS3BBYlxKgp3eFFpQpjBHMGvn6lVZ0O3zmyPDI9LOHH3HQs1C
 jafFTp+ux8W7ZGoQ5nHPLHd4=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3265524654880463;
	Wed, 11 Nov 2026 09:37:07 +0000
X-Mizu-Trace-ID: 3265524654880463
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	link@vivo.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	tujinjiang@huawei.com,
	xiao.wang@vivo.com,
	xu.xin@linux.dev
Subject: Re: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages under only_merge_zero_pages
Date: Wed, 11 Nov 2026 17:36:57 +0800
Message-Id: <20261111093657.123292-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5445434f-078f-47d8-9851-dcc3712d18f1@kernel.org>
References: <5445434f-078f-47d8-9851-dcc3712d18f1@kernel.org>
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

> I think we should get rid of any rmap items when merging the shared zeropage
> only. That might require more changes to the ksm code, but it really doesn't
> make any sense to have rmap items.
> 
> Maybe we just want a separate KSM infrastrcture that only focuses on
> deduplciating shared zeropages in KSM: get a page, see if it is zero-filled. If
> so, try deduplciating with the shared zeropage. Done.
> 
> Mangling this into the existing infrastructure might look easier but it just
> adds things like additional zero-page comparisons and (as Lorenzo points out)
> makes the code harder to understand + maintain.

Makes sense, I agree.

I actually thought about doing it this way at first, but went with the
current approach since it looked simpler back then. Without needing any
rmap_item tracking for zero pages, we can avoid rewriting scan_get_next_rmap_item()
with more complexities.

Splitting them up has two obvious wins:

1. ksm_do_scan() becomes much easier to read:

   if (only_merge_zero_pages) {
           scan_get_empty_page();
           try_to_merge_with_zero_pages();
   } else {
           /* existing logic */
   }

2. We can even add better filtering in scan_get_empty_page() to speed up
   empty page scanning, without making scan_get_next_rmap_item() even messier.

That's a very constructive suggestion. I'll rework v3 this way.

Thanks,
Xu
