Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088646;
	b=Zi9sxeDP0X2BcYxmUsOefkWMqv4iBrZh857VvBke3cOQihGFnXcGvmCErNOnuVDei0oT
	 onJlTURfaqxV9CZOvr41lNv/dtOfhwFghELL2nvj9Z39dG+7n3b2HicGvSUHEnsgIgLbp
	 UbLBoOJShUbZNfx7cmHZ1OfpJweo+h1QVgJLd+N3yrh0bnD242HgOl0CVa617UbsV064+
	 IG8qJcl8SByc/aMXS6qhOprTVWpeTxUf9AD3DCPGE/DoWCV1vpDBMdZBR8iEuvma3pOKU
	 NmkBdV1jJGugV3EMNqoAg4e9MJ29Y1U1Nu6qYTuhdy2IoA2eMevIaymUT6W4vjBOaiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088646;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DnTyS8CiLp9kXhmJQ0XYx6IOZxT93PhaPAXeNnfkOEs=;
	b=zA9rEX9ZLVUc8R8Aq9HcCvHNBX4keP8lEl6ATiQdYFT7SNm/ziqYDp0huqPziyr3IOCr
	 LkT5fGEGMBoxbgh1ChIJy4uw7kixETPzx5LGAvlCa2rjFRxrDg9IKw8RQfSQPqookuAb0
	 nh88U2k+uDrM2lHJrjU0xxFGTyujacEPFhsT4txkA2ph2ywuzq9ewYNDbIiXxwLijrr4A
	 VszCd9Oaq/q5PgLdoKvXVBnP2/0azC7Jhx5Xjamow2j0X6VrjrjYC6dxHiK2fDIGs6NcP
	 TrXtRQoyQEtkQWzHQBmg3VefvznPSy/MEysrRadzrVn4hOBytiXwD/hrlicQ/SauJLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A8606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 08:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so894667137.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 01:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088645; x=1793693445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnTyS8CiLp9kXhmJQ0XYx6IOZxT93PhaPAXeNnfkOEs=;
        b=HZLr3F5fnxjfGhC6APuzJcftqjtC8CWBTcryhU4gKehrx2pYBDORtFhj8LHnW64xNv
         JwLhq51+0zueRknwT8RHBUWHQ51MZ2xlDgnpw+V3cx23rmbHHEwvp/l56WyV6xL4LIP6
         Nzzfk7cuvTLr5/QYEIwHG8lyDCUuf+x8nb6JM/x2ixYfjkfrG7el/rOs1gV2thCvOqAK
         TT4Pv2o2R9cJKNu6uQTmtd7OD+C5zUYO16Zc63xFTrixwAxWVKzokcz2wg6jYPQg6LVA
         ZRsmiciYKVcbA4ICkXxa10B0zVNcSkYbkH3TjxOJ7nW+O55NevZwGrI1l8gj2M1JN97P
         vfUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZWnwT+aPn1+h0vVIdgku//XQYVg1+Ig0BVrBJmwF1yOKlR+Tv78eq/yjYkJ6ZloG4hX7Sz9Pz/kw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbb1hncx92L2Cs2pU5whGegeDov5oY8+K3Y/4zuBpcZLq5syGG
	7pybN+Ono4Z/NG70fOt0rWmg4YQ7fytW28qfqNBpjjebOaAwN/wgOsBleTuZuupGZq8=
X-Gm-Gg: AYBFou1J0d5SXjpHztEFp+S04Vsyo8FTXCBZz7rECnYhedxO+RdYNEkdIMXBCyjGAs3
	NOM7gRVDsXeBGpPBUWO9QGbDDn4JF84go8ehVFoMcpGyUEy2Bj4lWi8CRNBXWQel3mK4LhYAolZ
	+K7xLse4ZkBzdUImBKFjYIglTACOYCdMdOFEIjXGVSmvlJ8w8DNtLPzGcjCrU+ZdBlR8Gku00lF
	fsFPIq/fbhOw+urRixfEvZI0kNnr+ejSngpRnBHaRhOKcBePXSGs133R5A5l0Niygx9eHRy9yi4
	vOZbspW9wTqqbDWQfhJnfSHuWG4VWFuqcwYHTvU0zgRIbnJbpXubBjDsnjWvcYG99MCgY2ZxLuO
	XYdUyy55dIQGu0cNyM33AnaSaJHhT0BnAujzRID2sXluDk5EsSnHLonS5JKtOH/eD9XTjb+R2lf
	xMIUczfO07QT4JKxggebe4ffx0JwL/r5MpvTYb/uaW22iNdq/ElhKgvezCuMUihF8sgl44rUGRm
	/k/pHpBSiOjbvfPAoA922RKjWd8wfJRiOjkceoepRFuNPyMeR1vOTu5oXmrqycay8cnYoY0HE9A
	n1GmAM1v5xEoDtSZyg==
X-Received: by 2002:a05:6102:f0f:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7ce5ce46140mr2712654137.31.1793088644689;
        Tue, 27 Oct 2026 01:10:44 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3c44ee7sm1692962137.6.2026.10.27.01.10.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:10:44 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so778946137.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 01:10:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6N4Bt9nCfxQSGrQO3TczkYr2nGKCi0Db0HJABCsedhOhoDmF9ok1cBo4yniRQL+z/2WclV42nCVo=@vger.kernel.org
