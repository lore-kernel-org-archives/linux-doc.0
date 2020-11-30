Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD52C63777
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D6642073C
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsH/BtYP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728906AbgK3RCw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22449 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728174AbgK3RCw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 12:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606755686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VgFd89DHnuHQ3v4vDDMB2aGeZJsjGIrSQaYmVa9y5pY=;
        b=BsH/BtYPtgxjJAV7ajUDfNCcvPXbyaykzPuSMqtIHkQXHm+Az4NsrnT8PMlOLwFykefl58
        R1+aipZOilWb5sxVDGQc8mBb/cG0kXzf40cQmMlotjYzq1SWVX2oLtBTuJ/HAAf1j8B1t8
        JrNQ3syyWqgUbIB6hprCrkdwLJd32q4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-U5TWXszJMnax0l8sqV9Aiw-1; Mon, 30 Nov 2020 12:01:19 -0500
X-MC-Unique: U5TWXszJMnax0l8sqV9Aiw-1
Received: by mail-ed1-f69.google.com with SMTP id r16so1921458eds.13
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 09:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VgFd89DHnuHQ3v4vDDMB2aGeZJsjGIrSQaYmVa9y5pY=;
        b=c9nTYoqgfqY/uwHvh0J2+6EHBjlGnbHUoO6XjslV0nFYZF9CLVXGY8micKLPIJEs/B
         eIabq8N/GN25/TcQKCVfq+tCfj5vlyX0X4bKGSSO0mtuzvHRFFzEqBk5NbVxli0Y0yUd
         iRSszQOXQ8Gm9PRDJOgD4K0AeLUh9Ssf2RitoKX6UvWSwryyhptFRLBLlG/FJRn6YIYM
         rntzOQl5Grlht2x7irYGQFOJlvx2WRbqbp+NOKGzWv96SrPwTsNwf8XqwSg66BtVuhVW
         34CFF69rVOVpTqjCJurWUty+/IVnPCvZHCdIvZwkLRS6pczV5kdgwI1E4PSoKggq4Z3J
         nLQQ==
X-Gm-Message-State: AOAM531nqsZW2i1kpdX+bvjN+brDmgQWZ6nuLorjecTZ5nVJLAfV3HwS
        +vOeqNToGeTHD7/XCsPSF3KvYGc6zqErDI5wADOUxNoh1AXwHj3wDlTD/POGwa0S7OeaVU/Y+GF
        /VOgmlYM52IxU8C5rvZ1j
X-Received: by 2002:a50:9991:: with SMTP id m17mr8474515edb.48.1606755678190;
        Mon, 30 Nov 2020 09:01:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuh5JY/rp8mBQt2cCoqr5FsmGZwPNmCeuL6bdGW9SV9BsoqQFM1sgKQnAFQijgEJHRpPd3MQ==
X-Received: by 2002:a50:9991:: with SMTP id m17mr8474488edb.48.1606755678013;
        Mon, 30 Nov 2020 09:01:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id e3sm9022319ejq.96.2020.11.30.09.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 09:01:17 -0800 (PST)
Subject: Re: [PATCH 1/2] KVM: x86: implement
 KVM_SET_TSC_PRECISE/KVM_GET_TSC_PRECISE
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     Oliver Upton <oupton@google.com>, Ingo Molnar <mingo@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wanpeng Li <wanpengli@tencent.com>,
        Borislav Petkov <bp@alien8.de>,
        Jim Mattson <jmattson@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20201130133559.233242-1-mlevitsk@redhat.com>
 <20201130133559.233242-2-mlevitsk@redhat.com>
 <38602ef4-7ecf-a5fd-6db9-db86e8e974e4@redhat.com>
 <ee06976738dff35e387077ba73e6ab375963abbf.camel@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <005aaf41-9376-d535-211f-9ff08e53bcc4@redhat.com>
Date:   Mon, 30 Nov 2020 18:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ee06976738dff35e387077ba73e6ab375963abbf.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/11/20 16:58, Maxim Levitsky wrote:
>> This is mostly useful for userspace that doesn't disable the quirk, right?
> Isn't this the opposite? If I understand the original proposal correctly,
> the reason that we include the TSC_ADJUST in the new ioctl, is that
> we would like to disable the special kvm behavior (that is disable the quirk),
> which would mean that tsc will jump on regular host initiated TSC_ADJUST write.
> 
> To avoid this, userspace would set TSC_ADJUST through this new interface.

Yeah, that makes sense.  It removes the need to think "I have to set TSC 
adjust before TSC".

> Do you think that this is an issue? If so I can make the code work with
> signed numbers.

Not sure if it's an issue, but I prefer to make the API "less 
surprising" for userspace.  Who knows how it will be used.

> About nsec == 0, this is to allow to use this API for VM initialization.
> (That is to call KVM_SET_TSC_PRECISE prior to doing KVM_GET_TSC_PRECISE)

I prefer using flags for that purpose.

Paolo

