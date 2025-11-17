Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF0305E1F
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403648; cv=none; b=hX0bLdKt9PNWEh+zrnNjeG1TIvCfo4s/LIXUGpNAiO+qZU35eTJFtRjcNd3Tv8t2eWnaEXpj6wIZwQ++u57JlF4BAQBfnCD0ghJgnCpaiHXg9ZcbF6G448en2vD3yRZ/ljB+H5z3Tt23pIEkbhJXVKw9PUhWCz4Oy7+jcLgSjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403648; c=relaxed/simple;
	bh=CZtsj+hifIsZJbKTfeb8TuUonR9rJOLyCJoinWAfVZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H91UGlq+Op+2sOsrYBNF3D+AHnETJicl2r3jbrkdPmcX2k6h0nYfJkWp2O1jbOTa3JIRvAGBmPWzHL2pVDwaX5rFk0QT62LN/RLS7n6GwCoIB5yB5jdQXaScDcWzFD0SeoDkk5SZAxM6L21vVtvGgz/zR9eMJ8CQvTRgxwcAVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=IpzOdkO/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="IpzOdkO/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so8328608a12.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 10:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763403645; x=1764008445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8uyJ9UgvBm8P+z5AaxjU/5GgC74k2Y8kBRaWb+wv/8=;
        b=IpzOdkO/TAphkuNLFQKOlMCFibMB7FXtwyELkClcZK/UQMitx5pYr6aLyTVD7HivrA
         yZ9TyaHfpn1tXwTDvcz9UE1jK6kILYxxIprO1UczbPyJAhZQF/Zw5wKmGg5uBjvB/0Ed
         wu9eUfc8dA9n4Sw2YarHZh4P0Mb7oNH+ULUozCRT/M4kNFBJulpSFaeq19eUR24SWdNA
         tU62ePkikquYMiUW0xcCZfA0igD2z5u5cAGVoxi5edaVuxaUPurQM1FlznHFZ98QCjaD
         olouksHmBWu3Fqn30s2sg1M/TWI9mLVwCrvGVuSL9o1TBhIuPeUTXIt8lrSAsnsOMwEv
         35KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403645; x=1764008445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j8uyJ9UgvBm8P+z5AaxjU/5GgC74k2Y8kBRaWb+wv/8=;
        b=mudMBRw9EtvIpytzPD07gZbtxb6A07qBop5MUbm59dR4qdoZQoEcDoQxBXeTGT2jqE
         sRA77HD4Xo/cmom+PDGlUkkOHcXWdDSTUZ/ufFgtFNP3Edf2C0WwFxZvFrNpeWwBfq1k
         cUroADQozgN5Ou1C7iUBQ3zYGiGRcihsQSprxngsZY8LmIhbvL2EEoYggvV9crimQFkA
         214W1/6usAXBFLkdexv2rVO8MIHLVLzEpcMoFoccePyCxylfFowJPcJHbGMZbLiaZWWJ
         jsIThNrLqgpR/WZ6pNVDettJAlkS3vwXTuf0A4k7xDhu4QZb5G13w85KxsswncYZoVzG
         I5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA+oY+DrGFFWmK8iKJJMOIzD14Q+jHSKW2hlA6mcWrmTEWeWzxbSTQa4zhXM2Nl5nTJ1/VGgnegwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUb0flKpz/tappBl5yiqjMJTPit7D+jsXd05F/2ntj3221XDFm
	kxPuYJmXKEPRYlvJYVW7olyrjp1vib3v2MQNlBRk4Ebiu5xDJqwMwIY63YfP+ztFNyYtOtmF1Bi
	h/k8qxsjvSHhHgeu8G8kVTngh9zKC9czuaIP4eo0wPw==
X-Gm-Gg: ASbGncuOudGVewwkEtlcY+6n1TLH8RpE1mBAFSoWD3yvEuZED2jD3HRY4P4mjy+qzV2
	On1NTS7Rgkpl1wCP6l3Pn+kJN/M15+6Lve9DDixMd1Fc/p00pGINa4vm1F+vWkt7oKK6e6HwBzT
	MzFQ/Q/aGDXM1HhqF38r9CTDi7M3ctnUuJ+WbalOS2BNTHnKF09MyrpRox50+4ek9mPmSdL62m2
	JSmuxRfZPTGdfUk2mzMQaXwTIdcBhUfUdauF7DTDMk6TPVwh9JdZN8yIRCrKuL33x+I
X-Google-Smtp-Source: AGHT+IGM1Tr15Cbgk4QQHnvYqnvMCGG164LW1Q1ssAN2iVzR9VtHS4h71YwFJlzXxkn+A9bvWz6u1Z5jGfTyNzSIJ9I=
X-Received: by 2002:a05:6402:50d1:b0:640:c807:6af8 with SMTP id
 4fb4d7f45d1cf-64350e9c5c3mr10832591a12.30.1763403644857; Mon, 17 Nov 2025
 10:20:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-11-pasha.tatashin@soleen.com> <aRrtmy--AWCEEbtg@kernel.org>
In-Reply-To: <aRrtmy--AWCEEbtg@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 13:20:07 -0500
X-Gm-Features: AWmQ_bngMkZtOLXtzvbIhDYg36rxAp3uf7c25ogdWq8dWGd7IJgw-yYh-gP9XSc
Message-ID: <CA+CK2bCVf2RppZbALAuFZyZarWukzhwkmOgtG2PcKqUQuao6uw@mail.gmail.com>
Subject: Re: [PATCH v6 10/20] MAINTAINERS: add liveupdate entry
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 4:41=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sat, Nov 15, 2025 at 06:33:56PM -0500, Pasha Tatashin wrote:
> > Add a MAINTAINERS file entry for the new Live Update Orchestrator
> > introduced in previous patches.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  MAINTAINERS | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 500789529359..bc9f5c6f0e80 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14464,6 +14464,17 @@ F:   kernel/module/livepatch.c
> >  F:   samples/livepatch/
> >  F:   tools/testing/selftests/livepatch/
> >
> > +LIVE UPDATE
> > +M:   Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Please count me in :)
>

Sure, added.

> > +L:   linux-kernel@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/core-api/liveupdate.rst
> > +F:   Documentation/userspace-api/liveupdate.rst
> > +F:   include/linux/liveupdate.h
> > +F:   include/linux/liveupdate/
> > +F:   include/uapi/linux/liveupdate.h
> > +F:   kernel/liveupdate/
> > +
> >  LLC (802.2)
> >  L:   netdev@vger.kernel.org
> >  S:   Odd fixes
> > --
> > 2.52.0.rc1.455.g30608eb744-goog
> >
>
> --
> Sincerely yours,
> Mike.