X-Received: by 2002:a05:6102:6a85:b0:7cb:288a:b68b with SMTP id
 ada2fe7eead31-7ce5ceb4cddmr2598661137.37.1793088644228; Tue, 27 Oct 2026
 01:10:44 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020212235.1143086-1-ebiggers@kernel.org> <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol> <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol> <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
In-Reply-To: <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Oct 2026 09:10:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>
X-Gm-Features: AclHuK_1hOMOvqhIVfJ47rUg7hn4eoGYJnc5iIPXkduWeAV9hHcxdetyXE5uQ4g
Message-ID: <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, 26 Oct 2026 at 21:12, Rob Herring <robh@kernel.org> wrote:
> On Wed, Oct 21, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 21/10/2026 08:49, Eric Biggers wrote:
> > > On Wed, Oct 21, 2026 at 08:41:47AM +0200, Krzysztof Kozlowski wrote:
> > >> On 21/10/2026 08:39, Eric Biggers wrote:
> > >>> On Wed, Oct 21, 2026 at 08:26:28AM +0200, Krzysztof Kozlowski wrote=
:
> > >>>> On 20/10/2026 23:22, Eric Biggers wrote:
> > >>>>> -Make sure that base commit is in an official maintainer/mainline=
 tree
> > >>>>> -and not in some internal, accessible only to you tree - otherwis=
e it
> > >>>>> -would be worthless.
> > >>>>> +    If ``git format-patch`` with ``--base=3Dauto`` (or
> > >>>>> +    ``format.useAutoBase=3Dtrue``) can't detect a base commit, e=
.g. due to
> > >>>>> +    the current branch having no upstream tracking branch, it ex=
its with
> > >>>>> +    an error. In such cases, pass an explicit base commit to ``-=
-base``
> > >>>>> +    instead. This is also needed if git detects the wrong base c=
ommit,
> > >>>>> +    such as when the upstream branch has local, unpublished comm=
its.
> > >>>>> +
> > >>>>> +The base commit must be in a well-known public tree, such as the
> > >>>>> +subsystem development branch the patch is targeting. See
> > >>>>> +:ref:`obtain_a_current_source_tree`. Mainline or the latest linu=
x-next
> > >>>>> +can also be acceptable bases, depending on the subsystem.
> > >>>>
> > >>>> I disagree, that's pointlessly too hard requirement.
> > >>>>
> > >>>> For many of my contributions base is obvious and not needed to be
> > >>>> explicitly defined. For all the patches I accept, answer is the sa=
me -
> > >>>> base is either obvious or if not and patch does not apply, then th=
e base
> > >>>> does not matter.
> > >>>>
> > >>>> Requiring it is just bureaucracy without actual benefit.
> > >>>>
> > >>>> The only benefit would be if maintainer COULD change its base to a=
pply
> > >>>> some patch with odd base... but this cannot happen. Maintainer bas=
e is
> > >>>> fixed - it's the HEAD of his development branch for given category=
 of
> > >>>> commits (e.g. DTS branch for SoC maintainers).
> > >>>
> > >>> There are many use cases for applying patches besides the final pat=
ch
> > >>> acceptance, such as review (by anyone, not just a maintainer), test=
ing,
> > >>> CI systems, etc.
> > >>>
> > >>> HEAD of a branch is of course not fixed, and changes every time a p=
atch
> > >>> gets applied.  That's especially relevant when wanting to check out=
 an
> > >>> old patch for any reason.  Trying to guess a base commit based on t=
he
> > >>> date and patch subject is a waste of time.
> > >>
> > >> All these tools should just work on top of linux-next. Requiring peo=
ple
> > >> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree"=
 is
> > >> pointless. I understand that base is helping, but helping and requir=
ing
> > >> an obvious information just do not go together.
> > >>
> > >> So again: base has ZERO meaning to the maintainer process. It has
> > >> meaning to tools, so fix the tools to work on known and obvious tree=
s.
> > >
> > > So what is your proposed algorithm to apply an arbitrary patch when
> >
> > Already provided that, so to recap:
> >
> > > there's no base-commit?  Including any historical patch (from
> > > months/years ago), patches with dependencies, etc.
> >
> > Dependency is something else, but for every other patch:
> > 1. For testing/CI: you apply on top of next
> > 2. Every other case the maintainer knows where to apply it, because it
> > is his HEAD of next-branch.
> >
> > I am repeating myself, but I really had no single problem of lack of
> > knowledge where to apply a patch as a maintainer or reviewer of some
> > subsystem, thus maybe I do not understand the actual problem you are
> > experiencing.
>
> Look at our DT PW. There are numerous patches that don't apply and
> then we silently don't test them at all. Here's one example[1] (3

That's a false positive, as the first two patches (the ones that really
matter for you as DT maintainer) do apply to yesterday's linux-next ;-)

> actually as the whole series doesn't apply). The more base-commit

There are indeed patches in that series that cannot be applied, which
is explained in the cover letter.

The problem boils down to how to present work that touches multiple
target trees, and where some parts depend on other work that is
not yet finished. Do you post it as single series, so people get an
overview? Do you split it in multiple small series (which may still
have interdependencies), so everybody looses context?

> [1] https://patchwork.kernel.org/project/devicetree/patch/8b2c7719c301a44=
5891fc6c5309456327ec8a94c.1793026273.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
