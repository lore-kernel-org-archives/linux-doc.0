Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF137C0E2
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785051068; cv=pass; b=gHo50ExoaWiky0O61e8ujLV3F4sRWIP2lGfZQ6OlrBYfx+WCzZYWHu9pDfwyWRR5Cra22at0/Jny0FNaU1yn7AyOq3NRTftgpkygqczrn+Nuvxn0Lrq+3Ent9FQx2d+jLJxcapf6jZTaJtxDmxKfb+ecPM72p16nMOK2atuBypI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785051068; c=relaxed/simple;
	bh=i0lh72d2nmu3uu3VDQoHujJQG0QNixt9o8QmQUrkaDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHecj8tBUd0whn9Qmyz2+UosVT8wGqxXxLXvgpTw1daq2FiZOFYRWBSeGrNDxX/xBpC5bnTN3uv2+ptjg9KWWyxWnQUF2bT4LQ/E9yA5yHAfKCg9m+pKKlSrGPvGzlxvERekuBWhJy3bWGSwTrpDKfItLZJ+qeW7gVtkFb2WB4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrK5Lp6W; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrK5Lp6W"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1761832b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 00:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785051065; cv=none;
        d=google.com; s=arc-20260327;
        b=dsSI0QT8fV4gTJbqeC5aa96zVr6E0fGR8SPOb7tsj2/yR/WRQZsaJKILCzMi0tGYVj
         mp3y0B1sVpZDFTWebsuhsRN627BfOBYCSl28wszq7tUvwTw9gnxN8CfklYV6q9dAyUqy
         DZEihyO/Ysba2XAmj5s965s8NwgB2mJGjkIpQqVOkqfcleQnwa+uoDZF+Cp3+SS6TYPv
         q1fbWhQfdksVblVaWrCo/WtXhEqlA+jBJXmtpraKlqi/bhiI10O/uUCOfAYL638zDgVI
         g8FA98gr78kKIAihHkdpFYXzsfRY7gJ9IA0iPO/kupJRItg9hxY0oU1hzTR7WN9ccNX1
         5tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZTVSxKYFzxJZaYDAFPYkohl9eRKYUawYCXhr4l0HQQ=;
        fh=dHfF211LFfVwNAC9I9s9ylBlJF598lXk3jboQeYJhqQ=;
        b=WFPbTBKpkjwQ6kMz9UWAIEMrsPGo+/j3h4HiwYpQl95aLENC9MMSm6dQNPlRF9xea8
         OOnSeT4PVtYjFEUZvGTf/elEYC/dgMOu9k8Ih1z4w+3FVBIQKYUA8USbDeGiEjne2R6L
         3K0cDzqzCT47n116UHAtTvGQmXlmB1b6MIqu0xy/00BXaq0CgCIxJOzEVI59MpFWMFgD
         qga7jFJJY/SlUdq1zZbjm8iSL7Su2ACfEnXSYnYEn0NNQTN3x+IkJs5Ay+gonOBJDqrT
         Rit9zjUmMIAsJhDs58t+f2mThDmbGupp/2MpLT/uVpSprgwe68pj5bodkQh/7fELWFEV
         b+lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785051065; x=1785655865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZTVSxKYFzxJZaYDAFPYkohl9eRKYUawYCXhr4l0HQQ=;
        b=ZrK5Lp6WqJQ4AYEUExlJ96qEozJu712C5w53xvpoTOGRL96QqYfaHp2RmF753iN5bo
         SpbMiuR/Rrr6NF/cirypL9oH5ccFJu5bTk5LzZmmXhUqeg7FVeM4fTLlYxpoITkSGNR3
         I2Um1YzhaO7tB+9iew+TAmbV46K8WlZPKgh13IKI/eze+xalGjRmg2DPm7Yb1PTuegy/
         MxmXX75YGz7gvyBYyFHTMjrtevUQ63b9cQ+XCIYw2mH1awAMLl2FHoDGAuf6Q59GTmyB
         e/a4KhMt4VrfzGIH4psfiIcGyicDjqv+g4+ML8pvR1lnV4M+UuNinfYSKlsY9SespX06
         E0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785051065; x=1785655865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZTVSxKYFzxJZaYDAFPYkohl9eRKYUawYCXhr4l0HQQ=;
        b=rclHJrdU9OhnkAq/qwdhl7TJpY64cfsGR+QE9Q31vrvSROOSZaBP9KL+sFmeT3jgaX
         lBwNFNQtSsnkfx4yxt44ndCDt8SXQ4BKzz2hCE3SZ9BesJC5BPRkB8yqQAg6Ulub1u+4
         owhIbAW82tLblmYnZNG+d3IqzgnkmL2UbrUVnsK+yznWoRuDhfBTuma7etkejAoAOfTe
         7+ipjwiv70EP4L5mTsGNatjSEPB6B6egAuVImfAz7EtKv8sa1BqEfCuc1/fKAyuO2Cyd
         bREIZqzyFE9UgDPaxCzaOrXJP7ZA2Q9CPccdRKddN5WLrknLNtyV9XfnbXjtdp2cRR6K
         IjQg==
