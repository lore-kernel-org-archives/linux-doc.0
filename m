Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FE3C47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:16:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83C9861246
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 15:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbhFHPSu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:18:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33536 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232281AbhFHPSu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 11:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623165416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o58aRI1nAkDOuKYCfrK2Zy/zY+ckaGTYEPwd2qo+nAA=;
        b=WjFyDXW5TzU4f4aG2eTBImx+7uJLrTLZ1TvMRGmw+IPRJjjlBIpvOTqYlqIFiocVD0157/
        DQ6uHmTCDldm7Yh18EON/MLLDeNDe5fuEB7hSxLq5JTRdnQJbSkzg8JNila1Pzi6bX7a26
        4W8qbKK2z5hsqQxCiMw0PdjmOhDVpdo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-DB-vmuK-ORCE9-_LwqwV1w-1; Tue, 08 Jun 2021 11:16:55 -0400
X-MC-Unique: DB-vmuK-ORCE9-_LwqwV1w-1
Received: by mail-qk1-f200.google.com with SMTP id 190-20020a3708c70000b02903aa60e6d8c1so8415095qki.19
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 08:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o58aRI1nAkDOuKYCfrK2Zy/zY+ckaGTYEPwd2qo+nAA=;
        b=XbSy/2a6tqxmftZCfzNl6Pdd0iI+ReXbOT+9nf97g9mXybV/XC/AJ7zPj7gsxQhiHy
         i2Ii1loYLR40SYGNv3yq/LmWHw0U60ZJ045pgW6anMk447NKLH/c81MTDQiXFurScQPF
         8GyZZHUlpccnbgltIzUVL4XannVdmhPwodteNMICxEP+bAR9Ntrcd+ryS3JQifSBzxUk
         MfFZgjZKF1wyY1Zm7efyOc8WVr52Hg3hRCQguL7LBSz5rvZZQWmdpWK2xCMAIbGJrQyz
         ZHRHhldegCwCS69A0pSRLc2l6SqYTziBVK3rARv0BJZeDgLo+KK7mn5m0nKAxUuohOKM
         Sjxg==
X-Gm-Message-State: AOAM532ekX4NdclhlcB067xxU0m94aBO5XprU6S130UpPS6dHypo57Zl
        SpXR4TcnntBtBUwz+rlCaqqHj7yr64iwNVuKAbfkql8IHr2x13/SlS3LnJRGGJhPgHP3ERN6cr+
        jfYfIyqbG8hLpYB51++fY
X-Received: by 2002:a05:620a:408f:: with SMTP id f15mr21924740qko.398.1623165414859;
        Tue, 08 Jun 2021 08:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBLlJH23DxgLDX/p84+mzCKOsdataYBzhyEZq9wfQJJoaRz9EMetGKzWGtOqIiIcaJr3BbOg==
X-Received: by 2002:a05:620a:408f:: with SMTP id f15mr21924712qko.398.1623165414615;
        Tue, 08 Jun 2021 08:16:54 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
        by smtp.gmail.com with ESMTPSA id e20sm121010qtr.55.2021.06.08.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:16:53 -0700 (PDT)
Date:   Tue, 8 Jun 2021 11:16:52 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        nouveau@lists.freedesktop.org, hughd@google.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, bskeggs@redhat.com, jgg@nvidia.com,
        shakeelb@google.com, jhubbard@nvidia.com, willy@infradead.org
Subject: Re: [PATCH v10 05/10] mm: Rename migrate_pgmap_owner
Message-ID: <YL+J5NN2yRKjyEeq@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-6-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607075855.5084-6-apopple@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 07, 2021 at 05:58:50PM +1000, Alistair Popple wrote:
> MMU notifier ranges have a migrate_pgmap_owner field which is used by
> drivers to store a pointer. This is subsequently used by the driver
> callback to filter MMU_NOTIFY_MIGRATE events. Other notifier event types
> can also benefit from this filtering, so rename the
> 'migrate_pgmap_owner' field to 'owner' and create a new notifier
> initialisation function to initialise this field.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

