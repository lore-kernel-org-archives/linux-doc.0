Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB7FC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 19 May 2022 04:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbiESEDu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 May 2022 00:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233408AbiESEDu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 00:03:50 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3060D996A1
        for <linux-doc@vger.kernel.org>; Wed, 18 May 2022 21:03:49 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id bh5so3681339plb.6
        for <linux-doc@vger.kernel.org>; Wed, 18 May 2022 21:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gb1YAzoZl4sa0hLxrYxHiOizo1KxBkTwf3Ir2DZ2iVo=;
        b=FfaO33NNu6uvtL7LvvqKjqvfFywaxOsqqWnpN9vVr05AnaJAxSOtxSDNJTGR2YFk3u
         QXYCyGAN1aX7m2QfBqHN2mKj8r4aWdeMdL/Cv4SY9jRiIKu2d+6lVyAibTFhMVtP6YFV
         j+Nqoa+tnRuaKWOzzLjeVT27FaaDrFesUWz5KjrBchx+1mv84SWKXint5uMNGkVpLYDD
         u5KNCsBD0ntJ+SX7Y1kjWbQ2njZQ38Jki5rQSWRSPAlTLgvPv6QxbBQl9wkLRiWoTzhk
         dKNg4uuqB8anev+hOFqUdVAP7OyptvegmQWf3J8WrFlWy6mxnxYNaeUwF+xE1amH0tvo
         I2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gb1YAzoZl4sa0hLxrYxHiOizo1KxBkTwf3Ir2DZ2iVo=;
        b=1atZ7Vcqtv/VUHXWC8fDGJgPXyk6bjPbpqcdi/NZW5pPRsX2jf0vHCZFnYVjWE4nES
         nkXnjHrEkiKg47kpXZr77oCN90wUcXEzWKvqjESkCSK8X4zUU8vFyM53FWlP4Lufr1ts
         M1rXSdqXbp5gbLmWciD/12X/OHpwKfwznfcyZeL442s2n5Z5BstV5lPzrZFyHEtxpcSy
         UK0SsbLJHy7baUqdKQ9BHXFJwxzyIz7fV29Ri8+/rutKJ8j2OtqtPtt5qmWVtTmRw4cF
         gsor8d7gsLHb7hFpESYgSFtIZsffdk7nLHTM7MmWEukoyyHxwLUu0xQs1daZcZpfLcOm
         dfiA==
X-Gm-Message-State: AOAM531ppCAex13/Em7m9yXKMpNTG8ew0PufkwhUElqO9uXhtXxAGamA
        tWdQ0z7aeJg6SlOM4BPkeD6lQw==
X-Google-Smtp-Source: ABdhPJymWX1xXARueRINSzkpKUBJ9YLkEYCoagQ7kTzKyx7vKWCR0HOaBj+S9Tau46a4A4OuVVpiQA==
X-Received: by 2002:a17:902:6b42:b0:15d:3603:6873 with SMTP id g2-20020a1709026b4200b0015d36036873mr2929296plt.30.1652933028649;
        Wed, 18 May 2022 21:03:48 -0700 (PDT)
Received: from [10.70.252.135] ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902dcca00b001619fbb0e6dsm2466603pll.40.2022.05.18.21.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 21:03:48 -0700 (PDT)
Message-ID: <94047220-1991-078f-3a2c-21ccbcb1eafc@bytedance.com>
Date:   Thu, 19 May 2022 12:03:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 00/18] Try to free user PTE page table pages
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, akpm@linux-foundation.org,
        tglx@linutronix.de, kirill.shutemov@linux.intel.com,
        jgg@nvidia.com, tj@kernel.org, dennis@kernel.org,
        ming.lei@redhat.com
References: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
 <8c51d9ae-5a8e-74a9-ddc2-70b5fcd38427@bytedance.com>
 <37055be1-05af-f7ef-c33e-27f90fa0f9ca@redhat.com>
 <YoUJEZU9JcfMlhRO@casper.infradead.org>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <YoUJEZU9JcfMlhRO@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2022/5/18 10:56 PM, Matthew Wilcox wrote:
> On Wed, May 18, 2022 at 04:51:06PM +0200, David Hildenbrand wrote:
>> yes, I talked about the involved challenges, especially, how malicious
>> user space can trigger allocation of almost elusively page tables and
>> essentially consume a lot of unmovable+unswappable memory and even store
>> secrets in the page table structure.
> 
> There are a lot of ways for userspace to consume a large amount of
> kernel memory.  For example, one can open a file and set file locks on

Yes, malicious programs are really hard to avoid, maybe we should try to
solve some common cases first (such as empty PTE tables).

> alternate bytes.  We generally handle this by accounting the memory to
> the process and let the OOM killer, rlimits, memcg or other mechanism
> take care of it.  Just because page tables are (generally) reclaimable
> doesn't mean we need to treat them specially.
> 

-- 
Thanks,
Qi
