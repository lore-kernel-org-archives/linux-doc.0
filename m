Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC80357702
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 05:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786338761; cv=pass; b=Kw415vgHzKzPR6pGSNJCJPUk6ovqjrkZb/9m+H7fxQIFd/OCuJUE+OmjDoBo8beeM2/vONA8WaAH3aaL2SvMxDGb/wTCS1BPC8lLqKSMoJ7rJPYv0VheHVG/qwfMEO71224rfdboOHSOFTryvNfw3fLZvEtL4O33EVJJTHhccVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786338761; c=relaxed/simple;
	bh=fYJ/sJDWld2Y8fxP55LJJ+LvFpUiY9nSb4OKhpDbaE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXlWa8IA1R+ODy6h3JX36ltmJcNohYdT8Q6td6OakEUMziGf3cwmGcdszygmE8KuUoy4a8fRrQFuL8jEeGKev8iV3THbGalVd0KLabG1OXqLyZTzwi7FXrhK4wRQOsgOZA7k+DgjPyUB5Jg71yuT+pIuC2sV4rfyIn1eJ5bW78I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B68sSqHc; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B68sSqHc"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-529a1ee0e62so9924621cf.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 22:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786338759; cv=none;
        d=google.com; s=arc-20260327;
        b=nvBW33hVHtCu1boBMnp6xbzFpnXS3VvFCJ2XSV/I+Q8fXHKp3m4J2JBEw3Pf3JIle1
         ewG80859Hwo80T1+dCZvBJL1O4+4NwoZELEqZazjuepC0SXRVVVLO1QIr0hGG0iS/gMz
         HEQLkWMzMX+EcsK4Kpf197rn1jYGDk3jbtObv/+B8aCUgWn+uvUsAPW62YekKHN0h3SR
         5HTqzJXVBBYZYyVu/CT50ngKI+IZb8i9yLOD/E1SYOCFpYGnYzvXPoDUf9kPk8zdDRQM
         8yP5slo/BGPreEFi6Paoje6mj/5TvWmegIZcGhMl2uobeKa7fYATAnh4u04ptQrgBGJf
         WVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fYJ/sJDWld2Y8fxP55LJJ+LvFpUiY9nSb4OKhpDbaE0=;
        fh=kcOcqXyExu0XCQkr4HN+c9sVSt359CyxZ+YXIyECctM=;
        b=LpEXVcm1IF/BpXaWK5VEmR3wpCjpLfGL8cB9ZZniQS1HvElO11ShGpHZVHEiHCZjNt
         8ChjT2q2mRVOTD8zPRks9pqnn4ioYOoKWccSp+ZlUswopgVAfYEIfrLjPiZmzHEHu2t4
         TBgYCNidhq5lr0bKwX8BffSmq32E9MDAYSNgiZO1tPcQyLcovAeVJ4gtDj0Gjj7Oibnk
         WuImApAoaGn0rHUK3e33BaOVtikP1SFoRXpsAysbVzYHDIMKoRCFEO3HTsIGLYPZOrLA
         ZzADol93S4ABF5ve+lgpCSKtkY4kyeuq8cVoqL8F8odY7Z9DqLVAbx8x6BVuPbpA8KVj
         exbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786338759; x=1786943559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fYJ/sJDWld2Y8fxP55LJJ+LvFpUiY9nSb4OKhpDbaE0=;
        b=B68sSqHcczS8T2YI9acfGvDyOJajmb/8sVtYNQXuJRYxkCyaDYZ5WWRguLCx9+NeXe
         VGp7dANaIyAN1gUSJCtQtL17NbLrYRF1PzbigCgPqBfu1CaQuZhK2kJtUBVUT5VmDk1Q
         HPqskTkZ8n8bxplR6TvHfow+aYYGAtf1Co+z57g5FbImXBq6pbGz81FB1hYa6JS2KMZa
         +Nr0b0QIpLwjgR7PBdJt7NLQDX6i0/bpda61yu8foTR46i4icA4FHZinPFozo3r/I99O
         djzrzv+G5f2ohEhXaHbsvQjxbh83IkUEfEdzZnMxZEtSgFUMqSruPY09yrQHG3C9REEN
         mbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786338759; x=1786943559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYJ/sJDWld2Y8fxP55LJJ+LvFpUiY9nSb4OKhpDbaE0=;
        b=QNUsvIDZAJXPfnRJ7Hx7p0Bh94EBLXsDyZf4konIntqWtXgyGK0MHYmlS9BJGmIClW
         5hmUy+Eaixlru81CCn4RlkchbtkB/F5gL8UhEvxxRft6jhx2MNm5gLWt49gehA1wtzpN
         jEM7P8gSyYW8rVbGzIjjihP6uewp9UEsWHD3VUDU0JbQ13DPnijMC3IrX2kH0zmDpyjy
         /b8o24DvJp3n86fpX8Y0Nc+QaRHhSVchzsPBGkX3m21ynnBguYm69TQPCIDkWGUOaYeK
         yZ65R3b3fz3LvVU86Hpz2CRNd4FdDTLgnKlR9Y/6jar9OhNFY5UZzAKtvyJPmy3mQZiu
         Sq1w==
