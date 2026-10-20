Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512632;
	b=nGnYhRESate9uYzl9q8b2Hk7vaR1dNNfxYHT2P59TFbV6GZ3EkBfMXOPqHZzFH0IJeEg
	 LT2laukwOrS+ai1CEFk9sj9wMK80o1IdiI0oWGLs9p5JbgwaX5LS6jHAmubP5BoXUdJgJ
	 luH111yXUdrWyPACAMScz1v3cqZAX6HHvnpi+XQ1ojN2s8kfOfFFdyq5qKkFK2kLnaBvs
	 AJyxBC8bQ3ElnwKpIRQDSXrlaNIEg1Y3IKMvmPtc5a/IKojpLCo6pGVPn4ChvthbFKz6x
	 0euI+B9FyUtlG3BGryCYdD0UWocTtUupwuzWgcmAI/y/OZ4avw1OpYzCMHMWqi3GVXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Message-ID:Subject:In-Reply-To:References:MIME-Version:
	 Date:Content-Type:Content-Transfer-Encoding;
	bh=c4lo9c1DzgFzppkuIe3m48wNpvzpTiu2Q7BfuVscJUc=;
	b=v2ys/AB6UQVrlWqwNr2wBCdOwwaUctW0DjDLCOj6nMtkAG80A+ZhonibLLogfIM+40SK
	 l3u/g8QnYp6bJn3ahPM0D0Z6QweyA2a6wRQ0XLRxiDZfMF5Hy0ws4ALwaQMTfzgLs3URl
	 8JanW7G45dSjmZ2QG1wBbheZTdx9QD/zaUcJKbWZBRbTtDl6mMoo5vvWqOURMdQ+jY56c
	 6oZw/4+P+6eOJdyWB0fnzHbn9exytbqyhg4lZ12Qm7MaHrW2er1oe6CPFnKl2jg0HAsgV
	 ukguOAEpw4YJR5ZUg/e9CDilz15gMeLyvfBTOtDwR91D9jhTmJaildqsHGGOyoQziiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Yb/qqOgN";
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73E606A31F
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D73E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yb/qqOgN
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad211ad92bso773192a91.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512631; x=1793117431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4lo9c1DzgFzppkuIe3m48wNpvzpTiu2Q7BfuVscJUc=;
        b=Yb/qqOgNPajBomQKW9EmdyhHhaDypJ19gFb1YQkJGyaU8/EiIanIBWY5Z4CYza1eOw
         WOXCMNh5jwZKHSDzfYz3GjMvRARFrzLsZW6To0vXXBhPo4YCNCcA04j+Ep7971DsMKI2
         t3Q3OtnOb0kpnUypLntPDAI+ExrDG4I2pjLeag8bfYUPImFJQyUTKuqSkJN/b1NFMP5q
         vOkbfzXE/m2bd9CvdE9FGM1zIQzp/LQ9lfJlDqYRBaNf+30oOAKPuIeTGh/w7+CFCdn9
         ndCvRlALFLuMedVFA/XnbXzP+z28g0ldIE4g1E+Lh2xfMr2yCSX63ec0oNazXXUUL2dU
         F5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512631; x=1793117431;
        h=content-transfer-encoding:content-type:date:mime-version:references
         :in-reply-to:subject:message-id:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4lo9c1DzgFzppkuIe3m48wNpvzpTiu2Q7BfuVscJUc=;
        b=snJkcTHOVCbw8n83M1dyrP53pUhq4ZLKd7hgFwqhwkKKW2/PeUIXmG4qjbHuB+9046
         Fz9fwaw5/UF7UuPLH8N9BJjh9OtDW4XQfpunbQCXrDBf9nk9NJCdwj2QZHLst/lQ9JwQ
         AptveCOaZAB7dkll6KB9Hi/9JGUJaJGHLC5jESL8BAsEn+FOhRrZVfyTrZ+7xZTXeL2a
         W8hp1QHsTTfnxVF1SqKaid8wHaU0ZZKVAEYkxbMl+2C5kYrwZTHtbcGAmC4zokaUKa3V
         APDogPQKFgRgvXxHJuEg4H1CRm0GW/4XuClvrKf14DS2q10uFxjzMjaV/FH8ONr5tZli
         YDNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxthqzaS71ySTb4QbybjdH2BsmeMECeJTMfDHzfQNT7Z07E28A3z8IVYDU2fLhGSRamIhvMEh7z4gY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbhiHE0RneGDnrbPgYYR4usyHUHdjZPbKNkmgFGcO+jBYa8Xat
	5VOb8mhd7rXJxDfNH9Z4kgb1HsxLTSuLk2HNks+/X9E8fJLkBL4YkY2X
X-Gm-Gg: AYBFou3l6hIntWytfo3w16JFq4Lnas/Tf1IFHeitFcxJNI6Qwg7v7iinWUdR9vHim/7
	OZtGdoJEMJVjXG3xUkELs+TgeyNabv/OnPyTOlsIJvvHnjHS+DNYsHig4lBDZQc4wqWruYdihqG
	t6Jw1JDOtAdeHUN0/pJbnDBy18pqs7ZeM9E2ieCYFu5Zjn/6VT16izjaplGVfivrU7YLTRhZa6j
	1/gzTyzWp05hiq3qzpZLiisiODcNnKn3UmMzfmcrKMya2aNEVRjaOwAZfaaiwDkJja029pRqJ7G
	SSBRZvMYaOcue2WVDHvp78x8MRKNH0yEFHPOuIrN/HCx6/cibIk9Zgo4IMM7EQxSgqx7BphrufG
	BPMU91e6Zm+lU5yAxn5A5ZcfzDiJG7SD/aXGaFpfkaHYg9yzKto1TTuFDFWCHkKeJ5oXW+oEDwU
	UKzWGtrBL7NDh2JtkUF9LjmEQyk4ErUAOrSYmqC++1DBpD0c6WmlLUIWPNufVE38MJfHM8CTEuS
	91EbNBBszjVcEzNDVB9fKQnhEnIrRjRyYkLMg8nWdzX7oVz0KPnbQLf/gShGpEV5EVVR5g=
X-Received: by 2002:a17:90b:5112:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3acef0f47a8mr9810302a91.42.1792512630823;
        Tue, 20 Oct 2026 09:10:30 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80cbe295sm87743a91.5.2026.10.20.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:10:29 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, damon@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179251032453.2.6166799753856435091.damon-watermarks@gmail.com>
Subject: Re: [RFC PATCH] mm/damon/reclaim: allow disabling watermarks to force
 reclaim of cold pages
In-Reply-To: <20261020135822.85334-1-sj@kernel.org>
References: <20261020133233.3920818-1-ruanjinjie@huawei.com>
 <20261020135822.85334-1-sj@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 00:07:00 +0800
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi SJ,

> setting wmarks_high, wmarks_mid and wmarks_low to 100%, 100% and 0%
> effectively disable watermarks? Have you tried that?

That worked in my test with swap enabled. Agree that documenting this
combination might be useful.

Thanks,
Aveline Noir