X-Forwarded-Encrypted: i=1; AHgh+RrzJCBGIZuY8Qw0uoeoqrZALZNhrxIgXjlfLlu+wk5E2HkrBNECQlzNSEh71xUfbJigf6n4eKV5bh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye3yONTyv2FINLq4OBYA95MzKiqrkd/TLVT8LqxlPuAzS2CRil
	d2jeEEM0BBav4Uz0ORtLdzNOokNoQT7l/BeetuUkHLXt+CQ+3ickak7djQT9KNTIoFwTGG6Sq9q
	QKdurPgDGuX/09YifxUyDzaSs9X7SSF0=
X-Gm-Gg: AR+sD12Pvk1B7klsJfurDeQMUApgAW+R9/N4oIaCMDKuirzwD/DlW8YVDugnAedfGV8
	hFTp38aacIg3HfC9ViBhzkufVNpWkKjw+QrCfUlNvRpJpx/FHHj8IW9WoYlb/135Fr8nXqqcPmL
	gC+AK/vvaAh8onlPEHCAEJlvRQCzAR0uDU7Pc/Ng3PTcLO+lMkCG/vZC2HrvSoQi1yQiCUeFmjK
	o/GScoTEovGLKNcvJ9y5X4vv5v4hCMAbEzUPUQYSb1dwbgqSYJOTbREJkkY4Q==
X-Received: by 2002:a05:6a00:4213:b0:84c:4d9a:ae42 with SMTP id
 d2e1a72fcca58-84e59498487mr3719808b3a.27.1785051064667; Sun, 26 Jul 2026
 00:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-af-alg-harden-v1-2-c76755c3a5c5@gmail.com>
 <20260603133312.12848-1-freude@linux.ibm.com> <amOGWwdjnJqyxH5L@codewreck.org>
 <20260724160034.GB2032@sol> <amOTjPW__CNZui3_@codewreck.org>
 <CAFLxGvy+ec3nQLrQtwFZgGELhT2pKBDnHdD0pMvEGh-Mf3rjgQ@mail.gmail.com>
 <20260725220443.GA41199@quark> <20260725230922.GB41199@quark>
In-Reply-To: <20260725230922.GB41199@quark>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 26 Jul 2026 09:30:50 +0200
X-Gm-Features: AUfX_mwtxGS7a6c5QzhlmY01HvejyEPiuukikmfTBc_9wA_H1fyNyxlq8igMsLA
Message-ID: <CAFLxGvzT7jO+dxLSUgw0SOViuV7suY+Tz8m-RE6DBVfF-WbRUA@mail.gmail.com>
Subject: Re: [PATCH 2/3] AF_ALG: Drop support for off-CPU cryptography
To: Eric Biggers <ebiggers@kernel.org>
Cc: Dominique Martinet <asmadeus@codewreck.org>, demiobenour@gmail.com, 
	Harald Freudenberger <freude@linux.ibm.com>, acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ardb@kernel.org, axboe@kernel.dk, 
	corbet@lwn.net, davem@davemloft.net, edumazet@google.com, 
	herbert@gondor.apana.org.au, horms@kernel.org, io-uring@vger.kernel.org, 
	irogers@google.com, james.clark@linaro.org, jolsa@kernel.org, kuba@kernel.org, 
	kuniyu@google.com, linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, namhyung@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, peterz@infradead.org, 
	skhan@linuxfoundation.org, willemb@google.com, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 1:09=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
> > You've only mentioned that it "can" be used in this way in upstream.
> > Can you confirm that it *is* used, and with an actual upstream algorith=
m
> > name, and if so which one(s)?  And if so, would you also be able to
> > share whether this is for dm-crypt or not?  We should remember that
> > dm-crypt accepts keys directly and AF_ALG is not needed to use it.
>
> We'd also need to know whether the user (if there is one) requires
> unprivileged use.
>
> Hopefully not: these sorts of hardware crypto drivers have lots of bugs.
> Indeed, the CAAM "cbc(paes)" doesn't validate the key length correctly,
> leaks DMA mappings, concurrent requests race with each other, etc...

Uff, you're right. There are some nasty bugs.
I guess nobody noticed so far because the algorithm is only used a few time=
s
at bootup (as root).

--=20
Thanks,
//richard
