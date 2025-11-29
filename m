Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36581EA7DB
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764445724; cv=none; b=FBCH/IGZGQ72JbAn/5/BsIOrcXJshEQYTjDN77k+5wgwvCZETp+Rwn3H5HKJ5vLax/qvxBvIazmD7fdVxSXLP0xReOZZe7zTOYmBg5qrL5upCQepwohFgJBiYHTr3evWf9D0KYHWwJqmiW1EYykAd+p6ejT3pph1BsIdFsS7auY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764445724; c=relaxed/simple;
	bh=FvnB858yBC1J0pt7vj0LsIOHEafXPTiu7LsXlJJcg5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbJcUN4axjmwB89P2TKNfac5kwNXqIxZNagy8CI0NFxokYN5sOSQ9MVqQI9bCyKaUurfFwsiya67PpxAnEIAGfX+1ilByt/Zb+zUlXy3r417FDQqd1c5Wf2MH1NF1hNoscPqSMJHXBTE/xU0GbVKnINsu0cXWaJ9BrruENNa/EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=XIckq9bd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XIckq9bd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so4807005a12.1
        for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 11:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764445721; x=1765050521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvnB858yBC1J0pt7vj0LsIOHEafXPTiu7LsXlJJcg5k=;
        b=XIckq9bdeFf6oAvD7msi/4Mf7LFc3AIVourkgk0WDc2Wm7ThEkM70d2fODO6z+Qjcm
         1g1UjPJWr2q/G9r2On3r3IeWL4kxKHXuVWPvVJcdQ2B7Rxl3KoRj2jRUFzhnUulN1INk
         9QU4E6dQK/gDf1FCZxJP6qtcizxM9VG/1+BurpywNpHzH3cS9pjh+ftrMLzQwjsLHlHt
         WYjzxAYsCRzDMYGo9jHvp75CZlH14UFiJydZuVc1UUp2jJruM1J4F/o8GhATu2M6RVfY
         BDD2+pYnieTIw/GkhnhhIZK7QGVqcQQWei4eZZX+8pTq2SOTppF1PizmgL4VEuCbov7E
         xzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764445721; x=1765050521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FvnB858yBC1J0pt7vj0LsIOHEafXPTiu7LsXlJJcg5k=;
        b=l1GZ5jtzQiCKsK1aUOwB1oTOAiVIGV0cZfgy/WymfdpQzzcbyw2x1T2oyfnaeZD9rZ
         Oyc9r+fBQt722NZMxKFs8+SspHCp1VvWRZRDEgNNL5HWSzEdbdJ3+d/3sEq/dy06kIVF
         PcE4ysx4HcWhi4rygef0UzecZs1ks/mdHX87FDlf5fx4EjFy0c0paM9KQfAgVbRhxztj
         kD9zslBz5NzdTAO2Uk+D9hBelfJXkXAvrlIkwvbGkyOZxZ5FiDmT816Rr8HWrTRNpy3f
         M9FDkRfkuUMbZL9195omZYj/71SaasxQzc5HGxRZx33bq5uiZRtOh9lFjoZnx4Sn7GL9
         uyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAp8i056qntsSBgRexKgNuIRSGW3UteKsVcKA1mOdPsHDKKJJCpWHB+Z2WP/TD+enVNghfYKKurc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPwAIKmyPhLiU/pSiwze5CFb96q9kzP2lQXlYX0OKdIHDuLNl
	lgfYGGPm/357e7WwlcrcJO0atp13ZxH7xrjM1HoYWeMLXlMvjCla3I0VvkJ7WnO83L0SAmYDuaZ
	WQnTthkJeO5y4PQzod9W5kM+brWfbaKr5pv7FbsEpLo+THIUNdqy3LSo=
X-Gm-Gg: ASbGncuz8VjevEkYfgm6uKxLHcFuGo8760QWMcBT8mCfZooBYi3yojIzuFDTaies/ka
	uDApF7RbmoSlkTt5cwVnwOphT3xKjpYF0enoTOGTIg7Dc+WGBbhh7aJnLr5yW9uatQtemxKYupD
	o1lDynw8F3DhFHmVAxp+2pOV4JF7rF9QzF9ViMMulH0j/f5mmj76g/M8+i9GPq2wM4COpWj3l2R
	iHzpbRKQHvv0kPZc3kTdbDVgSJOWbhfTYaOaB6ZAwZ2xLUeKc1sdy1a7/KEJHuzjNnyHsS1/T4O
	c1I=
X-Google-Smtp-Source: AGHT+IGhdc7jpzZXbXzx+5ElHkJeGrvp4qZaRisqTJjP2qnsBtMcrab/nIjZx21bI1RZAQ8c6oAhKLXIxmDs2rQnWOM=
X-Received: by 2002:a05:6402:274f:b0:645:cd64:31c5 with SMTP id
 4fb4d7f45d1cf-645cd6431f3mr20056802a12.26.1764445720596; Sat, 29 Nov 2025
 11:48:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
 <20251126185725.4164769-3-pasha.tatashin@soleen.com> <CABVgOSkPMugdzjRoL9-NyJFWM3KJbUhoTG3BswbAqjyod4NbOQ@mail.gmail.com>
In-Reply-To: <CABVgOSkPMugdzjRoL9-NyJFWM3KJbUhoTG3BswbAqjyod4NbOQ@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 29 Nov 2025 14:48:03 -0500
X-Gm-Features: AWmQ_bkfURTHz40LLAhwd6J77GcKxmYlVd_cOa8hnPhfKNjpPXex3xo5z94pM3o
Message-ID: <CA+CK2bCOuPGvtcDx0P3a8CZ6EmnjzFfF=gJehpafNNBHX9reWg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] list: add kunit test for private list primitives
To: David Gow <davidgow@google.com>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, kees@kernel.org, pmladek@suse.com, 
	tamird@gmail.com, raemoar63@gmail.com, ebiggers@kernel.org, 
	diego.daniel.professional@gmail.com, rppt@kernel.org, pratyush@kernel.org, 
	jasonmiu@google.com, graf@amazon.com, dmatlack@google.com, 
	rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 2:47=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> On Thu, 27 Nov 2025 at 02:57, Pasha Tatashin <pasha.tatashin@soleen.com> =
wrote:
> >
> > Add a KUnit test suite for the new private list primitives.
> >
> > The test defines a struct with a __private list_head and exercises ever=
y
> > macro defined in <linux/list_private.h>.
> >
> > This ensures that the macros correctly handle the ACCESS_PRIVATE()
> > abstraction and compile without warnings when acting on private members=
,
> > verifying that qualifiers are stripped and offsets are calculated
> > correctly.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
>
> Thanks -- I'm glad to see tests added with this!
>
> I'd be okay with this living in the same config option as the other
> list tests (LIST_KUNIT_TEST) if you'd prefer, but don't particularly
> mind either way.

I prefer to keep them separate just because they work differently. The
other list tests emphasis on runtime correctness, and here emphasizes
on verifying ACCESS_PRIVATE() does not generate compiler warnings.

> Reviewed-by: David Gow <davidgow@google.com>

Thanks!

Pasha
