Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC95C433FE
	for <linux-doc@archiver.kernel.org>; Sat, 22 Oct 2022 00:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJVARa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 20:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiJVAR3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 20:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603C4E09AF
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 17:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666397847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ffLPQLNndW2qNqcG85lW2feB+QGegvpDWXA/1PXL/o8=;
        b=WR1X9Vj0MxZft0qVNWf2mDA+Ili+XUzJUevdUOs8kV2uCnOoJu4DrFHouMUYG27dDTVDe0
        k7t2un6ogUuOApjq706mraKei5/Xlqs8lDxrE4gvpjDsXzbpixwi9zcMF5MQGvmuXQYHly
        gZ99rHsteA9USEAKr0TWyi8uouENGuA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-k6q9g7DbPWGQAOIkSNpHHQ-1; Fri, 21 Oct 2022 20:17:26 -0400
X-MC-Unique: k6q9g7DbPWGQAOIkSNpHHQ-1
Received: by mail-ed1-f70.google.com with SMTP id z11-20020a056402274b00b0045ca9510fc8so4184609edd.23
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 17:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffLPQLNndW2qNqcG85lW2feB+QGegvpDWXA/1PXL/o8=;
        b=5yuLn33XQo2QqOKPe3MDDC9kpW9efiIgLQ9b+Q03dzuqAM1Dgrkc4JgZ/8GJgyFxNX
         lRRWQNZvVuadS+DNGCmqynRpbMEvySG2iLrB6hdJ/bcM1AYGF9WzsKG+6ZBN+Y5OXwf+
         kucEumoE88PnBWE0xnrznWCCoek5x0W+psRdJy5ZWcYV/vFt0Ggbe7jZqW3T95AtK+gb
         i3jWqh6ddhDOlDySgNEw/XAWSUQ0t9MAW2D7QutE48InimqJLkZjrOqUWBitttE3pFNY
         rG23NUkxukSgO3PeexV0PGMw3FF5IFlLCKKkEQYMnq4EWVfKzF6cCsbRoPGfTJX5S/db
         J0Zw==
X-Gm-Message-State: ACrzQf1AYr8Y/8h0cNscwa0qaJE8h7vyozw4chBICrw7dm6JFatUNk31
        O1w5Iug7TfkCQ8mjF6oYPHf6qOnFQNtXoIdb3aCbzEPOU0KJVl80S3NEoGvhRj+/FDx38bc95e1
        auRyKmlvRY8aTjzUnthGT
X-Received: by 2002:a05:6402:280a:b0:45d:19e8:c7ad with SMTP id h10-20020a056402280a00b0045d19e8c7admr19320285ede.44.1666397844055;
        Fri, 21 Oct 2022 17:17:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7RkKTesKjUts48gOVA6eAd7VenRhjjBJPu5k58JMgOB9rIwxtj/GLog2O5gHtldiRolHFfBA==
X-Received: by 2002:a05:6402:280a:b0:45d:19e8:c7ad with SMTP id h10-20020a056402280a00b0045d19e8c7admr19320251ede.44.1666397843182;
        Fri, 21 Oct 2022 17:17:23 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906200100b007a03313a78esm329655ejo.20.2022.10.21.17.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 17:17:22 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 1F72B6EE715; Sat, 22 Oct 2022 02:17:22 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     mtahhan@redhat.com, bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Maryam Tahhan <mtahhan@redhat.com>
Subject: Re: [PATCH bpf-next v4 1/1] doc: DEVMAPs and XDP_REDIRECT
In-Reply-To: <20221021165919.509652-2-mtahhan@redhat.com>
References: <20221021165919.509652-1-mtahhan@redhat.com>
 <20221021165919.509652-2-mtahhan@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 22 Oct 2022 02:17:22 +0200
Message-ID: <877d0su2y5.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

mtahhan@redhat.com writes:

> From: Maryam Tahhan <mtahhan@redhat.com>
>
> Add documentation for BPF_MAP_TYPE_DEVMAP and
> BPF_MAP_TYPE_DEVMAP_HASH including kernel version
> introduced, usage and examples.
>
> Add documentation that describes XDP_REDIRECT.
>
> Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>

With one small nit below:

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

[...]

> +The following code snippet shows a BPF program that is broadcasting pack=
ets to
> +all the interfaces in the ``tx_port`` devmap.
> +
> +.. code-block:: c
> +
> +    SEC("xdp")
> +    int xdp_redirect_map_func(struct xdp_md *ctx)
> +    {
> +        int index =3D ctx->ingress_ifindex;

Let's get rid of this index variable (it's not used).

> +        return bpf_redirect_map(&tx_port, 0, BPF_F_BROADCAST | BPF_F_EXC=
LUDE_INGRESS);
> +    }


-Toke

