Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382C414A611;
	Thu, 25 Apr 2024 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714056895; cv=none; b=Ma3cY/k6hbX1Uxu1orEjf+Dzx7xv6xHylrmtYbJKJbKscpf8PNZSG5/kLo9nbCcUvG2ZqjbT47NpHZPqWvFf9JEgP7wV1CrPpuY0kFKA7aN9cvXeWe7WcbQpuqD0SYx35JOen0seRTn0+/WxHsp2lPnFO3V+rCZCyL9ueGrUL/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714056895; c=relaxed/simple;
	bh=xgwYFz0Z0sAIKw87xvzaYKMJxHaB7/szxERzlMWadFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWwNl3U+5eKBD+MfhjAwYocPNMPykdrX/4qm9gmUEhTYilUhmJXlf9Kub/KxxJ0OBxSHxOOmkgCQPgNZnbtcjY/AFkEdcr2Hw0BVL/19QAAx+46fZpIO2m5mLLwjd7lv9y2Rsnw5P6eemd/PkKC7ZBh1Rltgmif01qL4boZ7E50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5sO1l0I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5sO1l0I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41a1d88723bso7848075e9.0;
        Thu, 25 Apr 2024 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714056891; x=1714661691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shPDAy901AEVAqXJhtYIyvQDWnUPvN9vrDAuIR4hSCA=;
        b=A5sO1l0IFfuC113Uck2rC5ZCxY3d6/vC63+HV0OyqI1OEAPnWw+8kFVH7/E+zNBFmC
         Rw6VbGh8skxEfeJuyGN0MCzjR1NKjTrjeP9/o09g8P/KC7d4AZsGHr6Oyt2viLfY2EVj
         mQWZAly3CLALfAzIqSZjptfVJbj4bEnsFjZxRrQEBISorPJ4d479zTaxbRBqpPMbhHXp
         HMzUq0eEbgzR0iJigz8K4L43zlZe75yAqary/jMQV/xd1IuRDl49OYaDfhacId9NXAkp
         o3W6G+5bDXt1a7Z0wRLumozdPslW5YJYHVcOK+lmnWKZqKBJeimJxWeoHFVUWYpPHu51
         ISuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714056891; x=1714661691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shPDAy901AEVAqXJhtYIyvQDWnUPvN9vrDAuIR4hSCA=;
        b=fVKUhezJ+cBo7+fcXXyRpC1D2vn4bmHK+REQ0c2vSYIJ86Q3nNt0bguZxxeis+chXx
         /n4vhb3+zjneYQVtohHW1Aps+fivmQhikWmaqBkBIZgW7v0HTDWVSbdH1mjq8s3vJIdv
         PAlRffOTNU+5Q3qO7p10mSv9hbRoGVQDkczBaFomOXEFywS92u7EVWj9GfdxhldwRZdD
         khztW4z48UmnP4g20rEzOej51Gnvl+ZoOtFymd5cEPl2c2Te8WmSPjhkvR3gP2spbWEu
         4OqCHtu4icqB2etkRPzSkn0cqPJHK+M0MiE4YF3WK5E3aon0ksTU9mmBpddhxO193oFl
         /ajg==
X-Forwarded-Encrypted: i=1; AJvYcCXssMm3bFx8KSEr6sENNgU5d13bdRReDtoYi7cYgSyYVw9osoU/2CHa2IWVL2YwgYCcEQt/5LALUmruY/xkuvy85ne+PIXqooANd8ov4g60aqlM91gvndWu7fCf2IKgKOc1UQ8ba4th
X-Gm-Message-State: AOJu0YwdkX94xRS3cH4BkRT0frpyLBmXcSmaahaLs/CAwJiUdEz2hxL5
	53w42XUQJZ7okd+E7gxtRVeakBj34A0XCS8rATJUiXFfzB6VrgwOvsQkJA4qFHOAIyZRuNW3BKC
	I8JsmaYprLJsP7FLhVmKwFp04yIc=
