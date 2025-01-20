Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E0417C68;
	Mon, 20 Jan 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387679; cv=none; b=T0I4WTU3hycOsVK4Q2eQwk0Eb2seCoxsXyzw7DqLrr1EucS4yU/CiQhi1w9wwItSXpAAAyjV7M51uqf11XSRS5KNediMuGRbvyoY/McWFm3IOE0/2qTU57VDw4cqcONlfQyGhHwCa1rGOPjwEhQy4JdnTsrRthclelaDu887BFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387679; c=relaxed/simple;
	bh=INU875kkZQ5U6gKagMmALFGgC9l0am3wT6m0U8ZlrJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snaBMDCQamk8XOP3nCnn253tpLyixWyiUFC8BTsf6RQmCYsDak4q2WBLdvLa9ylW9IlnNuGXv6ot9EnqIJovSiPexuZYuHc/HV8nYW+hxgZMMhpM5uVTPqfnM4+XFtRcKZwhyjoghtiNMXPp3FeloKmbPh2IA1sVwst1wTXvy1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gm5tqJYA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm5tqJYA"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-540218726d5so4374055e87.2;
        Mon, 20 Jan 2025 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387676; x=1737992476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6phSGDaq3hv1mlLFFxnobjnfwoHhRp2zpkD5NzRqtp0=;
        b=gm5tqJYAvjmKQH/Qf66jbhUATcJEYxGYuw6RBgiDHdYTPYUH/cxlauB70OhBBIfua1
         BejfDXvt1KitvGX9N13VEIbcp6qoZabNNlDuqhCQrrYu8xgWaH3i9OtxhwfdT8FA5baN
         FYKtljcVX1LKoU5MRng8NnE8QJPTzJVnmkzlf608QvxS8Zhol/31TAQQkFZ/3mUER+zo
         t5AL2kkygM5F8iMwAwoI17vB9f+DAnqLpt90bO7KY6tDZP7XP6+FIKqUm6UeoJyvRHCL
         eZTwYlP5I1BD59bFBGf5hkJ+bkU7CQX+D8DydZ+TmEAF7buFTqpnlbWPV/DQofOPmxxS
         ce5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387676; x=1737992476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6phSGDaq3hv1mlLFFxnobjnfwoHhRp2zpkD5NzRqtp0=;
        b=JKA926GYsqZnFb72FTwZWFj4yU1Nxnk8aVdjwRzR3yBYUVmSImAJg+mju4GMk6okW9
         Dj1dpc1mEW2IlOUZ5p7j9vXJDoaenIwbOx5sDsuFo5Er6ixEwZLsOL/2X4j2GYQafywa
         f52A/GcWMik3CrJVZe7JSKfjMZSVutw9MZkeLraUHd/DQtIJZKDK15GZ3hQic27l61I2
         LhSBpW+4VVaDGWbW5Cb24o4YGDe0py6ppiSoZTN7tJrjUqxoUcXLiqiqCPgl9IxETqKw
         z80kzgEkoF8c9Qol3LX9c7/1Jm5Nb9XA9enA9N3GgFgyfdp5uKA/q35zWG22/xtVxgqr
         N0kg==
X-Forwarded-Encrypted: i=1; AJvYcCV+5R1aAwGn8uoPJoqBIP3O41hYdVUA5frCSIpe2KZIcmQKTISzluP3a4gFWWXIf+T1dLlrNIowK2g=@vger.kernel.org, AJvYcCV6gcP1VXXTd/ufwyqxtAS7CSPSutHj5K3FWtHMbJ1PtAoQXCCIiky28XJRqQfAMUkW+K+h9B1kaeqrxray@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25j7Jb/XEbCxCrbskGKaDEoUlR1A4RLu01UKyoeiWGILZLplS
	W5Q1IWcfAznkZEyebv2wFpnR74ae5DGNj9VBoRag6lyDcF7r+IEgYAGaRxCTKrwe9rDY88BcPLy
	kzMP4qokQKJ3yVHXbB6PUgXaQMj8=
X-Gm-Gg: ASbGncuwef7VC/1Xp/ZuuZJSsfbvDy0WLmhZNjKlzq+lCmu0hqzSKzDjslc/Uc6qXa+
	avhsxuhN3HB82n7P7D0OJorExWD+aHz4OlWCk5DSRW3gCfMcNUo8=
X-Google-Smtp-Source: AGHT+IE31mT7c1JrfGuGiu8GGV1KRrNf+wAVdI3hJf9q82OOTyGEz62tZ6WSyWp4kUEU2Mqw5nsIuMeiRJmCBJJLwUM=
X-Received: by 2002:ac2:5e9d:0:b0:540:1abe:d6d2 with SMTP id
 2adb3069b0e04-5439c2824b4mr3975322e87.35.1737387675420; Mon, 20 Jan 2025
 07:41:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
 <20250120082908.4162780-1-hyesoo.yu@samsung.com>
In-Reply-To: <20250120082908.4162780-1-hyesoo.yu@samsung.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Tue, 21 Jan 2025 00:41:01 +0900
X-Gm-Features: AbW1kvZGlcjQq3dFQfHorYaRRanRk-TtNWJMLmLSLqZaZdCdxFWs1a5oa8uXvtk
Message-ID: <CAB=+i9R-9LQWJFGSJJ5dUqwkoFQK8VDxEwi-4Sb73pTP+xw+wQ@mail.gmail.com>
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 5:30=E2=80=AFPM Hyesoo Yu <hyesoo.yu@samsung.com> w=
rote:
>
> If a slab object is corrupted or an error occurs in its internal
> value, continuing after restoration may cause other side effects.
> At this point, it is difficult to debug because the problem occurred
> in the past. A flag has been added that can cause a panic when there
> is a problem with the object.

