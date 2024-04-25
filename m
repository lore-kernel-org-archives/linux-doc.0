Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7E2B9D9;
	Thu, 25 Apr 2024 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064931; cv=none; b=Wy3v4eKEQc1vDjIz5bw4zxEx/Z9NvePjc9j222jYDzUbZVcUlGoGebC3juh0NuxMQ7xZardxUqv77pzHIGDnPmtqEpE64ZBMGk8M1DPfhOU8yiZxJyOjiZ31JQB+XJ1n867FOI1CS/WUT8fRfYxWHh81MqCGwI7ndXoGFooX0yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064931; c=relaxed/simple;
	bh=LB6PxUT2FVg9BxOIRwoGod1p+J5wXmryaH+IXVj+ZtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aT+jnDDIsyxiJnfmQ6LGNkvgo+hIan+P/y1gdAUmgeIiynouV2ZQe1UHrbXNhrQY6EdVRkkq0RpPNSLPnrdGkHb6QR/MxVHfrsSFjzLO6Ry0JSy7TdZbXPT9RwN1n4lOuPlrUbule7JuGwqSQMxULPg+mD/APFi4sHZHFIMIqj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW7fhOih; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW7fhOih"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34c1fff534fso471422f8f.1;
        Thu, 25 Apr 2024 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714064928; x=1714669728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/YfpLjDg/V9+k2ejtPmLdCvlg7wyMi25Eix385icIM=;
        b=IW7fhOih3R+JQVOnn8JPL8m/X1P+ls2r4/YbQbxpIX2ZCXR10Q3Xbf06IDzzshcx8O
         3kjLX9MSL05Xp8m4gQh8GRlT3M4/1mPiNBORgjyJCnYWMF23Hsb8z64W+qAEe/Vz13BY
         TANz2DlvgTAI0wkviqb5BQpl+nEBLqG+iIGMf7iVp88j4i4r+ww0VqrVSwz+5++3yzFX
         VEbo/nds5e1kHL6O+2pA/3ztaqOxoq73QuOBYRC9tkP9omh9t4wXZVESzRuStZTxcq8w
         gHJpljgzZqa3QLvuNRNl9XTDbUAfobojV20GCfR8O3KoaX4ttEUjcki8Q1ZWN1C2SD+y
         ztjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714064928; x=1714669728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/YfpLjDg/V9+k2ejtPmLdCvlg7wyMi25Eix385icIM=;
        b=naVLPV3tvXTO12OSGyR05Oed6SVTu7sDkTKJsqxoW8y/MY1GtynrjUwe3wIyyhSC2o
         OgfHUJeg/XCXp3aEhMuBqMxA9zgOcMDmBvabhgAYvtS3S1q9pZ6oZqhXBAiancxyu4fg
         WIUhNbxXZ+qLCqmd21E7G0iGYlXAEhX+Mi7d68Iff54VdyMRGkgRY9uABNyEFKqw2MY3
         fP4ww0BbqHL1XYUVNvf0ZU+eHoEwx9v+xMHhF9iQQ7bFJHLH8OPvZ6UwrqQYWd4CSOe3
         jC7gn+aIk0Gf59lohG14eC5aYx7Mk1kCxsGGUEGrJ/uGSUUPh7SkNACPDnzaYyLtx5ie
         Jl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXofyXEEx7jb/Vubby7H6B5NGB55Qa4VfyQxCFqfO5Db8rtnAz3e1hKClZgmhBqwDsdlyFZ6bUoKnvHenZ0hiQoC6G+kQjGBrb5KXdURl8tPByEAxqWdpoNu7xqr4QJ4MoA1s63qHaj
X-Gm-Message-State: AOJu0Yys/3/bog7TZJQYoUYfdM9owEkpRwn58sZeBiLQwOU4N5JB690X
	4fw7Yd9AGmP0ljOQTOVQ4+J1Ro7V5T/KtU0Jne9ExPnqAcUP9rgiAYfoHu6Q/94KvAwgYyMcSM+
	QQruomoYk6HCX+3CZJJ1X2NiA4zc=
