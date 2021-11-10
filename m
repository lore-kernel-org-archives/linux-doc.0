Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6884DC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 13:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49CC061241
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 13:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhKJN5S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 08:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbhKJN5R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 08:57:17 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24593C061764
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 05:54:30 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id r132so183983pgr.9
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 05:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=csckiqmyP0dCF83S/nsqCaXOz0/oPqzPri47rPsjQiw=;
        b=uJAYmZAUASYBJLZgq//yft/HZ4r02Gr5daVYoLPw8TTSWbg5NUv9eutVT1fbjqoHOt
         x6+3fTzXEL0kjupOD/AHW3ALYxT/0uTfLXNQFFMxVFFA4lJrV7pytgjkVoNP5dBvv5Sz
         UGOKaHiuitKu/+YnBWo4D+sg9fziMZqm6x/Z5xaeZXRppmu770YVFJskK/hNyfg+GmBL
         NR3QLvxAvcZRB5hlfvbCQEPKwN6o/LIwJpuCsZMGIOsUfgzN6C4VcQPawEFl2vN3jpg7
         GzqqLb79UmYjzrax9xOvzeXl6Q78aEl1ouSiwFPZ5wlY4DbiBlH+FTP377fs6XRUdoCS
         kfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=csckiqmyP0dCF83S/nsqCaXOz0/oPqzPri47rPsjQiw=;
        b=VKdmsVXZuOPWMIqYyuEPDy8lUsLFdeGKjjjqTC4jHNb9LdK4gW8G1rYcPwRreYHlqD
         XFSyXx85AzOX/IvpZoJ/V7ZuIQe4or2rX1FzKUQJx+5v3il3UjOrdp5jvLzBlGtrI53O
         bQ2BPldGIHrV73Cm8p0Pc5iktBSnD9uUvy1wUwW+0mUNMofi+1RIXwCm1WH/vkFem7gH
         uH/f8Nu3Ih8qZHTypPcSOpgRGs+nIGiuCXsF33H2PPYIDPjLiJeS1leqmzU/4AE/LXcf
         7F+GgvB/femwE4kSjKlqOCdXkh9Ze5Jd+7RTocWWRuIUGygbKyzIiEpTIe2Q4IW6Db8V
         WP+A==
X-Gm-Message-State: AOAM530DAINVyMmNxdTy4l+cVZYRMLgHndjN6lbfs4ITDOe+2fsDlIH+
        7S0KB9QgQW+aS9TNi6PXculgCw==
X-Google-Smtp-Source: ABdhPJwqPZpOvU5AnVskn/IE9qCZu6lQuMcHlHjxOfCktGz2gqvzlzh+5aPrY0BgRFTFnqYnzLvayg==
X-Received: by 2002:a65:670d:: with SMTP id u13mr11993060pgf.455.1636552469727;
        Wed, 10 Nov 2021 05:54:29 -0800 (PST)
Received: from [10.254.189.129] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id f5sm5917256pju.15.2021.11.10.05.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 05:54:29 -0800 (PST)
Message-ID: <32a2432f-7f18-db5e-87a7-d8ba7c543076@bytedance.com>
Date:   Wed, 10 Nov 2021 21:54:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/15] Free user PTE page table pages
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        songmuchun@bytedance.com, zhouchengming@bytedance.com
References: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
 <20211110125601.GQ1740502@nvidia.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20211110125601.GQ1740502@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 11/10/21 8:56 PM, Jason Gunthorpe wrote:
> On Wed, Nov 10, 2021 at 06:54:13PM +0800, Qi Zheng wrote:
> 
>> In this patch series, we add a pte_refcount field to the struct page of page
>> table to track how many users of PTE page table. Similar to the mechanism of
>> page refcount, the user of PTE page table should hold a refcount to it before
>> accessing. The PTE page table page will be freed when the last refcount is
>> dropped.
> 
> So, this approach basically adds two atomics on every PTE map
> 
> If I have it right the reason that zap cannot clean the PTEs today is
> because zap cannot obtain the mmap lock due to a lock ordering issue
> with the inode lock vs mmap lock.

Currently, both MADV_DONTNEED and MADV_FREE obtain the read side of
mmap_lock instead of write side, which is the reason that 
jemalloc/tcmalloc prefer to use madvise() to release physical memory.

> 
> If it could obtain the mmap lock then it could do the zap using the
> write side as unmapping a vma does.

Even if it obtains the write side of mmap_lock, how to make sure that
all the page table entries are empty? Traverse 512 entries every time?

> 
> Rather than adding a new "lock" to ever PTE I wonder if it would be
> more efficient to break up the mmap lock and introduce a specific
> rwsem for the page table itself, in addition to the PTL. Currently the
> mmap lock is protecting both the vma list and the page table.

Now each level of page table has its own spin lock. Can you explain the
working mechanism of this special rwsem more clearly?

If we can reduce the protection range of mmap_lock, it is indeed a great
thing, but I think it is very difficult, and it will not solve the
problem of how to check that all entries in the page table page are
empty.

> 
> I think that would allow the lock ordering issue to be resolved and
> zap could obtain a page table rwsem.
> 
> Compared to two atomics per PTE this would just be two atomic per
> page table walk operation, it is conceptually a lot simpler, and would
> allow freeing all the page table levels, not just PTEs.

The reason why only the PTE page is released now is that it is the
largest. This reference count can actually be used for other levels of
page tables.

> 
> ?
> 
> Jason
> 
