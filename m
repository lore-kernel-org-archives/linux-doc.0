Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C8EC4361B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 22:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E719A206E5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 22:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405964AbgLKWBw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 17:01:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29658 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406017AbgLKWBd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 17:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607724006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EK8HRAAQwG+zadkdfwj/A0swUara/4+Zbd8qXA1iC48=;
        b=a8J+gYgLnxcaVDExgD+3vAbxi1g/QfrFxLwTtDCRlI0fAX6qR9me0XFDC4QTyinS+YU3mh
        MTgvWyZQc+LkEYkeNTZkFJKAQORpH5mniqou9oQMxSFG7lQW0amll43+afmbpDD7f0imdq
        JifpMpgQjdX0fx0ClnLHDmiIUvfvJz8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-gDW2SQ5DNcqssu-TdvD5HQ-1; Fri, 11 Dec 2020 17:00:03 -0500
X-MC-Unique: gDW2SQ5DNcqssu-TdvD5HQ-1
Received: by mail-ej1-f71.google.com with SMTP id t17so3280509ejd.12
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 14:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EK8HRAAQwG+zadkdfwj/A0swUara/4+Zbd8qXA1iC48=;
        b=k/jvk078DKfSlo9f5cllNAV3ED8Yv7rBLBbzDkJt5gX67ETbynJ+zHS4P5YQGjx8mF
         q6LAK/Mut4OvwsQJ5bxlE4H5PXqwxb2mTLUBxNVT5F+cKMJLaBZI077ayDBqZDgq2WZ9
         XIstCUM/sbRVMev33QtXkS1qVqr85NnRT+4K0F02712uPcWk4u1wDJ0ftOPDb3bhJAUF
         N6CzvDJmtdnWYpfP+nxj1KtDiRWWVyfIAcUPRAYXxuBG4t4ywmSEuRcfJucMWjF+4Lez
         ifCQVfj7TR86A1rtQarsrHuLBPHI5iLrOI3k/YiW30ao/7YrKo6vPOXtR2XSEp0pUugk
         jAAw==
X-Gm-Message-State: AOAM530X0dlNILwUUp0NrMkjeUcm+K36SmGBQP2y9kapcVjQkdmn+pCf
        lyHDxWiLBXbyWpKcjEvmTzMdMxvSKcX5H16fzxfCtP7GRLNp4C5NOtrXS8wSG5y2xN6+OMd9dWm
        sPhoMwMIHkfVheajtNxD3/YAb9F4jFyuUs2LZp1jbVjHEpZTL20GV3dfMiPBZqU5XKILhHLSC
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr12334245eji.434.1607724001788;
        Fri, 11 Dec 2020 14:00:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZEnlN3IFEJh4D6v54mu+Ro6WoFbJdFge0yKqBGFzqCplQ9jUb3+USgCjAlG9gzjAUdRFuyg==
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr12334212eji.434.1607724001534;
        Fri, 11 Dec 2020 14:00:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id a12sm8568558edu.89.2020.12.11.13.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 14:00:00 -0800 (PST)
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marcelo Tosatti <mtosatti@redhat.com>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <05aaabedd4aac7d3bce81d338988108885a19d29.camel@redhat.com>
 <87sg8g2sn4.fsf@nanos.tec.linutronix.de> <20201208181107.GA31442@fuller.cnet>
 <875z5c2db8.fsf@nanos.tec.linutronix.de> <20201209163434.GA22851@fuller.cnet>
 <87r1nyzogg.fsf@nanos.tec.linutronix.de> <20201210152618.GB23951@fuller.cnet>
 <87zh2lib8l.fsf@nanos.tec.linutronix.de> <20201211002703.GA47016@fuller.cnet>
 <87v9d8h3lx.fsf@nanos.tec.linutronix.de> <20201211141822.GA67764@fuller.cnet>
 <87k0togikr.fsf@nanos.tec.linutronix.de>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
Message-ID: <d9063c37-a965-d5cf-e923-c0c9f6ddc044@redhat.com>
Date:   Fri, 11 Dec 2020 22:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87k0togikr.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/12/20 22:04, Thomas Gleixner wrote:
>> Its 100ms off with migration, and can be reduced further (customers
>> complained about 5 seconds but seem happy with 0.1ms).
> What is 100ms? Guaranteed maximum migration time?

I suppose it's the length between the time from KVM_GET_CLOCK and 
KVM_GET_MSR(IA32_TSC) to KVM_SET_CLOCK and KVM_SET_MSR(IA32_TSC).  But 
the VM is paused for much longer, the sequence for the non-live part of 
the migration (aka brownout) is as follows:

     pause
     finish sending RAM            receive RAM               ~1 sec
     send paused-VM state          finish receiving RAM     \
                                   receive paused-VM state   ) 0.1 sec
                                   restart                  /

The nanosecond and TSC times are sent as part of the paused-VM state at 
the very end of the live migration process.

So it's still true that the time advances during live migration 
brownout; 0.1 seconds is just the final part of the live migration 
process.  But for _live_ migration there is no need to design things 
according to "people are happy if their clock is off by 0.1 seconds 
only".  Again, save-to-disk, reverse debugging and the like are a 
different story, which is why KVM should delegate policy to userspace 
(while documenting how to do it right).

Paolo

> CLOCK_REALTIME and CLOCK_TAI are off by the time the VM is paused and
> this state persists up to the point where NTP corrects it with a time
> jump.
> 
> So if migration takes 5 seconds then CLOCK_REALTIME is not off by 100ms
> it's off by 5 seconds.
> 
> CLOCK_MONOTONIC/BOOTTIME might be off by 100ms between pause and resume.
> 

