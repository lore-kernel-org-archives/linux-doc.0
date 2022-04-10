Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1A5C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 10 Apr 2022 03:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiDJDwk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 Apr 2022 23:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiDJDwj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 Apr 2022 23:52:39 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B8E13F0B
        for <linux-doc@vger.kernel.org>; Sat,  9 Apr 2022 20:50:30 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 2so12193189pjw.2
        for <linux-doc@vger.kernel.org>; Sat, 09 Apr 2022 20:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VgFiDwY6Y4ne8eMW7Gya/YgSy+EbiorRimyozmOcib0=;
        b=WGhkC6qB6pkO7j1wixMPtuHA8lkAhKWWD8qm+lLb13OwxgMDEqAwrGQCKmypDxd6s6
         y9Ydh7MNMeXeGZ/r+zDZgSAjD5VigQidLVd4RV3acAcFj8mHhS38lGvxnTbmOcma4pcD
         NDIJKe6NHXDqk5inyN3vIY3BI9+H+33geXiPaAu8Rnz3pCl2aINQJbfZ5oSm+f6GPMhR
         vNg4+9QGBMVbjK3SmhbTjQ5D2SrSBIB3/4zSmeOTRedmipuN26KalfJO2ow8x0d6hWh2
         rFOWSCghCRjd4A6+VIqOdbU34bBZOE6ex0sZq+MDmSaxB4Bu3RbcPpAQKrp7kw+NHFgG
         bPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VgFiDwY6Y4ne8eMW7Gya/YgSy+EbiorRimyozmOcib0=;
        b=yROPa3IY6crVStTip2j9XVLJKqEPNZE5OqHdL6wRuE7eHB+6XdvXt8K3fR8uWrexsU
         1ZWg+LKOBf8oyJsnARtN7L0I6UlOSWu/QyeRYpkaaezqs7mBQWMgrUkhLa7S8NhDhRWH
         PmyDpfGPPKFtNYc8/f9y6Q0X4iooekVi0BB03NsQCet8SUZJdz3mPMApUcte6WaiYrMU
         9u6B4mgpx2eNvznhaMzwEFl2iWM3c/Nwp9kb0XdvJHfv1T4oyUjhiS2RFJZsu/K9LWfj
         oG9tPvj/T2+XhuxbeUP1a3CfsEbC9Cww4bmNIzjrDFKJdz5H/Q1FI6nACuG/16azHpJZ
         CfEw==
X-Gm-Message-State: AOAM530UMV7/8gxTrk4ooAft+VtsbHC++VCHrlmP8LMZ8I4bEODhfmh7
        Er/VLbr+Iyk3J2z/wPz9nSyddt595Ig/jARQBdI=
X-Google-Smtp-Source: ABdhPJzp2GAtqz/+QVSxkWjOWp/U3Rou86ie4OYjju56Uj3x+hU0a8T+EGyY6QqRIydjNlTISrd8pA==
X-Received: by 2002:a17:902:7c08:b0:156:b9fe:b865 with SMTP id x8-20020a1709027c0800b00156b9feb865mr25981327pll.164.1649562629696;
        Sat, 09 Apr 2022 20:50:29 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a00239000b004fa7103e13csm32085670pfc.41.2022.04.09.20.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 20:50:29 -0700 (PDT)
Message-ID: <0c37089d-8dc8-8326-322b-e0171dba5736@gmail.com>
Date:   Sun, 10 Apr 2022 11:50:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Add locking/index Chinese translation
Content-Language: en-US
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, zhengbin13@huawei.com,
        tangyeechou@gmail.com
References: <20220408144742.23225-1-tangyizhou@huawei.com>
 <20220408144742.23225-2-tangyizhou@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <20220408144742.23225-2-tangyizhou@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 4/8/22 22:47, Tang Yizhou wrote:
> Translate locking/index.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>


Reviewed-by: Alex Shi <alexs@kernel.org>


> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../translations/zh_CN/locking/index.rst      | 42 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/locking/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 88d8df957a78..ac32d8e306ac 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -108,6 +108,7 @@ TODOList:
>     :maxdepth: 2
>  
>     core-api/index
> +   locking/index
>     accounting/index
>     cpu-freq/index
>     iio/index
> @@ -123,7 +124,6 @@ TODOList:
>  TODOList:
>  
>  * driver-api/index
> -* locking/index
>  * block/index
>  * cdrom/index
>  * ide/index
> diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
> new file mode 100644
> index 000000000000..700df8a2bb70
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/locking/index.rst
> @@ -0,0 +1,42 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/locking/index.rst
> +
> +:翻译:
> +
> +  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> +
> +==
> +锁
> +==
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +TODOList:
> +
> +    * locktypes
> +    * lockdep-design
> +    * lockstat
> +    * locktorture
> +    * mutex-design
> +    * rt-mutex-design
> +    * rt-mutex
> +    * seqlock
> +    * spinlocks
> +    * ww-mutex-design
> +    * preempt-locking
> +    * pi-futex
> +    * futex-requeue-pi
> +    * hwspinlock
> +    * percpu-rw-semaphore
> +    * robust-futexes
> +    * robust-futex-ABI
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
