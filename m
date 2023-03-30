Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E7CC6FD1D
	for <linux-doc@archiver.kernel.org>; Thu, 30 Mar 2023 04:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjC3EwK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Mar 2023 00:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjC3EwJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 00:52:09 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCAD35B5
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 21:52:08 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5463fa0c2bfso3346187b3.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 21:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680151928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO4PQ6TBQUMJYGG4kwuLxr6yMenE39U1cJw8HTuy6lg=;
        b=ZZNs3IBNvpq8rntHV5NIOSkis4YZkMzsAjmfFmPR3uyWaDukso/k3tomFXQoA79UH0
         V6IWti4B7o666Pm3pWHdJv96dTssfHmLIfmtAOGUSE2DKcBoJII9cfcKDXk356yd/tcZ
         HCCD7gk4I5zUsHxRlwgaPDSNluCKnTZCU8ciUmtyI2YcIRfC2S7Sf3RB19d6jpjuEwQe
         gRo11KSdhm4cPKRIIsZRaQiYWl6oDoNZsw8GKpy8yM5C9Fkr5Gwig2iTGd99k4q014OO
         v6h5iU+voqZrIk/8/QnZO+N2P/Mx3nZwdtHRDnaFZugUStyH9hvabc5iBGlR2KVyihp9
         IYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680151928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RO4PQ6TBQUMJYGG4kwuLxr6yMenE39U1cJw8HTuy6lg=;
        b=Wg6dQPhMBzRHGUpJ/CHw4k6MYOsGQ60p6t3IVkz5S+RESLzHJDJot4kD6WKnWfv31i
         6ttoqBZI1aw2db0MZaa9k9OnnL8IoBK7fZ2c7AH483v58sLgf9aFNL7inSFcT4+eMmt2
         4N/2JtxGSS4cmGHihRYjN8QQzoTFWNaLV6oRJ9rfql0yYFVaybtf3EAaObDe0JXU8GDB
         L1PFarnvmlFf9r+eTiQW22BqEDOmHwhA/oSJTS+MyDBnI4oDQu9v7s4x6o6+vh2UQ+85
         y0v/sLWAdIj/9lkuFYgJl1LYOioy72Ek1QYilgX75eRHbABqSVSbDPfIapBa1yCvjriC
         dkmQ==
X-Gm-Message-State: AAQBX9dw3XzhGtDQewZ0Go/PvlWxH0uzF2oWvwpygry7amViVfcSqm0n
        tnX737T6GJUtXfzUKOyth+z6ggo8giE1gh364sJrVQ==
X-Google-Smtp-Source: AKy350YnZgbOo6w5xUZz4s5lMgLbpcTFKk+vV8vas+HxvljdpL2280koeaEB3YKWM6wYoe5gf8d3QT+RO6TGDsudWNQ=
X-Received: by 2002:a81:ae23:0:b0:541:7237:6e6b with SMTP id
 m35-20020a81ae23000000b0054172376e6bmr10323405ywh.0.1680151927770; Wed, 29
 Mar 2023 21:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230329073322.323177-1-feng.tang@intel.com> <ZCUPxMQPJ8ETvUbM@debian.me>
In-Reply-To: <ZCUPxMQPJ8ETvUbM@debian.me>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 29 Mar 2023 21:51:56 -0700
Message-ID: <CALvZod48Fwua_VJvnzHatF-J4YRWqfMFnYjYN6W0_ioLtPZEfA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: Add document for false sharing
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Feng Tang <feng.tang@intel.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Joe Mario <jmario@redhat.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Eric Dumazet <edumazet@google.com>, dave.hansen@intel.com,
        ying.huang@intel.com, tim.c.chen@intel.com, andi.kleen@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 29, 2023 at 9:27=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Wed, Mar 29, 2023 at 03:33:22PM +0800, Feng Tang wrote:
> > +False sharing hurting performance cases are seen more frequently with
> > +core count increasing.  Because of these detrimental effects, many
> > +patches have been proposed across variety of subsystems (like
> > +networking and memory management) and merged.  Some common mitigations
> > +(with examples) are:
> > +
> > +* Separate hot global data in its own dedicated cache line, even if it
> > +  is just a 'short' type. The downside is more consumption of memory,
> > +  cache line and TLB entries.
> > +
> > +  - Commit 91b6d3256356 ("net: cache align tcp_memory_allocated, tcp_s=
ockets_allocated")
> > +
> > +* Reorganize the data structure, separate the interfering members to
> > +  different cache lines.  One downside is it may introduce new false
> > +  sharing of other members.
> > +
> > +  - Commit 802f1d522d5f ("mm: page_counter: re-layout structure to red=
uce false sharing")
> > +
> > +* Replace 'write' with 'read' when possible, especially in loops.
> > +  Like for some global variable, use compare(read)-then-write instead
> > +  of unconditional write. For example, use::
> > +
> > +     if (!test_bit(XXX))
> > +             set_bit(XXX);
> > +
> > +  instead of directly "set_bit(XXX);", similarly for atomic_t data.
> "... The similar technique is also applicable to atomic_t data".
>
> But how?
>
> > +
> > +  - Commit 7b1002f7cfe5 ("bcache: fixup bcache_dev_sectors_dirty_add()=
 multithreaded CPU false sharing")
> > +  - Commit 292648ac5cf1 ("mm: gup: allow FOLL_PIN to scale in SMP")
> > +
> > +* Turn hot global data to 'per-cpu data + global data' when possible,
> > +  or reasonably increase the threshold for syncing per-cpu data to
> > +  global data, to reduce or postpone the 'write' to that global data.
> > +
> > +  - Commit 520f897a3554 ("ext4: use percpu_counters for extent_status =
cache hits/misses")
> > +  - Commit 56f3547bfa4d ("mm: adjust vm_committed_as_batch according t=
o vm overcommit policy")
> > +
>
> Here's what I mean by bridging conjunctions to example commits as I revie=
wed
> in v1 [1]:
>

This is too much and unneeded nitpicking. The patch looks good as is.
