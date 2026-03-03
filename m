Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B34921A4
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553075; cv=pass; b=AZq2uLl5O362D6w/f4l1E2jF9tAja8ak2aixDTYscsvDFks/7qmmb7aV5QVByLvgbnfcaqL6kjGTUznaIoG38U+CfhPdScILkf5t6kknF3L1iM9ZG5+Aia1im1itF3F50f82L17RpU7V9MzIQSjrVSI9d0rfnrdZPj1rXQjwoP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553075; c=relaxed/simple;
	bh=dq+MkDWvVYX4QZZAfgYCSC5ilLlxZ4vgS4PEDXlagew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKOSeTxvPL61kfwWR6A7qdmRY3xFlWQc0XMo033kXbKIDjsKvSs9lYgO7jyURFxfvqAIESBaXOa316urOgjZr+sLDSgUeO5Q4EslKQPkbYOr/11ORv9XjuB3ydFYKVMOIw/k7HNKCNshrg4O0dz1xeII9bVNnOGy9IkjqC25Now=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CRiikqoJ; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CRiikqoJ"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899e85736e2so30647956d6.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 07:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772553071; cv=none;
        d=google.com; s=arc-20240605;
        b=aztYJu8hv4dv4SGFv8wouefzwD0YDOHyINk8ZJ0p1QVz7mMuyMBCJ9nTXdwUDCdP2w
         iGg4IkGPCNpxTT8WmwKi1BABCPsHQCUlaztjbtyme5g4muQ+nEWSnXyVyjUcUAEtyelU
         57Fl1d0tWVPsrcoe1dE+IX3Mxvg+4gd0rZ4fVc3iO+DNJcmmq4jJprruCZLpANnQk25i
         V/dTTZX/QBAVFuZ8Ke3gjA4feYBzBuIAFXYd42tGacvotT0lWisFTEzRrUKLZgXKl0pp
         +oYqtAr+X3JpLt/LOXCJZuS+5zu4wYDZCmQoV6nW9IjcVgUG40kN7S6dxcwC1127kQII
         h96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XX2std0eOKpVnxlasP7zVX+3pxODM6r50zuPsQkksH0=;
        fh=o54MULZK+yGlWs32dBNK2XkpdafIcnwsIHhfS6N8Zjc=;
        b=Uhk1mSDJvzwrIWN72RbGZ904UTdo3flzq/4YMmTFMExKbRoeymLly+fnE3XBugikeW
         1vAfibxJ+ho/QBCPf+LNXLGsXUL35NOgIMHQXb1IxwktZJretosHh38pLiR75/zlgNdS
         ziLvB66TnHYWPt/f9/97ntE5Xorc4azBmSoR6WnB94iBNjoZuWuTtx0RRHLmdcIr3Cj0
         POGTnY/hgFGhUNJAs7lmLCgLxFyiOCZbb1A3jKoDd6U10xF3M1JRc5+rR3jYhF5Du/6c
         6CJ8ZlBB7c5/6GhvZf6ilZ+eDjPJASlrmqws4THCH3bL4bRnwg3vRkqHGwktRHcEajGw
         Viiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772553071; x=1773157871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX2std0eOKpVnxlasP7zVX+3pxODM6r50zuPsQkksH0=;
        b=CRiikqoJtjZ/ZSBNbyfKQ74VE9E0aHxRb9EbyiNAj5K83T3WHTVDjA1g7SIQQ3/Qq5
         8V6lEzloxWOafapRc5u+x8ykL7HH7gAocxTcU8UHLUcA1e00kpv7pWinBMI93RHj5e7+
         Dh9M1ibK36zbofQGIdDt9l76A1GCKiNLCt2oKTX14AQWP1rBDC4kjwXDc0MQipaskApb
         EaO5gYxk36KCp8/Z6nCPg75n9fhKGqjaB1QwQeMI152PfXwW4rqdXLDnCTZI211B06rD
         JxEq458i0UGFCO8HHT9u3x27hdpUx3IQJZqHvKR4ufcBUEVQwsXmAWMzQ45fK1fdcAFx
         T7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553071; x=1773157871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XX2std0eOKpVnxlasP7zVX+3pxODM6r50zuPsQkksH0=;
        b=Lft0/2a3u8uW1YjVSrCPA554WKjx/qyheJz5Xo19xpTq1cb756SU9BDIrAFLnsjiF0
         HQcfAwH5ssdU9dvmiTrMf2awD+6j6pFkEIjLnug9hheF3UxJriso3Vk2GERSEvFsjJq6
         XGvDiasCiLP+C8GxwKsGQmDgSox0kSgHgRiHXCaH3l3uSgXl10+SBwisf2sVhlVL9MJn
         zPJE09Omb8oDMsf1HP93XGUopaxEuVAw5SoA1i8J4qjWOD7fEJxPVN73e+mgEgACgmF9
         RzxwDxsTecf5GqwyTWDqWKJFMrJDVLENjy0eOzm5pDFVPB03Tmt1KdsShuMxYNKpC2y1
         VUlg==