X-Google-Smtp-Source: AGHT+IEOkApi/wJwZZIW/sKnNji1+qRr4vvysLSEY7UFpWR3I4ldIZUW7FZruGfdtOWSE4i5rv1bd3JxqQMEplgA1GI=
X-Received: by 2002:a5d:4707:0:b0:343:eb6c:ae80 with SMTP id
 y7-20020a5d4707000000b00343eb6cae80mr89901wrq.28.1714064927724; Thu, 25 Apr
 2024 10:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFkJGRc824vYEufG=6ZVPAW2iVpd0NDThJadZVrUk_ZND_qJag@mail.gmail.com>
 <Zh6Xbqijp8rRGo1H@archbtw> <CAFkJGRe+UpNPSnSL623o6G+NCkK_uGPx-NCNLQx0vSGpMo98eg@mail.gmail.com>
 <CAPzh0z8RySn429XYQHoP_c9UA+pb6SLHGhH40vQDhc3P2xiysQ@mail.gmail.com>
 <CAFkJGRfK=1f8tfWO8G0v8SOmCwCgK7P5y7g2My47VG6Obb1DNw@mail.gmail.com>
 <ZiE9ydgMtpKOBLDk@archbtw> <CAFkJGRddGHK0j4CcQUoRKiD3afniLY=rRV5npY5wpauqqY0XZg@mail.gmail.com>
 <CAFkJGRdFuMoO4_mR-cR1NWjKQJnopN0v1R11-jSnLn+FKcOCdg@mail.gmail.com>
 <CAFkJGRcg+ThJ-xUve0=WorChW=-6PreLHXeM8YwtwzwpkHTu8g@mail.gmail.com>
 <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw> <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
 <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com> <CAFkJGRe7DVpcr+VKouTYzBK5r905W4xmxphU11AA6uB8Oj5FJQ@mail.gmail.com>
 <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com>
 <e47385b9-cbab-465e-8c8d-3bbad57415aa@amd.com> <CAFkJGRfPinGR30oRJNxiYpib5JCaA3f5D672noR-x_3Gq2UBSA@mail.gmail.com>
 <87o79xqxtp.fsf@meer.lwn.net>
In-Reply-To: <87o79xqxtp.fsf@meer.lwn.net>
From: Josh Marshall <joshua.r.marshall.1991@gmail.com>
Date: Thu, 25 Apr 2024 13:08:36 -0400
Message-ID: <CAFkJGRf+K7iGY+TJQu3RDuUv_Xna4BMZmEfeuhHJ0JPg3KQmTg@mail.gmail.com>
Subject: Re: Feedback on my development setup
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Bilbao, Carlos" <carlos.bilbao@amd.com>, ngn <ngn@ngn.tf>, linux-newbie@vger.kernel.org, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, pranjal.singh4370@gmail.com, 
	"bilbao@vt.edu" <bilbao@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the double post to some of you.  Mobile Gmail silently
converted to HTML and caused some problems.  Content is otherwise
identical.

On Thu, Apr 25, 2024 at 11:14=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Josh Marshall <joshua.r.marshall.1991@gmail.com> writes:
>
> > Hello Carlos,
> >
> > This is a generational shift.  For my peers, we understand the benefit
> > of keeping everything in a thread.  But at some point it becomes so
> > verbose and cumbersome as to defeat the purpose.  The size of the text
> > I'm working with and the number of text changes it has seen meets that
> > level.  And so I've kept it in git and referenced that.
>
> Nonetheless, you are trying to engage with the kernel community, and
> will have far better results if you follow that community's norms.
> Those include sending patches by email and not top posting.
>
> They also include listening to the advice you are being given.  Like
> others, I appreciate your efforts to improve our documentation; it
> certainly needs it!  But please think about improving the *existing*
> documentation, rather than creating yet another file, disconnected from
> the rest.  We already have far too much of that.
>

I cannot abide by this.  Not out of obstinance.  This document is not
written for a veteran.  It probably isn't even written for anyone on
this list.  It is meant to be much more approachable than that.
Comparing to the closest existing document at
https://docs.kernel.org/dev-tools/gdb-kernel-debugging.html , the
difference in intended audience and skill level is stark.  Let alone
being able to find that document since it is so buried relative to the
intent of someone trying to get started.  I have heard several times "
you should rather improve existing docs" but without really breaking
into all the implications that 'just' doesn't help.  Given the back
and forth required to express the finesse here, I am willing to have a
phone or video call to get this right.

> Thanks,
>
> jon
