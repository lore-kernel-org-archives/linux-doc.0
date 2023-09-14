Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1192CCA553C
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 13:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbjINNBm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Sep 2023 09:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjINNBl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 09:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DA3971FD8
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694696433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GD4InApqGwPlaqPD1j+cPsIFJ/FaN83LoGbvPs5/BZM=;
        b=JXuxT4MXd8+RwITV0lIaHkgM1hRgX3wB9wv0lGWn/LjQtJnrXzU7yGQ+VnpwHrXBqTqcl7
        If/FKOaJb+y9pHjcmUrkoznbXCR7Zvfmqr//trl/5N0OWtCHv5tmIkDmKk2exiWlLP72b4
        db45E/23FXL+02rTJfjpgiZ6Lpc3G1I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-KJ5MHeX7MVSprtZh6oV_uA-1; Thu, 14 Sep 2023 09:00:31 -0400
X-MC-Unique: KJ5MHeX7MVSprtZh6oV_uA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4020645b2a2so7032135e9.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 06:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694696422; x=1695301222;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GD4InApqGwPlaqPD1j+cPsIFJ/FaN83LoGbvPs5/BZM=;
        b=T7QOlD8B5ubEWMmUdvr/zQKgwEutWN04U1U2IlOtLbrFDMnPG35+SK0WnP2rpQWszm
         xr2JkaDENB7fpLhWSnlO0dCAtZc7jddvYvAopXz++1YMpc7H/AKGG3cQOzwypiLRjFvV
         EF3U+tqocddRCNW0HdMg0uO7EGtYa+PGRxAv64Dp7JIykpuR9PKXJ0WLCOUYIKZdsAAz
         MSrbFBGyKwHnFl0fttK2fdpgbYDx11o3f/jy8koAo6cUMpvDTgld0dWUfdvAUOjok/6T
         Z7J28FU87+yuoTkJ/30GofSNAo0dnRGJesLPLBrcWCxbWWFnwnQkm1Rlkdl5HIjI0j96
         DkBA==
X-Gm-Message-State: AOJu0Yy8JdTwg/NNdvKzqYZyWwmVj1iKKmkW9LWzc/pWy74GN3J5p2PT
        UXTjPut1Obm7nWhw4fNQseKMkWa9mhMONrdrAx6ngT0HDJF/rxWZIugw4Cr2DwwXXdLPYUsCNNV
        rJFitOfGjhkStfo+82xGk
X-Received: by 2002:a1c:7c08:0:b0:3fd:2e89:31bd with SMTP id x8-20020a1c7c08000000b003fd2e8931bdmr4909340wmc.14.1694696421061;
        Thu, 14 Sep 2023 06:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyAuCfFyUyVDVL0z0/uh6CoJRANuY+BSorx+ortm8WCPKSWcX0US0Dzyy1Y66VZIZ/zKjomA==
X-Received: by 2002:a1c:7c08:0:b0:3fd:2e89:31bd with SMTP id x8-20020a1c7c08000000b003fd2e8931bdmr4909307wmc.14.1694696420636;
        Thu, 14 Sep 2023 06:00:20 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id g13-20020a7bc4cd000000b003fc02e8ea68sm4810805wmk.13.2023.09.14.06.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 06:00:20 -0700 (PDT)
Message-ID: <5d6a780e-2945-2b24-bca6-3e38565fe157@redhat.com>
Date:   Thu, 14 Sep 2023 15:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] mm: report per-page metadata information
Content-Language: en-US
To:     Sourav Panda <souravpanda@google.com>, corbet@lwn.net,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        akpm@linux-foundation.org, mike.kravetz@oracle.com,
        muchun.song@linux.dev, rppt@kernel.org, rdunlap@infradead.org,
        chenlinxuan@uniontech.com, yang.yang29@zte.com.cn,
        tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com,
        pasha.tatashin@soleen.com, yosryahmed@google.com,
        hannes@cmpxchg.org, shakeelb@google.com,
        kirill.shutemov@linux.intel.com, wangkefeng.wang@huawei.com,
        adobriyan@gmail.com, vbabka@suse.cz, Liam.Howlett@Oracle.com,
        surenb@google.com, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
References: <20230913173000.4016218-1-souravpanda@google.com>
 <20230913173000.4016218-2-souravpanda@google.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230913173000.4016218-2-souravpanda@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13.09.23 19:30, Sourav Panda wrote:
> Adds a new per-node PageMetadata field to
> /sys/devices/system/node/nodeN/meminfo
> and a global PageMetadata field to /proc/meminfo. This information can
> be used by users to see how much memory is being used by per-page
> metadata, which can vary depending on build configuration, machine
> architecture, and system use.
> 
> Per-page metadata is the amount of memory that Linux needs in order to
> manage memory at the page granularity. The majority of such memory is
> used by "struct page" and "page_ext" data structures.

It's probably worth mentioning, that in contrast to most other "memory 
consumption" statistics, this metadata might not be included "MemTotal"; 
when the memmap is allocated using the memblock allocator, it's not 
included, when it's dynamically allocated using the buddy (e.g., memory 
hotplug), it's included.

-- 
Cheers,

David / dhildenb

