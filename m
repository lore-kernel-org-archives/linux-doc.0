Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AF36A358
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918246; cv=pass; b=QNrqIsQHi+f5u0y2DE0+UE/UT6Dp6SGqQMSKQG2mtV9MA7joUEacJemQ6X4kc6Fisc5xibiV7rlNukaV/GEYzUrOp8x9TcaAK+zmGlkWwFaeK92H9KYZqjPc6lResKSbIB+3jRA4FoON3M0YGjg/5MxLQjHESwFWB+NI3otAJII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918246; c=relaxed/simple;
	bh=Xedh6KNk2EDOFluQ+qo8w16I8eWpP1wETZBFHf4d8jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbH5tpTLiWVk5U+tetTsFBNVZwiWi8tinp5l35mbU2KGr8yRYJu5X/JuvZR2XY13sqP6UxkezUHkYg8pWaJWrz1tCNQnMemYQhz88SW9kKfOeilTsYEalMYKWQgxeFz/FrGr7JahnwwnmiuIprVxNeklNNm5kertLFo63MOXpCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaLCHZXK; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaLCHZXK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47640541585so504026f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 11:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784918241; cv=none;
        d=google.com; s=arc-20260327;
        b=QzanjFUq7fsgHkzmG4Pv782FFyAS98mE71iirynb9rtAHb8zoByOrp27SNirrA3Naw
         q8lW2GrtRV7RN3sDWHGNqxohbZ7ZFeQ/QBPveAMHSI/V/L5gXnBpnrzTA/QW0FMXcYEs
         CbUwLp8sJUZ9iZDxO4i8aExrIUOKFFdwUTRCk3FaqcD2FNk+SAvvEkvp/WOIW4aGTz5s
         1piZlwOPh354jeSJ5Y1UbgVinO6t/LOU1e60a83t77cp2i4HTKgps5TQHcK9j/m6DNgR
         K/jHk5Mn0ODhJ/ax7fts7VuOxcaensoQA0MgXB2VeUu/FYeIi4NQ/phWQdvztnFcfW7t
         3oYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xedh6KNk2EDOFluQ+qo8w16I8eWpP1wETZBFHf4d8jo=;
        fh=HfkB/YMF3VYfIAcPYP0HXr/aDLMHuL9fxUUzvqlgNsc=;
        b=eJiMuMS9NgXbjqXHZnteFaI09ApfrVbIPJ6IG7iQA96Y4ENe/Z/cvQseq69+JNORqv
         Fn9L3Z7E9vxlqqS3JY4AJdsfRaaCxYUn8qdVkaSWAjcfeE5vBemvqPtRe0igaAa/SMaj
         /YnvigQJmsanOZZ//XO1ubeV0raiX4piPQhaitkyQLUJopaN20xliSr2Iv7EH8gbSGJs
         IVJ94R89v97oM640qq5NP3vNtAGmcolebfO4fkWw0e4XISGLjkKvCE8byvPus/9JB//D
         B3cjjjRSolK9DNy2MWwmz4rrL4IcniSHgQPVmHtIZlFqs4psJMAYEjPHAxl/8aXiq/7E
         gOjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918241; x=1785523041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xedh6KNk2EDOFluQ+qo8w16I8eWpP1wETZBFHf4d8jo=;
        b=FaLCHZXK8tZn69Br4avxOg2kezor204PtIf8gjapq24wqLcVYPBVgTsttpd+w4IoH1
         et3gUQaMBwfoj/hbcPxZzggS8meH/rQsaSHuU/zlS4MP5e9AqPvi7/iLq6fTrYaXm6Ku
         n1ILdjcftCcsaCKUdJkE+1/xX7aLoFSFKy6XhAt4tWCPmXMrF7Ar5gSFMtfPEkYTo0s8
         4OS3vnMFeiGWJSzPYzvCN7bT63g/eWyVUTGC12Da8MrhbMtOocuL0iD7kWL+mxarCpkN
         fPU8VAaXinx7oS92V9ekB2D2vQjQvqf3VoPBUbfJYQJHD4rU/q1v52YvsdGRK5Rf5C/R
         zTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918241; x=1785523041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xedh6KNk2EDOFluQ+qo8w16I8eWpP1wETZBFHf4d8jo=;
        b=TY+33N2cLct67NabeClk9CIDxa0fJSiGjLN06zp9u5oyWM99PluL4l4bVm/uCMZnXa
         EWc8G2Ac5HpEAEz3hj2CUGegIsS3PI6Q6mheraQhOWv2w5qrzAt1s+DjQGESaTFK5nMi
         HeAxj7AAk0mHVb1UqZ5fuRsYRvo+5v4lpCY8ovfvjTMh8vbE3IXo4dvKAaBzsThSVgZE
         vfSkuZWA91PYDtlk+nEUM+qoAmCiNHq9ExEKb7Qp3OL0fcmLJnyZ3b5FTbI9WBuoddvN
         61JxXcqY/v9n3qqErDC0T4C0kp/AvJv8ySntYJBPS8mdI6Z8KuGVDbL471oVUfPJCR83
         yzIQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4NbT75Dr7lA98GNRZ1SiRmy8Tcq0O2CkBAJU8v74spCcbTwYoxXBPK/T6Qzlsx2gbY9bM22EYrUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3tbegLxiVSQ4SlkEF+oIT7Q4V87whqD+JzsFJd+uFx50mKX+M
	ly2YAoc803N3DlSU96uq/k14rPH1KC+FDD1VAuddI3QyCJbajnUxptLUng/hPVE4PbyaR6Qq9qV
	klPnVtJpiotjF0/9VhNKp2rB55G5NaFI=
