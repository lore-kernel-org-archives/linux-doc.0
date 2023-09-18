Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E42CD13D2
	for <linux-doc@archiver.kernel.org>; Mon, 18 Sep 2023 16:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjIRQma (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Sep 2023 12:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbjIRQmQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Sep 2023 12:42:16 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9575444AD
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 09:03:37 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-76dcf1d8957so319829985a.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695052935; x=1695657735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpekWC9RDoPaptS5D3LgfCtgsKJPqxE0CvywzGx4FOY=;
        b=ahDJKRXrhvm7MMBTXE79sx8HmGdHy19eRRSnTYjy5iwvr5sOmaovPJrcD/m/MYDx4b
         v7KTHwFm9nosWTeoag2nHppqUOgIGM7onr0lz+GhuOGeQUaN+acg2D8o28YHv5LHq6yo
         BdVRA1qAa+8+TbgsiJGCXdn7WIvgHDg1B+mxw8VMoDBUavkGjIJJbFQfzzDOiaXb+1zZ
         cBrOByRUUku87RNTpsveINK4qOb0ROozh3HPg9wH64KCRRrQUFDm/WBmrNoSA3UpP7Ls
         qQtfDikIdbkVWuZIHiQ7wgTDRrDSvb0INgKwrcVVzqH7Mln7vLFgmW+ki2s6cjc/20il
         lFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052935; x=1695657735;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QpekWC9RDoPaptS5D3LgfCtgsKJPqxE0CvywzGx4FOY=;
        b=iszMpDgOnmEfP/R2mCfjcl2NIV+P1Rlht/XffY8ltMZfacTjRt5XQsfQvZKxWzn36d
         j1YNntWVMYW2riUTuImxyUkxMSEL2BSSF4a+aODIXCD84TpdAfevAoh4FoMZQd0YqaO/
         ROlFXBgNhMrLw7W4wqkSfK4LECJY1p6vnkfonmew+8ZiuTgk89Tbb8J7l0FGWrYn1jlE
         dXJqXHdq/x+8XASQPEMnyb4iyO4dST2rUHRO14Dr9F7+/8pJtMdIyDl2xsK2y9NaAUYo
         LnPzvBKBtc0srxIzsvQ3qH5t5qm2lKwD+gDpN3UjfnbmrtZVotiztxWolmsY/g62rMhe
         KD9Q==
X-Gm-Message-State: AOJu0Yy7qhVUBIpoRn8ggjBfBWFikCXLqIyXqZEKI9+fHp2EK2Jl5QZC
        0YdmAHmHadV3k1Na8iTSs+qjySh0gllCq8GZeZI=
X-Google-Smtp-Source: AGHT+IG19Ts0EgOuzI/WqXVCrvF4OpJ7JCaLRhVWQBgeNTxF4XOA9vmkEQ2/CAfIf6KkmuJkIwYS+g==
X-Received: by 2002:a17:902:728a:b0:1c4:152a:496c with SMTP id d10-20020a170902728a00b001c4152a496cmr7514885pll.19.1695042889984;
        Mon, 18 Sep 2023 06:14:49 -0700 (PDT)
Received: from [10.254.225.85] ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b001a80ad9c599sm8276929plg.294.2023.09.18.06.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 06:14:49 -0700 (PDT)
Message-ID: <7f0db16b-609c-7504-bd5b-52a76e0200b3@bytedance.com>
Date:   Mon, 18 Sep 2023 21:14:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 6/6] fork: Use __mt_dup() to duplicate maple tree in
 dup_mmap()
To:     "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Peng Zhang <zhangpeng.00@bytedance.com>, corbet@lwn.net,
        akpm@linux-foundation.org, willy@infradead.org, brauner@kernel.org,
        surenb@google.com, michael.christie@oracle.com,
        peterz@infradead.org, mathieu.desnoyers@efficios.com,
        npiggin@gmail.com, avagin@gmail.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20230830125654.21257-1-zhangpeng.00@bytedance.com>
 <20230830125654.21257-7-zhangpeng.00@bytedance.com>
 <20230907201414.dagnqxfnu7f7qzxd@revolver>
 <2868f2d5-1abe-7af6-4196-ee53cfae76a9@bytedance.com>
 <377b1e27-5752-ee04-b568-69b697852228@bytedance.com>
 <20230915200040.ebrri6zy3uccndx2@revolver>
