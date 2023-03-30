Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39391C761AF
	for <linux-doc@archiver.kernel.org>; Thu, 30 Mar 2023 04:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjC3E40 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Mar 2023 00:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjC3E4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 00:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3237049C7
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 21:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680152135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SfE1DWU3+82lgaUycDeR1l3BXeg5cIyOiSyAYjqLz10=;
        b=JIBtfm8nfjhEAtyVdJBsUdOUVE1f3lkKQ8Ru2jz0y+j7p0LaVcZodkBs2oE7oATBtAh3lw
        +rl0JPdGIcOZF319ahl7RZEJ91gwNVFxaczBFQB7GFHDKK59vzsvqsSUB806IX4QzIBEJh
        ueqRNsX8tTi/oYN7tAwY246yMdzLUSk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-tBwsGx8DPqSiNP4emIYraQ-1; Thu, 30 Mar 2023 00:55:33 -0400
X-MC-Unique: tBwsGx8DPqSiNP4emIYraQ-1
Received: by mail-pg1-f197.google.com with SMTP id s3-20020a632c03000000b0050300a8089aso4934933pgs.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 21:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680152133;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfE1DWU3+82lgaUycDeR1l3BXeg5cIyOiSyAYjqLz10=;
        b=4NWZ3Dd7easZdbGZxhfHN1V/FwpLwm6z48KgzlMkUceHQ9nu8iaBPjDwBClvkOG/YC
         Vlr1Db8tCiz5jmAWgyz2BqBg/a4elR5Y+h2tCYr5p12Z5tOoKuNiMSvEMa+VcQqjg7yd
         +roP0dw7zDTuz+wyAR/bCMFoUHV0BeLgsEj3yCDQauwVOp1BhZu0g0bgCZ9LwXWM5znp
         TeJB2FsOH3odLfv9ieLSYiicwPSXdCEySNiZ6p2aJzfsEYiR0E+qVMz+jMkFWndp1rxC
         uwbhn53XsEO5yTZfjFvF7BnV+wypIWwCiCW+q+9Qk8jOpsr++lMjmREtgMQCc+hZZu1C
         uJbA==
X-Gm-Message-State: AAQBX9fflRkWQhlBLi7qOxFfn/0SKZICBSdXViTNPNVS7tUDEuKEoMO9
        G5TX8gmC142Az5mhDO3dknHb25viYfI/Knfze5TOQBCpDqLXVpGO+dzuI6XHKWDaPipKZqC22lS
        AeRKLEnzd0Buaqx7xhp9m
X-Received: by 2002:a17:90a:3:b0:23d:3931:7b49 with SMTP id 3-20020a17090a000300b0023d39317b49mr22164451pja.35.1680152132757;
        Wed, 29 Mar 2023 21:55:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350ahVfgTHtRLxkoOOQlT2RCr2YXsazoiymyRXgQ9yO6J9Xq64hWqpppKwwPGxAW3vPkD+5AjgA==
X-Received: by 2002:a17:90a:3:b0:23d:3931:7b49 with SMTP id 3-20020a17090a000300b0023d39317b49mr22164429pja.35.1680152132358;
        Wed, 29 Mar 2023 21:55:32 -0700 (PDT)
Received: from [192.168.35.160] ([64.114.255.114])
        by smtp.gmail.com with ESMTPSA id d4-20020a17090ac24400b00240ab3c5f66sm2325330pjx.29.2023.03.29.21.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 21:55:31 -0700 (PDT)
Message-ID: <37dcd52a-2e32-c01d-b805-45d862721fbc@redhat.com>
Date:   Thu, 30 Mar 2023 06:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     Andrew Morton <akpm@linux-foundation.org>,
        Stefan Roesch <shr@devkernel.io>
Cc:     kernel-team@fb.com, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, hannes@cmpxchg.org,
        Hugh Dickins <hughd@google.com>
References: <20230310182851.2579138-1-shr@devkernel.io>
 <20230328160914.5b6b66e4a5ad39e41fd63710@linux-foundation.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 0/3] mm: process/cgroup ksm support
In-Reply-To: <20230328160914.5b6b66e4a5ad39e41fd63710@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29.03.23 01:09, Andrew Morton wrote:
> On Fri, 10 Mar 2023 10:28:48 -0800 Stefan Roesch <shr@devkernel.io> wrote:
> 
>> So far KSM can only be enabled by calling madvise for memory regions. To
>> be able to use KSM for more workloads, KSM needs to have the ability to be
>> enabled / disabled at the process / cgroup level.
> 
> Review on this series has been a bit thin.  Are we OK with moving this
> into mm-stable for the next merge window?

I still want to review (traveling this week), but I also don't want to 
block this forever.

I think I didn't get a reply from Stefan to my question [1] yet (only 
some comments from Johannes). I would still be interested in the 
variance of pages we end up de-duplicating for processes.

The 20% statement in the cover letter is rather useless and possibly 
misleading if no details about the actual workload are shared.

Maybe Hugh has some comments as well (most probably he's also busy).

[1] 
https://lore.kernel.org/all/273a2f82-928f-5ad1-0988-1a886d169e83@redhat.com/

-- 
Thanks,

David / dhildenb

