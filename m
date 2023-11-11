Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C8E386
	for <linux-doc@vger.kernel.org>; Sat, 11 Nov 2023 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feZhIMDL"
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26793C3D;
	Fri, 10 Nov 2023 16:10:26 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7a93b7fedc8so101134339f.1;
        Fri, 10 Nov 2023 16:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699661426; x=1700266226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxFVU/O++xjmTUwRIyuxUTtJP9CCcilQCzHndj7FEYs=;
        b=feZhIMDL7LJc0K0de1Ss7uqYXeQGzb/5AqyauzCHr7whjIpDcr/R+aMxUwtanM0GQ9
         4HgER7g2TdomJyIcN7PAHT9ywwdNovk18ES5jWa1BT6rrJrZgcbrWFTXj4+RClQp3SpF
         vsDru4Qxi+PzBh6uxiJsUzSAgC1NP4JW3JFSdtlxFZ+tcILKOMBgp62XHDV+MUfCtW5N
         HywQp60/FlUAa3lTUjG3EFE7sJALZyRVOWHblP9el+B9QEspV9tWxAqlZMcKn1zg4oLM
         chuTWQoIVT1bxSQU/acSjSN/ETsh7rlduxjmz2zx2ObA6LgUmN47LRCmzhDtIm8hf+Vb
         v/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699661426; x=1700266226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxFVU/O++xjmTUwRIyuxUTtJP9CCcilQCzHndj7FEYs=;
        b=OZr4rhJRwXVN1FQkHGid6oCP9km79NP72t2bP1udzC9Z18CMaW4R/kJptBTg5P4Hpw
         yjEF4MiCasT5fJjjR1Xm0HJqUoyCcNPWf8DzvsPXFajQ1hdCFVm0+r+wBNEESMtaWtrO
         uRn68qYE+hmXPxiOzwlDGptm+SOv5H3JpNoEtVe3nDhSqpB6I6d9el/V0q1TNZONt2Mx
         xRVNN7zPv1XNeKxp+z2xao68fh4Utl00AHVPJrW3+h2XFurY1v2ttr7HICuy8WZWcHFy
         dhu8PAAs7nCx13287xX/lFCXkIKVVv6W9APBJfi1EVGJl+fpT0lTt2cVOFHWIjL+yEBZ
         reXw==
X-Gm-Message-State: AOJu0YwZeQdflWNyYS8uzIGbASe/0ZtdtrRH0WXRJk40pFeB3vBz5OUZ
	r3wbg8pFb2H+gIllbKX3eRBE0rGMpmfbJfnR4dI=
X-Google-Smtp-Source: AGHT+IE5zVX9XFLdvU0U9v6tHC+jPR/bJBfCK2y0DtpDCDOycmbMLl6zIsI6TPPAuAWcAbSWDbmTNSb2EibQvEgEAVU=
X-Received: by 2002:a5d:9506:0:b0:798:d82b:7b02 with SMTP id
 d6-20020a5d9506000000b00798d82b7b02mr939096iom.4.1699661426127; Fri, 10 Nov
 2023 16:10:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106231158.380730-1-nphamcs@gmail.com> <CAF8kJuPXBLpG2d4sje6ntrA+U-AnLzu3sNpJK02YxNcg04YNng@mail.gmail.com>
In-Reply-To: <CAF8kJuPXBLpG2d4sje6ntrA+U-AnLzu3sNpJK02YxNcg04YNng@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 10 Nov 2023 16:10:14 -0800
Message-ID: <CAKEwX=OgN_xQWrp_OYkK1BRq3DFW4he9OSycdjBm0BNy+vpPAg@mail.gmail.com>
Subject: Re: [PATCH v4] zswap: memcontrol: implement zswap writeback disabling
To: Chris Li <chrisl@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, lizefan.x@bytedance.com, 
	Johannes Weiner <hannes@cmpxchg.org>, Domenico Cerasuolo <cerasuolodomenico@gmail.com>, 
	Yosry Ahmed <yosryahmed@google.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, mhocko@kernel.org, 
	roman.gushchin@linux.dev, Shakeel Butt <shakeelb@google.com>, muchun.song@linux.dev, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 3:10=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> Hi Nhat,
>
> Acked-by: Chris Li <chrisl@kernel.org>

Thanks, Chris!

>
> On Mon, Nov 6, 2023 at 3:12=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -219,6 +219,12 @@ struct mem_cgroup {
>
>  #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
>         unsigned long zswap_max;
> +
> +       /*
> +        * Prevent pages from this memcg from being written back from zsw=
ap to
> +        * swap, and from being swapped out on zswap store failures.
> +        */
> +       bool zswap_writeback;
>  #endif
>
> I notice the bool is between two integers.
> mem_cgroup structure has a few bool sprinkle in different locations.
> Arrange them together might save a few padding bytes. We can also
> consider using bit fields.
> It is a very minor point, the condition also exists before your change.

This sounds like an optimization worthy of its own patch. Two random
thoughts however:

a) Can this be done at the compiler level? I believe you can reduce
the padding required by sorting the fields of a struct by its size, correct=
?
That sounds like a job that a compiler should do for us...

b) Re: the bitfield idea, some of the fields are CONFIG-dependent (well
like this one). Might be a bit hairier to do it...

>
> >  #endif /* _LINUX_ZSWAP_H */
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index e43b5aba8efc..9cb3ea912cbe 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -5545,6 +5545,11 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state =
*parent_css)
> >         WRITE_ONCE(memcg->soft_limit, PAGE_COUNTER_MAX);
> >  #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
> >         memcg->zswap_max =3D PAGE_COUNTER_MAX;
> > +
> > +       if (parent)
> > +               WRITE_ONCE(memcg->zswap_writeback, READ_ONCE(parent->zs=
wap_writeback));
> > +       else
> > +               WRITE_ONCE(memcg->zswap_writeback, true);
>
> You can combine this two WRITE_ONCE to one
>
> bool writeback =3D !parent ||   READ_ONCE(parent->zswap_writeback);
> WRITE_ONCE(memcg->zswap_writeback, writeback);
>

Yeah I originally did something similar, but then decided to do the if-else
instead. Honest no strong preference here - just felt that the if-else was
cleaner at that moment.

> Chris
