Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332A4C2BB40
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 13:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E79B523EB1
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 13:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391842AbgLKNjU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 08:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23858 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388882AbgLKNjA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 08:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607693853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gV4c090IqWI5tEA2buwHKvS0/NqK9RSA3GoSyg8aYNs=;
        b=OiUUxPY+wcGk+yzt0L4ugFC+v2m++H9GRMMkvGbVxp9qysvngOwUf8jw0pdnp8X6NVKIK6
        kzGOJ61vRoTa0BYRo+YCAXzsOGXetHBUAOScCUnalkD6m3xHM+OsnqgzDNyBQdOsD1DHcj
        AaMUpBRnX62Wo2Mf/dexmSc1ARjdaUE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-kWf4h77dMMuBzKwkxfl17g-1; Fri, 11 Dec 2020 08:37:31 -0500
X-MC-Unique: kWf4h77dMMuBzKwkxfl17g-1
Received: by mail-wr1-f71.google.com with SMTP id v1so3326726wri.16
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 05:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gV4c090IqWI5tEA2buwHKvS0/NqK9RSA3GoSyg8aYNs=;
        b=lEJciTlMyUfaRIynPy8j/CYNBI4G9VMDahCiIhyan2/rQaULfdoYFVUEyrHJYWLZE5
         21IrCo/qhG/hyApKsFxbJqFJV5JpMdMDiilFh9pQhJTNWIWKseZGVXMzTxSvOGulkTS0
         sZBvyXlhn5ISIYIGbYdUFHd4sUHYRtq7v8gUtqcZzwSrPZcX7V8aAoNzab8KtvpHT+hb
         qPm5jUaecqH7pw9tlnKWPM+kPgYw6vvQI4MYZC7/o/E9aY+tJp7/tD0E9FP/oDcXv6aJ
         Ms17FMqQ+7QTmrQpfpUbONO9BpvduBx2HrbQm174k6jADr5sOcQiPVfbJxo7r1MRYyM1
         yrHw==
X-Gm-Message-State: AOAM531w1KtMvhNSSocOUb3rY9Cr9CIBqO4h/W6Oooy3mbgPNKmX9eZF
        G3Ufee+sG2Y84dkYm9jgpkmKhRxv2PTf4fR8d/Su6cp7MeB4/p7bGi3ugsIaLVkM9HPyR31XroA
        wm8uyuebIOvhASBzGbjX27+ncPeq8Ueu2dcTEWyqyw28rLLTizZIz2pTL8lvsIjVLjotpnK3M
X-Received: by 2002:adf:dd90:: with SMTP id x16mr13783268wrl.85.1607693850282;
        Fri, 11 Dec 2020 05:37:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJ6/HzWkhgIrtQKABfYostveB3IDy4vSX+reQk78mBEui3U7TXREPtLi7Hnr4bOSkxry96bA==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr13783217wrl.85.1607693850018;
        Fri, 11 Dec 2020 05:37:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id z64sm13966730wme.10.2020.12.11.05.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 05:37:28 -0800 (PST)
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
To:     Marcelo Tosatti <mtosatti@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>
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
References: <20201203171118.372391-2-mlevitsk@redhat.com>
 <20201207232920.GD27492@fuller.cnet>
 <05aaabedd4aac7d3bce81d338988108885a19d29.camel@redhat.com>
 <87sg8g2sn4.fsf@nanos.tec.linutronix.de> <20201208181107.GA31442@fuller.cnet>
 <875z5c2db8.fsf@nanos.tec.linutronix.de> <20201209163434.GA22851@fuller.cnet>
 <87r1nyzogg.fsf@nanos.tec.linutronix.de> <20201210152618.GB23951@fuller.cnet>
 <87zh2lib8l.fsf@nanos.tec.linutronix.de> <20201211002703.GA47016@fuller.cnet>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ec926c2c-985a-2e3d-1ba0-b35ce55a19c4@redhat.com>
Date:   Fri, 11 Dec 2020 14:37:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211002703.GA47016@fuller.cnet>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/12/20 01:27, Marcelo Tosatti wrote:
> This features first, correctness later frenzy is insane and it better
> stops now before you pile even more crap on the existing steaming pile
> of insanities.

FWIW I agree, in fact I wish I knew exactly where to start simplifying 
it; the timekeeping code in KVM is perhaps the last remaining bastion 
where I'm afraid just to look at it.

At least I know there's a couple of features that IMHO are completely 
useless, and that's even before you reach the ones that might "only" be 
obsolete.  So perhaps that's where to start, together with the messiest 
userspace interfaces.

Paolo

