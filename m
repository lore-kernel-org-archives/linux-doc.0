Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5C13AA47
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709039848; cv=none; b=YDbaW9VqM6XtFwwS74Fat28is9QVO6nttHU9DZ04faZoQVpxD+IFr/4pVScoDg/QkHA29HQl5/b8WWk/6s8Dun26btwlMIvrIpYeYpYwm3PunBRCd6DKuD11JwxZuM58rkF8dqDXArX3t+4DwsSJnp8ptVULehzLXnPyQoP3cFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709039848; c=relaxed/simple;
	bh=0lFfyuFpoi0t3C/DNOaORcnlyq9MlGM72o5rvEcttb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFaMUjROt5Fwed4vZkgD9OhK5VudfLLuKJhfBfxTe1dl9OETeBKALnfaWhVtP2R8CuXIUWBv42rOpRKsqaWVUSxCaZhzARsBvKw2YnrllwoM+klvyeJwZ+ImzboR/FCKemxpmqcJtawRpGeq1lHsP2Yjk/xC/6laQCXmdsKG0Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0XWb4Ee; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0XWb4Ee"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3122b70439so524020066b.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709039845; x=1709644645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUZhjFZ39s+ELRKA1etrKqDwbBO7lDoPw6G3kMvlx7g=;
        b=d0XWb4Een2XMDE4uJzUL2BLL2vYF3BEQrByYyMQsbRkXAFHjs8Ku8nJehMxA+fEdv4
         gnZTOYK9z8Ivm/ODwsv5QuiPdvMlStkEpojtNJXyaTkIDMWd1AQuNfDOWgnm25xL9mrO
         /7y+CvxgxpVGjt4IWQpO0Fb+DtjDyOFvS3qYw35LwAUdSQO2xONBTzP1YVEG+g7j0oVK
         lhlYXlwQoS8c00K3lWViwAW8N7ezlxL+yuIte8Nvd3emD6e26DRH9JBWYfKtD+12KSRx
         pHt3vH/Y0YVT4XBvHfrrP5ap5cldIIYjwR7FQWtlE8yny+2WwdUIw0/cCx9IQyn518uo
         OPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039845; x=1709644645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUZhjFZ39s+ELRKA1etrKqDwbBO7lDoPw6G3kMvlx7g=;
        b=DgNY2CIHnf2CWXuwW/R5cDkiJcpE/vV5Dh0nttN99Rr+Y+6OsdOJyKDy8SOX2flv/p
         psLie3lLEf5hjHJZzp9snpqXLRz7I45ppy60foVnfKiNwDo3YFy9ykQoM0Kg3Hiso9LR
         wXbeF3m1ccH1t6VnhdEAundjRtA8JRNh9249Sg2HPrXcalrsOfDa/vcuI1Jno8Sudjjl
         ubcVOPby9jjka+BZmAkyb6hBLwZVsRkvq0Iac4ybjV57CDNpfaixast1jBIMx+IbFu64
         qzSGNQNPVCD9hCDnDZPK92loLKLFNi+hT1GCxIc/4CgrcgQoW14zJ5Pa2LhDuTk+ff1v
         JL2A==
X-Forwarded-Encrypted: i=1; AJvYcCXLhzxlk/6lvXHS9HEvVCqz0d3HI10aG3SwRR9oimGaDoAbUXkABmjeRsOkFwV2xgmoRD8i155VwBx1L5jWOaTClj+lrU9sYsCb
X-Gm-Message-State: AOJu0YwE3ht5zRGz8iNJceeCs83/apgwCvt9fUk1as+p/NeBReCgPw8M
	PLCc1Mb+rdcNSZySOjfs0yKKSHa4fEKmaZEt+MEcKGRDg7CJy6lctEl5/kaLIk2AzcBjYG3/QlY
	tLM3kVJ161kYeuybZ5ACwYnkvzQ4=
X-Google-Smtp-Source: AGHT+IElF3ZmsF/UZZmciKICTRF0tVKH1FlmanClYcKnNCykO8fe5zgcdlKUGncg2VtmknVLqUUnZ1I6zfZpMNuaiwI=
X-Received: by 2002:a17:906:b154:b0:a3f:d1e3:b906 with SMTP id
 bt20-20020a170906b15400b00a3fd1e3b906mr5248808ejb.25.1709039844684; Tue, 27
 Feb 2024 05:17:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226093854.47830-1-lukas.bulwahn@gmail.com>
 <a6e683f5-3088-48ef-9930-93c95e85c5ce@gmail.com> <CAKXUXMz1HLYKo=D4UrtPDf3GO4VjxXmU1xtYm_aZ3tXo6PrekQ@mail.gmail.com>
 <e5bf0fd4-9eab-48ee-b56a-7137c528d9ff@oracle.com>
