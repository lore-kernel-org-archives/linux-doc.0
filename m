Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218B4C77AA
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580799; cv=pass; b=KW68ZmfzPYFvoGN27KFRbJu3MnwprLC1zWNRKidf7VoRBCf3K5K0D78z2Yckhv3Id6H6uh0nGE/kAwLVIJvAn9W8DwWy34Y3vrBvau0FZAuGTUH9MPWcaGJg3BI5LcAK2nhFArVvU6xfwWRQ6wsQoKj2QvPlBn064MwEmqVyPeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580799; c=relaxed/simple;
	bh=3JXviSsNS05f6c95fuXgojlVZygBTpvh0eQQs8WkfiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRrM+S/9JT0VTrC0lMK/tczoI+BYQ/dpgJTikvIHCEo+zDr9PHYrwIhFhty4w6RLqKd8nG+T4HKyfR86BQuhsHriVlH0M/4NjsYhb8TYSAYIQkyyq38y/VbsUcl0R0uTQS2JkP5/a5j/vyYAp0xyTXDZhEQ7ULGVmXGCeT627NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0rJXY1q; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0rJXY1q"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7c58e6eb3edso4172737b3.2
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 03:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778580796; cv=none;
        d=google.com; s=arc-20240605;
        b=TZer0n/+YDjtlyB54NNSNatC2PNtCD2f6o80VUaf4SPiEuDY9VtHxLgAiJZGM2pu17
         JKb/Gez33QJVFe57xXGm/DN5rpLcwbIMIm7Np/E798uvrS9NWyBWzLxJdD4+DePZTcdw
         43bWhvGSwkscH3m9PSBwA9pR3mUVGnAKqCm4aqhEqsChRCTp3kQgEEjAEq1imZwBaj69
         9ZGHKZr8cC9AZFeK//xLwYemll4Uj79Xc88HQpGa5/4jnEE3+awTUJL1R5O4Gnu8u+8u
         KZWTISClxDvJmsCn3rFLvmZKtp918TPhRuFKxSnitzFeHu+uicZm8tA2cYvoI6wTRwIZ
         ELDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BSZqOS+TrqkUHbWv/C2v4w7E8GCl6EcU8pMI4+NnO4=;
        fh=N9hKEmxjsp6XnjsK4nVAnRwWrEtNVvG6LqfIe5F7iOA=;
        b=ArLoiCdB/fc7aByqsP94QReReBh3KaK1g4cNDaHG2QRPyxktBbfkhko5tzRY7HokB5
         xAvTF16Q0SUlJIurqg3zBjECCEq8REtyWntcZnGGKbDuUW/ELiTqrwxxKSwVOQfkP7jS
         ZLSJVGM+G6AzwTA2qBHyihYh3w7KjyLKAc1mAnd1QaQ9WEBFNN+kYdkaTQW9wJmgHNyJ
         Xore2trXwdvB6h46Ak8jEvTDXsH/bNHSjzl6MbL0lifS8MB7S5UZKguez/JUwMnrqsAd
         iixB54IoFVMojtxWoPms+loX6MOYXdFvuenOr5FKq2h20nawPUJ6yxwDH3WXYXlKKv4E
         rnPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580796; x=1779185596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BSZqOS+TrqkUHbWv/C2v4w7E8GCl6EcU8pMI4+NnO4=;
        b=d0rJXY1qXMP+qdjzen+4W6TpacmYAQEw1wV2s+GTrt8gWLhaOamJ0SPOZyHHUyI6f5
         pGy7+islksyKuw3htw8inCJEMv377G1cdqt30AWubqQR+VNeFcpGYq9PTw+77P729oPQ
         BhHhTyzsscS7zRStrDAUCYOiYXa9bEIV4CNQ9QyhlLWDz6nNIrhT/PKgxnstJzyvvGzq
         5HK0JDSZ6uRWQde04yROY9f4wabk1pFgG/kYNK3bnOdWGkgKMxP3gPmk95l8+dGqlLq5
         Eje4Xc4GMQ0Xws+gVHb9SrdWjUgrTiDU8bOrkXwfhTjpvyRxdL4o6p0gm49zKtXOrgcm
         lOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580796; x=1779185596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5BSZqOS+TrqkUHbWv/C2v4w7E8GCl6EcU8pMI4+NnO4=;
        b=qj8GPgiUsFwKGLKKKxQHxrsU8X8Z/X8Xqcr5LTD9+pOtfZnMeLHghpiBXAvDIpxc8T
         zk7d4gySKiWEesNTCkU0b2wMeM3hWKgdrfIqb3O9xz3f4OLDL8WPKQOO4Ixm3N5tAl0j
         r7PxukNqFls4Fm5nT7+FqtWOqsw4Bkup5bQvmDkmka7uhVuAJbomFXRbT25xEA1iAYCV
         Tmc3v0R9v9i1a6GgJrm7A/KlR3AAPdEaqIqD6u+hevN/FX4KthbPr27mgczdZFlrsBHV
         SmL0DDJKbGFaLdxsm+yjAEqE9RzBNb7j9Kmea3NAHx6No+UclQkLoIEQ1WUEXPx5Ga4E
         QDfA==
