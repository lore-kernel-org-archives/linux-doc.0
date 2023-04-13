Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3C1C77B6E
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 12:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjDMMiw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 08:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjDMMiv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 08:38:51 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009B993D1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 05:38:49 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id qb20so36634371ejc.6
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1681389528; x=1683981528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=80XOupwEydImNFImNi9YzwZQAYrfVPalPz/6koNH+OQ=;
        b=WbVa8mtEKFuN8Fzn/sc1Ag//M4u6Tv5kyOLYzxXpgsNB3kQOvmss8fAbTSfgYAqrXz
         Nz2gdQrelH8JdEkKyk5V5QhlHd6mtgGgZfhNjAaLYa7ccyQIzf/kcqgdvMsMWuqpmwbm
         3U3PuUG+M0Cm9IQC/KXg12OKTeqLLiws1BHfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681389528; x=1683981528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80XOupwEydImNFImNi9YzwZQAYrfVPalPz/6koNH+OQ=;
        b=hfh8lpAXDLCfW5fLpOi7WImG5ls/GfNc45oByb4Xo2pierooMmNYDV3tybHe1INN6R
         YFaGj9Ju3dCadzYsY6+9RbiWWr1GwxqBLPbzDj4e0Vgk3Z0q0r2s0OgJov8lJMRx/z5n
         0SJg5KB3GgHcl5bhMMS92p+M1XuyRnSk+YlmRod9J4/ChyQ3wRfOfxzFUMr06RqyxcOs
         dh75HJzJeJL8n4cb3Vl+wYukjgaN4hA+F210A4dLVtDFtQBxyncu+AkeTjQy2ES4YUqr
         ny5ziu7/1w4Xb7JPs3JOUqO7o8OHnB5tJgCdPlPRymiWzxFOh90f/doRhy/VUcdrE8Cl
         bj8g==
X-Gm-Message-State: AAQBX9fwaa2PlAihYXUJktuUfa1ZPKaiwjXRT+0IxS/pTIhXM500IPI8
        aOnwts+TuwJAn+ZilOJV6KtmTLXIHKrz4QFd4NlzKA==
X-Google-Smtp-Source: AKy350Y86kypZ6iuf2r0dmwP5DoiggvZU1uQ7oDQ8/09NxbbY91pFRClYxEJzsMHwUVBAs0KUgj6mQs5p9MZGnzV/BI=
X-Received: by 2002:a17:906:d298:b0:932:1bdf:be3e with SMTP id
 ay24-20020a170906d29800b009321bdfbe3emr1232299ejb.0.1681389528500; Thu, 13
 Apr 2023 05:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer> <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk> <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
 <87ile011kz.fsf@toke.dk>
In-Reply-To: <87ile011kz.fsf@toke.dk>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Thu, 13 Apr 2023 14:43:32 +0200
Message-ID: <CAHApi-m4gu8SX_1rBtUwrw+1-Q3ERFEX-HPMcwcCK1OceirwuA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Well, you mentioned yourself that:
>
> > The disadvantage of this patchset is requiring the user to allocate
> > HugeTLB pages which is an extra complication.

It's a small extra complication *for the user*. However, users that
need this feature are willing to allocate hugepages. We are one such
user. For us, having to deal with packets split into disjoint buffers
(from the XDP multi-buffer paradigm) is a significantly more annoying
complication than allocating hugepages (particularly on the RX side).
