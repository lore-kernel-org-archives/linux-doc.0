Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6899CC43460
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 09:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3298B61159
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 09:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhDSJla (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 05:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55872 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232191AbhDSJl3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 05:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618825259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AmGTVNtUbfWIthapU1UBUKJXnV5z2nwQ4bKCA13Sz/w=;
        b=E+YV1KOFQcqtxL+rcmaQ8po30QFcam+D9xxYyRwfwKgmJEDX5e1K4x0XStg1iZIuTdTkKE
        DcfO2KXdIztCCZ2S7kqrewozt+ii26DKdBT3uJ59Vo/RGzWLjzwhN/NnwUIHW6Zs1+7PRF
        JOEljcrsc7cjvMmCZkDfU+ZG5wXAO4o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-9sQ4SO9IMnapDEmUd7dDVw-1; Mon, 19 Apr 2021 05:40:58 -0400
X-MC-Unique: 9sQ4SO9IMnapDEmUd7dDVw-1
Received: by mail-ed1-f71.google.com with SMTP id c13-20020a05640227cdb0290385526e5de5so831425ede.21
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 02:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AmGTVNtUbfWIthapU1UBUKJXnV5z2nwQ4bKCA13Sz/w=;
        b=loL/RoVkXXf4sCtpGdlbQYC9CCHTscc9jgLlGrNQ5AUYe0JlN2Jxy9XkEqhFoLDQiK
         We27qQpvcI7qPqtqj3QwSo4kkna4J1nqy1sWlEyWodROpp5me2n8D+lw6PE/o0QdVgOx
         j8lXWfUubqXT4YoZHt+0MLsdY7yiqkE6lhQnmPjW+36hv0DQPp1JCUJ1Y4DrNmQzwInI
         eKcZGz6rSJ9wIc4XX3EFQsdHK7K7Rcdmm3SjUujjso5q+THr+XZjnV4AsNGS+LS00sQb
         DVf/3Rhcpeai1UYR7vXnkEq9lmCW7cjr61QzfYZuj1CeWM7jTC5ztqB/SOmMBeOr8x3Y
         1RmQ==
X-Gm-Message-State: AOAM532Ml+K4TkDbthMx8Xs1kqkQfqUuOgkAeqfncHJAbMJW0lUfs+oC
        hGI33RqGtTk7KMpSc3xDXa9DSzBJmkwJNTJamvsHVyZ01Lezh2d2t5jrFZ13SG0Fj8S8gGFxvwo
        +ojavCQHF38AZpUhiWIlc
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr5758037edd.258.1618825256864;
        Mon, 19 Apr 2021 02:40:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbtPzHbVC2RzD+kuMasvTGdWEU1pXWvHTNdC+/82ekpX/pQhjS/66zHCChzb2+hcis/LcehQ==
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr5758019edd.258.1618825256654;
        Mon, 19 Apr 2021 02:40:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id n2sm12149749edi.32.2021.04.19.02.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 02:40:56 -0700 (PDT)
Subject: Re: [PATCH 00/13] [RFC] Rust support
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
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com>
 <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6297428-c4c6-f03b-49c7-6026c3d16d30@redhat.com>
Date:   Mon, 19 Apr 2021 11:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/04/21 11:36, Peter Zijlstra wrote:
> On Mon, Apr 19, 2021 at 11:02:12AM +0200, Paolo Bonzini wrote:
>>> void writer(void)
>>> {
>>>       atomic_store_explicit(&seq, seq+1, memory_order_relaxed);
>>>       atomic_thread_fence(memory_order_acquire);
>>
>> This needs to be memory_order_release.  The only change in the resulting
>> assembly is that "dmb ishld" becomes "dmb ish", which is not as good as the
>> "dmb ishst" you get from smp_wmb() but not buggy either.
> 
> Yuck! And that is what requires the insides to be
> atomic_store_explicit(), otherwise this fence doesn't have to affect
> them.

Not just that, even the write needs to be atomic_store_explicit in order 
to avoid a data race.atomic_store_explicit

> I also don't see how this is better than seq_cst.

It is better than seq_cst on TSO architectures.  Another possibility is 
to use release stores for everything (both increments and the stores 
between them).

> But yes, not broken, but also very much not optimal.

Agreed on that, just like RCU/memory_order_consume.

Paolo

