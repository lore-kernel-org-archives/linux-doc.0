Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3121ECAAD3
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 12:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiIIMX1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 08:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiIIMW6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 08:22:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B67211163
        for <linux-doc@vger.kernel.org>; Fri,  9 Sep 2022 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662726115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wpKZaZKB6OuIOUbNK0QXmxRia5uDsfJYJGNMehBpaeQ=;
        b=Gg28gKJ3uKapzabdcjs/ovSkjmzQHcse7/DT6PFfTqWsw+hYpR7ACfBtTyuGGGiV/+5xuy
        N7xGMSXUYiUl8By9l0ewwMVmj8Q+DdQE+Rz0WnpSaZ/PBT87lvB2r1bpSRU/W3tFQGIMx0
        ZohYkQ23f6xUZy3z3J76XaWgPtdxaW8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-XqOtu6fJOE6kCT-T2Giu4A-1; Fri, 09 Sep 2022 08:21:53 -0400
X-MC-Unique: XqOtu6fJOE6kCT-T2Giu4A-1
Received: by mail-wm1-f71.google.com with SMTP id az27-20020a05600c601b00b003b26feb5cbbso2698627wmb.5
        for <linux-doc@vger.kernel.org>; Fri, 09 Sep 2022 05:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=wpKZaZKB6OuIOUbNK0QXmxRia5uDsfJYJGNMehBpaeQ=;
        b=TbXCSfcV36m17m/8oGkJxNHbMQMwKwi4uCQ4mSgyofAZmc3l/g8s5Wm8kXKf+QQWpZ
         1FVm+WJUjNTE+h3f8iDMuP4K7safFciJsxoGN/yklTTw4xI1LoCagnOZFdoIgmgJz7hC
         05NK24pzUGprKH/owQsvisP68l0/OVFRvUxbDaAJSwc1RkWd/bdN2DEbJLLq2EZUV+l1
         TnWKJJlyurx7BUQPOT/DoYRq8VAlgWTAsNdUZKE0GfqjqHMWjHLUwfzFr4y1qWcGfE7Q
         0f46CykeKuygToHgjS0Ln5ePobKcJS3aCuaunOPibJmDUhRCRF+46gqW+0jR9iZ4LvOl
         iTLA==
X-Gm-Message-State: ACgBeo2CPXqOihrM+N+2DRcksDoG4sQgLA0qynUfxbr9STqEaiYqtgCB
        8z5IGfesCwgVxrDhH+lqy1ikphUVYoAypexvaNrEe5YsI9LrcdLVlQF51CiunBIr3kCXX16i+8F
        ju5CsL1694A/oVsNhtlBK
X-Received: by 2002:a5d:588a:0:b0:228:462f:a49 with SMTP id n10-20020a5d588a000000b00228462f0a49mr8372603wrf.616.1662726112730;
        Fri, 09 Sep 2022 05:21:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zCe6lDbEZptsQT9dTPwb/AYvVBjW5axO/MWFBwE2Vrd8p4VQ+FCvkXzdgnWOwMPwcYhUpUA==
X-Received: by 2002:a5d:588a:0:b0:228:462f:a49 with SMTP id n10-20020a5d588a000000b00228462f0a49mr8372589wrf.616.1662726112488;
        Fri, 09 Sep 2022 05:21:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:6300:1fe0:42e1:62c5:91b6? (p200300cbc70463001fe042e162c591b6.dip0.t-ipconnect.de. [2003:cb:c704:6300:1fe0:42e1:62c5:91b6])
        by smtp.gmail.com with ESMTPSA id q127-20020a1c4385000000b003a5f54e3bbbsm429713wma.38.2022.09.09.05.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 05:21:52 -0700 (PDT)
Message-ID: <c4447a26-8bc7-2250-0a64-1cb3a1b3b5a2@redhat.com>
Date:   Fri, 9 Sep 2022 14:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 4/5] selftests/memory-hotplug: Restore memory before
 exit
Content-Language: en-US
To:     Zhao Gongyi <zhaogongyi@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Cc:     akinobu.mita@gmail.com, corbet@lwn.net, osalvador@suse.de,
        shuah@kernel.org
References: <20220909075200.198363-1-zhaogongyi@huawei.com>
 <20220909075200.198363-5-zhaogongyi@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220909075200.198363-5-zhaogongyi@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09.09.22 09:51, Zhao Gongyi wrote:
> Some momory will be left in offline state when calling
> offline_memory_expect_fail() failed. Restore it before exit.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>   .../memory-hotplug/mem-on-off-test.sh         | 24 +++++++++++++------
>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> index 3bdf3c4d6d06..259fd8978639 100755
> --- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> +++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> @@ -134,6 +134,17 @@ offline_memory_expect_fail()
>   	return 0
>   }
> 
> +online_all_hot_pluggable_memory()
> +{
> +
> +	for memory in `hotpluggable_offline_memory`; do
> +		online_memory_expect_success $memory || {
> +			echo "online memory $memory: unexpected fail"
> +			retval=1
> +		}
> +	done
> +}

Maybe call it

"online_all_offline_memory()"

instead?

Note that "removable" as used in hotpluggable_memory() will nowadays 
always return "1" if the kernel supports memory hotunplug, independent 
of the specific memory block.

-- 
Thanks,

David / dhildenb

