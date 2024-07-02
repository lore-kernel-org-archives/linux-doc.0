Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A017C77
	for <linux-doc@vger.kernel.org>; Tue,  2 Jul 2024 04:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719893720; cv=none; b=k+w/9VGer+Q71p0ANZDiQBFT6/YokdHvV83Ms7e503zJlI7Rl/h+w/SZvDxtIwOlVOaZI+HzTbm9AUh8g+X5nWk1rdBaQNJhhnBwNoyjmENtTdFK8Rj50qrhtzes01xbfKJ8akY4Vx1ndUYoOz46DsojoCdrrrsOJHouuqSQ4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719893720; c=relaxed/simple;
	bh=ZWsNogRVnns5cet+PBja4gLwrx9LY7hMmua3yurU3JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQfnxeMC1gTR3xVkQxPxlY5czmAhBuA0t7W22u++4wzmtQt3W31wqkyCir8V9ZOzXqUO09X4k9p27Rae3P3E+otdv5GT9RcgS8wQNqqsLwi8uYZiSE+OFUGPG2RYBzAeBCjQDEiPBbeSiUQ6+KVLl7o8fUAbE5TNM4fYpD+o5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rt7L4I+i; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rt7L4I+i"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-36743a79dceso2710700f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 21:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719893717; x=1720498517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EevALuEQAKTYdIpOrLnzivNt8QLRmSfCy/CDC5aK0TA=;
        b=rt7L4I+i5cmtvgMPqVIboFQV65vRhs1iMvxcIx+ZU+qunZivLHzlyg0lr1XtTlmxLr
         p2hIJLq2VQGxMmgjB3RSUahoyweaHUjX8/u5mtiSq+zq/7FnvI2PKFL/fpfgvRcNzWxl
         88jyKSd1AWLxF/eRXLjN9BwOkyN1Tuc1qMJQWM/kwgJs83BqsWOMCzw4OTWBSMYek5XO
         k2qYuVDVGbnsqyEcQXSl25JacOJlve1sYTPHnphIx62qN6faxweanvIe6eO1XmByx/ir
         Bpuew3Uji9hxPHHa1cHmGM29BkCZbcYflaZpX2hswjdvOt5gLsPI3p4YrMPyBYmef2eS
         xtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719893717; x=1720498517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EevALuEQAKTYdIpOrLnzivNt8QLRmSfCy/CDC5aK0TA=;
        b=PxglOVn5FMyiusuaRc00cM9yXn7PsH98ob6UwNnOmB7SBCVfpL0RqQcfqx5e6OOa7g
         1yen+x6fo4tWPXsP5zWldwiy8a8x0expuFDnpncgCgfYwOQhXPjjeytJtrA4yowc8HMA
         /r0uee5WLB0A25T/c4huvhG3tg4nCgrNf/H9z6bgfaApefCscZ0IOeupoNXgIkzqwOyE
         kU3Gw4eo5ZvS4sOEQXc6FC+AdIw8HDZb6MJeDLZFRRDrEY5meULOBaWwZoCUewKlwffH
         n5vjy7rcY7YBnTbgR4As+A+lqFxwMPTOxNKfUT79AEmK7XBNV+AJVCcbfDkN3PHOv9rA
         YWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfMeTsTTKxYENO4iu8ulQjXJ6L4kb+9kfM6cHNhrF1JYY8MECMrKEbHj/eEMeZ9uGN1xhi+Nf+/yRHYCnYI9ketBRWdMS3oQqY
X-Gm-Message-State: AOJu0Yw3A5vV8Fgm9SBKMNhmBsTM0y/1Y5aNnSCTpvFACuS5qIDJIRUD
	+BorNVeg6O1CySdpoLXsIjPc03dqpLRhnnX4VDbdEINuIw/te7E1sDSkl94zxb9YFDgf5utaEOE
	MJ5Wmug0UJuAz7V/7j2nTeHi9wwiD4Wi1x8amGN9Bg13VZFejwW/g
