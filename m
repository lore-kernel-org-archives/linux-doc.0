Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB33CC54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 08:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiITITO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 04:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbiITISn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 04:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9121B696F3
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 01:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663661731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/e/evqGTFru+f3l3LD+eG8BtO8WljnsYCWvP+vFWoVo=;
        b=J5cVXx+u+D77CPkciGe9KroVi+Wf3kU3Si2zzwRMcjFB3fUVUBDKst/cnOg2inGFJZ7CEi
        05zR1r09t1kudRul4+7nzglQijga239H+NuXT+cf2Ibjv3CIM7r2YiqT7H7kBsy+QcmwhL
        blgEEeQ+U9vGGHXptfVplFhuri8hrmw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-UtzWJ0z6Pn6BnKIy5sIreQ-1; Tue, 20 Sep 2022 04:15:23 -0400
X-MC-Unique: UtzWJ0z6Pn6BnKIy5sIreQ-1
Received: by mail-wm1-f71.google.com with SMTP id p24-20020a05600c1d9800b003b4b226903dso5925909wms.4
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 01:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/e/evqGTFru+f3l3LD+eG8BtO8WljnsYCWvP+vFWoVo=;
        b=MG7N71EF73T9pdu2AZq2z8GdhskFXNtWcnv6VJNoAa4bsaMvyh7M2v0z2MuJ7YxXGK
         94xzHyKHGtnj/ItID3KTWzUT2/I98x/2H1tv3r76XjiXyqs8QlTVKpLq28a3hGhsgYC9
         H18eqoLXe807s9io+FwBPd02dF9Zb7VfPoF+9g3yKH+bOm5mFu/qF4MCHoJbUBiyFe8J
         beWHv3NcbhUO2jpXuwGVT9o7Bu/lt15TnLBe2auV0MAEkMPorJ1bBGPElCNYsETOGyqG
         GAY/9XMeJbBQ4vQpPRKmYKIHjL7HnXZ98dAFzaaWsmlpDpdUjjK4UOWVJ6tCsSljZiBx
         Eb0A==
X-Gm-Message-State: ACrzQf3Z1S4hzfO+WANc5M/QYUDs7udoiGkEFxdTcEoRl78u/oMnInjZ
        HAxeQnSqE8NkXg7dUOQ8SByqrpHeMSf8OQHBF7ZZ7avTgKznyVA0quMyS1rrodSr3oSkp/BydAq
        +j2ZnQJ4rr4EQqc9Ygo4W
X-Received: by 2002:a05:600c:23ca:b0:3b4:6199:8ab9 with SMTP id p10-20020a05600c23ca00b003b461998ab9mr1396440wmb.20.1663661722189;
        Tue, 20 Sep 2022 01:15:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5pb0rzdBr6watv2OP+RIFajUY8ofPhVTXwU2pExV8u2gef6cxMTASlsrhhKQd0N+G4n5cOww==
X-Received: by 2002:a05:600c:23ca:b0:3b4:6199:8ab9 with SMTP id p10-20020a05600c23ca00b003b461998ab9mr1396424wmb.20.1663661721920;
        Tue, 20 Sep 2022 01:15:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c712:2300:e82d:5a58:4fd8:c1e6? (p200300cbc7122300e82d5a584fd8c1e6.dip0.t-ipconnect.de. [2003:cb:c712:2300:e82d:5a58:4fd8:c1e6])
        by smtp.gmail.com with ESMTPSA id a5-20020adfe5c5000000b00228de58ae2bsm901775wrn.12.2022.09.20.01.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:15:21 -0700 (PDT)
Message-ID: <749470a3-e1c7-dc60-d7b7-4e5e3ffde8dd@redhat.com>
Date:   Tue, 20 Sep 2022 10:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/3] lib/notifier-error-inject: fix error when writing
 -errno to debugfs file
Content-Language: en-US
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        corbet@lwn.net, osalvador@suse.de, shuah@kernel.org,
        Zhao Gongyi <zhaogongyi@huawei.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        akpm@linux-foundation.org
References: <20220919172418.45257-1-akinobu.mita@gmail.com>
 <20220919172418.45257-3-akinobu.mita@gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220919172418.45257-3-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.09.22 19:24, Akinobu Mita wrote:
> The simple attribute files do not accept a negative value since the
> commit 488dac0c9237 ("libfs: fix error cast of negative value in
> simple_attr_write()").
> 
> This restores the previous behaviour by using newly introduced
> DEFINE_SIMPLE_ATTRIBUTE_SIGNED instead of DEFINE_SIMPLE_ATTRIBUTE.
> 
> Fixes: 488dac0c9237 ("libfs: fix error cast of negative value in simple_attr_write()")
> Reported-by: Zhao Gongyi <zhaogongyi@huawei.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>   lib/notifier-error-inject.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/notifier-error-inject.c b/lib/notifier-error-inject.c
> index 21016b32d313..2b24ea6c9497 100644
> --- a/lib/notifier-error-inject.c
> +++ b/lib/notifier-error-inject.c
> @@ -15,7 +15,7 @@ static int debugfs_errno_get(void *data, u64 *val)
>   	return 0;
>   }
>   
> -DEFINE_SIMPLE_ATTRIBUTE(fops_errno, debugfs_errno_get, debugfs_errno_set,
> +DEFINE_SIMPLE_ATTRIBUTE_SIGNED(fops_errno, debugfs_errno_get, debugfs_errno_set,
>   			"%lld\n");
>   
>   static struct dentry *debugfs_create_errno(const char *name, umode_t mode,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

