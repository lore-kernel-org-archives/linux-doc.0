Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397BCC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 19:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C5D860F6B
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 19:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243377AbhITTLI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 15:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29110 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344790AbhITTJI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 15:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632164860;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=L5eNIsZ6KwBeoWOsBqwSADzC++5/odqrtaTxVloBqSU=;
        b=Q6ARtUi91V3eABNMKcm+I2AfP4dOnsM83gBLaG0LdCQ7clAXGjGLlPflDx+7yI3lDrZLXM
        eKYriqvoMBxQdrNPwRxMIlJhRCG7wyVMQ4GTfjhZ5J2kEmM4NA2lKd+iwu4eyXKxqpRtHF
        v9T4/ag3qkWka14sdSOZbr9VQcES+6w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-fsx1yfslOk-AlrN2yWUgLA-1; Mon, 20 Sep 2021 15:07:39 -0400
X-MC-Unique: fsx1yfslOk-AlrN2yWUgLA-1
Received: by mail-qv1-f70.google.com with SMTP id a15-20020a0ce34f000000b0037a944f655dso190888608qvm.5
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 12:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L5eNIsZ6KwBeoWOsBqwSADzC++5/odqrtaTxVloBqSU=;
        b=1ZxTyxMO5y7E8JDWF7OII1MzLJ09HTMNIgIZ3d7Jqmp0vbUJ1MpQ1iW2AQIEKWfMJ5
         iJwb0wtXskwdCulAuEBuM4LRMDRHvywG34NUUTGi1YpyrZryG3yBjdxTLQhE/h4GjWmV
         zB5bwxyo2WZP7M2WfP65IHLw3YVu3FuMDm+CcfEkspSSIJIBQK+jquSVIwhIrev0NUZj
         bE4A29Vp3z2FPIxma0iKqOnJdYwQ7pY4JqyQoE/FzdTRe7+EtEdCNtftThp1k/709ciR
         58dBA+czbfw17KilWW6+i79D9jfhciUAS3FgW3bhWmwY/5pv6aTvpL/ELO1DHpnOGD6O
         1Ljg==
X-Gm-Message-State: AOAM531hZTQu27oUfcjSp9Jwbd3NG11xxBYaulcN7JWaZxc3c4M5X8af
        JAed57YmLo1mpDJeAdKUebu/9lg3S/X00MnwuSvYoTT8JHj6sMIX9tqWbdbgKEgU/wIRl9SMjOD
        AyvRyUsKUN63cYm9Huo44
X-Received: by 2002:a0c:8e05:: with SMTP id v5mr26551514qvb.4.1632164858623;
        Mon, 20 Sep 2021 12:07:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUlhdb4yrs33oVaLc7KkLYEJohXWSRUXFQ1m3xANX2pAOEfK2wxqguR0SBw9ODXLL6u6zTSA==
X-Received: by 2002:a0c:8e05:: with SMTP id v5mr26551482qvb.4.1632164858305;
        Mon, 20 Sep 2021 12:07:38 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
        by smtp.gmail.com with ESMTPSA id s10sm11731979qko.134.2021.09.20.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 12:07:37 -0700 (PDT)
Date:   Mon, 20 Sep 2021 15:07:35 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, david@redhat.com,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, ivan.teterevkov@nutanix.com,
        florian.schmidt@nutanix.com, carl.waldspurger@nutanix.com,
        jonathan.davies@nutanix.com
Subject: Re: [PATCH v2 1/1] Documentation: update pagemap with shmem
 exceptions
Message-ID: <YUjb91tWhd/YAgQW@t490s>
References: <20210920164931.175411-1-tiberiu.georgescu@nutanix.com>
 <20210920164931.175411-2-tiberiu.georgescu@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210920164931.175411-2-tiberiu.georgescu@nutanix.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Tiberiu,

Thanks for the patch!  Yes it would still be nice to comment on this behavior,
some trivial nitpicks below.

On Mon, Sep 20, 2021 at 04:49:31PM +0000, Tiberiu A Georgescu wrote:
> +In user space, whether the page is swapped or none can be deduced with the
> +lseek system call. For a single page, the algorithm is:
> +
> +0. If the pagemap entry of the page has bit 63 (page present) set, the page
> +   is present.
> +1. Otherwise, get an fd to the file where the page is backed. For anonymous
> +   shared pages, the file can be found in ``/proc/pid/map_files/``.
> +2. Call lseek with LSEEK_DATA flag and seek to the virtual address of the page

s/LSEEK_DATA/SEEK_DATA/

> +   you wish to inspect. If it overshoots the PAGE_SIZE, the page is NONE.
> +3. Otherwise, the page is in swap.

It could also not be in swap, right?

Example 1: this process mmap()ed an existing shmem file with data filled in,
but without accessing it yet.  Then the page cache exists, not in swap, but
pgtables will be empty.

Example 2: this process has mapped this shmem with 2M thp, all data filled in,
then due to some reason thp splits, then the pgtable can also be none but lseek
will succeed, I think.

So to further identify whether that's in swap, we need a step 5 with mincore()
system call, perhaps?

-- 
Peter Xu