Hi Hyesoo,

I'm concerned about this because it goes against the effort to avoid
introducing new BUG() calls [1].

And I think it would be more appropriate to use existing panic_on_warn
functionality [2] which causes
a panic on WARN(), rather than introducing a SLUB-specific knob to do
the same thing.

However SLUB does not call WARN() and uses pr_err() instead when
reporting an error.
Vlastimil and I talked about changing it to use WARN() a while ago
[3], but neither of us
have done that yet.

Probably you may want to look at it, as it also aligns with your purpose?
FYI, if you would like to work on it, please make sure that it WARN()
is suppressed during kunit test.

[1] https://docs.kernel.org/process/deprecated.html#bug-and-bug-on
[2] https://www.kernel.org/doc/html/v6.9/admin-guide/sysctl/kernel.html#pan=
ic-on-warn
[3] https://lore.kernel.org/linux-mm/d4219cd9-32d3-4697-93b9-6a44bf77d50c@s=
use.cz

Best,
Hyeonggon

> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Change-Id: I4e7e5e0ec3421a7f6c84d591db052f79d3775493
> ---
>  Documentation/mm/slub.rst |  2 ++
>  include/linux/slab.h      |  4 ++++
>  mm/slub.c                 | 14 ++++++++++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/Documentation/mm/slub.rst b/Documentation/mm/slub.rst
> index 84ca1dc94e5e..ce58525db93d 100644
> --- a/Documentation/mm/slub.rst
> +++ b/Documentation/mm/slub.rst
> @@ -53,6 +53,7 @@ Possible debug options are::
>         U               User tracking (free and alloc)
>         T               Trace (please only use on single slabs)
>         A               Enable failslab filter mark for the cache
> +       C               Panic if object corruption is checked.
>         O               Switch debugging off for caches that would have
>                         caused higher minimum slab orders
>         -               Switch all debugging off (useful if the kernel is
> @@ -113,6 +114,7 @@ options from the ``slab_debug`` parameter translate t=
o the following files::
>         U       store_user
>         T       trace
>         A       failslab
> +       C       corruption_panic
>
>  failslab file is writable, so writing 1 or 0 will enable or disable
>  the option at runtime. Write returns -EINVAL if cache is an alias.
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 10a971c2bde3..4391c30564d6 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -31,6 +31,7 @@ enum _slab_flag_bits {
>         _SLAB_CACHE_DMA32,
>         _SLAB_STORE_USER,
>         _SLAB_PANIC,
> +       _SLAB_CORRUPTION_PANIC,
>         _SLAB_TYPESAFE_BY_RCU,
>         _SLAB_TRACE,
>  #ifdef CONFIG_DEBUG_OBJECTS
> @@ -97,6 +98,9 @@ enum _slab_flag_bits {
>  #define SLAB_STORE_USER                __SLAB_FLAG_BIT(_SLAB_STORE_USER)
>  /* Panic if kmem_cache_create() fails */
>  #define SLAB_PANIC             __SLAB_FLAG_BIT(_SLAB_PANIC)
> +/* Panic if object corruption is checked */
> +#define SLAB_CORRUPTION_PANIC  __SLAB_FLAG_BIT(_SLAB_CORRUPTION_PANIC)
> +
>  /**
>   * define SLAB_TYPESAFE_BY_RCU - **WARNING** READ THIS!
>   *
> diff --git a/mm/slub.c b/mm/slub.c
> index 48cefc969480..36a8dabf1349 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1306,6 +1306,8 @@ slab_pad_check(struct kmem_cache *s, struct slab *s=
lab)
>                         fault, end - 1, fault - start);
>         print_section(KERN_ERR, "Padding ", pad, remainder);
>
> +       BUG_ON(s->flags & SLAB_CORRUPTION_PANIC);
> +
>         restore_bytes(s, "slab padding", POISON_INUSE, fault, end);
>  }
>
> @@ -1389,6 +1391,8 @@ static int check_object(struct kmem_cache *s, struc=
t slab *slab,
>         if (!ret && !slab_in_kunit_test()) {
>                 print_trailer(s, slab, object);
>                 add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
> +
> +               BUG_ON(s->flags & SLAB_CORRUPTION_PANIC);
>         }
>
>         return ret;
> @@ -1689,6 +1693,9 @@ parse_slub_debug_flags(char *str, slab_flags_t *fla=
gs, char **slabs, bool init)
>                 case 'a':
>                         *flags |=3D SLAB_FAILSLAB;
>                         break;
> +               case 'c':
> +                       *flags |=3D SLAB_CORRUPTION_PANIC;
> +                       break;
>                 case 'o':
>                         /*
>                          * Avoid enabling debugging on caches if its mini=
mum
> @@ -6874,6 +6881,12 @@ static ssize_t store_user_show(struct kmem_cache *=
s, char *buf)
>
>  SLAB_ATTR_RO(store_user);
>
> +static ssize_t corruption_panic_show(struct kmem_cache *s, char *buf)
> +{
> +       return sysfs_emit(buf, "%d\n", !!(s->flags & SLAB_CORRUPTION_PANI=
C));
> +}
> +SLAB_ATTR_RO(corruption_panic);
> +
>  static ssize_t validate_show(struct kmem_cache *s, char *buf)
>  {
>         return 0;
> @@ -7092,6 +7105,7 @@ static struct attribute *slab_attrs[] =3D {
>         &red_zone_attr.attr,
>         &poison_attr.attr,
>         &store_user_attr.attr,
> +       &corruption_panic_attr.attr,
>         &validate_attr.attr,
>  #endif
>  #ifdef CONFIG_ZONE_DMA
> --
> 2.48.0
>
