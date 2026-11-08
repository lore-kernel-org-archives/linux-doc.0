Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132561;
	b=G8lqlHUHXzo2Ndrl0uvNzp/BqIl+oc44gvOOIBe31KYcLYjgL9NxjYpUaRECJGJGu3Ub
	 ETYggIVMbXLFOa6+vCBUSNEmG0UH7h533EBURM/0lZj1t4QR4kbNDtyHy2GCX9FR8Ykp2
	 E3H2NgHBRWpYLDVUns1jFARfBny8P/stI0QVi/R9e1YMcp9iis8nOJHBfKBTlpnBL7IlG
	 qmh4iJEB3yohekqJide4jRHCpT1sn1yb6/DFJQqH/RmPVcuhPgxabKKdTwETL+msPWdlS
	 A6Q93ydl+eFT4ddOr1N56ffIJPHcoUhWFJr2GtY/bcBxPA52ckF5369FW6uEzeenHSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132561;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bMJlZTOTEJlmOuVWJz4GRAC6Q9ZXPrxhv+08R2sTA74=;
	b=I2sr4zRrf+0cy4FdvN5AYyUjJAx1IcUSLYbTnxXA/y+do/Y3cWZlhbSFAt5kWCphKXnT
	 zB6io9Z2wZLQg96Wv1N5GCHCFVmW7YVmt77OhtPIkwE8fLifYVq4VNiAZzcxZwY9Rnbss
	 BVe5R5m1W+btz9KMLZk+bDEUytb38QeYGXIfb9ZsoJqcI8mVm475ggGxWVK+WxoDKb41f
	 yhWa0fvcc6km/6FWAzqU2j8tvvwoQcLnDJXbwLbTs9y60XtJ8V+N/RG6z7LgDFcrNC1mM
	 ruvfLM+kVytzq2zyI/gcCvcYh4YiaWeyYawmhEkGVPNuCrYenJ5oEPxTP2O0QXH/EIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.149
Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64676606A321
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 10:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64676606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bMJlZTOTEJlmOuVWJz4GRAC6Q9ZXPrxhv+08R2sTA74=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794132547; v=1; x=1794737347;
 b=oJi7KdRqKwDGAFpr7Bmv9zJzxhR4ofd/6SKv8EmW8rADUsNX2np1y5SzvNmn5z4ppLwGdrb/
 KxVerOoFanoXU9/Vb9kHUjRBhpKKjfHm1sR0yFld2vc2O5vaimBScxbcCJH+/nS9tTBJnuoOJRb
 fiaWVOj6l7ZrFkwFxkVXDI68=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2d28383a0356ad5a;
	Sun, 08 Nov 2026 10:09:07 +0000
X-Mizu-Trace-ID: 2d28383a0356ad5a
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	david@readahead.eu,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stable@vger.kernel.org,
	mason@kernel.org
Subject: Re: [PATCH 1/2] mm/memfd: handle GUP pins more reliably when write-sealing
Date: Sun,  8 Nov 2026 18:08:57 +0800
Message-ID: <20261108100857.94336-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261103-fixes_core_2-v1-1-f332954f1df4@kernel.org>
References: <20261103-fixes_core_2-v1-1-f332954f1df4@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Nov 03, 2026 at 07:31:44PM +0100, David Hildenbrand (Arm) wrote:
>memfd_wait_for_pins() detects GUP references by comparing a folio's
>actual refcount with its expected refcount. As spelled out by
>folio_expected_ref_count(), obtaining the expected refcount when there
>can be concurrent folio (un)mapping is racy.
>
>So it is possible that a changing folio mapcount can race with our
>check for GUP references, and F_SEAL_WRITE might succeed even if there
>are some, allowing file contents to be modified after sealing.
>
>For folios with a reliable pincount, detect FOLL_PIN references using
>folio_maybe_dma_pinned() before falling back to the refcount comparison.
>For small folios without that, the 1024 pinning BIAS makes it very hard
>(although not impossible) to misguide the refcount comparison.
>
>This improves FOLL_PIN detection for folios with a pincount. Handling
>FOLL_GET and small folios requires a more fundamental change.
>
>Fortunately, most interfaces that allow for GUP'ing such pages use
>FOLL_PIN, in particular interfaces using FOLL_LONGTERM. However, we
>still have some FOLL_GET leftovers ...
>
>Fixes: 05f65b5c7090 ("shm: wait for pins to be released when sealing")
>Cc: stable@vger.kernel.org
>Cc: Chris Mason <mason@kernel.org>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
