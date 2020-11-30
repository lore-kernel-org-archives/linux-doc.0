Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E7DC64E7B
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 14:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C962520709
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 14:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLVnQjQG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgK3OfT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 09:35:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40151 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726242AbgK3OfT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 09:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606746833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HFkLXb2ck3BWjmucBaw+f/gpFhUWWzy0p9pSm1cDYgw=;
        b=PLVnQjQGdbkw2Kf7AgFgp54saKynLvT7PNk+NK9JkppUTbwVNepI+/lnYAh4/jghPxjEeL
        8BnH1GW9CWrMI3xeqlptc2tpCnmpvCeRGz+sQQ2Kbdlz2CV3dZK9u4g2L0aY9SaGYZ3WlE
        4nsTyb8PPybZu2l6lzETjjSP42ZmfF0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-72TJMuE6Nd2FSGT1VkweLQ-1; Mon, 30 Nov 2020 09:33:51 -0500
X-MC-Unique: 72TJMuE6Nd2FSGT1VkweLQ-1
Received: by mail-ed1-f72.google.com with SMTP id g1so6825834edk.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 06:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HFkLXb2ck3BWjmucBaw+f/gpFhUWWzy0p9pSm1cDYgw=;
        b=RXYJwzplLINhXiEZP3eBGGiC+r/kvgatlOkXi63YjnoBkxSf34s1RTsEQHmHoHLOZ1
         +Ts97V/fignpiYU/PGFstUPDCGh+UA6ujDjqtlAF8gC1dqF7OAlHnbWwkhIq8h6pP+Ab
         hFToojt0nXqUeJJLcLYLZBx+QpD8z2chGMs/+rxqrpicnXIa4jqzDsXD2ccLVCAbpxu9
         u3Sd6jfVM6qgZKgBq5GzL9efTTn2lPYcHCkQOJJMWzmYT0U2/L6lq2ZHWjh2rjnI/lqq
         eFCaHi1OmHlztVZBL4SDdTsvK2wJoDnqv5pRE5Xz4YtmUakP65ytEDNSS/cm/mOh53BH
         rvkg==
X-Gm-Message-State: AOAM531ZDeGQQilc7W9EiGIkGPIKOA2eocQhGVzPN1ohUqG0vJwWxia5
        j5IxupFlIqJCw2eYjCyr7kF6skrRf+0yWFE9a7eHd6k9vy+3D/U2e0EGIsmOy8l1M0q3J1NStCp
        4rJqTYcy5Luuyxt3uhxQt
X-Received: by 2002:a17:906:a218:: with SMTP id r24mr10440574ejy.372.1606746829959;
        Mon, 30 Nov 2020 06:33:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsu+a/K74PyJGaUN13cu1VH4GJRzXEObx7Bgwg01gB5/PI6z+n0lfbvWmX0Rt/JHx2FjPRLQ==
X-Received: by 2002:a17:906:a218:: with SMTP id r24mr10440470ejy.372.1606746828612;
        Mon, 30 Nov 2020 06:33:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id w3sm9211804edt.84.2020.11.30.06.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 06:33:47 -0800 (PST)
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <38602ef4-7ecf-a5fd-6db9-db86e8e974e4@redhat.com>
Date:   Mon, 30 Nov 2020 15:33:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130133559.233242-2-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/11/20 14:35, Maxim Levitsky wrote:
> +		if (guest_cpuid_has(vcpu, X86_FEATURE_TSC_ADJUST)) {
> +			tsc_state.tsc_adjust = vcpu->arch.ia32_tsc_adjust_msr;
> +			tsc_state.flags |= KVM_TSC_STATE_TSC_ADJUST_VALID;
> +		}

This is mostly useful for userspace that doesn't disable the quirk, right?

> +		kvm_get_walltime(&wall_nsec, &host_tsc);
> +		diff = wall_nsec - tsc_state.nsec;
> +
> +		if (diff < 0 || tsc_state.nsec == 0)
> +			diff = 0;
> +

diff < 0 should be okay.  Also why the nsec==0 special case?  What about 
using a flag instead?

Paolo

