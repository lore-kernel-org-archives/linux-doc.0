Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF5E339B5C
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065046; cv=none; b=h9zeKEYmMaQZDEemxR/D+DsCOuuTFtmca+xbeGt2GB+3DT/IYAAc9dQMdQzN/41DvPlTRWzzG8RdpxggbQzqsZfV+y5rhGcDuCL9R//S5aOqYTdaOBorYQbSxjxfnvKgcBwPeFxQ/9fogzlUa+DynVIOp8g9LXQSbRxkTjr8pq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065046; c=relaxed/simple;
	bh=4YmHvcvZpSJVJYzfmLEbibQx5RFd/moigts2aPZXuSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhHUKaTUV/bvpYhv/xPiU+RbUe+ffosRQrvLy3BPFUqdEdRsfdPsDGt4Q3l/GFhKr18E6nyJDShNPRwJO1N/T2Zt5feGnWIEEURfjLOBLiydDVmb9OamX9vtoMCGwYwU1DUjGpiadyX0edsr+DU6hfo3Ao95BGMbEC5eQUDDuWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fjZa2+QC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fjZa2+QC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761065043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnZSOAVMKEkF8DgY+Fx3pHUy6vCFxXk/5AE4e+Z/Gr4=;
	b=fjZa2+QCNhYcEq8Q51LtvKCGxfmeYviZmFZYCtNaMEYEccveBh4fOAiAKs5Ba5KucYY+jF
	NW3IUptmgYlf+TsPKyv3iIyIaQVptiCim4Qe3tHzDq8IHEvbbpUUvkjua6dcArTSnofyED
	MnAsP0u/IyszGtO3B9+3iP/amFKysas=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-hhDDRXsENqO2dhgi5VCZsg-1; Tue, 21 Oct 2025 12:44:01 -0400
X-MC-Unique: hhDDRXsENqO2dhgi5VCZsg-1
X-Mimecast-MFC-AGG-ID: hhDDRXsENqO2dhgi5VCZsg_1761065041
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a3f6becfso1076751cf.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 09:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065041; x=1761669841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnZSOAVMKEkF8DgY+Fx3pHUy6vCFxXk/5AE4e+Z/Gr4=;
        b=g1pAofEZ7plymcHC0KkoeMNYmmmeRCMu5JMnHCDivPtpOLr0LoP/3Ihk5r/7LNQmEg
         c6keQQneFdB1SQOf5EHe0v3SRm8hfySi4qkmxH+DnCyfgBQXT3ItApgY+ISlone4Qek3
         49KpXySHIxXjbLRvXDpu+NgiACJmcwCZu68yQyr8QLQkmZafm0plf8Edcs03UyAjXnXx
         k5jAUT9FlOPnX8uNDOC+taQ2iylu1dPmIZxEnxh3FsDeBfIgdjnYM5IC0tgrzeLMK8Oi
         FKK9kMIf162YAze4FPV1029XngLdYcGVTQOed55AkXyrUsYv/zmfEjRcw+bC9ioPi6ug
         i5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUxO9pzIacqe5/xzGTw5zrjtcm2+0ii6UG5UEHikBIiWWRooEYvqlOIjC7KaC2nkUa40coZbepwahc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytmZgdnb2caBDoOB8GaHvVBTD9lrkVos0HWi2bgYNahXixICP6
	mNeSgwIozxykH7AddqpW59qQbAt62/0QggrZsa8PmFBlVf5frtybJHMNG4MGhVaxebtksh+acik
	YFWa7IPiccg/PvjGmP4uMB6K1E8INfDTIHHUrH1QbehMA34bkU6JYObay/Z6jN28quF24V2paG4
	kQyKPlocbfvh+/61YQHML26U4XZt6elIrpB6K5
X-Gm-Gg: ASbGnctlRhbvrqwVhXkPu5Soe5pqpF5EusNU/eWz0MjxCBNoYKnsiZSGJ4WuhdAviwO
	scHxClx484EBTdbDuZRTyYC8kMq2/PJzVmQS1efpF7YdFvpj9uSr6lZ3OkA63jpQspBhCU0uWVp
	orWhcpPtuVcGS7M0IpA91aXLp0lV6UgynuInKnEgyF/h+eyQYD6CdDqO62WzvLtJApvvS04cPPW
	VcDs6LuPcm7jdw=
X-Received: by 2002:a05:622a:8d:b0:4e8:a8dd:9ece with SMTP id d75a77b69052e-4e8a8dda588mr204964251cf.73.1761065041340;
        Tue, 21 Oct 2025 09:44:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAfDFlGk7bvGv6JgbTw1zj++uENryqhdqzCaeJw6qYcicQPAK2zyOIVO/t/8no07sO0cLtemg82e5bbZzJhxI=
