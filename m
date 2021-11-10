Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2B2C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 12:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0B946103C
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 12:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhKJNBa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 08:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbhKJNB3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 08:01:29 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B262C061766
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 04:58:42 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id m14so2574463pfc.9
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=bYJCDmXhbZdwQcqQV6p0qfHrLLCZuMTTGmF8KIZ2ebg=;
        b=0Qj3WziVPa6/9jW1dnkM0js30+i48RZdsL8Xr/KA/YP6GLcSd+4iDZ8d/hdjQ+QcSU
         M8tFdlfYx5DT9eFjBgBgX7wvdySyiUT9yMOii2gUfVN7Vv786Jo8n1ZQKGoQfLnrfzJn
         kMgCMuI8xZSKKQlHTzYYmwz4+QugGvdqrpEtRr5n8XEjx8U8wfFrwqOfsoMyKoTGZEPV
         XRghj6fVtEnWuGAMGy4rAqXylpKvDJsxJFvTlcRDQX/x3u17FhglF+aADpjYSkShkleA
         n8FYpYmuiyTdm9uJcgJVQIbN9ugR1fXEb0+HnKgzmL8CrG3jk/y35V85ws19b9PJfZTg
         V8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bYJCDmXhbZdwQcqQV6p0qfHrLLCZuMTTGmF8KIZ2ebg=;
        b=qC0dVQ2kp/ax0+kEbgAG82gbO4KfM4uInnu4PQzLlKf36CB877WcJKhDpmRFp2tMBw
         dynV38ZH7wIXP1765RRru9EXB7h3tbaDdvhUDmbGuFAfNSC8cFPsyXyrO96LpPULCgyf
         YPgd1m1E96qPZnfqhB0wPHhRz+xf6+GlgcGEzl5CGun2CnWS+CwAC0SKonIeu/Uh+HJy
         4UgB0x6GQl6JabHENejgstlgCYfXgPcSjroixqxvfpe50843WkHwRe98XSYVh6Dche3u
         LfbhEQwbTGXJbjyu8hI8XWGbrrCDAKy/Ut6PpmHNyDBIoOI0ycMu03rpBbLEFNNB850Z
         2PoA==
X-Gm-Message-State: AOAM532Wgcv+Vuh5nHh+Qpv+w0R3LdoxQHMIPFDEAr3Ta4boC7LpOZyG
        TQ/OK0ZgFzX/6PuCiIyeCQYbOA==
X-Google-Smtp-Source: ABdhPJwbusrzbHVv2OyW13KKKsVbVhQcdBFFWjiyo9LwLOH9xHto26AgH0kSAvdXoNk3nAGUeFZf9A==
X-Received: by 2002:a05:6a00:844:b0:49f:dbe4:b911 with SMTP id q4-20020a056a00084400b0049fdbe4b911mr16603220pfk.6.1636549122022;
        Wed, 10 Nov 2021 04:58:42 -0800 (PST)
Received: from [10.254.189.129] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id t4sm23081243pfj.166.2021.11.10.04.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 04:58:41 -0800 (PST)
Message-ID: <18fa08bf-847b-1c47-10ee-01c92caeb0cc@bytedance.com>
Date:   Wed, 10 Nov 2021 20:58:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/15] mm: introduce is_huge_pmd() helper
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        songmuchun@bytedance.com, zhouchengming@bytedance.com
References: <20211110084057.27676-1-zhengqi.arch@bytedance.com>
 <20211110084057.27676-3-zhengqi.arch@bytedance.com>
 <20211110122945.GO1740502@nvidia.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20211110122945.GO1740502@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 11/10/21 8:29 PM, Jason Gunthorpe wrote:
> On Wed, Nov 10, 2021 at 04:40:44PM +0800, Qi Zheng wrote:
>> Currently we have some times the following judgments repeated in the
>> code:
>>
>> 	is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)
>>
>> which is to determine whether the *pmd is a huge pmd, so introduce
>> is_huge_pmd() helper to deduplicate them.
> 
> Isn't this pmd_leaf() ?

Currently, the implementation of pmd_leaf() does not include
pmd_devmap() checks. But considering the semantics of pmd_leaf(),
the "devmap" pmd should also belong to "leaf" pmd. Maybe we should
modify pmd_leaf() to make it more semantically consistent?

By the way, something went wrong when sending this patchset, and
I have re-sent the complete patchset, please comment over there.

Thanks,
Qi

> 
> Jason
> 
