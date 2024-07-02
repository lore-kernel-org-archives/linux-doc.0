Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C7B1A28C
	for <linux-doc@vger.kernel.org>; Tue,  2 Jul 2024 04:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719894818; cv=none; b=dffB2fRkhpLJou51UvKCGNYqd/dNlcDqMPH8wP+FTps/D0zE6+dacaRPKB18UIqW2S/P1MkvfMtuAm3hSPs3X0DKko7LaxG+lwxSTamoGeHpgUWXhGIi3QTFJOX2wDB28ZY2GYib+3XjdLhxPqkQTsc3T7oZN0/SBavHnYZ6okk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719894818; c=relaxed/simple;
	bh=helbAJbRih6JEFEDzWsc4hDLbmjo26gsM3G3/7KRtCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsetdC+gsA8YlyWpuGYPp7XFkDR7mS002Ko0mWL9T8rzjFJOzmLKvDT+96ZGa6satkiFJrq34os1xIRIYOPzSFXdp4V3ncEElL7qhM+14UPlCAxF3to6Uc0NM1FviYBxdsglakBZhvISfqFkk7lvxE7zY0QLaLkLFUAUL0MaeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZMb+YCUg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZMb+YCUg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-356c4e926a3so2154508f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 21:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719894814; x=1720499614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hACoZqRsGCJqarz3d4IaeWELtsQGiX6WuVT0TwVleE=;
        b=ZMb+YCUgrfee1QB+kU22xSPZb4RBEWKvixu41naPcollByyd3ZQlmcLU6CXYBbCMFw
         Lm4p5q+81wtNKjY2Wt4HMWwkEaVZs0/vniCo7a4nCmUjQEdH54WMHPuesrOzY7ke0SEP
         t3mribvlGCxeHoRsCfykgk2auVQJ8OKMXDayc94YYo2lhpf/DA7HXhVjIJmH9EgNrDnu
         VOqB/ZmUvYO5Kw2b641ScXL6s+IcgkPwtfF4n/5LuJJkpDtXm/jxtDiU5Y34V3Kg2YdK
         QghfiEavyXjTktdcdFrdtWgwCcdiGfZCf54hdiNyfsdOhu7wnE6qZQXMmq3w8G7OLbqs
         pdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719894814; x=1720499614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hACoZqRsGCJqarz3d4IaeWELtsQGiX6WuVT0TwVleE=;
        b=p0DqpZTBMliWBAQ/qwmFI6mm8z3sU7EvkNPgLRh7vU5isA6/1eroSENDa6CXZWkIbY
         41qvyk3SNo9MHKJo2n4QGtNpD+TUVOpUAKGq8zdTF5YujYjxk+GaZWkmWeDyhpdq3yLd
         jpIpABx+Ky8QS1cCZkG6gP+L/hRfmik4Mc+TzMS40k4cyHBv1BEdbohV9VD/9zYePFcO
         tvTK64V9btPNPL+h2akcSJM1mzgfIytGRC+nULh6OhLu0od2QOXlYGmGRmbetlBMeZaB
         qbQ4PM+9DYQxtnpfEK0vU36ab6XzX4dZlOi7+44U6uvNdx0F8gAZmmtAdX8gENrfTvxs
         a03A==
X-Forwarded-Encrypted: i=1; AJvYcCUGYa543oJpp0bXBR8i2JYvaoYT5+iOLK6NgARLJ7G+8lTeyNWpHjwnuBghntTWut1bt+vM72b1t7iA3zmEMRTvPsDSmLwFB1d2
X-Gm-Message-State: AOJu0YyU1yO6r+6PSusyMzYPywZQJ2+CIeQkUKZajlwppUWwFkJCezBb
	iRZrs94IvGXfKYl5wFO4t7JWn5w0t0I58+iXCaCpTDyeVzq7fshC47iTCMlNiIys8Eve+EFa0lL
	YGH6AeNQNP7rAkrvxB2k92QMtpU8trmpGYhC0CeEl42aiqn/09OTx
X-Google-Smtp-Source: AGHT+IEKCedqhfrqW3JHJeVQYmdhQ5WwMlSAtWVSs49qtQj332c4+w16tm1IY2fFcGRLqKTd7mnLN/vtzwoPFXXMbYY=
X-Received: by 2002:adf:e246:0:b0:366:ddc2:a14a with SMTP id
 ffacd0b85a97d-367756cf3f2mr4606325f8f.40.1719894813987; Mon, 01 Jul 2024
 21:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701184912.01f1f9ce@canb.auug.org.au> <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
 <CACw3F52=GxTCDw-PqFh3-GDM-fo3GbhGdu0hedxYXOTT4TQSTg@mail.gmail.com>
