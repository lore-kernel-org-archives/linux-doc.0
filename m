Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB1E357D19
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778620738; cv=none; b=JA7KQB+htTBQVeg90s/BT6FjqAbP/3tY3dLtqo+cbJUy4V4dHaouvU77AFP1UfclbVEDHsI7ScjB2vk4Yc8PhJKkr1KP4QlkptTLP98HlwWfObT41MbhrMP6W4wjoPIJG2xfirhLtKmwGGbahnE2oNknkE+5nsWLeAIWSIU0FQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778620738; c=relaxed/simple;
	bh=ZF+m+ZjVtnGgRZxs8fykE/7UK37XkDux4yfRZUGOw5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCjO4ydq6qhYry1so4fBzTjQQTxITMZWJHg0sekoIIUCJI4D90zJoNkAxgJLPkzTZkplbhiu3d0qOtmtlkLPV1bHSx+vJClOxGNMGghR7wi2Lrm6GBZsNONg8fw3O69mcXVdVcJ5X6fWdYLqxdnR/TxZsA6eUKj3rc4sPQMwZQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd24f466598so272304466b.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778620735; x=1779225535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULDGSLAty8SEh/aPzQ3wMjjybANkPqfntQTcejrtbks=;
        b=rJt2pNOj7emDhAj/30WF2EOowFFCpK5HTjjvVoBm+ohZhb8aCfGIxj+ER/59XHPAZ0
         kyZeztjqLZARfnKucjF73ur+K6TOvwPnqVg48Jf775mjB8N5PjCA/QWZCbwM+ZGzgVOF
         hOChcCPvd+dMY8s1e3WmfHKzzE0f8uJkAuJS6hhBc3WUwjtz21h44qnxOFOfkymroSQo
         l/oGWmRO6A7sm8fIFzO49N+4LLl/UFSVD5W3HCGu31IMdujMgdVWxFqMBd12PbJusGNO
         estKX1yyCCTCH8RPIFKggFfPDDD7iM9Ta2BvvlOD/19qAFLL95Zw12ybQFKzCevz39xF
         aRsg==
X-Forwarded-Encrypted: i=1; AFNElJ+9sc1vboCizTzMVK96WHzkdfB82AMYV53PrB3jTsBNPe6O1W7QpliKwgNFSNWytjn7MWgHWSVzG7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNinCqQFwgYknHtjgcFwo6FRSNeMFSYgoxM/gzR0utX1dRIWou
	PqWWa84/leCculOpaB3WSQG6n8TGHBrGyL4i8bzRsjx1lfXrD35kvI6NqLBjYfbvKz8=
X-Gm-Gg: Acq92OGpIb0686n5bJbNSiQRFoY+80OkVX1Wu3yA6fOG+MebBp2Acu9XKbhugFONJCa
	GZwz7OaOYGVHnYhOHewAeKfeSWF6Dlpt8jV3ci41CJVOwJ3M8lwzTe4qSVVs0Psgp2GIkQzaAP8
	FZphrW+fBBq8SEGbHFrNprP/t4OTlRfi6/m5nLwIyDYGLfvZP7+3XgrL9UChdNyJoWHdRjmeAJ0
	j9lsuNROBtfqj8ETHHJShjUozbUd6x1RdUYrul7RHVG8VDkU/FmPyZf9l4XouhzE1p5NkRdpzgD
	52E5hV5uAx1Hrr42BERrUCK03qVt6M2RnrgZizco+IzUICg0V8XKIOai8jU0X7oGHc4u0+YbFEg
	O60F+lUpqWV3C3gqymG6+piJhZZpVB6ONsq4gcOQZ9XFCu1B9KQofaemhvAi9T/aBp0womj17cP
	+fpRn/it+1TrQkmAOqc6sYBUzvnGIr8zpYeErL8LBrthC5tavaCDw++YRrSLCtJLf4
X-Received: by 2002:a17:907:c289:b0:bcc:c8ea:3b01 with SMTP id a640c23a62f3a-bd3bf98112dmr29273766b.12.1778620734827;
        Tue, 12 May 2026 14:18:54 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3a7fe13sm724436366b.31.2026.05.12.14.18.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 14:18:54 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd373f83042so92682466b.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ82YfkbO3+fz+l3osz2Ip/NX4OIrwuLF8GBp2hQOTaryT0F72wcqFMeAB+goJSjHgZF7NEZPUrtT/o=@vger.kernel.org