X-Gm-Gg: AR+sD10djrAvJBLkOrUZhmWOng5meQpnoaEQUESovKEs+IHgtv5ZB9uTyU9+fDSJC6o
	UPSdZXY9cH5SemNksIJ7cIXVh6gSw2xuha2CiO3i0sUKW8B4CYXb5CJaQT7JnUe7/Fr6YjGpyfO
	VP9ssuEhIRxVYXVOHETv9y6Cam5n3npI1cpH72amdmAz7RB5wZd86MprIzoDdrfGkvV8PMpFXPN
	TvptxTA/0i02b1C5N0kMwcB6XQyZpWL2RP2g0h0MkX67yumcaKzHBR6WknJuElgUawyDPpnpTHX
	KY+RjsoTY2G/sV1ztg==
X-Received: by 2002:a7b:c309:0:b0:493:f6f0:d66b with SMTP id
 5b1f17b1804b1-49573cc2eabmr81103425e9.1.1784918240966; Fri, 24 Jul 2026
 11:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com> <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org> <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com> <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
In-Reply-To: <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 24 Jul 2026 11:37:09 -0700
X-Gm-Features: AUfX_mzApVYg8xjBBKKP9ECVkPTdBjH-zV4-LOXVUdYxXRJlmVsGVskdKCUZFSk
Message-ID: <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev, 
	mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev, 
	muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 10:57=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> The numbers generally look good, the store rejection rate is
> decreasing and we are naturally doing more writeback which makes
> sense. The store rejection rate actually increases when the batch size
> increases to 64, maybe aggressive writeback is more likely to fail and
> cause a store rejection, so that also makes sense.
>
> The only part I can't immediately reason about is pswpin. How are we
> reading from physical swap more than we ever wrote to it?

The same page can be swapped out once, and swap in multiple times :)

Unlike zswap, physical swap in is not necessarily exclusive. You load
the page in memory, but if the swapfile is not full, etc. etc. you
don't invalidate the copy of the data on the swapfile. At reclaim
time, we notice the page is not dirty, so we just skip (z)swapout.
