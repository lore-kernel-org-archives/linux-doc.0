Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795088954;
	b=Aawul3zlf2j5E1hU5XeDcwoONgd6j2F1lfDtFFgA8sCjzcC12YTcWStP7BQW6NRbRp3F
	 YRmqh2CSREDqvdUlv/Vp/+2x6qcvQp9vq3rmNjNsr3AqdmkspkGYGobRTHzuWTmM+NiDt
	 qqaY13rlLRcgKZJGJp741+YJGN+5F4aB6lD3RLcKGf5oseLHfk8ZB0TSSdMHclq27MzJT
	 m9/pLyB/GQnlGtDbMi+X3vW4+wpcaWeB4ujE2nTod3ui6kvSDAq+TtdDEYg2ffU2q6UpR
	 U6zUegfKH87AGMxb4tU7eKobT9jaARkmAg8myk41nO2lX7GfVxNJoQ8TqBQtBdJnv3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
	b=d6vFOjN5cSG27FGg+jLbx+h6Shwc/ai36FClm4GA2QZexq8bgfOOy1EKmEHTWkpj5bsO
	 /SR3pQtLZNksoiRdBF4G7UtI/SNrK1nJ94vQXIrvWBX/KuAIZ1YqGSO2NU0tuE2+IUKzV
	 AK7QPd1MB9MYOhTE94ENp7Mk9RFlHN1mHS8VIS8SUwU8CzI8lP4iTEWB/BegsI5OPmOGY
	 RyrKnXk99laAsEg7fCWP08+5iDBndJir3j1sUyKpivBqHjSQdoZy7p+52a61ax+c0ifii
	 yxw9f+4CicqIxsQJkxdwZQBmWNbgEEq4H6MLTmmhO6TIJ/fJKnR6XbrhEqLH9h/XRYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUdb8TI4;
	arc=fail smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A5606A326
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUdb8TI4
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso3438041fa.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 03:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795088953; cv=none;
        d=google.com; s=arc-20260327;
        b=BpeABI7mUhdECB0oVyigFBh/fhtnq+jXVCMlicwA8RbRyA+vfGkPi6uKp7cfJLzi/2
         8h6vLAA02qM4st7EJ6x80Zzy0pBcJk9NC8qTX3/OkjLPwLOl4UdCYbHT5YOAYPihVYJF
         p8bR4QdY/TU+OfeeukxS2G+kQLB+jQgpTj32yawVMxtP9UW3L7c7LXCVaFFwr36eZAWk
         mPWrOuWUklZS8wIKWfdgaZ0s2wrhyFSJ7KyOfF1H1ZOxwOkx8yS5HYbWFb9ObNJ0ZhKw
         GwVObcyid0qhm0z9nRqyFB+yEnfZdMzctIZwqsKn1ArdKUaxjcRH4Ha7Evex7ykx1Etj
         8r3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
        fh=mKnxztgqWDIKzceaLDDXl5W+TCQ2fywu8DmjDWLwiHI=;
        b=lRe7N96DN71YD5T7nP9Ot71WFst+6+uV6pXgWWII4vICszqgY3akYp8d8+ZBDrmG5f
         Pxqi7nW8G9av4o0g82rxVGnGYMLvvRIyIlAnC/di0MzEkUYqlsPnBQY12Vv/rlXaLZOA
         XaWdn6G29vgzj1anuuNkcWj8vvfppUX4k3F22OhsqHjPB8erIHoCGCwbMnXx8GvymtVA
         wDhVaskOA8KLQfkECKnar9/rNa03F7FvNxHUwx7mFtInoOQA5t/ZLtBsQ7oppK2yQ4Ws
         tJwJaXRKzWihMmwnTYW++2+RjXEnjayO61HZlFFhiolZJ5Y7QW7lTm339MJH6+9XvOaq
         Rc3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795088953; x=1795693753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
        b=fUdb8TI45r/JtE95aHTR1w5KYIMHt9jbmBjUlntNkVudQj8V8HCcEFg6VBX/1akI1q
         cEsyZU1khC3qKgF2Q5gTANUPfpB1GL8niDnw2XKDsgwbRuGjZ7SLg38y0OuL0UKYQdsS
         AZMW2nWiMyKNSpMdu5DTs2w6lAlP7YT+fTpA/PNLaPnVBpm6EyyFsrOuv2k82G3mdi7d
         wfuNUoxLpuKOiuoEnZ7l9aup39V0rU8pIgmzSt5IgNbOvw+eVe8+S2bzxh4Iu7xTzd+Z
         sLmQeJg8emMboHxELS7TmDp213b6VJa91zUW/46XUSz4OTZzoBuyljKmMLouejNGI0Ih
         Fc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088953; x=1795693753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5JCdy+prC5WLmfZzb2euIbx/n+jdsPpvA3OvYZR0kg=;
        b=HyNFIBTb8APKR+L13vr1NNJfyRJMlySVy/fFYNx/xer5yUNEyUeEalGCTalUlqFyN/
         3nXpeNv9UyQsSNGqSi+KTGCY/OrhnQ9xOuNzaf3QrNjTqO8XEdZMDu9tYMnziwk12NCD
         vdvog16xZK2OU5TvmfqqQRZkBcN+LNhm3tPDXrgTGQVFLiUW6f9RXFFCKcLkCdtt3DAo
         oNyH5/93iroIi8ntcteobmTy2ikc71l6RsQUvOsdUsEr06y5TiYXB97LkJqDxFnFKD4s
         bJFY7IC+uMe8pDwex2w5zPX+Fgxb2wyz8izrHe3RVPladl9wFxROtNfF+OBshO3bwliT
         VvsA==