X-Google-Smtp-Source: AGHT+IF9nwPThTt8z9K+1haMbMBbCYroYJ57wiZV0/bS3R4gPAJ88du+Pg92yyC+NAIaW8A06zHLHB7eCcwjzNrUuQU=
X-Received: by 2002:a5d:5702:0:b0:34b:58a2:dea3 with SMTP id
 a2-20020a5d5702000000b0034b58a2dea3mr3938432wrv.64.1714056891312; Thu, 25 Apr
 2024 07:54:51 -0700 (PDT)
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
 <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com> <e47385b9-cbab-465e-8c8d-3bbad57415aa@amd.com>
In-Reply-To: <e47385b9-cbab-465e-8c8d-3bbad57415aa@amd.com>
From: Josh Marshall <joshua.r.marshall.1991@gmail.com>
Date: Thu, 25 Apr 2024 10:54:39 -0400
Message-ID: <CAFkJGRfPinGR30oRJNxiYpib5JCaA3f5D672noR-x_3Gq2UBSA@mail.gmail.com>
Subject: Re: Feedback on my development setup
To: "Bilbao, Carlos" <carlos.bilbao@amd.com>
Cc: ngn <ngn@ngn.tf>, linux-newbie@vger.kernel.org, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, pranjal.singh4370@gmail.com, 
	"bilbao@vt.edu" <bilbao@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Carlos,

This is a generational shift.  For my peers, we understand the benefit
of keeping everything in a thread.  But at some point it becomes so
verbose and cumbersome as to defeat the purpose.  The size of the text
I'm working with and the number of text changes it has seen meets that
level.  And so I've kept it in git and referenced that.

1) I'm sending this out to people well outside of the mailing list.
It has gotten around.

2) Ubuntu.  That's why it has an explicit callout.  However, in my
research RHEL does not have this issue.  So I added text calling out
this difference.

3) There is some assumed knowledge.  If a reader doesn't know those
commands, honestly, I don't think it is safe for them to start Kernel
development.  As stated in the preamble, this is targeted towards
upper level CS university students and above.

4) I'm considering changing citations to sources.  It might be more
representative.  There's no specific text taken from them, but there
is knowledge referenced from them used to create  the document which I
did not already possess or, in the case of the VM image, a big ol'
file.

