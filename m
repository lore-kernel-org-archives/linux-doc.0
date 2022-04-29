Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F9DC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 29 Apr 2022 20:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380705AbiD2Ubq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Apr 2022 16:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380676AbiD2Ubp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 16:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D3CDCD32F
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651264105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n8HsfkpqhssnZoIsPQ1O3oVRAyXbkapxW4GnxH0gSv4=;
        b=OXyk+ZlA2xofIDLIpoh4YJ+rLWv81XKCIyy/IB39BgGEe31RKH4WNLCYpEDcIa1ShrAN2n
        Df/3G8VM/wCkyyVQ1ZiPCi2WCGcyyQGgVCm4XzcCAkmyd+sygyQJLNjtrtFnsUkDESUdmC
        f8FSupPV971Lb1Wl1zABlpBDfU5IZDE=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-GmsUPGlcMI2QxMwAD1OprA-1; Fri, 29 Apr 2022 16:28:24 -0400
X-MC-Unique: GmsUPGlcMI2QxMwAD1OprA-1
Received: by mail-io1-f70.google.com with SMTP id n9-20020a056602340900b006572c443316so7207073ioz.23
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 13:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n8HsfkpqhssnZoIsPQ1O3oVRAyXbkapxW4GnxH0gSv4=;
        b=kEuTydK8wTttBaAABVf9TxSvUWh5GG/+CkZfRHhcNjiMPlwl+TFWf+DVoU20zIHcLV
         dbpQP3q6aXa5k2olwwh7TcKC/FzGgOL1LYV7IEJwnNzhfVZ8WpXJYUExpe1Hx+3S9Edd
         PM5RoT25nrElLDRqqccYliN2u6wy3yko7eeQmkwNA9omxIgN8LPuPvBEQr1cgyhbl5vu
         xUr1/xzGEhcd4Jpl8hiEs8Q1BlcG0r1K27PeSHfCNKRLFUeBltCqCsIwBnVJM+IuSHe4
         gyMpIY1hpBRw+gCUfgyJUaFGCWQKLTqHbF90Nu6eNmb6Otla/tQJeFZGVp4SBJVqV2a8
         dKmg==
X-Gm-Message-State: AOAM531Ve7XXmDuJdpAZWI40H8ulHupjmFi+2Ffquci0hsYI48ymgEt/
        adQaWf7PnaYr4yvQw8fmCEeAxWLYMjOJTSEYoYGSA0wvKvJ38J08FNZGC3g0T8EY3ifT4fw4/3d
        +Efs8mQZKGlDuxJAfDKhX
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id a65-20020a6bca44000000b00657b54a5c53mr445899iog.108.1651264103269;
        Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXw055Zf6CAZcffMOqFXVe3D8deItwuTS9dyUJRlHujGyFKq6cxPYeLOoiZHbK09XyaEEw5w==
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id a65-20020a6bca44000000b00657b54a5c53mr445889iog.108.1651264103032;
        Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id j7-20020a02cb07000000b0032b3a7817b2sm836302jap.118.2022.04.29.13.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 13:28:22 -0700 (PDT)
Date:   Fri, 29 Apr 2022 14:28:20 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Alexander Gordeev <agordeev@linux.ibm.com>,
        David Airlie <airlied@linux.ie>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Harald Freudenberger <freude@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        intel-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
        linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Christoph Hellwig <hch@lst.de>,
        "Tian, Kevin" <kevin.tian@intel.com>,
        "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 7/7] vfio: Remove calls to
 vfio_group_add_container_user()
Message-ID: <20220429142820.6afe7bbe.alex.williamson@redhat.com>
In-Reply-To: <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
        <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 21 Apr 2022 13:28:38 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> When the open_device() op is called the container_users is incremented and
> held incremented until close_device(). Thus, so long as drivers call
> functions within their open_device()/close_device() region they do not
> need to worry about the container_users.
> 
> These functions can all only be called between open_device() and
> close_device():
> 
>   vfio_pin_pages()
>   vfio_unpin_pages()
>   vfio_dma_rw()
>   vfio_register_notifier()
>   vfio_unregister_notifier()
> 
> Eliminate the calls to vfio_group_add_container_user() and add
> vfio_assert_device_open() to detect driver mis-use.

A comment here explaining that decrementing open_count is pushed until
after close_device to support this feature would help to explain the
somewhat subtle change in vfio_group_get_device_fd().

Otherwise the series looks ok with fixes noted by previous reviews.
Thanks,

Alex