X-Forwarded-Encrypted: i=1; AL+hErGjjP0FvCts//xNia509t+cjiaP3nSU3j3kXcBf0s3XfWMWfRX1A+mVVS1hDyUNxk1vtQZbly3OVes=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vHJiGsdcbE2exuB9/J67cG4uIuwSyKFCeJiFTwaquZcYv4xFO
	tJ/sFnH+YAKhOTUfdFDC+k9WxC8IFHhWGcPWI3riVP60QI5apEXhamafu9+o5j4c5dmsh+u78TM
	Q4kIgSq4AwAjpTohXXmoy1mjTkHs/Ep8=
X-Gm-Gg: AYBFou3qTV9o7RY6aDepD5sJPsRyELK2UU7+EjO6LN89n4vrlQ7AwftsfRu+Y38v0I0
	qpIgmrhq/fPsR19p/P77Ktf+i1Cs/5gS15/MkjSUMyv9vrRkHq655LPNsDzgMWBmSKyq9yxAtJo
	AIDUei8mVdJlgDsSyQr1EYt2Rks/J9KvT28+uS+S1f38ADMJGgeogICFo/RUYIWkQsa+CbfmE2C
	ca66UVFdMw3kUEIvkoILJnxkjw3GFUYnGrbSHEVOfT4BrLqatJntDabuEsXBJEA/+nSASTDg3Wd
	8mOndAta3CpZyQD7QBGBfm1SeZZ+WRWqpL0cd/oE7altsRsGV8T1KqPmtTsVpoBUCTf2DdhYfdN
	+yvAYL/5jyrpWuZ2+baW6UdfV3u9/5aEDaMdOIqR/XxKyvnE1+eR36XjrOltLvEmLS6Wp39EpR7
	t0WoDSdBVJB3B3Ah80Fw==
X-Received: by 2002:a2e:a00c:0:20b0:3ae:11a4:22e8 with SMTP id
 38308e7fff4ca-3ae6709dd77mr16529231fa.1.1795088952382; Thu, 19 Nov 2026
 03:49:12 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-2-chenyou910331@gmail.com> <avRotoTK1Gt9MzAX@wyuan.org>
In-Reply-To: <avRotoTK1Gt9MzAX@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:49:00 +0800
X-Gm-Features: Aa3M54okjAbOEj_05oVJxNrc7LA7w2MsSPgZgTIBGiScGonxhAvZNmD_KaK5owI
Message-ID: <CAKspUhKNVoOBRiXxu3py2M=d5uDCjwFL-dWyt_fCTVKxusSMvg@mail.gmail.com>
Subject: Re: [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the
 English original
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 09:08:06PM +0800, Weijie Yuan wrote:
> I'm wondering where the term "=E4=B8=89=E5=AD=90=E5=8F=A5 BSD" originated=
 from? Sounds like
> machine-translated to me.
>
> I checked that wikipedia (tw) calls it "=E4=B8=89=E5=8F=A5=E7=89=88 BSD".=
 And wikipedia(cn)
> calls it "=E4=B8=89=E5=8F=A5=E7=89=88 BSD" Or more specific: =E4=B8=89=E5=
=8F=A5=E7=89=88 BSD =E6=8E=88=E6=AC=8A=E6=A2=9D=E6=AC=BE =E4=B8=89=E6=A2=9D=
=E6=AC=BE BSD =E6=8E=88=E6=AC=8A=E6=A2=9D=E6=AC=BE

It was carried over from the original translation, and I agree it reads
like a literal one. I'll change it to "=E4=B8=89=E6=A2=9D=E6=AC=BEBSD=E6=8E=
=88=E6=AC=8A=E6=A2=9D=E6=AC=BE" in v2, which
also matches the "=E6=8E=88=E6=AC=8A=E6=A2=9D=E6=AC=BE" wording I plan to u=
se for "license" across
zh_TW.

Thanks for the review!

Chen-Yu
