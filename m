Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0CD39FF2;
	Thu, 25 Apr 2024 05:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714023468; cv=none; b=qL7rhuXIbnARZIvUs/3OnDaa/C7qI409pvdgy46x/cSXusapPc45k/lXpGLSnf9HyJmJCNogGIUHojN0NO+/adl4ilQ9lWug01mh0pTiL+/Nb5WvkaM1N1eKbjG842mA9fJ2P5H/R+m7nigSqYNekfRtvJJvxeWsNY0D7DgCNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714023468; c=relaxed/simple;
	bh=7cXGX7nzSc9kgXdFOZd40H6dM1rb/ORldCTv+2OyzqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au6OzbWLZQgXcpxHpbPF0X1mof5uY6eWp4uLaVCy+mQH7yq3H+/2FtVhVZ/rTzT8I7XhOG86pP8bLvc98D5s8cJVQLWY85E+IElOr0Mr3fP7N9stH88lY9QkD6t1Xl8s0VYF1g0Up0L5Cj/Gte40lY9ipH7n92XT8qrsxYd4yiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuapcJvS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuapcJvS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34af8b880e8so346421f8f.0;
        Wed, 24 Apr 2024 22:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714023465; x=1714628265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPL2nbk+Q/UWy1nHnxkSFv/m9vKVttF+eKGmemIFKnk=;
        b=JuapcJvSLQy9G8YOBUY1n94aPY5t5/VGaazbDkNMWZmoxIgm7Hrz2bkv//LlMNIgGf
         UxwH0rqoFYjL6PC4j5M35xdZ9MN4pACIlwLqgnZlEDiZwH8PZGVK6EYrJUB8Y+s4S3jH
         +IivwstH7gx4FHKlunNZMp5MKgH+wY1j+ZKlRz6pwCvN02ejO0eUQzs/gvEoXwGebOYS
         8IHLuiNhPySXaN40HzVglnedai6c5Veu8J5TUG6vV4p7K0lAoSlZmAt6eQn7PLmtZHSE
         GqwFFfjzTMTeNStWFi+zk2MpJoFAmmuoNZECBK6nlHP389+QjHw9oPcQTgAYDrq6BTKw
         X0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714023465; x=1714628265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPL2nbk+Q/UWy1nHnxkSFv/m9vKVttF+eKGmemIFKnk=;
        b=eesBpMR9iyJ/dmrZjrfbpElUvKRmnXgoon09WYu8DNwP3kz4b86XftNZHvX24a8mcf
         RNdoLHbktPlaj2Hvrxxd6EZg9FzTH29yWSod+MXRJB1ozjFaPvsu8TpDlbDadAx0znqA
         n8y52SDaHryN4Yq24t8zUc0/hnS4DmWn3K2onzltYyw0xki+lg9UG71TNZEqENPqTuQ9
         zdS9Jv6h9N8CvK4gkklmCEwJI1ikQ4rdqvh6Qelw4xHJvbnp17AiKFrjiyb87348LdiT
         ze3DgbCBd+MyYuN6uL5iCeAJdv1CLuhXw1NZTnAdztygXSyLRq1oZtuRMeeHR2BL1Dj9
         xjFA==
X-Forwarded-Encrypted: i=1; AJvYcCU06YZcx7eg6glcw4Xf3Caz6k72klVUwiZuywD/hgU15ckp6/IGRsWx/HWEasquR7ywQS1gYPCyYfrLa2DgDtbuMj5GxaA4WC1hzG616Kw89/cNwPlOw+U4GpJfJBochKzCzzG3aBS1
X-Gm-Message-State: AOJu0Yw7oj8zIfmHko2K1/SpQOGm+zr9gGfSMiyOGQQU14pfDzDKUVJ/
	NzoZWYTGHYTwByNM5Qdn6lBT9Gi2cwvlCnsEGTc19hVmKfM2OBNZFJtDphRcSLFotW5hRnX6knQ
	xYmW+31K+sX2Rqfh5m0/G9VNam0Xx0NN0L58=
