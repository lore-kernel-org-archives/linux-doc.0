Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28F17A597
	for <linux-doc@vger.kernel.org>; Tue,  2 Jul 2024 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719964523; cv=none; b=acyvpLGviUVIPhe/vf5ZryFNUMJbqrpm0UpCmXUo3NlmOtBJTgwvXiU5tYrdENOWj+zfgvUsz5KCzta6gUBbekpUhXpqn9jXi7NbpFc6evtEQyvSYQqsDNLSlr4edPNT/OGhbnVTvpG5nNZx7vSoe6+0Rp8Samn3RXH9QdS1M8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719964523; c=relaxed/simple;
	bh=EDhDG017HVwpVzQWhP9PCQKMPhAQILJNstvkAl8CoE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwIX70kgV8VVmBJ8dJv+C+otl5p188ux7U4s3z/j5Xe2ErMIFwyQwKeOqmrtGHIxP6JY0FfWUiJcCgDUToHC08k1lseilJlns2VHsQflLEK4ZExKca0YzEnbvYUA/psNGix9PXxHBEys2HrA/e+DPJ2Rt+T7D1lXqVmXJCJs+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kOfnbgZn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kOfnbgZn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36532d177a0so2805116f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2024 16:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719964519; x=1720569319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km4qsHJHKqda9E66CUlrx57zoiZfz1VAUkowth8QfXI=;
        b=kOfnbgZnJQnZKpp0wTPp2ABafG4jiAMe2YwLP+ImwIIzK4E+H2vxWuaZ2E1ggE6WZa
         ys+yerx3HL7vGjCBIX+5Wgk4COzSESl0ByeMRFdY9cGUkq8kLMQ6vQVaCTzcgnqPrmt8
         fw+YFuMpghh6a2bKykn0wdHjV30IkY+FwGCICQtPHJhQYgdTYGyMZSfwY6vwOAjrXrmi
         rjVzrRmya12EFOAP/WsrPASixWXcVkHXnjpm14gEjyaWkDlw3W58oFD7Jo1bEhONzgYI
         hvG+azUn74Cyemd2kJ8KkAFT2Lh/lcoYGMhiQofqY80U6e7uwJptjOXU73JxUXiUz1MT
         hXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719964519; x=1720569319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km4qsHJHKqda9E66CUlrx57zoiZfz1VAUkowth8QfXI=;
        b=bLEgDOil0srpAqRHk9CqLehaBs+yTUaFnL7YAW8q0vLVOFOMv93tKWcUtjQI2/k+Oh
         zKnCQn5s8WKgKC8G6qAO2mHhNOugXoXdKISqQkLMy1DTASCUJQNcid/eHkKTv/Kue5I7
         CvddsbD63jwid+CXwymDEynN8niRv8uL6UkmUvWi62giaFXcYMKflwj9CKZ3U6+vDKaL
         kYTBsDTA2znWx2gHSYEUcUFlT843Iu+aq1nkJtHrQm9PD9pnKSmO3Np/UwnkfootfZfW
         RnPJvx5e314layJDFVMM6ALeTRR9dizs2zPPKmco/worP9e+lUoquggWgEYdx7VRPRY9
         p8sg==
X-Forwarded-Encrypted: i=1; AJvYcCUbv2nbXdbHteXS4OwYjEWkihH1ddCNjiFvLfBMCI3mHv2iRBg0JpEpOZ++w5T4vZGTagFbR6QjgfUA/XrndGX3w7pch4f4PEtB
X-Gm-Message-State: AOJu0YxeLOl4eA++8bJEogLJCestYluCb0AUT6J/jLssrb7TqKwKA+/P
	CPRxnvSmB3eMNO9+c6zYhcdg9LvqX1LNu6+MkwA7igb3LaPwmxJtMnz+938Ds+G/ASICAdveit0
	FBouAlrmyXnTtTDASmfIWkULJr1ZPPG+ZHMWn
X-Google-Smtp-Source: AGHT+IH5zwIwvLQGEuIu/nPR6ya02EVLQ7qtQuC7shDkZz1+29oW9qpeW5xFLhHQee9ZI3BF3KCtfvvtzh6VVtGZXnw=
X-Received: by 2002:adf:f5c4:0:b0:365:ebb6:35e4 with SMTP id
 ffacd0b85a97d-367756a836amr7357563f8f.23.1719964519041; Tue, 02 Jul 2024
 16:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACw3F52_obAB742XeDRNun4BHBYtrxtbvp5NkUincXdaob0j1g@mail.gmail.com>
 <20240702230951.78721-1-sj@kernel.org>
