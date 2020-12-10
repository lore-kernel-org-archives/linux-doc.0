Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10057C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 11:52:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D19BB23D5A
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 11:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgLJLuB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 06:50:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30323 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727398AbgLJLtw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 06:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607600906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nYPQDiAhm8hSh2USepS5FHexuq2b5Pq9ywrQrkIfNpo=;
        b=MwLFwwTvszpGs0IvLvysgFyrI1SOUKoIdYXqd1JZkaaUWL/WNWLDDVP4L+6zoEBBHdJ0eO
        aQ1X406KrExfYXNFpXzcx090c3iNFEl2/YPaOygiJqwSJmj71/gr3ZsuRN7v3wHW0Isefk
        0N/3Ib2RLaPd5xo0lEM/jblOhrRhQy4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-xYAo2u_AP3y7joCDFXpl2A-1; Thu, 10 Dec 2020 06:48:24 -0500
X-MC-Unique: xYAo2u_AP3y7joCDFXpl2A-1
Received: by mail-ed1-f72.google.com with SMTP id z20so2289669edl.21
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 03:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nYPQDiAhm8hSh2USepS5FHexuq2b5Pq9ywrQrkIfNpo=;
        b=XIpmIJpyF/oy7V6lGuPemQ07E8Fl2dcEwHFY0W7+RVjrmsu3zO/HyYPbOZAyBkYVT5
         0H5k+u8vx9pnNtqyWOzMYdDGmaOEvomi1fTrulI7MWLlBkBthMntEqjY9WZu47Lm2J5v
         OBFJyD9H9HLzWVFw7f3CaaYVN+1fJmrEA/PcPfVFmyQB9YBfzm6032oMBZhgtOhiwOwD
         LM3CG8L0RU7ghpmbQfAn7LW9NC0S2NSqqLeD67gLgH+De4gLFJ2cfegPpUuonkldMDx3
         AVGwjC62t1l1AmeTLXlbSS0J6LRFXG55nlDblMZcY2TA7eqzYuatoOCt/8zF8oVwQv3j
         OntQ==
X-Gm-Message-State: AOAM531038ovtzqTnTRbmFhh2zwIYravaa3mfZitg3tZfZAkN/xNbGMH
        ++Xi12NYBY1S8VCKMEz/54vUqHN83fgQ7780mW4bdvC2v6lArwzv33xNSue5LK3gt7W5+MNGB4z
        YrMsw4XVkWwBrHlLrMzta43ZUCwj6b7lWF0KIdQr11h3ygweP8qYlcBonM3ZmBhCMBl2Mg/gr
X-Received: by 2002:a17:906:60c4:: with SMTP id f4mr5984870ejk.336.1607600903243;
        Thu, 10 Dec 2020 03:48:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQgXMt4toLvnNgD5Cb9xhVQ4EUd7Fk1QIvNq7IrqgtLyqfYak4c6SknAeDik9vCfyF8qAaQg==
X-Received: by 2002:a17:906:60c4:: with SMTP id f4mr5984837ejk.336.1607600903022;
        Thu, 10 Dec 2020 03:48:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id rk12sm4108614ejb.75.2020.12.10.03.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 03:48:22 -0800 (PST)
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
To:     Maxim Levitsky <mlevitsk@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Oliver Upton <oupton@google.com>
Cc:     kvm list <kvm@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20201203171118.372391-1-mlevitsk@redhat.com>
 <20201203171118.372391-2-mlevitsk@redhat.com>
 <CAOQ_Qsj6THRPj2ta3PdOxUJeCj8KxPnLkWV8EGpvN_J=qUv74A@mail.gmail.com>
 <d3dd82950301517e47630cc86fa0e6dc84f63f90.camel@redhat.com>
 <87lfe82quh.fsf@nanos.tec.linutronix.de>
 <047afdde655350a6701803aa8ae739a8bd1c1c14.camel@redhat.com>
Message-ID: <7c25e8c0-a7d4-8906-ae47-20714e6699fe@redhat.com>
Date:   Thu, 10 Dec 2020 12:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <047afdde655350a6701803aa8ae739a8bd1c1c14.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/12/20 18:08, Maxim Levitsky wrote:
>> Even if you support TSCADJUST and let the guest write to it does not
>> change the per guest offset at all. TSCADJUST is per [v]CPU and adds on
>> top:
>>
>>      tscvcpu = tsc_host + guest_offset + TSC_ADJUST
>>
>> Scaling is just orthogonal and does not change any of this.
>
> I agree with this, and I think that this is what we will end up doing.
> Paulo, what do you think about this?

Yes, you can have a VM ioctl that saves/restores cur_tsc_nsec and 
cur_tsc_write.  The restore side would loop on all vcpus.

However, it is not so easy: 1) it would have to be usable only if 
KVM_X86_QUIRK_TSC_HOST_ACCESS is false, 2) it would fail if 
kvm->arch.nr_vcpus_matched_tsc == kvm->online_vcpus (which basically 
means that userspace didn't mess up the TSC configuration).  If not, it 
would return -EINVAL.

Also, while at it let's burn and pour salt on the support for 
KVM_SET_TSC_KHZ unless TSC scaling is supported, together with 
vcpu->tsc_catchup and all the "tolerance" crap that is in 
kvm_set_tsc_khz.  And initialize vcpu->arch.virtual_tsc_khz to 
kvm->arch.last_tsc_khz before calling kvm_synchronize_tsc.

Paolo

