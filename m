Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963891F584C
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064078; cv=none; b=pnQxVUuAjXEhO2JAuDRDbv4qcv/w7eQ70y/4/EfnusAhobnwjaxSc8UMpR6/d/r5nR3mxfQGuWe/Rfi36IOKLYBVTnpcWzdS/uOvkFcSZG3f/pOQTPT4ycoFu0LySL315igR7aPJkh0XPDcRDtQda1UkYx1U9vNuAPheQOVUV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064078; c=relaxed/simple;
	bh=0JL2p2qr9N1wihmhv2SB4/CNeAvlfQqJRTz8Itd3L7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3LR7vedpzMAidIfQAHe3hz6pEo6gXF1rDfbdxW2o5PRNt/oytcM2Zgt78QGD1QHFIttvA3pykEeOuaXIZYhUZy5YEpFBWKeEq+EPBCv7e4RmDDW4LbMPkfxatR9MgREHmO6ZDuqKr4O4UQfYEavTIYv7+CA8x4CQ3lYwf/wRfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HePrGfpu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HePrGfpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761064075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvopacnigHBT8bombNvmTILspbaRSMSn7DFUJVL0nnc=;
	b=HePrGfpuHO0NAddAtozFro9TTREwO+F54nL37qXG2k7lTjlfJStxQvEta9+ybgZD7SmAk2
	KPVa2ai4eNz1hKabjPS514iAgO3Qx/HU1W6LMOb/1ah4PsnwQCHzt1f8BGaW+lgyetZ+NO
	aFv9EkHLSvzw1BN1LgGX44fRN/tlp1M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-_jHln2e-O1inSl5RKsLKKA-1; Tue, 21 Oct 2025 12:27:54 -0400
X-MC-Unique: _jHln2e-O1inSl5RKsLKKA-1
X-Mimecast-MFC-AGG-ID: _jHln2e-O1inSl5RKsLKKA_1761064074
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso1865171cf.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 09:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761064074; x=1761668874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvopacnigHBT8bombNvmTILspbaRSMSn7DFUJVL0nnc=;
        b=u74ZyvBsSO6It4o+C9aT171aDmj3arW4yQSybohkqMpRooC9YQzieilfGsA5VoBu3a
         6QKZvVw/Gi/azRqXg4rxYCIoAI8aSUviFPNrRt6OjQYyHYrnj8wG53YRx86gEM9J/89l
         LFJjB4Nl1/lcjXE7bXUzjF2rZE7bMYlFUcGZWEA69cNSVCRrJbRdtldob1qMy6uijHOI
         nwfq9OvhLbEZBmY/1OFNvzCVaoKbXKrK7JxwVrH4p0Trin6VWHdYtHSL3bzvabBTJvra
         niv/eAZqTVkDU05FxwEwgPB6tvMDm8ahEoGS6pGUKYoKL0vPzt7rrrcfBaeSp+cAFe8b
         WEgg==
X-Forwarded-Encrypted: i=1; AJvYcCW+/yx/Fbtv6xDO4gTqw/p4+j0AGOtHhNIJwj70L6gFSaH/nvnG4hiVfdsuj2vu12sZeNJaGrLJhmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCdK+7shHXWF34Bp9jjsECHpfH7hjJjiXXQeWJbjMOGt5fVVzx
	ov/AqtK0fu3mqCVdPT7Mos3E/c45qb0FmpbX3g0fGikReGJJzOZ/WgwX69eHBM5PHtxLSQlwGCs
	1ywuU8LyVXQLG4qMimsElSWPmPEy/ir+qwlA9qTHnU23vJMTsHCup0o3Vmn8NkMk3ctSEx5t2+N
	NMXwc+Yobym4XYkBo3AJpfiYQZA6Gr3KiEYkiw
X-Gm-Gg: ASbGncsitPhbinFMvTynM6p/NXycf1R7ZjGT1EH6TXGVSHYAQLDjKs6OJ4S0GZHoIGi
	ML6YmBIFclKmeQuwAyzM7NlibuSqjkHj3byXo/vajI4vBdKOxSJ4vsd9cGehHqKlmZHu/7JMJv+
	xYiiL9ypuJlS5E+ROxwypiHaabvDsuavmYHrdZYhtJwEqMlADOuaYBl6UbeV00QjlDzJXLERQ9B
	rCjcK5/uyhGA4k=
