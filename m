Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8ECC43460
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 09:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09F616113C
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 09:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhDSJCt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 05:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29851 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238228AbhDSJCs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 05:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618822939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ee0dIEYIH6BtGJdamgCFF0WqtWy7bMaej2BcD7VK7sE=;
        b=WEG/9CJuP5TZRWL7WgKVDYd9KZgfr+XVyuVngCU9DlZzydvX7Cn0l5HwHv4tId8Vxv1dQm
        RiSi4wsAeLYYCFNeA4KDq2tMa/XH/pX4uPH5+YIxRqx8O52/4MdiGpUL4ULoXlN1+ZiGZn
        rTiPlVmQCeDKUyKeFDYbZd5+o85peKE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-27p2Bl6JNMGgKEfvTqBCMQ-1; Mon, 19 Apr 2021 05:02:15 -0400
X-MC-Unique: 27p2Bl6JNMGgKEfvTqBCMQ-1
Received: by mail-ej1-f69.google.com with SMTP id n10-20020a1709061d0ab029037caa96b8c5so3418756ejh.23
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 02:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ee0dIEYIH6BtGJdamgCFF0WqtWy7bMaej2BcD7VK7sE=;
        b=Rb9HXmLfacvafug2IhwP+uSBCnWTqxhI4K3cn1M3sBytR2f/qYTbgvAyzDSA6luTqL
         q5cMtxSEfKnE4ZIrzLvyEAZ1H+NB7dTAgha/Uk23PHpw9/D8YFRIzeEJvM162F+9QLNm
         KpcOtAjigZ0SPFHgegUzhyq8yDiDiTTzXvaB9cNrcAwiMxMfqK8OB1dvQHEec7sMyDfF
         lYrNp+XjtIhy8CGeVUT2imJsLB2CR+9BbUoR2RssHgnkRpjqi0UV46QOsB1wXhaCZWZe
         WD/L49AvJiUPt8tKiydXo8dBvzhHNRbpMLloLGhU8T4y9kqTjwoKrnFo2HSFNmUaQch/
         zj+g==
X-Gm-Message-State: AOAM530l6qcjeZ2jc/mR6U3ZLqwUaRqA3u20sIa4k7uR/uc4JWE6Jqpc
        efpV3PsztpKB1Z94dIX/udKUtiagRLBf+9rQMxVI90FxJi+fBSthx1gzTK2COOjdvC6jWy0Rwcy
        6jIXg/IItuexQTuLiNIw5
X-Received: by 2002:a17:906:c04:: with SMTP id s4mr14194099ejf.410.1618822934328;
        Mon, 19 Apr 2021 02:02:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXW7jFvkQ/C99356pwNAJA2uxSOj0HsSwFrdguK8RibjopIIaXciG+M6vuPZwTljJpE8XT7A==
X-Received: by 2002:a17:906:c04:: with SMTP id s4mr14194067ejf.410.1618822934103;
        Mon, 19 Apr 2021 02:02:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id mj7sm9853549ejb.39.2021.04.19.02.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 02:02:13 -0700 (PDT)
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
 <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com>
Date:   Mon, 19 Apr 2021 11:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/04/21 10:26, Peter Zijlstra wrote:
> On Mon, Apr 19, 2021 at 09:53:06AM +0200, Paolo Bonzini wrote:
>> On 19/04/21 09:32, Peter Zijlstra wrote:
>>> On Sat, Apr 17, 2021 at 04:51:58PM +0200, Paolo Bonzini wrote:
>>>> On 16/04/21 09:09, Peter Zijlstra wrote:
>>>>> Well, the obvious example would be seqlocks. C11 can't do them
>>>>
>>>> Sure it can.  C11 requires annotating with (the equivalent of) READ_ONCE all
>>>> reads of seqlock-protected fields, but the memory model supports seqlocks
>>>> just fine.
>>>
>>> How does that help?
>>>
>>> IIRC there's two problems, one on each side the lock. On the write side
>>> we have:
>>>
>>> 	seq++;
>>> 	smp_wmb();
>>> 	X = r;
>>> 	Y = r;
>>> 	smp_wmb();
>>> 	seq++;
>>>
>>> Which C11 simply cannot do right because it does't have wmb.
>>
>> It has atomic_thread_fence(memory_order_release), and
>> atomic_thread_fence(memory_order_acquire) on the read side.
> 
> https://godbolt.org/z/85xoPxeE5
> 
> void writer(void)
> {
>      atomic_store_explicit(&seq, seq+1, memory_order_relaxed);
>      atomic_thread_fence(memory_order_acquire);

This needs to be memory_order_release.  The only change in the resulting 
assembly is that "dmb ishld" becomes "dmb ish", which is not as good as 
the "dmb ishst" you get from smp_wmb() but not buggy either.

The read side can use "dmb ishld" so it gets the same code as Linux.

LWN needs a "C11 memory model for kernel folks" article.  In the 
meanwhile there is 
http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html 
which is the opposite (Linux kernel memory model for C11 folks).

Paolo

> 
>      X = 1;
>      Y = 2;
> 
>      atomic_store_explicit(&seq, seq+1, memory_order_release);
> }
> 
> gives:
> 
> writer:
>          adrp    x1, .LANCHOR0
>          add     x0, x1, :lo12:.LANCHOR0
>          ldr     w2, [x1, #:lo12:.LANCHOR0]
>          add     w2, w2, 1
>          str     w2, [x0]
>          dmb     ishld
>          ldr     w1, [x1, #:lo12:.LANCHOR0]
>          mov     w3, 1
>          mov     w2, 2
>          stp     w3, w2, [x0, 4]
>          add     w1, w1, w3
>          stlr    w1, [x0]
>          ret
> 
> Which, afaict, is completely buggered. What it seems to be doing is
> turning the seq load into a load-acquire, but what we really need is to
> make sure the seq store (increment) is ordered before the other stores.
> 
> 

