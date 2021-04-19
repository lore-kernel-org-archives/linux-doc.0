Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED86C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E54B9610A1
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238041AbhDSHxm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 03:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28423 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238016AbhDSHxk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618818791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x2ufc3mqMrnhfTRRARV/wYF3P8xOeNxsUa5+ZAlFuFg=;
        b=Z79mL9Pu6P4jGZupmIiqupHoKSZpRsh9hw2hCIkCh/OYwyqyt5mLBg7EiqVTrLz9etFXrf
        C+dpCpNpe8wCDoQn7Y4TwfS8vzHQO01btMEw6YxR5LuAQn0mk5vQ1gMS0hSQQrLKf/2xaw
        CmOmU2e0a95fO2i8bhW/4BPPKs8cRXk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-pWpaNnZROeenL4XbpUV6WQ-1; Mon, 19 Apr 2021 03:53:09 -0400
X-MC-Unique: pWpaNnZROeenL4XbpUV6WQ-1
Received: by mail-ej1-f70.google.com with SMTP id p25-20020a1709061419b0290378364a6464so3327418ejc.15
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x2ufc3mqMrnhfTRRARV/wYF3P8xOeNxsUa5+ZAlFuFg=;
        b=ofg927fuHEZeVwd3WR+7gDJ4uNkyS1B72g1ApS90q9Dzzm4WxLA0As4g2U4QbDMMNY
         x79P4/FOhRZvJ718phUl6paFb3emjbQqRwws47EI6QkExAbVddiyA//56ncHOORoITOI
         Dp1ItgmyAMOubVaKWkbO8Ui3YIdm/8iU+pUEOLFdBlALBCZcfeddoNDXecbFLO6rp2lJ
         7ZnY9yYtwJJZgzGeRbIuqd29KlgFLP1dY5iviqoemWt8cXklMkgII5evaVJRmsDeUbKN
         rOANiAv/Po+bX3uZoz+nRmBSTS90vZ5ukkKWal/AMbdCp1y2YhKKPdF+OqRN41YwlYRe
         5m8w==
X-Gm-Message-State: AOAM531omTGqIeq/ne6artxzfTlN+RUHHJZTV3wN7nR47d76brIxkbm/
        IzBfjsE5wh42NNVXSHfi2c8JiFp5+sNQceDWa/T+gRAalcKWFFFwJeLSM6SmZyYV64DnNJxU5Xs
        80Ljmdi/0hR07L9Fa/fZc
X-Received: by 2002:a17:906:a286:: with SMTP id i6mr20596332ejz.135.1618818788207;
        Mon, 19 Apr 2021 00:53:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7jBzHFRvwixkLhHkF8GQ7d8wupO6F8D5LBz7CIhnhdlBLvGmXmwH0kDpoLoDDNSWxHAxmYA==
X-Received: by 2002:a17:906:a286:: with SMTP id i6mr20596322ejz.135.1618818788003;
        Mon, 19 Apr 2021 00:53:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.gmail.com with ESMTPSA id mj7sm9712114ejb.39.2021.04.19.00.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 00:53:07 -0700 (PDT)
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
Date:   Mon, 19 Apr 2021 09:53:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/04/21 09:32, Peter Zijlstra wrote:
> On Sat, Apr 17, 2021 at 04:51:58PM +0200, Paolo Bonzini wrote:
>> On 16/04/21 09:09, Peter Zijlstra wrote:
>>> Well, the obvious example would be seqlocks. C11 can't do them
>>
>> Sure it can.  C11 requires annotating with (the equivalent of) READ_ONCE all
>> reads of seqlock-protected fields, but the memory model supports seqlocks
>> just fine.
> 
> How does that help?
> 
> IIRC there's two problems, one on each side the lock. On the write side
> we have:
> 
> 	seq++;
> 	smp_wmb();
> 	X = r;
> 	Y = r;
> 	smp_wmb();
> 	seq++;
> 
> Which C11 simply cannot do right because it does't have wmb.

It has atomic_thread_fence(memory_order_release), and 
atomic_thread_fence(memory_order_acquire) on the read side.

> You end up
> having to use seq_cst for the first wmb or make both X and Y (on top of
> the last seq) a store-release, both options are sub-optimal.

seq_cst (except for the fence which is just smp_mb) is a pile of manure, 
no doubt about that. :)

Paolo