In-Reply-To: <CACw3F52=GxTCDw-PqFh3-GDM-fo3GbhGdu0hedxYXOTT4TQSTg@mail.gmail.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 1 Jul 2024 21:33:20 -0700
Message-ID: <CACw3F52wm=5Rg+QP-E7JDOjBvA2mYv0uDBL+8=KPCfQ8tkHQaA@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 9:15=E2=80=AFPM Jiaqi Yan <jiaqiyan@google.com> wrot=
e:
>
> On Mon, Jul 1, 2024 at 8:15=E2=80=AFPM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Mon, 1 Jul 2024 18:49:12 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> >
> > > Hi all,
> > >
> > > After merging the mm tree, today's linux-next build (htmldocs) produc=
ed
> > > these warnings:
> > >
> > > Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indent=
ation.
> > > Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote end=
s without a blank line; unexpected unindent.
> > >
> > > Introduced by commit
> > >
> > >   2cba7831f62c ("docs: mm: add enable_soft_offline sysctl")
> >
> > Well that's annoying.
> >
> > @@ -267,6 +268,37 @@ used::
> >  These are informational only.  They do not mean that anything is wrong
> >  with your system.  To disable them, echo 4 (bit 2) into drop_caches.
> >
> > +enable_soft_offline
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Correctable memory errors are very common on servers. Soft-offline is =
kernel's
> > +solution for memory pages having (excessive) corrected memory errors.
> > +
> > +For different types of page, soft-offline has different behaviors / co=
sts.
> > +- For a raw error page, soft-offline migrates the in-use page's conten=
t to
> > +  a new raw page.
> > +- For a page that is part of a transparent hugepage, soft-offline spli=
ts the
> > +  transparent hugepage into raw pages, then migrates only the raw erro=
r page.
> > +  As a result, user is transparently backed by 1 less hugepage, impact=
ing
> > +  memory access performance.
> > +- For a page that is part of a HugeTLB hugepage, soft-offline first mi=
grates
> > +  the entire HugeTLB hugepage, during which a free hugepage will be co=
nsumed
> > +  as migration target.  Then the original hugepage is dissolved into r=
aw
> > +  pages without compensation, reducing the capacity of the HugeTLB poo=
l by 1.
> > +
> > + ...
> >
> > This seems a reasonable thing to do so there's probably some way in
> > which to do it, but a bit of grepping failed to turn up examples in
> > existing .rst files.  Can someone please suggest?
>
> It seems I need to add some blank lines according to [1], especially
> to add a blank line above the first list item:
>
> diff --git a/Documentation/admin-guide/sysctl/vm.rst
> b/Documentation/admin-guide/sysctl/vm.rst
> index 75e22137d849..74b4c0f65213 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -274,12 +274,15 @@ Correctable memory errors are very common on
> servers. Soft-offline is kernel's
>  solution for memory pages having (excessive) corrected memory errors.
>
>  For different types of page, soft-offline has different behaviors / cost=
s.
> +
>  - For a raw error page, soft-offline migrates the in-use page's content =
to
>    a new raw page.
> +
>  - For a page that is part of a transparent hugepage, soft-offline splits=
 the
>    transparent hugepage into raw pages, then migrates only the raw error =
page.
>    As a result, user is transparently backed by 1 less hugepage, impactin=
g
>    memory access performance.
> +
>  - For a page that is part of a HugeTLB hugepage, soft-offline first migr=
ates
>    the entire HugeTLB hugepage, during which a free hugepage will be cons=
umed
>    as migration target.  Then the original hugepage is dissolved into raw
>
> But I am having trouble testing the build, so wasn't able to validate
> the change above:
>
> Documentation$ make
> /tools/net/ynl/ynl-gen-rst.py -o
> /Documentation/networking/netlink_spec/index.rst -x
> make: /tools/net/ynl/ynl-gen-rst.py: No such file or directory
> make: *** [Makefile:113:
> /Documentation/networking/netlink_spec/index.rst] Error 127

I tried another way: make htmldocs at repo's root directory. Although
I wasn't able to finish the make process,

- without the blank lines:

  Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indentatio=
n.
  Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote
ends without a blank line; unexpected unindent.

- with the blank lines added, the ERROR and WARNING in vm/rst are gone.

Andrew and Stephen, what is the best way to post the fix for this?
Should I send out a v8 of the patch with the blank lines added? or a
standalone commit for this fix?

>
> [1] https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#bu=
llet-lists