X-Forwarded-Encrypted: i=1; AJvYcCVBZDkUE92T+4tvkWwXkR7Vic39yWuMjdlKV/JMbM6oAUQ+7zY9LliUeIuktGanwyDVQI7FsQjZgfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1G1lXes+hTGj/8jPd4/UElgO0/C/dZZTLCfyPlL7tG7uoqEgd
	MYqeYZWJV6afMURR0+7qyTND8GJaaACUeeg8bjfATCsspbD5fgKcL5YL2Uz5cJhEgRw+JKfKk4h
	tnIh+5OuJpyPNIzvckuyCsu50mggt5Qi3Md/dDekv
X-Gm-Gg: ATEYQzz4s3ijkfr1pg0M89rUR81vLnq0MV7W96IdBywlb8GiRv+L1DygtQxfkNcQUmV
	cqshJmquTZK1uBxQWNraA92/p0xKq6dnKaNsIC290z7M53rldX/fsQyv8jbQzNLExW7rA5uYHzR
	/4ig0z49ByMU81+DhTMBL/TVUILxYYOlQPe5QY73+NT0ljvCbJjF+61AVaVRAaAXBmO7tXHvT3m
	wC91ZnDLe/dU0Hvsme30KQePQdY3e1Mspfxb2UIqAE2VXgeR2fdSZ+99/gZPN5MnsSdlirsneV1
	rvR4V89XZyPlQUFIfzTHtTnO8gPhT6BuEbZG+Q==
X-Received: by 2002:a0c:e083:0:20b0:899:a655:1e1c with SMTP id
 6a1803df08f44-89a0a89f981mr24703846d6.18.1772553070977; Tue, 03 Mar 2026
 07:51:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com> <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
 <CANpmjNNfz9TQcnZWkTXEAzVNdUAAYfBv0-FB-e7oV5PCfsYR5Q@mail.gmail.com>
In-Reply-To: <CANpmjNNfz9TQcnZWkTXEAzVNdUAAYfBv0-FB-e7oV5PCfsYR5Q@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 3 Mar 2026 16:50:33 +0100
X-Gm-Features: AaiRm50oFjbSzRbajGzbxbdZNPrSH3B1_BNVoEG05ijQc5OU5p9gEg4qp---aio
Message-ID: <CAG_fn=VczquLYh0zs-Rh51=B=J0k9EUtdoqrKncKy-n5jHxFEg@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:23=E2=80=AFPM Marco Elver <elver@google.com> wrote=
:
>
> On Tue, 3 Mar 2026 at 12:20, Alexander Potapenko <glider@google.com> wrot=
e:
> >
> > > @@ -830,7 +835,8 @@ static void kfence_check_all_canary(void)
> > >  static int kfence_check_canary_callback(struct notifier_block *nb,
> > >                                         unsigned long reason, void *a=
rg)
> > >  {
> > > -       kfence_check_all_canary();
> > > +       if (READ_ONCE(kfence_enabled))
> > > +               kfence_check_all_canary();
> >
> > By the way, should we also check for kfence_enabled when reporting erro=
rs?
>
> Not sure, I think it might be redundant - I don't see a way we should
> get to the reporting path if KFENCE is disabled. And if there
> currently is a way to get there, we should check kfence_enabled before
> (such as in this panic notifier now).
>
> > > @@ -1307,12 +1314,14 @@ bool kfence_handle_page_fault(unsigned long a=
ddr, bool is_write, struct pt_regs
> > >         if (to_report) {
> > >                 raw_spin_lock_irqsave(&to_report->lock, flags);
> > >                 to_report->unprotected_page =3D unprotected_page;
> > > -               kfence_report_error(addr, is_write, regs, to_report, =
error_type);
> > > +               fault =3D kfence_report_error(addr, is_write, regs, t=
o_report, error_type);
> > >                 raw_spin_unlock_irqrestore(&to_report->lock, flags);
> > >         } else {
> > >                 /* This may be a UAF or OOB access, but we can't be s=
ure. */
> > > -               kfence_report_error(addr, is_write, regs, NULL, KFENC=
E_ERROR_INVALID);
> > > +               fault =3D kfence_report_error(addr, is_write, regs, N=
ULL, KFENCE_ERROR_INVALID);
> > >         }
> > >
> > > +       kfence_handle_fault(fault);
> > > +
> > >         return kfence_unprotect(addr); /* Unprotect and let access pr=
oceed. */
> >
> > If kfence_handle_fault() oopses, kfence_unprotect() will never be
> > called, is that the desired behavior?
>
> It is - consider multiple kernel threads running into the same OOB or
> UAF. We should oops them all, otherwise this change is almost no
> benefit.
>
> > >         /* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
> > >         if (WARN_ON(type !=3D KFENCE_ERROR_INVALID && !meta))
> > > -               return;
> > > +               return KFENCE_FAULT_NONE;
> >
> > We explicitly don't panic here; guess it should be fine...
>
> Yes - it's a KFENCE bug if we get here, the WARN is fine.

Reviewed-by: Alexander Potapenko <glider@google.com>
