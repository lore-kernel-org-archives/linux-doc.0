Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C806ECAAA1
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 12:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiIIMVA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 08:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiIIMUn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 08:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56DB4CA2D
        for <linux-doc@vger.kernel.org>; Fri,  9 Sep 2022 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662725921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C1UePzLOz1wZO53Q7qIAQAN+1mLe/XFxJBDYGz76QS8=;
        b=F6ZTWvHAekDdVLBwbZre/TVWwSHle09Cya5bgGFG+7fcSLe4QMUBU2nKJxlL7mj2mUikir
        OQnK0SAvN7nBP3vtTIaXv0SVIq6BsWSI2BBuW+1e4ktA5T+L2u1ooBtbWJ5vLhraciTTqA
        rAa4Z+J2PBCrJ4R2oeg8Q8qv/UMjKNM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-mKxKHm_vM8qkL4w1LZQ5vw-1; Fri, 09 Sep 2022 08:18:40 -0400
X-MC-Unique: mKxKHm_vM8qkL4w1LZQ5vw-1
Received: by mail-wm1-f69.google.com with SMTP id j36-20020a05600c1c2400b003a540d88677so771792wms.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Sep 2022 05:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=C1UePzLOz1wZO53Q7qIAQAN+1mLe/XFxJBDYGz76QS8=;
        b=0+MFGwII2BGRG6VC9mX+urWbGNU6Ls9ohAjxQlAd5ilk2E7j59syiDTfXd7VIFnG8l
         ke099xRXUsWTFv7Rn+XRJoUwShFFD6SSiXL1Osw1AuzKGE8XMLw11/rJVhy9Frw/l6VQ
         pNlZ6Pt/skA3XoTFUwbJnOjPLW14ncZg2/c4FpvVk/laxth8ACOZq7pZ7Olp0XnZ2xts
         LOwDiEXSG77+ZjaUvkpoLIC5Ue1eGg3KNKJTMup2NAX6k3UsSD4DtTs/ZGit7Yl/cNGU
         9rexs/Q3aZqUvc/2Vvuu6zyaRcpiZ2/zT4Ulm/1hoddyLmSqaP13KK9cNZj5NxnlQPMo
         SlKg==
X-Gm-Message-State: ACgBeo1O1LXcCsdkahglU2B5UJLZ7VSMiZyzuv8yH7sMKiN9BJA3IHZj
        Mn6dV3Pfsh2TNBJV9iEazDswOZv+gAibOwsy4T0MIP62TZV5s+crqwuVl7/TWzs6T0NAHBDcINc
        UPR5SCYFY030FPkAHmJt7
X-Received: by 2002:adf:aad8:0:b0:228:da00:72ed with SMTP id i24-20020adfaad8000000b00228da0072edmr7790406wrc.483.1662725919598;
        Fri, 09 Sep 2022 05:18:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5tMHThzhDM9UmbRu652GEnmckUCr5U/s1IUwwqCuZv5g0XbC/1Nbh7KIdE4A7S+yBwuQn5xQ==
X-Received: by 2002:adf:aad8:0:b0:228:da00:72ed with SMTP id i24-20020adfaad8000000b00228da0072edmr7790394wrc.483.1662725919361;
        Fri, 09 Sep 2022 05:18:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:6300:1fe0:42e1:62c5:91b6? (p200300cbc70463001fe042e162c591b6.dip0.t-ipconnect.de. [2003:cb:c704:6300:1fe0:42e1:62c5:91b6])
        by smtp.gmail.com with ESMTPSA id bg35-20020a05600c3ca300b003a5c1e916c8sm1711870wmb.1.2022.09.09.05.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 05:18:38 -0700 (PDT)
Message-ID: <8b36d6dd-5973-e9c3-0a5d-2521753d04bd@redhat.com>
Date:   Fri, 9 Sep 2022 14:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 5/5] docs: notifier-error-inject: Correct test's
 name
Content-Language: en-US
To:     Zhao Gongyi <zhaogongyi@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Cc:     akinobu.mita@gmail.com, corbet@lwn.net, osalvador@suse.de,
        shuah@kernel.org
References: <20220909075200.198363-1-zhaogongyi@huawei.com>
 <20220909075200.198363-6-zhaogongyi@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220909075200.198363-6-zhaogongyi@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09.09.22 09:52, Zhao Gongyi wrote:
> Correct test's name for mem-on-off-test.sh/cpu-on-off-test.sh.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>   Documentation/fault-injection/notifier-error-inject.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/fault-injection/notifier-error-inject.rst b/Documentation/fault-injection/notifier-error-inject.rst
> index 0e2790122166..170c583eb5bc 100644
> --- a/Documentation/fault-injection/notifier-error-inject.rst
> +++ b/Documentation/fault-injection/notifier-error-inject.rst
> @@ -95,8 +95,8 @@ For more usage examples
>   There are tools/testing/selftests using the notifier error injection features
>   for CPU and memory notifiers.
> 
> - * tools/testing/selftests/cpu-hotplug/on-off-test.sh
> - * tools/testing/selftests/memory-hotplug/on-off-test.sh
> + * tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> + * tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> 
>   These scripts first do simple online and offline tests and then do fault
>   injection tests if notifier error injection module is available.
> --
> 2.17.1
> 
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