X-Received: by 2002:a05:622a:8d:b0:4e8:a8dd:9ece with SMTP id
 d75a77b69052e-4e8a8dda588mr204963971cf.73.1761065040848; Tue, 21 Oct 2025
 09:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910170000.6475-1-gpaoloni@redhat.com> <20250910170000.6475-2-gpaoloni@redhat.com>
 <878qifgxbj.fsf@trenco.lwn.net> <85166a8a-ad54-42d0-a09f-43e0044cf4f4@redhat.com>
 <CAB=6tBQP3aCDWch4ZcEYMqFsJ4OKXSyC_hb9V9hA7ZZty7vFeQ@mail.gmail.com>
 <042629f9-f295-494e-8fbd-e8751fcbe7c0@redhat.com> <CA+wEVJYLF9T21-V2k0Y0zxcF0zcRG64QUVrM=qHDWHz7+4+ptw@mail.gmail.com>
 <dafcdb6e-be12-4b86-959e-8510a9622358@redhat.com>
In-Reply-To: <dafcdb6e-be12-4b86-959e-8510a9622358@redhat.com>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Tue, 21 Oct 2025 18:43:49 +0200
X-Gm-Features: AS18NWCBpqAbisvSgvvqFRL4j0rCUfXKUoQLmxvhLRhTM9VY1KibLNsIgwn639M
Message-ID: <CA+wEVJZS5GErRThB7wvQ5pDoVo_j=pKD4neN-U2qJEnTgHRYXg@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 1/3] Documentation: add guidelines for writing
 testable code specifications
To: David Hildenbrand <david@redhat.com>
Cc: Chuck Wolber <chuckwolber@gmail.com>, Jonathan Corbet <corbet@lwn.net>, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-mm@kvack.org, 
	safety-architecture@lists.elisa.tech, acarmina@redhat.com, 
	kstewart@linuxfoundation.org, chuck@wolber.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 6:34=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 21.10.25 18:27, Gabriele Paoloni wrote:
> > Hi David
> >
> > On Tue, Oct 21, 2025 at 5:37=E2=80=AFPM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 20.10.25 23:02, Chuck Wolber wrote:
> >>> [Reposting with apologies for the dup and those inflicted by the brok=
en Gmail
> >>> defaults. I have migrated away from Gmail, but some threads are still=
 stuck
> >>> there.]
> >>>
> >>> On Mon, Oct 20, 2025 at 7:35=E2=80=AFPM David Hildenbrand <david@redh=
at.com> wrote:
> >>>>
> >>>>>> +------------
> >>>>>> +The Documentation/doc-guide/kernel-doc.rst chapter describes how =
to document the code using the kernel-doc format, however it does not speci=
fy the criteria to be followed for writing testable specifications; i.e. sp=
ecifications that can be used to for the semantic description of low level =
requirements.
> >>>>>
> >>>>> Please, for any future versions, stick to the 80-column limit; this=
 is
> >>>>> especially important for text files that you want humans to read.
> >>>>>
> >>>>> As a nit, you don't need to start by saying what other documents do=
n't
> >>>>> do, just describe the purpose of *this* document.
> >>>>>
> >>>>> More substantially ... I got a way into this document before realiz=
ing
> >>>>> that you were describing an addition to the format of kerneldoc
> >>>>> comments.  That would be good to make clear from the outset.
> >>>>>
> >>>>> What I still don't really understand is what is the *purpose* of th=
is
> >>>>> formalized text?  What will be consuming it?  You're asking for a f=
air
> >>>>> amount of effort to write and maintain these descriptions; what's i=
n it
> >>>>> for the people who do that work?
> >>>>
> >>>> I might be wrong, but sounds to me like someone intends to feed this=
 to
> >>>> AI to generate tests or code.
> >>>
> >>> Absolutely not the intent. This is about the lossy process of convert=
ing human
> >>> ideas to code. Reliably going from code to test requires an understan=
ding of
> >>> what was lost in translation. This project is about filling that gap.
> >>
> >> Thanks for clarifying. I rang my alarm bells too early :)
> >>
> >> I saw the LPC talk on this topic:
> >>
> >> https://lpc.events/event/19/contributions/2085/
> >>
> >> With things like "a test case can be derived from the testable
> >> expectation" one wonders how we get from the the doc to an actual test=
 case.
> >
> > Probably it is the term derived that can be a bit misleading. The point=
 is that
> > we need documented expectations that can be used to review and verify t=
he
> > test cases against; so maybe better to say "a test case can be verified=
 against
> > the testable expectation"
>
> On a high level (where we usually test with things like LTP) I would
> usually expect that the man pages properly describe the semantics of
> syscalls etc.

On a high level yes however there are two issues:
1) even the Posix standard define the behaviour of certain syscalls as
implementation specific
2) if all the details required to write testable specifications were mainta=
ined
as part of the manpage, these would become unmaintainable

For this reason specification must be broken down over the code in a
maintainable way

>
> That also feels like a better place to maintain such kind of information.
>
> Having that said, man-pages are frequently a bit outdated or imprecise
> .. or missing.
>
> Anyhow, I guess that will all be discussed in your LPC session I assume,
> I'll try to attend that one, thanks!

Sure Looking FWD to see you there

Gab

>
> --
> Cheers
>
> David / dhildenb
>