On Thu, Apr 25, 2024 at 10:36=E2=80=AFAM Bilbao, Carlos <carlos.bilbao@amd.=
com> wrote:
>
> Hello Josh,
>
> On 4/25/2024 12:37 AM, Josh Marshall wrote:
> > Hello everyone,
> >
> > Last draft before I send in a patch.  Big change is an added preamble
> > to set tone and intent.  Also some stuff up top setting forth the
> > structure of the document.  Carlos, I tried figuring out what you
> > meant by troubles with KVM, but all that boiled down to was scant
> > documentation on use cases people rarely venture into.  I think that
> > is a different document from what I am trying to write, although I
> > might now be qualified to write it.  Pranjal, sorry man, more words :)
> >
>
> Exactly. Since you found the KVM documentation to be lacking in detail,
> that's an excellent opportunity to expand upon it. That's what I was
> suggesting: improving the documentation for these niche cases adds value
> and could be included in your potential patch.
>
> Before I talk about specifics of the document, have you thought about whe=
re
> this text belongs in the broader kernel documentation? It's an important
> part of your potential patch. I suggested incorporating it into 'A Guide =
to
> the Kernel Development Process.' Have you had a chance to consider that?
>
> > https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-workspace=
/-/blob/main/Linux%20basic%20dev%20setup.rst?ref_type=3Dheads
> >
>
> It's difficult for us to discuss the details of your draft like this. It
> would be more better if you paste the text directly into the email, and I
> can provide inline responses. I'll paste the parts I need.
>
> "
> [...]
> This document has been viewed through many perspectives from many reviewe=
rs,
> each wanting a conflicting adaptation. [...]
> "
>
> Really? According to your GitLab history, the commit "Draft 1 complete an=
d
> ready for the first round of peer reviews!" was 2 days ago. What am I
> missing?
>
> "
> [...]
> `NOTE: On some distributions, kernels (/boot/vmlinuz\*) lack global read
> permissions. Administrator permissions are required to make the kernel ch=
osen by
> ``guestmount`` to be readable. There is debate about the effectiveness of=
 this
> security decision. On some distributions like  Ubuntu, this will cause a
> problem. In the context of changing a one-off system, having this file gl=
obally
> read-only is considered safe.`
> [...]
> "
>
> Please specify the distro you used to prepare this doc.
>
> "
> [...]
> .. code:: bash
>
>    mkdir -p "$HOME/Documents/linux-workspace/kernel-dev"
>    cd "$HOME/Documents/linux-workspace/kernel-dev"
>    export LINUX_REPO_PATH=3D"$(pwd)/linux"
> [...]
> "
>
> Please explain to the reader what these commands are doing and continue t=
o
> do so for subsequent commands, as you've already done in some cases.
>
> "
> [...]
> .. code:: bash
>
>    make -j
> [...]
> "
>
> s/-j/-j (num cores)
>
> "
> [...]
> Citations
> ---------
>
> -  https://github.com/archlinux/arch-boxes
> [...]
> "
>
> Citations should be numbered and cited in the text where appropriate.
>
> > On Tue, Apr 23, 2024 at 1:43=E2=80=AFPM Josh Marshall
> > <joshua.r.marshall.1991@gmail.com> wrote:
> >>
> >> Hello Carlos,
> >>
> >> My intention right now is still to gather feedback on the draft!
> >> Everything, including if it should be sliced and diced into other
> >> places, is up for consideration.  The final intent is a patch into the
> >> central doc tree and not remote documentation.  I'll wait longer to
> >> gather more input before replying to particular points.
> >>
> >> On Tue, Apr 23, 2024 at 12:40=E2=80=AFPM Bilbao, Carlos <carlos.bilbao=
@amd.com> wrote:
> >>>
> >>> Hello Josh,
> >>>
> >>> On 4/23/2024 10:34 AM, Josh Marshall wrote:
> >>>> I have a draft document which I would like broader review on, which
> >>>> currently lives here:
> >>>> https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-worksp=
ace.
> >>>> This document is to ease the setup of Kernel Development.  I intend =
to
> >>>> send this in as a patch to the mainline doc tree once it gets by a
> >>>> suitable number of reviewers.
> >>>
> >>> It's great that you're interested in improving the documentation. I'v=
e CCed
> >>> linux-doc list for visibility.
> >>>
> >>> However, please note that we already have existing documentation, and=
 it
> >>> might be better to extend what's already there rather than creating
> >>> something entirely new. You can refer to:
> >>>
> >>> https://www.kernel.org/doc/html/latest/process/development-process.ht=
ml
> >>>
> >>> If you still feel the need to start a new document and host it remote=
ly, I
> >>> suggest updating:
> >>>
> >>> https://www.kernel.org/doc/html/v6.1/process/kernel-docs.html
> >>>
> >>> If I may offer a suggestion, focusing on documenting the challenges y=
ou've
> >>> encountered with KVM, etc., could be more valuable that trying to cov=
er
> >>> everything.
> >>>
> >>>>
> >>>> On Fri, Apr 19, 2024 at 12:15=E2=80=AFPM ngn <ngn@ngn.tf> wrote:
> >>>>>
> >>>>> On Thu, Apr 18, 2024 at 05:40:20PM -0400, Josh Marshall wrote:
> >>>>>> Looks like breakpoints aren't working?  https://paste.debian.net/1=
314501/
> >>>>>>
> >>>>>
> >>>>> This maybe caused by Kernel Address Space Randomization (KASLR), tr=
y
> >>>>> disabling it by adding nokaslr option to the boot options.
> >>>
> >>> Thanks,
> >>> Carlos
>
> Thanks,
> Carlos
