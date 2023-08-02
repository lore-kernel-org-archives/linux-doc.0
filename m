Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBD7C00528
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 08:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjHBIA7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 04:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjHBIA6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 04:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083D1CC
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 00:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690963169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wZUNkMP1qMALUPnTMpjHr05U2sKlpWGQ7HUYoQvVCOc=;
        b=U9HskgkVSZ/WO0pYpaJV6m9ehDA3QnbS8WdUt8JIQsLNcrkegqzb3RRzPlYcIcGEureRt8
        4wH/Nfco/HL1SGPlIAWaeoMf7OV7uIdYuZgSBeIx+sKtzQZAhnlOjWz4zEFuHjffC0qUVU
        2VUEL+nmUzGj/EMjjR38doGammlEyxQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-RZjMNiapO-KjIioWKuSodA-1; Wed, 02 Aug 2023 03:59:27 -0400
X-MC-Unique: RZjMNiapO-KjIioWKuSodA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31797adfe97so2130386f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 00:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963166; x=1691567966;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZUNkMP1qMALUPnTMpjHr05U2sKlpWGQ7HUYoQvVCOc=;
        b=fHI5Mdl6CZtr4oM4WHuDHkLoktu79p6QIyVw0NDgNMDNET+uLB0K5qmH62B3JQqdLd
         b7CDcSaauSRITAfbbZ97KGMNLNygjXDn3GEGD13Kk4hpohKtt99msra4Zkq/prC1tTQu
         cZWYhp7O9PZ0j8TAFf9rRxTx2QNWsHs08zCL3Jpquz2PwDCZqYvTNwbzNp2q7bK/I5QI
         p6pxYcPSbpnfyQDzgdmj/78+9Gfht1ffq7K3A/UuSLxUH6c5Uu9u6bVV33UVnxEeTHJ2
         rq8txHbVa3AhfG9tCA4kC3AXbg+Jd8OJHhE0WmZIIMzQQtCdVawfy4Jkf70caHZR3RvY
         oE3w==
X-Gm-Message-State: ABy/qLZiBe4lNawNTy+vL8bXMx6zTt0JFF/uLzDllK7Sow3b3zi3CXdj
        UB4cl8jCbQMiQJXUEcDDofPBHgc25u0JXYgmmjfBNwtLimDg1cGymIt3F9ahTn4wE6Yg/5oodnK
        LIxDC0X3+HIXErR7+Ful4
X-Received: by 2002:adf:e484:0:b0:317:4e25:eaf0 with SMTP id i4-20020adfe484000000b003174e25eaf0mr3464111wrm.63.1690963166489;
        Wed, 02 Aug 2023 00:59:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEeZ4lCKsSdrPpN7GeReHVH6V71A8h8zbu+gFT0GD1iLHflH1tK4sX4xeVW2tbCE54RTetw2g==
X-Received: by 2002:adf:e484:0:b0:317:4e25:eaf0 with SMTP id i4-20020adfe484000000b003174e25eaf0mr3464103wrm.63.1690963166076;
        Wed, 02 Aug 2023 00:59:26 -0700 (PDT)
Received: from [192.168.3.108] (p4ff23509.dip0.t-ipconnect.de. [79.242.53.9])
        by smtp.gmail.com with ESMTPSA id t8-20020adff048000000b00317878d83c6sm16100887wro.72.2023.08.02.00.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 00:59:25 -0700 (PDT)
Message-ID: <89efb68c-b6e7-f652-8dc7-310c5f48a0a9@redhat.com>
Date:   Wed, 2 Aug 2023 09:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] doc: update params of memhp_default_state=
To:     Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org,
        corbet@lwn.net
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20230802074312.2111074-1-mawupeng1@huawei.com>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230802074312.2111074-1-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02.08.23 09:43, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> Commit 5f47adf762b7 ("mm/memory_hotplug: allow to specify a default
> online_type") allows to specify a default online_type which make
> online memory to kernel or movable zone possible but fail to update
> to doc. Update doc to fit this change.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a1457995fd41..09bad9c62f41 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3105,7 +3105,7 @@
>   			[KNL,SH] Allow user to override the default size for
>   			per-device physically contiguous DMA buffers.
>   
> -	memhp_default_state=online/offline
> +	memhp_default_state=online/offline/online_kernel/online_movable
>   			[KNL] Set the initial state for the memory hotplug
>   			onlining policy. If not specified, the default value is
>   			set according to the

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

