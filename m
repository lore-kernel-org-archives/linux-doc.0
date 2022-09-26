Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DDFC6FA83
	for <linux-doc@archiver.kernel.org>; Mon, 26 Sep 2022 14:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235108AbiIZO4o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 10:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235191AbiIZO4K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 10:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08B757271
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664198834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CC6e2wRFrDDsU2r0lOBUFQLcJ+ak6awLWbpV9xxP0pE=;
        b=d89K99CNve6DTqftaZqsPRDMc49VImGUjBN6e4H12VbWxy60G6842XPp2tl/qFyhOi3djN
        znNiIdF7Xi1ODzxvqD+gf5/mXh72XnY5APQ4mtJVaDJJKLuxfKmXEcNGxflEsp9mYMfLSc
        kbP9S44VHMa1xw9m5v0fxI/356zWLOo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-2qSUIpytN8i2bq56hDoBzA-1; Mon, 26 Sep 2022 09:27:10 -0400
X-MC-Unique: 2qSUIpytN8i2bq56hDoBzA-1
Received: by mail-wm1-f72.google.com with SMTP id r7-20020a1c4407000000b003b3f017f259so4160904wma.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 06:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=CC6e2wRFrDDsU2r0lOBUFQLcJ+ak6awLWbpV9xxP0pE=;
        b=6k9zZqGxZGrmJ6qlJodEi2m+lX5GcR2CQtXLyML01JO9oTiTG8UQyuTV5DDC78rQw6
         WLldeUEmuizFu+u9LDSWTRQgjYP8PIs1yMTryAtn7aP/XTq9OYPYst2LYs3qFXY9G6vj
         ABWTW0WGzM8lHbrkTrsM6MZ+MOqzpeXL2qlj0aUiRYtPYZR70xI0rqj0XsFgvvO1iOVA
         f3AqM+CVL6auKZA96zLXkWhuXB8O7zo0msIMxcJyNWV6jfeyKMzc11mjt+9E8/neI6Ly
         yewLzacVf2uJQ1s/A8XqxUbhacdBPVQJF37bzQpIbIhajJy4FoeMzyw81weBTTKNYHEJ
         ShWQ==
X-Gm-Message-State: ACrzQf1xRKKECGVtdLLdv88go92ZeDfa9O47NVM7gTq6ygKXVSjfQ7eF
        qBitsOLF9SvAH43j6OicKf9tvMimEgnsSc01IePyGzPQMNjGd9YSy07Yr7DCHyXZ+uBHpJnmTBp
        YYxjfbE56ol628GKF5Th1
X-Received: by 2002:a5d:5850:0:b0:22b:1ada:a0d1 with SMTP id i16-20020a5d5850000000b0022b1adaa0d1mr13313632wrf.313.1664198829373;
        Mon, 26 Sep 2022 06:27:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6i/D23ji2hKO4DfDWW0T+a1gSVZfr/kKtjKf8L/kZXxs1GT++Yct2ALmt57EuGwcrSrkBlOA==
X-Received: by 2002:a5d:5850:0:b0:22b:1ada:a0d1 with SMTP id i16-20020a5d5850000000b0022b1adaa0d1mr13313605wrf.313.1664198829067;
        Mon, 26 Sep 2022 06:27:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7? (p200300cbc7034b00e0907fa6b7d6d4a7.dip0.t-ipconnect.de. [2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7])
        by smtp.gmail.com with ESMTPSA id bg34-20020a05600c3ca200b003b4ff30e566sm23814053wmb.3.2022.09.26.06.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 06:27:08 -0700 (PDT)
Message-ID: <a889576f-0178-b44f-16b0-fdeafbe01035@redhat.com>
Date:   Mon, 26 Sep 2022 15:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next v3 1/3] selftests/memory-hotplug: Add checking after
 online or offline
Content-Language: en-US
To:     Zhao Gongyi <zhaogongyi@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Cc:     akinobu.mita@gmail.com, corbet@lwn.net, osalvador@suse.de,
        shuah@kernel.org
References: <20220926130341.253039-1-zhaogongyi@huawei.com>
 <20220926130341.253039-2-zhaogongyi@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220926130341.253039-2-zhaogongyi@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26.09.22 15:03, Zhao Gongyi wrote:
> Add checking for online_memory_expect_success()/
> offline_memory_expect_success()/offline_memory_expect_fail(), or
> the test would exit 0 although the functions return 1.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>   .../selftests/memory-hotplug/mem-on-off-test.sh   | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> index 46a97f318f58..3edda1f13f7b 100755
> --- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> +++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> @@ -266,7 +266,10 @@ done
>   #
>   echo $error > $NOTIFIER_ERR_INJECT_DIR/actions/MEM_GOING_ONLINE/error
>   for memory in `hotpluggable_offline_memory`; do
> -	online_memory_expect_fail $memory
> +	online_memory_expect_fail $memory || {
> +		echo "online memory $memory: unexpected success"

The functions themself already print an error, isn't it sufficient to 
set retval=1?

> +		retval=1
> +	}
>   done
> 
>   #
> @@ -274,7 +277,10 @@ done
>   #
>   echo 0 > $NOTIFIER_ERR_INJECT_DIR/actions/MEM_GOING_ONLINE/error
>   for memory in `hotpluggable_offline_memory`; do
> -	online_memory_expect_success $memory
> +	online_memory_expect_success $memory || {
> +		echo "online memory $memory: unexpected fail"
> +		retval=1
> +	}
>   done
> 
>   #
> @@ -283,7 +289,10 @@ done
>   echo $error > $NOTIFIER_ERR_INJECT_DIR/actions/MEM_GOING_OFFLINE/error
>   for memory in `hotpluggable_online_memory`; do
>   	if [ $((RANDOM % 100)) -lt $ratio ]; then
> -		offline_memory_expect_fail $memory
> +		offline_memory_expect_fail $memory || {
> +			echo "offline memory $memory: unexpected success"
> +			retval=1
> +		}

These functions return 0 if the result is as expected and 1 if the 
result is unexpected.

... but wouldn't we evaluate the right hand side only if the result is 
"0" -- expected? I might be wrong.


Wouldn't it be simpler do it as in "Online all hot-pluggable memory again"

if ! online_memory_expect_success $memory; then
	retval=1
fi

(similarly adjusting the function name)

-- 
Thanks,

David / dhildenb

