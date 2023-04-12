Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCEBC7619A
	for <linux-doc@archiver.kernel.org>; Wed, 12 Apr 2023 14:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjDLOas (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Apr 2023 10:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjDLOar (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Apr 2023 10:30:47 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635E410C0
        for <linux-doc@vger.kernel.org>; Wed, 12 Apr 2023 07:30:45 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id dm2so29457939ejc.8
        for <linux-doc@vger.kernel.org>; Wed, 12 Apr 2023 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1681309844; x=1683901844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hV5Ne4/31d5bZz3cd3WidbbAZPsQ2K5R5VgJmtESd3c=;
        b=Ef3ZNyIwfn2tgIn5VYdodtKoHofTHBF48vSKjvDgvzzyd7icYtwHpA8gR9eWcXBzE4
         uMsgHSi7oGwf2Z5CYEWmvPh2f1WFFVM2zu98iJObrG71TI0vefPpJXtdZ4g0+8pizmJa
         7kEP6uY+ScqoziGvRMQWQQ2rjDj/GaJnHz3qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681309844; x=1683901844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hV5Ne4/31d5bZz3cd3WidbbAZPsQ2K5R5VgJmtESd3c=;
        b=0Uqai9czjPDpBZjqhw16GB2uh76WKKbUemCzQTBFM85mYi2wKzPxQCCLYPIn6VQ5uJ
         EyhgpxrLxGR6YPY5ZLJEH/WBohBq6TAqP2T99tYWkiFFspNx0edPWV4RW+4dcZJA/a+R
         ETWdH+ZrdeNUKnqD+BDYz2hPId9PBiGKVPz3Tkgvbs84Sg1Q0gINrfn8KmJuN6tX3MSd
         1dTKCrbfYohGA0UdeGxjoKRN5Hdc/lkERvEgHMS2yusm2PhtwoElQ9zw/AjfuXZI7U29
         wKhLcOj+UJT9832n0S+ruvtxXJhIfI2BmRzb7igcv5NmQeNqiAAk35u75ugN6F3BxPqg
         XdJQ==
X-Gm-Message-State: AAQBX9d6kHh2b79raxVUUK51pf7ajV/7zOT5YNLno6iCquq2Pm+rfy7O
        iB62ShVE32POZrpEwWVuf6kS0aLJiwV6GwAtdQJYAA==
X-Google-Smtp-Source: AKy350Yt4SeQfT6MmpPED1unBq6lSFhE49tsPdIDsDUP8eL1G0arDIPgCt7yuQGlyQRpwnW9Oj6ijxAmPvq0B8EgHvI=
X-Received: by 2002:a17:907:d310:b0:931:6f5b:d27d with SMTP id
 vg16-20020a170907d31000b009316f5bd27dmr1417968ejc.0.1681309843846; Wed, 12
 Apr 2023 07:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230410120629.642955-1-kal.conley@dectris.com>
 <20230410120629.642955-3-kal.conley@dectris.com> <CAJ8uoz0NczOxbs7xqwC4B9YDP5fN1oECBi53yHoaZbvTxcm_fg@mail.gmail.com>
In-Reply-To: <CAJ8uoz0NczOxbs7xqwC4B9YDP5fN1oECBi53yHoaZbvTxcm_fg@mail.gmail.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Wed, 12 Apr 2023 16:35:27 +0200
Message-ID: <CAHApi-kp5FVfHm4tVObbOz7yu6o7PjaFLw8XgLB0OFY=pSuaKg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 2/4] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Magnus Karlsson <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
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

> > -       pool->unaligned = unaligned;
> >         pool->frame_len = umem->chunk_size - umem->headroom -
> >                 XDP_PACKET_HEADROOM;
> > +       pool->unaligned = unaligned;
>
> nit: This change is not necessary.

Do you mind if we keep it? It makes the assignments better match the
order in the struct declaration.

> > -static void xp_check_dma_contiguity(struct xsk_dma_map *dma_map)
> > +static void xp_check_dma_contiguity(struct xsk_dma_map *dma_map, u32 page_size)
> >  {
> >         u32 i;
> >
> > -       for (i = 0; i < dma_map->dma_pages_cnt - 1; i++) {
> > -               if (dma_map->dma_pages[i] + PAGE_SIZE == dma_map->dma_pages[i + 1])
> > +       for (i = 0; i + 1 < dma_map->dma_pages_cnt; i++) {
>
> I think the previous version is clearer than this new one.

I like using `i + 1` since it matches the subscript usage. I'm used to
writing it like this for SIMD code where subtraction may wrap if the
length is unsigned, that doesn't matter in this case though. I can
restore the old way if you want.
