Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2A5C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 07:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346118AbiELHlc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 03:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbiELHlb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 03:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C792416D129
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652341289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UB9mU9YOUuvmjC8HW/bQVlMThaY/Mp776ejEpkktyQo=;
        b=eo1pUcF4P+6aODF17C32zz8wH5p+domowct+r4nKEJ2Jpi1Tcf4oWHpmddkkLPFQZR+0R6
        E0h6GBdXzs+kzv5EdVNJJTU/jBt6nsNvpO8W3jJPRJxjM2K8d8iyb1Iz6i1vyeDT/YMPpe
        3Z6sXoAD/GZ1TTkMgCiH7Nzz5Ha4MyA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-gKs3YV8eM1iJuNWsIhcaRA-1; Thu, 12 May 2022 03:41:25 -0400
X-MC-Unique: gKs3YV8eM1iJuNWsIhcaRA-1
Received: by mail-wr1-f69.google.com with SMTP id y12-20020a5d4acc000000b0020cdff2382fso1444920wrs.11
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 00:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=UB9mU9YOUuvmjC8HW/bQVlMThaY/Mp776ejEpkktyQo=;
        b=zj4TC1t8tcefVgyrvCS2T88zCvMXoNcd/ZAvCZOS2+IOCa0lvJ0o3fiHXbzLXlk4fu
         6jgQEMBfnvi0JJYSI0zzVICN+H4GYBl0jDM+3pmH9Azr7/2wTZNpImMC2kTYxJX6ge58
         Gt6h3yPOTGHVSsosE8WTGNvgrZ39egRrrONwDfPrBXU0oOwnS1r+oDBbTGV7eRS6bEko
         l9zalnfWtF+F5tnsj6JfCR/QIaO85h0iiFgYZX1wiAAHfjxsHa8AM+U1YQB1/loM4jrA
         hIEKNhVNAbJgz0C1ekZmG7rw8jUYTITYzUruROM18rnDCxwtM7y5ZieugaUgbX6B3Jy3
         Im6Q==
X-Gm-Message-State: AOAM532J0pnYkLPZlEqVC9GS624R6dh8RZAF2SMZaazuN53DzhUrFLBn
        0DEJ2NAzl6ar9wsGwr9AzgIqpahCvSIKjVegmQQXdli/zkFW4APxFbBUGRz7RW1sHNoOnEy1agG
        fAp+Gxnys1k03sM//X8FU
X-Received: by 2002:adf:cc82:0:b0:20a:cf3b:4624 with SMTP id p2-20020adfcc82000000b0020acf3b4624mr25667666wrj.573.1652341284517;
        Thu, 12 May 2022 00:41:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBjlod8MeuObO/DAktAps0EDmVeiibZR+PFFNEWdAxgv5/5LuDiW4y70u4NNJMfK7KQAGFgA==
X-Received: by 2002:adf:cc82:0:b0:20a:cf3b:4624 with SMTP id p2-20020adfcc82000000b0020acf3b4624mr25667655wrj.573.1652341284263;
        Thu, 12 May 2022 00:41:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:d200:ee5d:1275:f171:136d? (p200300cbc701d200ee5d1275f171136d.dip0.t-ipconnect.de. [2003:cb:c701:d200:ee5d:1275:f171:136d])
        by smtp.gmail.com with ESMTPSA id y12-20020adff6cc000000b0020c5253d920sm3989255wrp.108.2022.05.12.00.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 00:41:23 -0700 (PDT)
Message-ID: <21aae898-d54d-cc4b-a11f-1bb7fddcfffa@redhat.com>
Date:   Thu, 12 May 2022 09:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 3/4] mm: hugetlb_vmemmap: use kstrtobool for
 hugetlb_vmemmap param parsing
Content-Language: en-US
To:     Muchun Song <songmuchun@bytedance.com>, corbet@lwn.net,
        mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220509062703.64249-1-songmuchun@bytedance.com>
 <20220509062703.64249-4-songmuchun@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220509062703.64249-4-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09.05.22 08:27, Muchun Song wrote:
> Use kstrtobool rather than open coding "on" and "off" parsing in
> mm/hugetlb_vmemmap.c,  which is more powerful to handle all kinds
> of parameters like 'Yy1Nn0' or [oO][NnFf] for "on" and "off".
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  6 +++---
>  mm/hugetlb_vmemmap.c                            | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 308da668bbb1..43b8385073ad 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1703,10 +1703,10 @@
>  			enabled.
>  			Allows heavy hugetlb users to free up some more
>  			memory (7 * PAGE_SIZE for each 2MB hugetlb page).
> -			Format: { on | off (default) }
> +			Format: { [oO][Nn]/Y/y/1 | [oO][Ff]/N/n/0 (default) }

Really? Can we make the syntax even harder to parse for human beings?! :)

Not to mention that it's partially wrong? What about "oFf" ? That would
have to be [oO][Ff][Ff]

Honestly, "on | off" is good enough. That "oN" and friends work is just
a "nice to have" IMHO. No need to over-complicate this description.
>  
> -			on:  enable the feature
> -			off: disable the feature
> +			[oO][Nn]/Y/y/1: enable the feature
> +			[oO][Ff]/N/n/0: disable the feature
>  
>  			Built with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y,
>  			the default is on.
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 6254bb2d4ae5..cc4ec752ec16 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -28,15 +28,15 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
>  
>  static int __init hugetlb_vmemmap_early_param(char *buf)
>  {
> -	if (!buf)
> +	bool enable;
> +
> +	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
>  
> -	if (!strcmp(buf, "on"))
> +	if (enable)
>  		static_branch_enable(&hugetlb_optimize_vmemmap_key);
> -	else if (!strcmp(buf, "off"))
> -		static_branch_disable(&hugetlb_optimize_vmemmap_key);
>  	else
> -		return -EINVAL;
> +		static_branch_disable(&hugetlb_optimize_vmemmap_key);
>  
>  	return 0;
>  }


Apart from that

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

