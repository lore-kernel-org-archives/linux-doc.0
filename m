Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BA12AAED
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711433830; cv=none; b=sV5HWgRAO1ydxFN83BL5KVlrLNO956HFoPMEKK/vk317acC+4L93AIuW2EL+r5V3ck3QJttGnroRiyMnryKO2s5J7KlHwaQomHknOFUgKNg9tBn1r7aI9reDdy9Jt4ot5fV7M4AibJnn/1UNm9syIzBJIOpQ6iklTa+hBszkOsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711433830; c=relaxed/simple;
	bh=cjpYESOM7QMMIUabp8rtA0I+OebgB6BIhZxP8vFNojE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=an5sb16cYSGTBCi3RblhK4bEb0u1G/VReEaFXNub7VCgaZNfc9M5oaTZy4qFLqpREUcZ1amFvPLtLjbtKe+hA59m7EiSDRTBVubnK2AmCaeKF8f8JgK4v5EobpDhE9CqmunqhE7IdOmB7BmHafaU+lZqPeFTkX9Uy72j1EteL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T7dem5P3; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T7dem5P3"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc71031680so4520315276.2
        for <linux-doc@vger.kernel.org>; Mon, 25 Mar 2024 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711433828; x=1712038628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z496Fd73CRYseME+3jY6zyut4smUZ0eN3AIP9fOLqdk=;
        b=T7dem5P31ZTUMamKiNjXX/VzUANyV9bvdtsleVMrndS24LM4lW0mApPWFmeFplgU5M
         WUt6oeTSNzgYe+WcJuWZ1QOFMT11WPF7x8a8J+Fur3Thar7LTgJZXFa90rfqzPQ/qhRQ
         Kt23puhb+bUhTQeM43DHeU9zuC9JN7VmHTebFKnh/vyvkLNUBuFYz6DpACbIuCfVtz4d
         dKA3KqJof+sncu++9yyEgj8oX9qzJwzaynJwsrbyXZ2ZAU4zIblsNLMtIPtVFloL2aoh
         c5lG3byFZZBuJ1ShR67Oty1U7caRgvPbcRto2PdA9lCwSaHjhPkGQY3ROVWHsCRZdEpL
         pKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711433828; x=1712038628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z496Fd73CRYseME+3jY6zyut4smUZ0eN3AIP9fOLqdk=;
        b=JIF18KF6FZ3Wik0H3GHXfsfdhlEFiCRmAhxFyGn6MYtlStOeej4AB1T5vhATb+O9+C
         AEOvziy3I7zUlYHiiqJZOJeMxU4NmgUhU9XUI/I/FOWSWzClW+EOJhO3kuhn0QNs/Dnn
         BUeLte2muvBaab8bnleNv1VwIZmQB0tr7lxjIEXrVLazP+AYG5qsEze3k3JKcS5eUk8S
         KgeuoRSAWYeN2cSUv9IgLMqdD9KQhgqRiHG78ljl2+VfNft46Py2gE7rQbLN+mNZMM9A
         3dBvtj3AsrqJeTTk8UrKrUB4k5j0e65ADO2NqdRHH+GqVwTEY24SnvpfWgEoutWIWLQD
         vOpg==
X-Forwarded-Encrypted: i=1; AJvYcCXVuj5J/T3WuZCIrWWEDidI9THoUwWrXJhIyKjOH8WfWRQ7jL2M63hnCAknZ/AVaPE/AfB6g3lz4j/P6FmDTH92un8c17DLNhxr
X-Gm-Message-State: AOJu0Yy86vLGL+NowWBK8OAW+ucbcp4riUBBYBru7y5JvXrubdZQdnLK
	8vTZG6YToPLJ6aW5DUsol2WqP0VDEi+ruaTZxSQOyeCXmw8AtbrHoJmz91yQPzpbEOILj7ywxdc
	kTVXfA4nB4NNLgO+dPyh3hnjHKbBajD1l/5Nd
X-Google-Smtp-Source: AGHT+IEV/dFFov55V7o1ynkJrF4pIJ/0LJvsrOPx/JXXTb5VOpv/f8LDRkk8uJ5K2QGdEcgfMh/IK2JoU9tv+OldiI4=
X-Received: by 2002:a25:c793:0:b0:dc7:3165:2db1 with SMTP id
 w141-20020a25c793000000b00dc731652db1mr7239261ybe.49.1711433827791; Mon, 25
 Mar 2024 23:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325123603.1bdd6588@canb.auug.org.au> <CAJuCfpH4Ee00hM9+B7=mi5Dwjrhov8vUK-KwPuoO3wsD7iJSAQ@mail.gmail.com>
 <5e1321ca-0d46-4e9d-a6e5-0560d99f65ff@infradead.org>
