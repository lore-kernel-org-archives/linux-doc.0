Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403640DB37
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832144; cv=none; b=LGXUYeKbky1/+QAQYY9m9i2smaro1BsQQB1rA1SSROdaxEm2jvO3JlpL8Krxm38SshyXC8HDYI/uX19VxiMKVDJlORGJ77ZZOtRIRl0heVUTod/6kzEzFejpNqdxBdI10gMXRyT/i3Xnynl65BvVZAYlYnejHiK0gVqprEgMx4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832144; c=relaxed/simple;
	bh=QaGsg8YHe+4kQJxQkKk1XH9DeZBJmhX14Rv5dC+iT5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjnI3ch2msiuSnAuYmY5ccwZm0yQgN7aQfwl6lMbYNXMo4oGTgdh0egJAtwHXKo0kT+yp4X3G1ZOaHrUNq3Ltb4TwulT7jHnnNiXG0gxyKlXm3lMkRwOimBPoUmfF+Gda4M4pwsyHyI0NQNZWQ+U0fakE38IqykoAXr5LEXd19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4M3q6Ji; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4M3q6Ji"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so15350155e9.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832142; x=1792436942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYwwSnERvRQ2SylVNRBxQCfE31X9AnGYXZyWqtwRxqU=;
        b=h4M3q6JiO4JtuKFmCiTTjMvtqNp3GSDNyg7Up35emfeW9vJ8yg1Wgha7qHUXNAmWbs
         Hy/2sqd/IK1dnC/gRaou8rNRIYbmM1lmrRZKFkZDsA3rAy8psVgOaZpolwHTq/0BpqsD
         OqBFB/P3ccJ4pUNmEXKgHHD4xgNVynZA+acJM91cklVvxBlvJ2v6T+A7Sa+jUnI7vk1m
         +W4rmbrBb1zH1wS5/owhUYyMyQPM8wjoRFkmBjTl86Ue6QfpYHG21wNfehLckwY/I0+s
         6tsw42eTuMHj3tXK7a1umozE/kr1h3GtLD/kMbOW6d9WZS4NgzAXi8u11xHqkMGAgHEN
         EhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832142; x=1792436942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYwwSnERvRQ2SylVNRBxQCfE31X9AnGYXZyWqtwRxqU=;
        b=1UEeb4xImZRU4WrBgn/VsvmELuHN4fieZgdTjsfuIV/xVLcPuOoP31AZART6Wjbd5Q
         YOaY+hICejEX0RenNpe0FoD83pxkWJI28FzlHrg8wNgcfzjnvibvSFtwytOw2APkz5Bo
         zqmku3S6+rI1VvAMUEbJLUNcdcfy697bXYdjHK1GALMqbUlDMXe8u/6uKOPEN6sP/F9a
         l4R4uFDpwMyLY5HgPMw5BcCm62P1LRca9QoELkHlt7bThNulQhSKRbvzCtvmR8sUylFw
         ZWVXjVaJlVc/DvV4hiBUXJcMtWsLP4v9rcyvItvy9HDcQdHWOCOOWMF9JMQld2pMPRRa
         Utqg==
X-Forwarded-Encrypted: i=1; AKwUvBwjDp81ErsXn20c+og8e4EFxOAoVY3Zxx4uCJsPIimemjjK6f4m+PzAUGKGrhAXesaRDgRNDY2Gn2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIKOAaX2k28h2BxSXuTCxHjeQ2KdVzL8SSIcom6OJ/BmBbfrmD
	gluqokxLjk0T9wn9ETJjmb+xkknq0ebQ8gN3ogMirhjwQa52xofYQ0Tf
X-Gm-Gg: AYBFou3m/mGDgeClvBVpPVe0ZzkVybgDRupaHICimMGxMa8UQnROZnIORy2sLUw8u1e
	4hTZ7Uo8fXA8wKG8QCrugqq3zV0jnXYezaQtz6gHrYqHZhZBfbpXcPp2K1+oGA6XX2KNGZ/l1gf
	MWmrwQJqBrBdIoWOEz4gjs1SyeoVp5RsXV+WPN/WQzM0ZGTvpmTflQf2n3trcQjzXbuEJdaz8Sn
	3lPU2RrIHLP/QQKVQ5Ni/rRiv16te9zuhfrffznypfWMt0r5qjJzz81ncN9qNH33MENKWT/NZUS
	dIdzThHsbHneNjXwGXdFp5l+IIqu0IWbqQ8y0/g2Ghd1AvpoPbZoq1YIVrGC7Ysk2CQtcMhw71w
	X4WH0/zbEW9XswlDVMd37enWB7NlaDmNbvtzMdWQgtfZw5cWwXW8VO+KxyJzFfIEKDy4Iw9Xd6g
	tTQXZdas7fgsw0Pak5efIq2hwU8VtHy9CV5496WMlEClSAW3FDYVMNNnwTXZnh/5TKlFX5G1u43
	jBA2XmWt3bsjipn7+sxfOwXg6H58oSLLsoENhjtri7dZwyHmg0VbUajq3ALZ6++FyGbGZRFoSRL
	rAdSNV3T4UCY+kG4BjtL0CYWseqY8DFBie8q+hfKUoqj/yfJIj25Gm4KmzVfd5YcEjw7c6ng
X-Received: by 2002:a05:600c:8519:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a18e4a16femr188375425e9.10.1791832141574;
        Mon, 12 Oct 2026 12:09:01 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm200105015e9.3.2026.10.12.12.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:09:00 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:08:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH v6] softirq: Preserve interrupt context during IRQ exit
Message-ID: <as0wCemtoR7p4S7-@gmail.com>
References: <20261011060742.30584-1-kmehltretter@gmail.com>
 <17377421-38AC-4453-B6CE-A4854ED597E6@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17377421-38AC-4453-B6CE-A4854ED597E6@mainlining.org>

Hi Bradley,

On Sun, Oct 11, 2026 at 10:31:04AM +0100, Bradley Morgan wrote:
> >Suggested-by: Peter Zijlstra <peterz@infradead.org>
> >Link: https://lore.kernel.org/r/20260813130826.GW687043@noisy.programming.kicks-ass.net
> >Assisted-by: LLM
> 
> Very beneficial change in my opinion, well, nothing looks inherently broken
> 
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> 

Thanks for reviewing this again.

I think the patch is in good shape now, and I've also done a lot of
testing.

Thanks,
Karl