X-Forwarded-Encrypted: i=1; AFNElJ9J+p7oCYhDKMLieswmVJ3uAnMD3GxPt+J/xSM7VaaGba8OYbv+p0xRRNxLb/8uac+PXniuNte0x2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXEZR4yGDb3vX4TZrP4CGXPHUP2gMY9SwbdShvYnHAxPjc6eLV
	hcqQvuDqcI3w840RXbs/InP+vaZTHE48HPTnc+IVpkaEXSVUjwUZ45MK9cvOQbmSVo1vgx1lOhb
	F4JabviCydnRtpotfKT2j81SfX7eE2Es=
X-Gm-Gg: Acq92OEoz76ICoFBKIusBIanYtvPweNc4rZuULZU0/Zq8Voo1JLgjUUWnDwvYSNh5L6
	W3kR8sQ5atYpH9H8tE+BlaIa400oufoTCDDBq8MdZv+rLaTX044cUhzh8NfDCWN8kqtQRkH9Ack
	jNjII/fimjnTy31JdhVJ+SrxZhgX+dVCd6bvmcNGnpzA8IZ4/3CE765e0tswwzwUCd1tHXVwsF+
	61NgHtmTone5Bdyr//aIBKqSlrypb6u96cfIAmlBfPIBk+zKFbwNYc6GfF6hz9JpJt4RagFw9aQ
	0cs=
X-Received: by 2002:a05:690c:4d47:b0:7b6:f4f:f057 with SMTP id
 00721157ae682-7bdf5e9c436mr289758407b3.24.1778580796530; Tue, 12 May 2026
 03:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com> <20260508190121.3461706b01f6079bbacdd167@linux-foundation.org>
In-Reply-To: <20260508190121.3461706b01f6079bbacdd167@linux-foundation.org>
From: jim.cromie@gmail.com
Date: Tue, 12 May 2026 04:12:50 -0600
X-Gm-Features: AVHnY4JV_Kad_CzJVZ6-hA21hwnqEtvGFXmvgfMclci-oTVYzeG4JisLmLwYre0
Message-ID: <CAJfuBxz7t08qiAxrDuUkF6_6pkjG-nK_3tn82w+Kbt+y=XZxug@mail.gmail.com>
Subject: Re: [PATCH 00/17] dynamic-debug cleanups refactors maintenance
To: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Documentation List <linux-doc@vger.kernel.org>
Cc: Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Shuah Khan <shuah@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 8:01=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 04 May 2026 14:45:06 -0600 Jim Cromie <jim.cromie@gmail.com> wrot=
e:
>
> > This series is nearly all maintenance: it refactors/splits functions,
> > The user visible change to /proc/dynamic_debug/control is s/class
> > unknown/class:_UNKNOWN_/, which is a more visible/greppable indication
> > of incomplete class definitions.
>
> Wait.  We can't make userspace-visible changes?
>

- the code has been marked BROKEN for its 1st, intended user: DRM,
so there are no users affected by this change
- UNKNOWN is an error condition, an incomplete/incorrect classmap definitio=
n,
and is expected to be caught in implementation or review.
- phase 2 of the patch set has improved compile-time and modprobe-time
validation,
they would catch this coding error.
- I will drop this patch if these reasons are insufficient.


> > Coder visible change is to drop the enum ddebug_class_map_type's
> > unused vals - namely: DD_CLASS_TYPE_DISJOINT_NAMES
> > & DD_CLASS_TYPE_LEVEL_NAMES
> >
> > These allowed more symbolic named inputs:
> >   echo +DRM_UT_CORE > /sys/module/drm/parameters/debug
> >
> > But theyre unused 3 years later, and probably not worth keeping.
> > With a removal commit in the log, its easy enough to restore them later=
.
> >
> > ...
> >
> >  MAINTAINERS                                        |   1 +
> >  include/linux/dynamic_debug.h                      | 106 ++---
> >  kernel/module/main.c                               |  12 +-
> >  lib/dynamic_debug.c                                | 504 ++++++++++---=
--------
> >  lib/test_dynamic_debug.c                           |  28 +-
> >  tools/testing/selftests/Makefile                   |   1 +
> >  tools/testing/selftests/dynamic_debug/Makefile     |   9 +
> >  tools/testing/selftests/dynamic_debug/config       |   7 +
> >  .../selftests/dynamic_debug/dyndbg_selftest.sh     | 257 +++++++++++
> >  9 files changed, 582 insertions(+), 343 deletions(-)
>
> No Documentation/ updates?

I have 2 doc-only updates I peeled off and sent to @Linux Documentation Lis=
t
Otherwise, there are no behavioral changes here to write about.
Phase 2 has API changes needed to actually fix classmaps for DRM, and
docs to go with it.

I split out phase-1 to lower the barrier to review and apply.
By your response, it seems to have helped.

wrt sashiko review, Ive made several adjustments, Im reviewing,
working the others.

Thanks
Jim
