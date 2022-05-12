Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3679C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 07:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351054AbiELHgf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 03:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351080AbiELHgW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 03:36:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4DD381EC66
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652340979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SQ4ujRgpzyh6ewlTgWHvwE4PWXv0qetHu9e1jhXut6g=;
        b=DL/KvTRuuC2g9e4QyQPy2UR0EzRccrUoGStF+A3K2vfU0FAZDYzOSDrWENjgLvB8dx+AgO
        HuLZAk6kVpBSFra9bdmcHXV4TvGCyf68Izmn3YnE3bnbarzCL1V2vNEPFZoYFePsk4qpsi
        0YrT64Cr0OHel6FIZmzLrh48DxhpAYU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-VvuPMTSoMmOzjuGlwPMHHQ-1; Thu, 12 May 2022 03:36:18 -0400
X-MC-Unique: VvuPMTSoMmOzjuGlwPMHHQ-1
Received: by mail-wr1-f71.google.com with SMTP id j21-20020adfa555000000b0020adb9ac14fso1723785wrb.13
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 00:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=SQ4ujRgpzyh6ewlTgWHvwE4PWXv0qetHu9e1jhXut6g=;
        b=WSlhib20h/aeH2Tpah6eMYeqoltaIIbG9xmxrWnw2wWaiZvWSxBZXL4vUABJVBdOxS
         sSQyW4anGgIw1L+A232omIrMjy6m/JYJmPAnoBbGojPL8eC+9BqCdA0V1XysZsV+//ZW
         7KV4HnhGpoPqOeFJT9jBj5YAA0hOk/UiFwY0HWatmjD7Brjg06AXoBa0NIYpM99xiSdB
         QuyKtWAX5Jq65D/wtBQF8Lko91E5iqXm5RNMpfYg7bA3mDU6l5MDrU9tYBsHyZcMbpaw
         uJ6IoWVoFk0/9H0ngqgreLwejAdinOwEu/v8KDNVQl7tT7oDQWvNUilb/nFv+OcLzIGL
         1G0Q==
X-Gm-Message-State: AOAM532ksN331vN1RdfwbRQtymbnC+ki5dtrRTTgKKuNybjYaBq7NTxW
        qspNTAU2Zu71gLfr4LqEe5tKp4IiImr6mbzkhk/hx1Ow341hpFA23OZK6T2l4c9xGFz0QgSD+oj
        gyslrT3o7+YaDsFgNR9Lb
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id b13-20020adff90d000000b0020cde324d35mr5504489wrr.583.1652340977091;
        Thu, 12 May 2022 00:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4WzSFjh9/1fr5OcChI0nWnCZFMhs6TwJW3Bp8ipC/jSMUjUw0QWNYF/O6+XQdsSUG9IbInw==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id b13-20020adff90d000000b0020cde324d35mr5504467wrr.583.1652340976871;
        Thu, 12 May 2022 00:36:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:d200:ee5d:1275:f171:136d? (p200300cbc701d200ee5d1275f171136d.dip0.t-ipconnect.de. [2003:cb:c701:d200:ee5d:1275:f171:136d])
        by smtp.gmail.com with ESMTPSA id s19-20020a1cf213000000b003942a244edfsm1850197wmc.36.2022.05.12.00.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 00:36:16 -0700 (PDT)
Message-ID: <ebffd794-697b-9bf1-f41b-4b2d52c100fc@redhat.com>
Date:   Thu, 12 May 2022 09:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 2/4] mm: memory_hotplug: override memmap_on_memory
 when hugetlb_free_vmemmap=on
Content-Language: en-US
To:     Muchun Song <songmuchun@bytedance.com>, corbet@lwn.net,
        mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220509062703.64249-1-songmuchun@bytedance.com>
 <20220509062703.64249-3-songmuchun@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220509062703.64249-3-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09.05.22 08:27, Muchun Song wrote:
> Optimizing HugeTLB vmemmap pages is not compatible with allocating memmap on
> hot added memory. If "hugetlb_free_vmemmap=on" and
> memory_hotplug.memmap_on_memory" are both passed on the kernel command line,
> optimizing hugetlb pages takes precedence. 

Why?


-- 
Thanks,

David / dhildenb