In-Reply-To: <e5bf0fd4-9eab-48ee-b56a-7137c528d9ff@oracle.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 27 Feb 2024 14:17:13 +0100
Message-ID: <CAKXUXMzh4hznQNL+K_PrtJ-Ug1p0Q-JGOsTmAt=6fi4d07YOFw@mail.gmail.com>
Subject: Re: [PATCH] docs: freeze some package versions for sphinx virtualenv setup
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 9:41=E2=80=AFAM Vegard Nossum <vegard.nossum@oracle=
.com> wrote:
>
>
> On 27/02/2024 09:24, Lukas Bulwahn wrote:
> > On Tue, Feb 27, 2024 at 7:57=E2=80=AFAM Akira Yokosawa <akiyks@gmail.co=
m> wrote:
> >> On Mon, 26 Feb 2024 10:38:54 +0100, Lukas Bulwahn wrote:
> >>> Akira-san Yokosawa reported this already in January 2023 and Jani Nik=
ula
> >>> was fast in providing a fix (see Link). This however remained as a th=
read
> >>> on the linux-doc mailing and was never turned into a patch for Jonath=
an to
> >>> pick up.
> >>
> >> Have you read Jon's message in the thread archived at:
> >>
> >>      https://lore.kernel.org/linux-doc/874jf4m384.fsf@meer.lwn.net/
> >>
> >> I think you can see why there had been no submission of a proper patch
> >> in your patch's direction nor others.
> >>
> >> If you still want your patch applied soon, you need to convince Jon.
>
> [...]
>
> > Hence, I proposed this patch here. It works (for me). But I do not
> > care if it is picked or not---because I am just continuing the
> > whack-a-mole game. As of now, I do not know how much work the better
> > solution for "updating to recent versions" needs. I will spend half a
> > day and hopefully I can then present a good working patch. But let us
> > see.
>
> I now locally have a file requirements-2.4.4.txt that was the result of
> running 'pip freeze' in a working Sphinx-2.4.4 virtualenv:
>
> alabaster=3D=3D0.7.13
> Babel=3D=3D2.14.0
> certifi=3D=3D2024.2.2
> charset-normalizer=3D=3D3.3.2
> docutils=3D=3D0.20.1
> idna=3D=3D3.6
> imagesize=3D=3D1.4.1
> Jinja2=3D=3D3.0.3
> MarkupSafe=3D=3D2.1.5
> packaging=3D=3D23.2
> Pygments=3D=3D2.17.2
> PyYAML=3D=3D6.0.1
> requests=3D=3D2.31.0
> snowballstemmer=3D=3D2.2.0
> Sphinx=3D=3D2.4.4
> sphinxcontrib-applehelp=3D=3D1.0.4
> sphinxcontrib-devhelp=3D=3D1.0.2
> sphinxcontrib-htmlhelp=3D=3D2.0.1
> sphinxcontrib-jsmath=3D=3D1.0.1
> sphinxcontrib-qthelp=3D=3D1.0.3
> sphinxcontrib-serializinghtml=3D=3D1.1.5
> urllib3=3D=3D2.2.0
>
> My preferred way forward would be to put this in
> Documentation/sphinx/requirements-2.4.4.txt and then update
> Documentation/sphinx/requirements.txt to be completely unconstrained as
> much as possible (just specify the bare minimum set of packages with
> only lower bounds on the versions).
>
> If you agree with the approach, feel free to submit that as a patch (if
> not, I can submit one in the next few days), I just didn't want to snipe
> your contribution.
>

Vegard,

I tried to look into the "completely unconstrained as much as
possible" proposal and looked into what I can reduce in the
sphinx_preinstall. I have just shared the changes here:

https://lore.kernel.org/linux-doc/20240227131410.35269-1-lukas.bulwahn@gmai=
l.com/

Feel free to pick up this patch; I will probably not touch this for a
week now and just see if it works for others or if others will pick it
up.


Best regards,

Lukas
