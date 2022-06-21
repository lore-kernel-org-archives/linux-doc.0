Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05618C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jun 2022 07:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347593AbiFUHjR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Jun 2022 03:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347594AbiFUHjH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jun 2022 03:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1776111440
        for <linux-doc@vger.kernel.org>; Tue, 21 Jun 2022 00:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655797145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zwfem3uveCMVHvWRElD2ntpsDQotbmTt7QrAnuC0sFY=;
        b=c5sGHdBnAknSebhi0dFenMR5Gm+/DDd7WGiZSADxTuwg4i2fs6ESFmdZcFa9lBCqhJxWnt
        CDpKnu8UlFz1NDkvxE+RBpxyYIfqrQsj842kLcgwdBZIQC8b906bp5n8xL8VxHmfngzAH5
        NsJgTDPZwDfnFdkYTwJc41tGMoLeeXs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-04xqnST9M7mVrEM2FEn5Yg-1; Tue, 21 Jun 2022 03:39:03 -0400
X-MC-Unique: 04xqnST9M7mVrEM2FEn5Yg-1
Received: by mail-wr1-f72.google.com with SMTP id w8-20020adfde88000000b00213b7fa3a37so2961252wrl.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jun 2022 00:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Zwfem3uveCMVHvWRElD2ntpsDQotbmTt7QrAnuC0sFY=;
        b=8L/0q6bBM+w/yL+0NGBBj7mTeVPpimZJQ7ICjYzwiToLmfTmqPtJopLp2BVCNrCgkO
         xO9ztfrug6lVC+cLu4TcF2zfigZCvbf2fpKoykjZdR437ykN7geuAGXGt8lXP+oAQpGL
         VSOrcxkQyOij2joanjO+c7DBz4BYwiKkIe3JzJUTZlK0R1blckaI1F8FMLfBfZlnI0pZ
         cs6I+z3+GDZJstt62W/acBUZrLlYBuVuYgl96KqmOORaBsPBbniOYouwEMxb3FF34Gxh
         Y/bKn2V0mY/AxxxvsBPlyo72Jh40pP7gREtqpFQNRqNS1hGdzPGCaTIjl4w5+1d7WeHu
         F1aw==
X-Gm-Message-State: AJIora8tXQL9vogKnfR0WNpTPQ0AHOVqoPhJOU1apdMyExBC0KxT6Z3T
        mq6hLPXa8AS0rkbe2jYKu/knn8nN9hnSoLTzgUMJ0zE1i9ODncfSgvNMiKjbaRQ1lb30B7Zsm4l
        faqZrnUAMoPHCNAMx+HjT
X-Received: by 2002:a05:6000:18c4:b0:21b:8b8e:4994 with SMTP id w4-20020a05600018c400b0021b8b8e4994mr11042349wrq.122.1655797142360;
        Tue, 21 Jun 2022 00:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tY34WWq2a1oDkkjRucMjmAsNPLPMUQUiGG5ZZmJwsDBonqnup9PU4sqC5FozyGwDBO7hjWWQ==
X-Received: by 2002:a05:6000:18c4:b0:21b:8b8e:4994 with SMTP id w4-20020a05600018c400b0021b8b8e4994mr11042323wrq.122.1655797142065;
        Tue, 21 Jun 2022 00:39:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:2500:cdb0:9b78:d423:43f? (p200300d82f042500cdb09b78d423043f.dip0.t-ipconnect.de. [2003:d8:2f04:2500:cdb0:9b78:d423:43f])
        by smtp.gmail.com with ESMTPSA id y6-20020a5d6206000000b0021350f7b22esm16641626wru.109.2022.06.21.00.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 00:39:01 -0700 (PDT)
Message-ID: <41477111-dc5d-d0ef-7d4a-ca1c6336bbbf@redhat.com>
Date:   Tue, 21 Jun 2022 09:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/2] mm: memory_hotplug: make hugetlb_optimize_vmemmap
 compatible with memmap_on_memory
Content-Language: en-US
To:     Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org,
        corbet@lwn.net, mike.kravetz@oracle.com, osalvador@suse.de,
        paulmck@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220620110616.12056-1-songmuchun@bytedance.com>
 <20220620110616.12056-3-songmuchun@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220620110616.12056-3-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20.06.22 13:06, Muchun Song wrote:
> For now, the feature of hugetlb_free_vmemmap is not compatible with the
> feature of memory_hotplug.memmap_on_memory, and hugetlb_free_vmemmap
> takes precedence over memory_hotplug.memmap_on_memory. However, someone
> wants to make memory_hotplug.memmap_on_memory takes precedence over
> hugetlb_free_vmemmap since memmap_on_memory makes it more likely to
> succeed memory hotplug in close-to-OOM situations.  So the decision
> of making hugetlb_free_vmemmap take precedence is not wise and elegant.
> The proper approach is to have hugetlb_vmemmap.c do the check whether
> the section which the HugeTLB pages belong to can be optimized.  If
> the section's vmemmap pages are allocated from the added memory block
> itself, hugetlb_free_vmemmap should refuse to optimize the vmemmap,
> otherwise, do the optimization.  Then both kernel parameters are
> compatible.  So this patch introduces VmemmapSelfHosted to mask any
> non-optimizable vmemmap pages. The hugetlb_vmemmap can use this flag
> to detect if a vmemmap page can be optimized.
> 

Makes sense to me and looks good

Acked-by: David Hildenbrand <david@redhat.com>



-- 
Thanks,

David / dhildenb