X-Received: by 2002:a17:907:80a:b0:bd1:e36f:1ad7 with SMTP id
 a640c23a62f3a-bd3bf484689mr27989066b.9.1778620733204; Tue, 12 May 2026
 14:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALCETrVqG+1yErRJjkxvJrf=A+Vu84HTR4Bx1Pcd8G1C0PJcMA@mail.gmail.com>
 <14A441D8-5370-44BE-8732-99BF8107C3FD@getmailspring.com> <0b8bba44-f6bb-4d69-b9d4-5787c276d41a@inspirated.com>
 <20260510163204.GA2279@sol> <3bfcf406-fdde-4303-9bd6-0d8d21ddba37@linux.win> <20260511213829.GA316710@google.com>
In-Reply-To: <20260511213829.GA316710@google.com>
From: Ignat Korchagin <ignat@linux.win>
Date: Tue, 12 May 2026 22:18:42 +0100
X-Gmail-Original-Message-ID: <CAOs+rJUA+bz6Y2GKioHnFGFKX_uAP+4LaPRs=ZDgRQoUi4mWkg@mail.gmail.com>
X-Gm-Features: AVHnY4IXFsTsREC72LukcHqvk6gC-iS5eeOIEbsMsX37ajVDHN0xSqZ-iDLXxGU
Message-ID: <CAOs+rJUA+bz6Y2GKioHnFGFKX_uAP+4LaPRs=ZDgRQoUi4mWkg@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - Document the deprecation of AF_ALG
To: Eric Biggers <ebiggers@kernel.org>
Cc: Kamran Khan <kz@inspirated.com>, Jeff Barnes <jeffbarnes@linux.microsoft.com>, 
	Andy Lutomirski <luto@amacapital.net>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:38=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:
>
> On Mon, May 11, 2026 at 10:03:21PM +0100, Ignat Korchagin wrote:
> > I don't think fully discounting hardware offloading is beneficial here.=
 HW
> > accelerators will be produced and without a common interface vendors wo=
uld
> > start implementing their own "bespoke" drivers with bespoke userspace
> > interfaces (we already had such proposals), which in turn may introduce=
 more
> > attack surface. Yes, AF_ALG needs substantial improvement, but at least=
 it
> > can be a standardisation point.
>
> That isn't the best way to accelerate symmetric crypto anymore though,
> if it ever was.  This has been known for a long time.
>
> > > In any case, any hypothetical security benefit provided by AF_ALG wou=
ld
> > > have to be *very high* to outweigh the continuous stream of
> > > vulnerabilities in it.  I understand that people using AF_ALG might n=
ot
> > > be familiar with that continuous stream of vulnerabilities, but it wo=
uld
> >
> >
> > Is it actually that much compared to other features/subsystems, like eB=
PF or
> > user namespaces? But we don't rush to deprecate those - instead trying =
to
> > harden them and come up with better design.
>
> There are plenty of other kernel features with a large attack surface,
> of course.  But they tend to be much more useful than AF_ALG.  It's all
> about weighing benefits vs. risks.

If divide number of CVEs in such systems on imaginary units of
usefulness, I think the ratio is similar.

> When we get the point where a large number of Linux users *had* to
> disable AF_ALG as an emergency vulnerability response, and at the same
> time their systems weren't even using AF_ALG so nothing even broke and
> they could have just done that to begin with, I think we get a very

Well, there were: cryptsetup, RHEL fips check, so there are some...

> clear idea of which side is heavier for AF_ALG in the real world.

Same thing could be said for unprivileged user namespaces - distros
even put a custom sysctl to restrict it and no-one noticed.

> The main relevance of AF_ALG to the Linux community is that it allows
> their systems to be exploited.

To be clear I'm not arguing for the current AF_ALG implementation. I
agree, the splice zero-copy is... suboptimal (to be soft) and is
actually not-so-zero copy. But I think it was just added before we had
more modern approaches like io_uring (have their own can of worms, but
hey - people adopt it fast).

But I advocate for the usefulness of the concept itself - kernel/OS
providing crypto services to userspace. As mentioned in other threads,
other operating systems have it and Linux lags behind. There are use
cases: common interface for HW accelerators, embedded systems, which
don't have the space to bring a userspace lib etc. Even non-technical:
there are environments that just don't want to rely on third-party
userspace libraries like OpenSSL purely for licensing reasons. And I
agree, that it is hard to do it right, but we can piggy-back on other
subsystems (such as io_uring mentioned or other ideas).

> - Eric
>

Ignat