In-Reply-To: <5e1321ca-0d46-4e9d-a6e5-0560d99f65ff@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 25 Mar 2024 23:16:55 -0700
Message-ID: <CAJuCfpFTOz8cNiJFiCU5tMM1u5L=wXRsXqxUhN9g-R0u77CyZw@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 10:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 3/25/24 19:19, Suren Baghdasaryan wrote:
> > On Sun, Mar 24, 2024 at 6:36=E2=80=AFPM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> >>
> >> Hi all,
> >>
> >> After merging the mm tree, today's linux-next build (htmldocs) produce=
d
> >> these warnings:
> >>
> >> include/linux/slab.h:545: warning: expecting prototype for kmem_cache_=
alloc(). Prototype was for kmem_cache_alloc_noprof() instead
> >> include/linux/slab.h:652: warning: expecting prototype for kmalloc(). =
Prototype was for kmalloc_noprof() instead
> >> include/linux/slab.h:692: warning: expecting prototype for kmalloc_arr=
ay(). Prototype was for kmalloc_array_noprof() instead
> >> include/linux/slab.h:714: warning: expecting prototype for krealloc_ar=
ray(). Prototype was for krealloc_array_noprof() instead
> >> include/linux/slab.h:730: warning: Function parameter or struct member=
 '_n' not described in 'kcalloc'
> >> include/linux/slab.h:730: warning: Function parameter or struct member=
 '_size' not described in 'kcalloc'
> >> include/linux/slab.h:730: warning: Function parameter or struct member=
 '_flags' not described in 'kcalloc'
> >> include/linux/slab.h:730: warning: Excess function parameter 'n' descr=
iption in 'kcalloc'
> >> include/linux/slab.h:730: warning: Excess function parameter 'size' de=
scription in 'kcalloc'
> >> include/linux/slab.h:730: warning: Excess function parameter 'flags' d=
escription in 'kcalloc'
> >> include/linux/slab.h:774: warning: expecting prototype for kzalloc(). =
Prototype was for kzalloc_noprof() instead
> >> mm/slab_common.c:1217: warning: expecting prototype for krealloc(). Pr=
ototype was for krealloc_noprof() instead
> >> mm/util.c:751: warning: expecting prototype for __vcalloc(). Prototype=
 was for __vcalloc_noprof() instead
> >> mm/vmalloc.c:3897: warning: expecting prototype for vmalloc(). Prototy=
pe was for vmalloc_noprof() instead
> >> mm/vmalloc.c:3916: warning: expecting prototype for vmalloc_huge(). Pr=
ototype was for vmalloc_huge_noprof() instead
> >> mm/vmalloc.c:3953: warning: expecting prototype for vmalloc_user(). Pr=
ototype was for vmalloc_user_noprof() instead
> >> mm/mempool.c:245: warning: expecting prototype for mempool_init(). Pro=
totype was for mempool_init_noprof() instead
> >> mm/mempool.c:271: warning: Function parameter or struct member 'gfp_ma=
sk' not described in 'mempool_create_node_noprof'
> >> mm/mempool.c:271: warning: Function parameter or struct member 'node_i=
d' not described in 'mempool_create_node_noprof'
> >> mm/mempool.c:271: warning: expecting prototype for mempool_create_node=
(). Prototype was for mempool_create_node_noprof() instead
> >>
> >> Introduced by commits
> >>
> >>   c64e38ed88d1 ("mm/slab: enable slab allocation tagging for kmalloc a=
nd friends")
> >>   ea7b8933f21b ("mempool: hook up to memory allocation profiling")
> >>   576477564ede ("mm: vmalloc: enable memory allocation profiling")
> >>
> >> from the mm-unstable branch of the mm tree.
> >
> > Thanks for the report, Stephen!
> > Let us check with Randy Dunlap how we should handle these. I assume we
> > still want documentation to document kmalloc(), not kmalloc_noprof().
> > Maybe there is a way to mute these warnings.
>
> A proposed patch is here:
>   https://lore.kernel.org/lkml/20240326054149.2121-1-rdunlap@infradead.or=
g/T/#u

Thanks! I'll change back all the instances in the documentation where
we replaced original names with _noprof versions.

>
>
> --
> #Randy