X-Google-Smtp-Source: AGHT+IHBcNobxBEs8U0B2IiWSXZ7vTR+8oM61v830nDHqdxeYwUA0Ip4SprAWAT+QBBPSTarwvfJsXsKhnhRNWDVwYI=
X-Received: by 2002:adf:fa82:0:b0:364:4321:271a with SMTP id
 ffacd0b85a97d-36760aa2ea8mr8855849f8f.25.1719893716958; Mon, 01 Jul 2024
 21:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701184912.01f1f9ce@canb.auug.org.au> <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
In-Reply-To: <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 1 Jul 2024 21:15:05 -0700
Message-ID: <CACw3F52=GxTCDw-PqFh3-GDM-fo3GbhGdu0hedxYXOTT4TQSTg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 8:15=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 1 Jul 2024 18:49:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
>
> > Hi all,
> >
> > After merging the mm tree, today's linux-next build (htmldocs) produced
> > these warnings:
> >
> > Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indentat=
ion.
> > Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote ends =
without a blank line; unexpected unindent.
> >
> > Introduced by commit
> >
> >   2cba7831f62c ("docs: mm: add enable_soft_offline sysctl")
>
> Well that's annoying.
>
> @@ -267,6 +268,37 @@ used::
>  These are informational only.  They do not mean that anything is wrong
>  with your system.  To disable them, echo 4 (bit 2) into drop_caches.
>
> +enable_soft_offline
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Correctable memory errors are very common on servers. Soft-offline is ke=
rnel's
> +solution for memory pages having (excessive) corrected memory errors.
> +
> +For different types of page, soft-offline has different behaviors / cost=
s.
> +- For a raw error page, soft-offline migrates the in-use page's content =
to
> +  a new raw page.
> +- For a page that is part of a transparent hugepage, soft-offline splits=
 the
> +  transparent hugepage into raw pages, then migrates only the raw error =
page.
> +  As a result, user is transparently backed by 1 less hugepage, impactin=
g
> +  memory access performance.
> +- For a page that is part of a HugeTLB hugepage, soft-offline first migr=
ates
> +  the entire HugeTLB hugepage, during which a free hugepage will be cons=
umed
> +  as migration target.  Then the original hugepage is dissolved into raw
> +  pages without compensation, reducing the capacity of the HugeTLB pool =
by 1.
> +
> + ...
>
> This seems a reasonable thing to do so there's probably some way in
> which to do it, but a bit of grepping failed to turn up examples in
> existing .rst files.  Can someone please suggest?

It seems I need to add some blank lines according to [1], especially
to add a blank line above the first list item:

diff --git a/Documentation/admin-guide/sysctl/vm.rst
b/Documentation/admin-guide/sysctl/vm.rst
index 75e22137d849..74b4c0f65213 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -274,12 +274,15 @@ Correctable memory errors are very common on
servers. Soft-offline is kernel's
 solution for memory pages having (excessive) corrected memory errors.

 For different types of page, soft-offline has different behaviors / costs.
+
 - For a raw error page, soft-offline migrates the in-use page's content to
   a new raw page.
+
 - For a page that is part of a transparent hugepage, soft-offline splits t=
he
   transparent hugepage into raw pages, then migrates only the raw error pa=
ge.
   As a result, user is transparently backed by 1 less hugepage, impacting
   memory access performance.
+
 - For a page that is part of a HugeTLB hugepage, soft-offline first migrat=
es
   the entire HugeTLB hugepage, during which a free hugepage will be consum=
ed
   as migration target.  Then the original hugepage is dissolved into raw

But I am having trouble testing the build, so wasn't able to validate
the change above:

Documentation$ make
/tools/net/ynl/ynl-gen-rst.py -o
/Documentation/networking/netlink_spec/index.rst -x
make: /tools/net/ynl/ynl-gen-rst.py: No such file or directory
make: *** [Makefile:113:
/Documentation/networking/netlink_spec/index.rst] Error 127

[1] https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#bull=
et-lists
