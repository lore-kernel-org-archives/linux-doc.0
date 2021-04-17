Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB1DC433B4
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 14:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 172E961186
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 14:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbhDQOwa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Apr 2021 10:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43434 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236367AbhDQOw3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Apr 2021 10:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618671123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yG7CbGT59OHfRevt3XXh2eiyrKABZpdeb+wHsJG++fM=;
        b=U2+JSirFA5ZcK2Rwcio3R2IllxT6VLimg4WBnAQILNEWiZHTw2OxNAYMJ8wr2ZLVjtKSza
        2DiqSf1GlusS9wAcbbT6+tkOZlmJR+Gmb4pmQBbif869BkYIeZsE6ld8+/SGd0ykDTdipp
        HrHY2jvoZhTckIQx0nP6ZapjxASCKiM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-QJi93uQWMyqWqyHlY3pckA-1; Sat, 17 Apr 2021 10:52:01 -0400
X-MC-Unique: QJi93uQWMyqWqyHlY3pckA-1
Received: by mail-ed1-f72.google.com with SMTP id k20-20020aa7d2d40000b0290382b9d237d6so8739400edr.17
        for <linux-doc@vger.kernel.org>; Sat, 17 Apr 2021 07:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yG7CbGT59OHfRevt3XXh2eiyrKABZpdeb+wHsJG++fM=;
        b=rFoaeJOS9Yi9oAgTIbLfL7HVZfdXiSTJz4gEtRFxaf6H2zwhPQ/ttFylI6Q1dnO2ir
         qzvGGs4chz6CiBJIp+wcHsy04XLx2SPR9g8BhvGM1FyUjKWkzPx4ShOWQS7byQCW9Pxz
         ssZha9WGlvzYq6CSU+JjhhDICsoXFi+WDdhXP0QnHBOOjes2mWPo66KHzUO/kulLnh7H
         bVhZEL1ytzMytTp4Lux3F2Wnj5VnUEq7zVeAwSj6zV0BzOrbgAxpt2gmDwL6DmDHd/FK
         ru3xNfUugQ/s0mnznRsHl49y9SZ6KM2rkoo+fiA9En3x2CR1jRd7VKoRIE89BmfuT4ha
         zCeg==
X-Gm-Message-State: AOAM533CqpJ9ANgTatB41iv8CIvbkOriyWPQ6uuSYfu9DqiFQfnXOuw1
        6UEXZaLqTHpeas5gNv+nSQ54Q1/c1/jYY2PxL+vf/7NytHXunTo6nDp6WzV2zrpyuC6f1vFsib4
        A0Qyj4cwvW/hl1S5C4dEp
X-Received: by 2002:a05:6402:290:: with SMTP id l16mr5438958edv.337.1618671120387;
        Sat, 17 Apr 2021 07:52:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHc4iGjW4sOLaFFmFfqQFNbzRCiVqgH6eNtR/zBIoDeFLhVfTfFdsedBGskI5MmVb9QV6caA==
X-Received: by 2002:a05:6402:290:: with SMTP id l16mr5438944edv.337.1618671120248;
        Sat, 17 Apr 2021 07:52:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id a24sm6468394ejr.58.2021.04.17.07.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 07:51:59 -0700 (PDT)
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
Date:   Sat, 17 Apr 2021 16:51:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16/04/21 09:09, Peter Zijlstra wrote:
> Well, the obvious example would be seqlocks. C11 can't do them

Sure it can.  C11 requires annotating with (the equivalent of) READ_ONCE 
all reads of seqlock-protected fields, but the memory model supports 
seqlocks just fine.

> Simlar thing for RCU; C11 can't optimally do that

Technically if you know what you're doing (i.e. that you're not on 
Alpha) you can do RCU using a relaxed load followed by an 
atomic_signal_fence(memory_order_consume).  Which I agree is horrible 
and not entirely within the standard, but it works in practice.  The 
Linux implementation of memory barriers, atomic RMW primitives, 
load-acquire/store-release etc. is also completely outside the standard, 
so it's not much different and more portable.

The only thing that I really, really miss when programming with C11 
atomics is smp_mb__{before,after}_atomic().

Paolo