X-Forwarded-Encrypted: i=1; AHgh+Ro0yqfNc/TyFHOSK2anKpuDqgVrzM/SK4pJFMsi5FD7cXCQkDhexuKWT9X2boq3K5VPbeUTY4W9lOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRY+mzvJuVVrYPnhJWuLdzHebxz06JqMwGInKspZX6K7o52rlh
	IbvlT45H3gSxghrWTjYmok7thY/iAvD7ubGPOyKGkSeGmyXGfETZaOUE7ay56MCg3vEi8chCK0M
	xJdXeWpIJycBL3ciwdw0ZrLYVLf1GFX0=
X-Gm-Gg: AR+sD12DpQsOX2VUy2uOIBTSzROlMx4QaQ+CEWPfApXyA3jt4Nq6nEMWwA/PJmb5aaz
	HX/V8zvFmCjBGjed5whgE1iHw+IF97XlEys1MNUbXJxG6pIHsqt3rq+Mj4xktgpYAdopkEgocez
	dgrw7PHJ0E22GqgdDOREiSlKv10jIumfP669jZ55L+9qv7C0PiDUuHmy25+xOfwMi5qAG9LCkoL
	02ncSRaBbZIyvP4i3UXZus4jK+yDfEstJ4OwPfng3Jjs3//RdKcHKCDmDRQeKWqdjb+VZUSJm85
	RvQj655RJwqUv7R/qFBYXMj5B/pnHeL/pHAT9Q0TbcUKv5ktJN23S3ar
X-Received: by 2002:ac8:5acc:0:b0:51c:61a:50e6 with SMTP id
 d75a77b69052e-52ce5f41d0dmr423204861cf.3.1786338758508; Sun, 09 Aug 2026
 22:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809101923.13176-1-chenmiao.ku@gmail.com> <20260809101923.13176-2-chenmiao.ku@gmail.com>
 <anh6axawbEiF37WD@wyuan.org> <49a6022d-7d7b-4414-ba61-4482ecca4b11@hust.edu.cn>
 <aniKpkE5iCCU835q@wyuan.org> <CAKxVwgdjNjDLWpR2WPOdsXKhusobwq_52ioB5J15gdD2C=obvQ@mail.gmail.com>
 <87tsp2j543.fsf@trenco.lwn.net> <anlJ7YQzjJ9qlZfA@wyuan.org>
In-Reply-To: <anlJ7YQzjJ9qlZfA@wyuan.org>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Mon, 10 Aug 2026 13:12:02 +0800
X-Gm-Features: AUfX_mxUDp8Rd_khSP8SUm8T8nWbvRz-3E7rd7suUgsB6_yyP6HMPzLJ8vR770M
Message-ID: <CAKxVwgeH3Nkc2F5-Kz8r5zGFLOnJZorT+t7UQyAkobo3zYV4yg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew support
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org, 
	si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Weijie Yuan <wy@wyuan.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=8810=E6=97=A5=E5=
=91=A8=E4=B8=80 11:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, Aug 09, 2026 at 04:34:04PM -0600, Jonathan Corbet wrote:
> > Chen Miao <chenmiao.ku@gmail.com> writes:
> >
> > > Thanks for the clarification. I'll first check whether the kernel doc=
umentation
> > > already has something like a "macOS kernel development guide." If not=
, I think
> > > it might be worth documenting this.
> > >
> > > In particular, macOS uses a case-insensitive APFS volume by default, =
which can
> > > cause unexpected problems for newcomers working with the Linux kernel=
 source
> > > tree. It would be unfortunate if there were no documentation covering=
 the
> > > things developers need to be aware of when doing kernel development o=
n macOS.
> > > That said, I suspect this would be better handled in a separate patch=
 series.
> > >
> > > Of course, if such documentation already exists, then that's even bet=
ter, and
> > > there would be no need to add another one.
> >
> > There is no such guide now.
> >
> > Correct me if I'm wrong, but I *think* that absence reflects the fact
> > that Linux kernel development is mostly done on Linux systems?
>
> Yes, I think so. But while macOS is not a common platform for kernel
> development itself, it might still be worthwhile to make things a little
> easier for people who want to contribute to the kernel *documentation*
> from macOS.
>
> That said, I don't have any data on how many people would actually want
> to work on the documentation from macOS. In my own case, though, there
> have been a few times when I only had an Apple machine available and
> still needed to get some work done.
>
> So overall, if supporting that use case is not too complicated and does
> not create much of a maintenance burden, having one more option
> available does not seem like a bad thing.
>
> Thanks.
Thanks for the discussion. My takeaway is that support for macOS
*development* is still limited.

For v2, I=E2=80=99ll limit the change to kernel *documentation*: I=E2=80=99=
ll add a note to
how-to.rst for macOS users about APFS being case-insensitive by default
and the resulting issue. I won=E2=80=99t try to document a broader macOS de=
velopment
setup in this series; that would need more established guidance first.

Unless there are objections, I=E2=80=99ll proceed on that basis for v2.

Thanks.
>
> > We can certainly add such a guide if somebody is willing to write it,
> > and if it would be useful to people.
