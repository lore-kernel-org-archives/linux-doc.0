Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86764C432BE
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 03:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6328C610C9
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 03:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236741AbhHZDFV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Aug 2021 23:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236708AbhHZDFU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Aug 2021 23:05:20 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BBCC0613C1
        for <linux-doc@vger.kernel.org>; Wed, 25 Aug 2021 20:04:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id c4so883104plh.7
        for <linux-doc@vger.kernel.org>; Wed, 25 Aug 2021 20:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Hf4b8kKe8+zCps4bUNp1ug1RGqjC8xfMz7Zwk5whBzY=;
        b=AdhaKecFsynrryav1LJhn4GpBg3BUa/8LEsccr/8oQstjlgJUHwMlii/xBzCN6bcxG
         oyBfpm5K3+yLYPiE0kYB70B7rj2uh8XJwVsxqem7TIsoVWDYZdrUzo59QEkndUQK3qgw
         eNpCAgg9Civ3hnAh9KMiHazns2fYng1BcVr/3725nr8X1lDBEcar1/ekBXDgaVM29HZf
         hoIvZDzdkZQxQQjFW3AYgEbkjYYKMaX/UiF5lDwXV+ESbNEW/fCQVrWkimJ+WTRj/a2v
         cnvASVT4zujztBYqZLaWdoyT5UtugtlgMHu1vErwY/h6UJ7EOXfY2GkMju78p2c943UA
         9fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Hf4b8kKe8+zCps4bUNp1ug1RGqjC8xfMz7Zwk5whBzY=;
        b=O0guWOSNBhVaqgzGbhSuaKqOeykRjjSui55M8/sfrVfOburhx6z/prTDGM7g9eetTX
         YOLALR/7Km1weznRSLZVCRyb3ERwJYirl6LcO6OapzoA39Cs7bfqLcXQXLnGAsm1e4O8
         6rp1Ib7Nb+DJvaKAs6uPg/KwRZWwnl9TgHflUa0lqj3cY9vTOE1YBxbnDLKcaOlv++CX
         uEuwKWW3AWu2mGhOkP7uaSJqjTg1W8CK/jk5Qk4rjma4ZTet4Qs8ZtLrdGWSxVXz7i6Z
         l0+laMxNWazg2tOG9Da2CfxQQrnz/MITNdfxDxZ8p8Py7BM2k0org5ln7V1Z4wUYNJ8e
         Z8Uw==
X-Gm-Message-State: AOAM530so6T7p1qQxpn3+h046Uds++6hqBOJ4CTTH7ApuzdL/jwb0TsN
        csYtGGMyjquQ9g7ozx+xlTK0Ug==
X-Google-Smtp-Source: ABdhPJzTy3uY3MsGRvf9gr6ZiLtxFolfbghsfX0P0tg0lphiVjDFB8SoshdeyFzPIztuf/eqqCYRuw==
X-Received: by 2002:a17:902:b10b:b0:134:de66:4f8c with SMTP id q11-20020a170902b10b00b00134de664f8cmr1419984plr.66.1629947073848;
        Wed, 25 Aug 2021 20:04:33 -0700 (PDT)
Received: from [10.255.175.44] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id e18sm922154pfv.172.2021.08.25.20.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 20:04:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] mm: introduce pmd_install() helper
To:     David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-2-zhengqi.arch@bytedance.com>
 <edd82170-7149-1abf-6204-f1d665a5fca2@redhat.com>
 <c650ef29-0f9e-02a0-9426-b406a4608c8f@bytedance.com>
 <324674f0-399b-aea4-e9b9-fe054a926fdf@redhat.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <4154bc99-e9c9-d194-dc07-577b9e5131e8@bytedance.com>
Date:   Thu, 26 Aug 2021 11:04:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <324674f0-399b-aea4-e9b9-fe054a926fdf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/8/26 AM12:32, David Hildenbrand wrote:
> On 25.08.21 18:20, Qi Zheng wrote:
>>
>>
>> On 2021/8/25 AM12:26, David Hildenbrand wrote:
>>> On 19.08.21 05:18, Qi Zheng wrote:
>>>> Currently we have three times the same few lines repeated in the
>>>
>>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>
>> Thanks for your review, I will add this to the patch v3.
>>
>>>
>>> That's mostly unrelated to the remaining part of the series and can be
>>> picked up early.
>>
>> The implementation of subsequent patches depends on pmd_install().
>> So I am worried that if this patch is submitted as a separate patch,
>> subsequent patches will not be updated until this patch is merged.
>> What do you think?
> 
> Usually I tend to send cleanups out independently, and then just base 
> the other series on top of the other series.

LGTM, I will submit [PATCH v2 1/9] and [PATCH v2 2/9] as a separate
patch series.

> 
> I'll have some more comments in reply to v2. It's fairly hard to revie > because you do a lot of complicated stuff in only a handful of patches
> :) I'll try to think of something reasonable on how to split this up to 
> make it easier to digest.
> 

Thank you very much, and I look forward to your suggestions. At the same
time, I'll also find ways to organize the code more clearly and
concisely, and add documentation to explain the new APIs.

Thanks,
Qi
