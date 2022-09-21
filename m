Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB30DECAAD8
	for <linux-doc@archiver.kernel.org>; Wed, 21 Sep 2022 13:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiIUNEM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 09:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiIUNEE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 09:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DBE96FF0
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663765435;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gdHnV3VWEqsU153bSqOynZpQmdwwjdT8tHpP+AqIewQ=;
        b=AVXrwVvAEW/c/GQ3621xvpVfq2gEnFNmBFNvS1X+kxTaYS4lX9hEWL1NLNzXqkSJPoHGav
        tH8KUmretoT0fuL/fGE5Klm+yYpoMkxYzF/XR0NmhdLRJ32uFFt3ETM0kl8vVimJbJJPlW
        VL4NQoB5wnANynreLzznZkR0g4Mm2Jg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-PUAYiSUjOpWj2BVobFfF6w-1; Wed, 21 Sep 2022 09:03:54 -0400
X-MC-Unique: PUAYiSUjOpWj2BVobFfF6w-1
Received: by mail-wm1-f69.google.com with SMTP id f25-20020a7bc8d9000000b003b4768dcd9cso1611509wml.9
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 06:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=gdHnV3VWEqsU153bSqOynZpQmdwwjdT8tHpP+AqIewQ=;
        b=ndn+khx1122jtpzuj6zPIM/TmrxUnMBQj1kTZcFRD4O4pRWyAlFGq5RA602Ygi/sWx
         IHrXkV6t5Icww7Yb95v+BT3iQtOHp2bAnA7wiXSOvFU6Tl2nDIh8xVicv2X8kjCJP1Ei
         ZwRW0XsS1hV2tBxNGsiGscvFQc0z4wt+pb6pTvVwiyToamk4RND+Pw/sdfkcUe0u02/g
         Tn4jBW4yz88DgO3K8fRoYfh3vI8biVelS4tGhJEZt6sBN+5klQAlhD2YSyRScNlUIQ/N
         Z1hsRc2s8NmuoN+Pq2N1gVZC9AL+45YQUgaRHEYxFPgJlfBKKpU+wxggkjJADPJPy4tw
         eQ0A==
X-Gm-Message-State: ACrzQf2Dzw5Ng0+0OCESma+4p43Wt39lLbf6sp7JlF34E/MGkvCUwmeR
        Kyky3C3+RAnq72oZQahBlav23KNhmU9EdPVXGROz7B4MfH+diMnPyKU7KNKL7tOD+iH8hKC4dsA
        /IQVY4j37sp+YfTxnT1b4
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id t18-20020adfe112000000b0021d71953a8dmr17774991wrz.371.1663765432923;
        Wed, 21 Sep 2022 06:03:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lMc4LT+3VySvRgJ/Fc31nBF9lBFT9H6ehTnnnf0ivjSkxi9SR6r+BJZ3x5kMq2M7Gjhw1UQ==
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id t18-20020adfe112000000b0021d71953a8dmr17774956wrz.371.1663765432534;
        Wed, 21 Sep 2022 06:03:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:6900:26b8:85a4:a645:4128? (p200300cbc703690026b885a4a6454128.dip0.t-ipconnect.de. [2003:cb:c703:6900:26b8:85a4:a645:4128])
        by smtp.gmail.com with ESMTPSA id p25-20020a7bcc99000000b003b476bb2624sm2812131wma.6.2022.09.21.06.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 06:03:51 -0700 (PDT)
Message-ID: <9f649899-d227-6dff-2ada-aaac81b50879@redhat.com>
Date:   Wed, 21 Sep 2022 15:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1 2/3] powerpc/prom_init: drop PROM_BUG()
Content-Language: en-US
To:     Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Dave Young <dyoung@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-3-david@redhat.com> <877d1w2844.fsf@mpe.ellerman.id.au>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <877d1w2844.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21.09.22 15:02, Michael Ellerman wrote:
> David Hildenbrand <david@redhat.com> writes:
>> Unused, let's drop it.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/powerpc/kernel/prom_init.c | 6 ------
>>   1 file changed, 6 deletions(-)
> 
> Thanks. I'll take this one via the powerpc tree, and the others can go
> via wherever?

Makes sense; I'll drop this patch in case I have to resend, assuming 
it's in your tree.

Thanks!

-- 
Thanks,

David / dhildenb