In-Reply-To: <20240702230951.78721-1-sj@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 2 Jul 2024 16:55:06 -0700
Message-ID: <CACw3F51pPswPj=siLg1FkscMZhdELa0_46eOPUZtr5_yQc8P7g@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 4:10=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote:
>
> Hello Jiaqi,
>
>
> On Mon, 1 Jul 2024 23:37:55 -0700 Jiaqi Yan <jiaqiyan@google.com> wrote:
>
> > On Mon, Jul 1, 2024 at 11:18=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > On Mon, 1 Jul 2024 21:33:20 -0700 Jiaqi Yan <jiaqiyan@google.com> wro=
te:
> > >
> > > > > > This seems a reasonable thing to do so there's probably some wa=
y in
> > > > > > which to do it, but a bit of grepping failed to turn up example=
s in
> > > > > > existing .rst files.  Can someone please suggest?
> > > > >
> > > > > It seems I need to add some blank lines according to [1], especia=
lly
> > > > > to add a blank line above the first list item:
>
> According to my understanding and testing on my machine, it seems we need=
 blank
> lines only before and after the blocks.

Yes, as stated in [1], "The blank line above the first list item is
required; blank lines between list items (such as below this
paragraph) are optional."

>
> [...]
> >
> > Ah, sorry Andrew, I should sent out this diff, as there are more blank
> > lines needed:
> >
> > diff --git a/Documentation/admin-guide/sysctl/vm.rst
> > b/Documentation/admin-guide/sysctl/vm.rst
> > index 75e22137d849..f48eaa98d22d 100644
> > --- a/Documentation/admin-guide/sysctl/vm.rst
> > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > @@ -274,12 +274,15 @@ Correctable memory errors are very common on
> > servers. Soft-offline is kernel's
> >  solution for memory pages having (excessive) corrected memory errors.
> >
> >  For different types of page, soft-offline has different behaviors / co=
sts.
> > +
>
> So, this was needed to make 'make htmldocs' quiet on my machine.

Absolutely.

>
> >  - For a raw error page, soft-offline migrates the in-use page's conten=
t to
> >    a new raw page.
> > +
> >  - For a page that is part of a transparent hugepage, soft-offline spli=
ts the
> >    transparent hugepage into raw pages, then migrates only the raw erro=
r page.
> >    As a result, user is transparently backed by 1 less hugepage, impact=
ing
> >    memory access performance.
> > +
>
> But above two blank lines were not really needed to make 'make htmldocs' =
calm,
> at least on my setup.  Many other documents also don't have this kind of =
blank
> line.

Yes, they are optional.

>
> >  - For a page that is part of a HugeTLB hugepage, soft-offline first mi=
grates
> >    the entire HugeTLB hugepage, during which a free hugepage will be co=
nsumed
> >    as migration target.  Then the original hugepage is dissolved into r=
aw
> > @@ -296,8 +299,11 @@ the request to soft offline the pages.  Its
> > default value is 1.
> >
> >  It is worth mentioning that after setting enable_soft_offline to 0, th=
e
> >  following requests to soft offline pages will not be performed:
> > +
>
> Interestingly, 'make htmldocs' didn't complain even if I don't put this b=
lank

In fact, without this blank line, even though make htmldocs doesn't
throw ERROR or WARNING, the output html file is broken: there is no
bullet point for the list items below.

> line.  But for consistency (see the beginning of sysctl/vm.rst), I think =
having
> this would be good.

Agreed.

>
> >  - Request to soft offline pages from RAS Correctable Errors Collector.
> > +
> >  - On ARM, the request to soft offline pages from GHES driver.
> > +
>
> Again, same to the reason above, it seems above two blank lines are not r=
eally
> needed.

Yep, optional again. I mainly just want to be consistent.

>
> >  - On PARISC, the request to soft offline pages from Page Deallocation =
Table.
> >
> >  extfrag_threshold
> >
>
> I have no strong opinion about these, though.  Having four more blank lin=
es
> that might unnecessary is obviously no problem.
>
>
> Thanks,
> SJ