X-Google-Smtp-Source: AGHT+IFj6baWkNET9KfwMiptbsOnk2z/vd0k6HOClQOTwPFguXr7r58wwvpO4LFOB8TAv68bGd4sNmkJ5SWeTfOq3hM=
X-Received: by 2002:a5d:5641:0:b0:34a:70d:1117 with SMTP id
 j1-20020a5d5641000000b0034a070d1117mr938896wrw.18.1714023465069; Wed, 24 Apr
 2024 22:37:45 -0700 (PDT)
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
In-Reply-To: <CAFkJGRe7DVpcr+VKouTYzBK5r905W4xmxphU11AA6uB8Oj5FJQ@mail.gmail.com>
From: Josh Marshall <joshua.r.marshall.1991@gmail.com>
Date: Thu, 25 Apr 2024 01:37:33 -0400
Message-ID: <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com>
Subject: Re: Feedback on my development setup
To: "Bilbao, Carlos" <carlos.bilbao@amd.com>
Cc: ngn <ngn@ngn.tf>, linux-newbie@vger.kernel.org, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, pranjal.singh4370@gmail.com, 
	"bilbao@vt.edu" <bilbao@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Last draft before I send in a patch.  Big change is an added preamble
to set tone and intent.  Also some stuff up top setting forth the
structure of the document.  Carlos, I tried figuring out what you
meant by troubles with KVM, but all that boiled down to was scant
documentation on use cases people rarely venture into.  I think that
is a different document from what I am trying to write, although I
might now be qualified to write it.  Pranjal, sorry man, more words :)

https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-workspace/-/b=
lob/main/Linux%20basic%20dev%20setup.rst?ref_type=3Dheads

On Tue, Apr 23, 2024 at 1:43=E2=80=AFPM Josh Marshall
<joshua.r.marshall.1991@gmail.com> wrote:
>
> Hello Carlos,
>
> My intention right now is still to gather feedback on the draft!
> Everything, including if it should be sliced and diced into other
> places, is up for consideration.  The final intent is a patch into the
> central doc tree and not remote documentation.  I'll wait longer to
> gather more input before replying to particular points.
>
> On Tue, Apr 23, 2024 at 12:40=E2=80=AFPM Bilbao, Carlos <carlos.bilbao@am=
d.com> wrote:
> >
> > Hello Josh,
> >
> > On 4/23/2024 10:34 AM, Josh Marshall wrote:
> > > I have a draft document which I would like broader review on, which
> > > currently lives here:
> > > https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-workspa=
ce.
> > > This document is to ease the setup of Kernel Development.  I intend t=
o
> > > send this in as a patch to the mainline doc tree once it gets by a
> > > suitable number of reviewers.
> >
> > It's great that you're interested in improving the documentation. I've =
CCed
> > linux-doc list for visibility.
> >
> > However, please note that we already have existing documentation, and i=
t
> > might be better to extend what's already there rather than creating
> > something entirely new. You can refer to:
> >
> > https://www.kernel.org/doc/html/latest/process/development-process.html
> >
> > If you still feel the need to start a new document and host it remotely=
, I
> > suggest updating:
> >
> > https://www.kernel.org/doc/html/v6.1/process/kernel-docs.html
> >
> > If I may offer a suggestion, focusing on documenting the challenges you=
've
> > encountered with KVM, etc., could be more valuable that trying to cover
> > everything.
> >
> > >
> > > On Fri, Apr 19, 2024 at 12:15=E2=80=AFPM ngn <ngn@ngn.tf> wrote:
> > >>
> > >> On Thu, Apr 18, 2024 at 05:40:20PM -0400, Josh Marshall wrote:
> > >>> Looks like breakpoints aren't working?  https://paste.debian.net/13=
14501/
> > >>>
> > >>
> > >> This maybe caused by Kernel Address Space Randomization (KASLR), try
> > >> disabling it by adding nokaslr option to the boot options.
> >
> > Thanks,
> > Carlos
