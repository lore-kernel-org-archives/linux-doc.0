Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE2484A35
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661262; cv=none; b=na6sv6fZk2R6hz5lfw2GGuKfj5Uifcz5nMVHI7wAmhB1RhKaC5gdFs9MhdnhKReFR9/KV6wfZhJQKMu0oCDWBb/fESpZ8/xT6rsyNTcU65yt6mzGTcrT1qL0lVIn3qd5K0D2ZYiT57QErapWYOqMtvG1AN4iBslEIbG+7FTyIuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661262; c=relaxed/simple;
	bh=jzUwRFYMwe0kkKb7Wpg8iUyhHURaS0YrhVvgitXw+xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvEBNVKmCUw9/0n8HwjaojDohDrKWady/YkfOJ63/w7qhOLmjA6HilPSfaD6W4RtTfYcVn/1mSSaW3Grwxy816avRigaIC0VBNMi6I4ghFvoxHLPczUIvGe1TxM3pJHeq0pt8U+xHNi/EQJibJ8kRHV4lEwz1AYyHPfze/NsKU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=jXaZG3tH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="jXaZG3tH"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b06d6cb45fso27017861cf.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754661258; x=1755266058; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzUwRFYMwe0kkKb7Wpg8iUyhHURaS0YrhVvgitXw+xk=;
        b=jXaZG3tH1PMRB0OKnWtxvsHd1Rk10dwuOCEgRiZ5YbCBqxQQTw+Jz5KwUYNcNChoWY
         xf4WD9V/Y23gBJQiJEVrIPi03TQslgT5miGCO0uzvGNjvtW1WMcFKZt2vM+ip1npFZHS
         /7IqrN1uq38jyr+pHzz6F7KmXrCR7uYxwubanh4J6jGtp8ZBw4vJyUsbiEMcKnqocg4O
         18KlT40DuLg1Ls3E1ao8KTRLE2eyQAhs2Ug1pzUcsExdnM2/sloRo03ahg2PY6lKrGv1
         kvN898/zDWHpxKrb1Q4s38J4C2/MMk5prFbc22KsrleozyUhtwxKMRqLQEHRQy/mrOab
         uzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661258; x=1755266058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzUwRFYMwe0kkKb7Wpg8iUyhHURaS0YrhVvgitXw+xk=;
        b=gs9Rg0DyGnIjBYqG6ZsrWDUMCu3Edl8Dz/qfNIFM7mTXUOTdl+9+Bj6Xrox9gd7Bsz
         1BwCVf/VDFYsXjcmJ1+BjAiwAQWGmJ6uJtYnhu5ggyRBBr6l0cs7fy1/oJH2Zo7FkiMo
         /mTDs5SQvbolpSizMVz6RRYWsSJuJbbsEOPgZ9fJHRGSha2n3lRHQjeX5XutiNt9+6EE
         YBeUY/ZXRtW0hdmW/8Lj83vwUjxBTkkll0k3X7/pRBq1VGP8pC9YKX5t0igdhK9gJJQt
         ko3BIaMZH8jaOO1wWNrNx57ZnDh7M/0lOkA8OWM1L+7cSm9pZqNjubf3ARmS+2+AA2rd
         H4jA==
X-Forwarded-Encrypted: i=1; AJvYcCXs+4UrcxbsndQBOW5Z0Daj5E5ylEIrq0EDzfvNB6ZmrPWtPHQRBplyESNympsUioJkuK6HfjkwIJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjrTP4QfZ6dadVV5kKVLSWbeJd3XRxSwVGVcg0lekQNfNqiqT4
	faRmpQ7ryZoqTWiacizmj9FlTyN+LC4cLWmf18AXU+OqOvft97CVOKCsNyGWH18Apii6M1kiCby
	NeKgH31YUG/sNBs5YyUQZbMbZWVz8NhhvQUUdfSWYFA==
X-Gm-Gg: ASbGncsKT7iJRROH1Wulik4bCOlQR1zIUPnLfj52Ym+9JWO8BnygrcwOppqIcjyEG7O
	ZAsMzkghIEGFBOdVwCGaLR1LYay91qlmJ/eKIsC/FXeaLqldzkYqfjKzC8aitumdtAycnw0JtQS
	ngInYgxvK6Xs7hUdRQnI1lm8vEFBeP8I4zWXoCAwIh+NSj3x3fEFyeYRc3XVKT57PddODxklCDr
	mmY
X-Google-Smtp-Source: AGHT+IEJmYietSH5VpR6RMJMP415b7zyz18sRNUfhN29PGY7yEn2BPdHDpMV3lyr863RZFGEM9NfgFIb4ZTkLRTpI/s=
X-Received: by 2002:a05:622a:1181:b0:4b0:7620:7351 with SMTP id
 d75a77b69052e-4b0aed29dfemr44241331cf.13.1754661258448; Fri, 08 Aug 2025
 06:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <b227482a-31ec-4c92-a856-bd19f72217b7@redhat.com> <mafs07bzeatmf.fsf@kernel.org>
In-Reply-To: <mafs07bzeatmf.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 8 Aug 2025 13:53:41 +0000
X-Gm-Features: Ac12FXzC2ItcrNrnqIm-RSLWTwNqS2AX71-Cg7eUT1NgfRdHm0ajR1sU163K8_s
Message-ID: <CA+CK2bCd9x0KA=cO8EauJ=_GJ-GzO+0Z7HXN5=cObxuGzFDzCA@mail.gmail.com>
Subject: Re: [PATCH v3 00/30] Live Update Orchestrator
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

>
> And now that I think about it, I suppose patch 29 should also add
> memfd_luo.c under the SHMEM MAINTAINERS entry.

Right, let's update this in the next revision.

Thanks,
Pasha