X-Received: by 2002:a05:622a:5:b0:4e8:b4d1:ece2 with SMTP id d75a77b69052e-4e8b4d1f832mr136116971cf.18.1761064073690;
        Tue, 21 Oct 2025 09:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+4bhTh0R0rxAhz5svf4CCiuJcWStZnahyEqAUmkhny4II2PoiiE/S+8ADSs8/XKYkUEz/fKi6H3YvlEckWRM=
X-Received: by 2002:a05:622a:5:b0:4e8:b4d1:ece2 with SMTP id
 d75a77b69052e-4e8b4d1f832mr136116461cf.18.1761064073103; Tue, 21 Oct 2025
 09:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910170000.6475-1-gpaoloni@redhat.com> <20250910170000.6475-2-gpaoloni@redhat.com>
 <878qifgxbj.fsf@trenco.lwn.net> <85166a8a-ad54-42d0-a09f-43e0044cf4f4@redhat.com>
 <CAB=6tBQP3aCDWch4ZcEYMqFsJ4OKXSyC_hb9V9hA7ZZty7vFeQ@mail.gmail.com> <042629f9-f295-494e-8fbd-e8751fcbe7c0@redhat.com>
In-Reply-To: <042629f9-f295-494e-8fbd-e8751fcbe7c0@redhat.com>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Tue, 21 Oct 2025 18:27:42 +0200
X-Gm-Features: AS18NWCYr1SX4wkTTAv1mmDjb6o7jALXBoi79rLo1c5c8AJEkanUrVwY-K7NzHM
Message-ID: <CA+wEVJYLF9T21-V2k0Y0zxcF0zcRG64QUVrM=qHDWHz7+4+ptw@mail.gmail.com>
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

Hi David

On Tue, Oct 21, 2025 at 5:37=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 20.10.25 23:02, Chuck Wolber wrote:
> > [Reposting with apologies for the dup and those inflicted by the broken=
 Gmail
> > defaults. I have migrated away from Gmail, but some threads are still s=
tuck
> > there.]
> >
> > On Mon, Oct 20, 2025 at 7:35=E2=80=AFPM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >>>> +------------
> >>>> +The Documentation/doc-guide/kernel-doc.rst chapter describes how to=
 document the code using the kernel-doc format, however it does not specify=
 the criteria to be followed for writing testable specifications; i.e. spec=
ifications that can be used to for the semantic description of low level re=
quirements.
> >>>
> >>> Please, for any future versions, stick to the 80-column limit; this i=
s
> >>> especially important for text files that you want humans to read.
> >>>
> >>> As a nit, you don't need to start by saying what other documents don'=
t
> >>> do, just describe the purpose of *this* document.
> >>>
> >>> More substantially ... I got a way into this document before realizin=
g
> >>> that you were describing an addition to the format of kerneldoc
> >>> comments.  That would be good to make clear from the outset.
> >>>
> >>> What I still don't really understand is what is the *purpose* of this
> >>> formalized text?  What will be consuming it?  You're asking for a fai=
r
> >>> amount of effort to write and maintain these descriptions; what's in =
it
> >>> for the people who do that work?
> >>
> >> I might be wrong, but sounds to me like someone intends to feed this t=
o
> >> AI to generate tests or code.
> >
> > Absolutely not the intent. This is about the lossy process of convertin=
g human
> > ideas to code. Reliably going from code to test requires an understandi=
ng of
> > what was lost in translation. This project is about filling that gap.
>
> Thanks for clarifying. I rang my alarm bells too early :)
>
> I saw the LPC talk on this topic:
>
> https://lpc.events/event/19/contributions/2085/
>
> With things like "a test case can be derived from the testable
> expectation" one wonders how we get from the the doc to an actual test ca=
se.

Probably it is the term derived that can be a bit misleading. The point is =
that
we need documented expectations that can be used to review and verify the
test cases against; so maybe better to say "a test case can be verified aga=
inst
the testable expectation"

>
> IIRC, with things like formal verification we usually don't write  in
> natural language, because it's too imprecise. But my formal verification
> knowledge is a bit rusty.
>
> >
> >
> >> In that case, no thanks.
> >>
> >> I'm pretty sure we don't want this.
> >
> > Nor I. If you find any references in our work that amount to a validati=
on of
> > your concerns, please bring them to our attention.
>
> I guess, as the discussion with me and Jonathan showed, the cover letter
> is a bit short on the motivation, making people like me speculate a bit
> too much about the intentions.

Right, I'll keep this in mind for v2 and I will improve the motivation aspe=
ct
(also leveraging the response I gave to Jonathan).

Many thanks for your feedbacks!
Gab

>
> --
> Cheers
>
> David / dhildenb
>