From:   Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20230915200040.ebrri6zy3uccndx2@revolver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2023/9/16 04:00, Liam R. Howlett 写道:
> * Peng Zhang <zhangpeng.00@bytedance.com> [230915 06:57]:
>>
>>
> 
> ...
> 
>>>>> +    if (unlikely(retval))
>>>>>            goto out;
>>>>>        mt_clear_in_rcu(vmi.mas.tree);
>>>>> -    for_each_vma(old_vmi, mpnt) {
>>>>> +    for_each_vma(vmi, mpnt) {
>>>>>            struct file *file;
>>>>>            vma_start_write(mpnt);
>>>>>            if (mpnt->vm_flags & VM_DONTCOPY) {
>>>>>                vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
>>>>> +
>>>>> +            /*
>>>>> +             * Since the new tree is exactly the same as the old one,
>>>>> +             * we need to remove the unneeded VMAs.
>>>>> +             */
>>>>> +            mas_store(&vmi.mas, NULL);
>>>>> +
>>>>> +            /*
>>>>> +             * Even removing an entry may require memory allocation,
>>>>> +             * and if removal fails, we use XA_ZERO_ENTRY to mark
>>>>> +             * from which VMA it failed. The case of encountering
>>>>> +             * XA_ZERO_ENTRY will be handled in exit_mmap().
>>>>> +             */
>>>>> +            if (unlikely(mas_is_err(&vmi.mas))) {
>>>>> +                retval = xa_err(vmi.mas.node);
>>>>> +                mas_reset(&vmi.mas);
>>>>> +                if (mas_find(&vmi.mas, ULONG_MAX))
>>>>> +                    mas_store(&vmi.mas, XA_ZERO_ENTRY);
>>>>> +                goto loop_out;
>>>>> +            }
>>>>> +
>>>>
>>>> Storing NULL may need extra space as you noted, so we need to be careful
>>>> what happens if we don't have that space.  We should have a testcase to
>>>> test this scenario.
>>>>
>>>> mas_store_gfp() should be used with GFP_KERNEL.  The VMAs use GFP_KERNEL
>>>> in this function, see vm_area_dup().
>>>>
>>>> Don't use the exit_mmap() path to undo a failed fork.  You've added
>>>> checks and complications to the exit path for all tasks in the very
>>>> unlikely event that we run out of memory when we hit a very unlikely
>>>> VM_DONTCOPY flag.
>>>>
>>>> I see the issue with having a portion of the tree with new VMAs that are
>>>> accounted and a portion of the tree that has old VMAs that should not be
>>>> looked at.  It was clever to use the XA_ZERO_ENTRY as a stop point, but
>>>> we cannot add that complication to the exit path and then there is the
>>>> OOM race to worry about (maybe, I am not sure since this MM isn't
>>>> active yet).
>>> I encountered some errors after implementing the scheme you mentioned
>>> below.
> 
> What were the errors?  Maybe I missed something or there is another way.
I found the cause of the problem and fixed it, tested the error path and
it seems to be working fine now.

The reason is that "free_pgd_range(tlb, addr, vma->vm_end,floor, next?
next->vm_start: ceiling);" in free_pgtables() does not free all page
tables due to the existence of the last false VMA. I've fixed it.
Thanks.

> 
>>> This would also clutter fork.c and mmap.c, as some internal
>>> functions would need to be made global.
> 
> Could it not be a new function in mm/mmap.c and added to mm/internal.h
> that does the accounting and VMA freeing from [0 - vma->vm_start)?
> 
> Maybe we could use it in the other areas that do this sort of work?
> do_vmi_align_munmap() does something similar to what we need after the
> "Point of no return".
> 
>>>
>>> I thought of another way to put everything into maple tree. In non-RCU
>>> mode, we can remove the last half of the tree without allocating any
>>> memory. This requires modifications to the internal implementation of
>>> mas_store().
>>> Then remove the second half of the tree like this:
>>>
>>> mas.index = 0;
>> Sorry, typo.
>> Change to: mas.index = vma->start
>>> mas.last = ULONGN_MAX;
>>> mas_store(&mas, NULL).
> 
> Well, we know we are not in RCU mode here, but I am concerned about this
> going poorly.
> 
>>
>>>
>>> At least in non-RCU mode, we can do this, since we only need to merge
>>> some nodes, or move some items to adjacent nodes.
>>> However, this will increase the workload significantly.
> 
> In the unlikely event of an issue allocating memory, this would be
> unwelcome.  If we can avoid it, it would be best.  I don't mind being
> slow in error paths, but a significant workload would be rather bad on
> an overloaded system.
> 
>>>
>>>>
>>>> Using what is done in exit_mmap() and do_vmi_align_munmap() as a
>>>> prototype, we can do something like the *untested* code below:
>>>>
>>>> if (unlikely(mas_is_err(&vmi.mas))) {
>>>>      unsigned long max = vmi.index;
>>>>
>>>>      retval = xa_err(vmi.mas.node);
>>>>      mas_set(&vmi.mas, 0);
>>>>      tmp = mas_find(&vmi.mas, ULONG_MAX);
>>>>      if (tmp) { /* Not the first VMA failed */
>>>>          unsigned long nr_accounted = 0;
>>>>
>>>>          unmap_region(mm, &vmi.mas, vma, NULL, mpnt, 0, max, max,
>>>>                  true);
>>>>          do {
>>>>              if (vma->vm_flags & VM_ACCOUNT)
>>>>                  nr_accounted += vma_pages(vma);
>>>>              remove_vma(vma, true);
>>>>              cond_resched();
>>>>              vma = mas_find(&vmi.mas, max - 1);
>>>>          } while (vma != NULL);
>>>>
>>>>          vm_unacct_memory(nr_accounted);
>>>>      }
>>>>      __mt_destroy(&mm->mm_mt);
>>>>      goto loop_out;
>>>> }
>>>>
>>>> Once exit_mmap() is called, the check for OOM (no vma) will catch that
>>>> nothing is left to do.
>>>>
>>>> It might be worth making an inline function to do this to keep the fork
>>>> code clean.  We should test this by detecting a specific task name and
>>>> returning a failure at a given interval:
>>>>
>>>> if (!strcmp(current->comm, "fork_test") {
>>>> ...
>>>> }
>>>>
> ...
> 
> 
> Thanks,
> Liam
> 
