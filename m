Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEC0C43334
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jun 2022 12:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243641AbiFGMXK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243729AbiFGMWg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 08:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE5D5F68BA
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654604524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LFae0+Vw/Q7XKFtLqEkht1EHSrvkXyEHWVa21iC8kcQ=;
        b=KPb+g8gTPtKcxN/JF3iJFVjISKh/F+2MUlMmMOZAbuu4c+cWN6bZB7w1meZ564/ckQdgMY
        ZP9NocfVt5YaYzY8uPW1piQEY0crunQJkpkDitPpLNsRKRdOQjwkVN5AOWTpL66bFAFu3q
        LGr4JcEfX89IEujrQeMjeJKp6bH48s0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-FGz3smXjMP2YQRe8d4rExg-1; Tue, 07 Jun 2022 08:21:59 -0400
X-MC-Unique: FGz3smXjMP2YQRe8d4rExg-1
Received: by mail-wm1-f69.google.com with SMTP id bg7-20020a05600c3c8700b0039468585269so5725064wmb.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=LFae0+Vw/Q7XKFtLqEkht1EHSrvkXyEHWVa21iC8kcQ=;
        b=AHgmD0LCStwBuFDIsY7ijih1tKVkgPi3BcUWXsGQBfa1bTXupjOfukJkNghc9Bmkud
         6XP0PFTRTDOl9kH5b0rvpt6Lo/SJUZnqnXGpT+dmKp+4bNu14FgyFq6SGprPeNsApJ3x
         WG+1Na9Vk9deGBerRUZqGcDePpfREnIQuRAn7YHeeycQl+a1g32nx2akqLf8DJS6/ap0
         Upd+FrD6zDGCXvE3OE8/j/J+wttb0kDWZfCJs/8CefJMzyCBBGAIchs3r2AGRDMQxBim
         ShkhGfWPzdDXqU3nC/woQlOWCihtG/gIfrWGtRP4ZFJgnFWqqLLKRBNK+wxgql9G4duP
         jxzQ==
X-Gm-Message-State: AOAM533vr/X7Q2giSMBAJ69UGa4Fa6NZ1w0ptcBGf/tjBTmh9J5NTfWu
        Eg0ZzcpNCACHAKnr3nqKWt9G8jpADbzbCpUNXTElpryiQYMFffkoJGU+qif3h1ncsIiq8yKZHf7
        KowgFPLxnELvVNsHKWD7G
X-Received: by 2002:a5d:6f07:0:b0:20f:e7b6:60e9 with SMTP id ay7-20020a5d6f07000000b0020fe7b660e9mr26970335wrb.452.1654604518595;
        Tue, 07 Jun 2022 05:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6zVY8RJtypryJ4lRqoQ7sLYVvIPsHW+mIUVYuw6yWEgN87NIn1XVL3PPwxcCz6RZEMmu3Kw==
X-Received: by 2002:a5d:6f07:0:b0:20f:e7b6:60e9 with SMTP id ay7-20020a5d6f07000000b0020fe7b660e9mr26970280wrb.452.1654604518294;
        Tue, 07 Jun 2022 05:21:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f? (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de. [2003:cb:c709:500:4c8d:4886:f874:7b6f])
        by smtp.gmail.com with ESMTPSA id eh2-20020a05600c61c200b0039c54f34948sm4284902wmb.5.2022.06.07.05.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:21:57 -0700 (PDT)
Message-ID: <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
Date:   Tue, 7 Jun 2022 14:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To:     Wupeng Ma <mawupeng1@huawei.com>, corbet@lwn.net, will@kernel.org,
        ardb@kernel.org, catalin.marinas@arm.com
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        dvhart@infradead.org, andy@infradead.org, rppt@kernel.org,
        akpm@linux-foundation.org, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
        keescook@chromium.org, songmuchun@bytedance.com,
        rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
        swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
        anshuman.khandual@arm.com, thunder.leizhen@huawei.com,
        wangkefeng.wang@huawei.com, gpiccoli@igalia.com,
        chenhuacai@kernel.org, geert@linux-m68k.org, chenzhou10@huawei.com,
        vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
In-Reply-To: <20220607093805.1354256-6-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.06.22 11:38, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> Initrd memory will be removed and then added in arm64_memblock_init() and this
> will cause it to lose all of its memblock flags. The lost of MEMBLOCK_MIRROR
> flag will lead to error log printed by find_zone_movable_pfns_for_nodes if
> the lower 4G range has some non-mirrored memory.
> 
> In order to solve this problem, the lost MEMBLOCK_MIRROR flag will be
> reinstalled if the origin memblock has this flag.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  arch/arm64/mm/init.c     |  9 +++++++++
>  include/linux/memblock.h |  1 +
>  mm/memblock.c            | 20 ++++++++++++++++++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 339ee84e5a61..11641f924d08 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -350,9 +350,18 @@ void __init arm64_memblock_init(void)
>  			"initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
>  			phys_initrd_size = 0;
>  		} else {
> +			int flags, ret;
> +
> +			ret = memblock_get_flags(base, &flags);
> +			if (ret)
> +				flags = 0;
> +
>  			memblock_remove(base, size); /* clear MEMBLOCK_ flags */
>  			memblock_add(base, size);
>  			memblock_reserve(base, size);

Can you explain why we're removing+re-adding here exactly? Is it just to
clear flags as the comment indicates?


If it's really just about clearing flags, I wonder if we rather want to
have an interface that does exactly that, and hides the way this is
actually implemented (obtain flags, remove, re-add ...), internally.

But most probably there is more magic in the code and clearing flags
isn't all it ends up doing.

-- 
Thanks,

David / dhildenb

