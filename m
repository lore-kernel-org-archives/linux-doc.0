Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC29EC83014
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 14:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EBAF20855
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 14:17:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XDnqifpW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgK3OQs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 09:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31179 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727278AbgK3OQp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 09:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606745719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jy2WUd8qluzxUHyAVJZ0iTyH/i+egdeldCJel1aWn4Y=;
        b=XDnqifpWWWmEqPhPm1iVO60/JIDzX23/GFgzXvTaYNfxFZgYPSNC5sQAO5VBUijHNwsnic
        K2mqG1IwzrH+tQPdAwWpTuhZB5FMpgexKys2muyrOIuykIsqNRl6GrM9cAu+qNdsB0fOLJ
        jXj01XFz0XF1nOG2guGgEuXuUfmhhew=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-4aRUzS2YN6Ows_1HxH_ptQ-1; Mon, 30 Nov 2020 09:15:15 -0500
X-MC-Unique: 4aRUzS2YN6Ows_1HxH_ptQ-1
Received: by mail-wm1-f70.google.com with SMTP id k23so7458146wmj.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 06:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jy2WUd8qluzxUHyAVJZ0iTyH/i+egdeldCJel1aWn4Y=;
        b=QQeX83OoY7C08aJqelF6ARR0KDaoUHYaYpgv+z9lgXwqfvw0KFDwY/dpraTk2rGbaC
         2UjK1csou6CJzVHz7XEVKIK4mgJ+qyJB+7MAzUTnHDDx6Xetd/DQbMEMHR+Jmwo8xrX0
         9LYxf4huzaj9TsYCWv8Qf/tPvT2elbdBZ1bR8Q12ztN0iq90lUKObNfUA52BD/4+GAOi
         wP3MIz/iQNxZg8LP/rPYiuHNyASVNdw+2fe3B+eQRrdDeaFWknonLAomssNWkFEy4biS
         LKQtCM9rc42purXe9M/dUiXAx0XVM436rIT8xvpqIJctxrOYBb520yklNQN1sAV8vG3/
         yCFA==
X-Gm-Message-State: AOAM5316kAGiT4jL+MoyOlRaqESmH0kjxZZhlU1WO5r1SsbrGX8TxUcX
        ANsd5I8G1KLkfZE6b+CneatVH7KVhcHhYDcxYqpl1rr5TZc9aXFd8y4Og8ZJFRIbFac6Hh7nhgl
        uMaVJB1RE/UIsosRUsLyS
X-Received: by 2002:a1c:e142:: with SMTP id y63mr10768866wmg.28.1606745714342;
        Mon, 30 Nov 2020 06:15:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4NO6q15SbHWukyBJ8MRyRFWENoejaNPVjxMUi4v5OO3B+V6ojxrsSeiVtMWCnB1wM/pytUg==
X-Received: by 2002:a1c:e142:: with SMTP id y63mr10768795wmg.28.1606745713286;
        Mon, 30 Nov 2020 06:15:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id s2sm24357624wmh.37.2020.11.30.06.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 06:15:12 -0800 (PST)
Subject: Re: [PATCH 2/2] KVM: x86: introduce KVM_X86_QUIRK_TSC_HOST_ACCESS
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
 <20201130133559.233242-3-mlevitsk@redhat.com>
 <c093973e-c8da-4d09-11f2-61cc0918f55f@redhat.com>
 <638a2919cf7c11c55108776beecafdd8e2da2995.camel@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e77e912-893b-0c8f-a9a6-b43eaee24ed3@redhat.com>
Date:   Mon, 30 Nov 2020 15:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <638a2919cf7c11c55108776beecafdd8e2da2995.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/11/20 15:11, Maxim Levitsky wrote:
> On Mon, 2020-11-30 at 14:54 +0100, Paolo Bonzini wrote:
>> On 30/11/20 14:35, Maxim Levitsky wrote:
>>> This quirk reflects the fact that we currently treat MSR_IA32_TSC
>>> and MSR_TSC_ADJUST access by the host (e.g qemu) in a way that is different
>>> compared to an access from the guest.
>>>
>>> For host's MSR_IA32_TSC read we currently always return L1 TSC value, and for
>>> host's write we do the tsc synchronization.
>>>
>>> For host's MSR_TSC_ADJUST write, we don't make the tsc 'jump' as we should
>>> for this msr.
>>>
>>> When the hypervisor uses the new TSC GET/SET state ioctls, all of this is no
>>> longer needed, thus leave this enabled only with a quirk
>>> which the hypervisor can disable.
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>>
>> This needs to be covered by a variant of the existing selftests testcase
>> (running the same guest code, but different host code of course).
> Do you think that the test should go to the kernel's kvm unit tests,
> or to kvm-unit-tests project?

The latter already has x86_64/tsc_msrs_test.c (which I created in 
preparation for this exact change :)).

Paolo

