Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71364C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 20 Dec 2022 11:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbiLTLMx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Dec 2022 06:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbiLTLMw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Dec 2022 06:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3060719018
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671534721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AcFvnlNioLP/KkH6qBwLrs8kaBJYehGt9ukR9bUDWnM=;
        b=JigKzRgJhAKdXkIrSOtUDMr6cV828G7GsPkCdcVPclwC2Yzhc5L8skdzei8/kBIYK2vhxQ
        vfG2bc5uv7kWN4P6EcKTlB6mbaNAd3bO0dwxCstcT8fNdAnvw+319S1ks4jz1opamLbnKf
        nlWy/1CVO6JoPrmdjPv7FNdYkGm+ZVA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-1VTkZ1mUMCG_wOBksbQDOA-1; Tue, 20 Dec 2022 06:11:59 -0500
X-MC-Unique: 1VTkZ1mUMCG_wOBksbQDOA-1
Received: by mail-qt1-f198.google.com with SMTP id n26-20020ac8675a000000b003a97d74d134so3128696qtp.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 03:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcFvnlNioLP/KkH6qBwLrs8kaBJYehGt9ukR9bUDWnM=;
        b=2JZJ5sZgtJV2Mq1YhaSW3XttOkCYNvg4a8HLJXynGNhWCqtP7Pyvb0iNfhFVXEUC8M
         cRhhwIBMqTDTv3v+T31eRufT2iko4UV+5nCxu8ca3GgGrxMko9gn1j1z9PY7YFacDsJT
         qHgxYm+ZEw4AGpQX6+3+epcDGE9PzrIICbnIyIJktNFwhzH+x+TOtdAPdyUNloDDi8GA
         ujcJzR8zGdEP82sobY4D3vIcaMjkjuCTyAudE2370glGhteUqpj3zyg6t8PSa8QVdXdH
         Tsg3M5iH2nxU585rsGdDs8fNYxzY60OjTHQCm1a5q/Yd9fSNrOBGqksxVBXmNDIp1gvk
         OlWg==
X-Gm-Message-State: ANoB5plf2woZs75LXaQ8JG6lgkfl3xsGK6n//rIESBUw1GIG7seQPUBE
        PNccBBCR00i9z3OqVhveR0frOphNC8zFrSImjF4OmuWYUw3osuQ/n+LCbIh+beDh29habVFj2z+
        OJpprbxK5MhFQUlvobB/y
X-Received: by 2002:a05:6214:3990:b0:4ee:b86a:2b5a with SMTP id ny16-20020a056214399000b004eeb86a2b5amr31435790qvb.20.1671534719554;
        Tue, 20 Dec 2022 03:11:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHlBJYZ26nly3d5ku6D7a6qEuXtdjCI1SVoOw5osIdwx03DPqQ1Xewxdch2fG+GWJlkP5OCQ==
X-Received: by 2002:a05:6214:3990:b0:4ee:b86a:2b5a with SMTP id ny16-20020a056214399000b004eeb86a2b5amr31435770qvb.20.1671534719340;
        Tue, 20 Dec 2022 03:11:59 -0800 (PST)
Received: from redhat.com ([37.19.199.118])
        by smtp.gmail.com with ESMTPSA id bl13-20020a05620a1a8d00b006fa22f0494bsm8662747qkb.117.2022.12.20.03.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 03:11:58 -0800 (PST)
Date:   Tue, 20 Dec 2022 06:11:53 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Wang <jasowang@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ricardo =?iso-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>, Cornelia Huck <cohuck@redhat.com>,
        kernel@collabora.com
Subject: Re: [PATCH 0/3] docs: driver-api: virtio: documentation improv
 suggestion
Message-ID: <20221220061138-mutt-send-email-mst@kernel.org>
References: <20221220095828.27588-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220095828.27588-1-bagasdotme@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 20, 2022 at 04:58:26PM +0700, Bagas Sanjaya wrote:
> Michael S. Tsirkin has asked me [1] to post my improv suggestions for
> now-applied virtio documentation [2], so here is the suggestion patch series.
> The original suggestion must be splitted since it contains three distinct
> changes.
> 
> This series is based on kernel-doc fixup posted to fix recent linux-next
> warnings [3].
> 
> [1]: https://lore.kernel.org/linux-doc/20221219011647-mutt-send-email-mst@kernel.org/
> [2]: https://lore.kernel.org/linux-doc/Y0QYTq7KW9C731s0@debian.me/
> [3]: https://lore.kernel.org/lkml/20221220073709.2687151-1-ricardo.canuelo@collabora.com/

Thanks, will queue for rc2.

> Bagas Sanjaya (3):
>   docs: driver-api: virtio: parenthesize external reference targets
>   docs: driver-api: virtio: slightly reword virtqueues allocation
>     paragraph
>   docs: driver-api: virtio: commentize spec version checking
> 
>  Documentation/driver-api/virtio/virtio.rst | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> -- 
> An old man doll... just what I always wanted! - Clara

