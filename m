Return-Path: <SRS0=ZlxX=AT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A24C433DF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 12:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBE9520775
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 12:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdNai/0v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbgGHMnY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jul 2020 08:43:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54184 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729096AbgGHMnX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 08:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594212202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WV6M1edub7XkEemGRBxIe4WR8aj11TMDUW7v+GRjIBg=;
        b=BdNai/0vhc4WR6gTgd1RnC0d+1FAbKAh7aB48pbCRsOo9mkLb7sO7uFza7YjM64ObaP6tz
        y4NjZPTEnoS+Swq4GMrwOMxbczwLnPO1CDK7EkeX1RgjloyfVHy2KRYO8xDh8aNg1a3z16
        hev0TTVg32REvXTWFRguKPlcZ94emzk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-CQQIvDosMoyELfdhzm5T_g-1; Wed, 08 Jul 2020 08:43:21 -0400
X-MC-Unique: CQQIvDosMoyELfdhzm5T_g-1
Received: by mail-wm1-f71.google.com with SMTP id o138so2826580wme.4
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 05:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WV6M1edub7XkEemGRBxIe4WR8aj11TMDUW7v+GRjIBg=;
        b=ObIzROgWPnkbcZG5lT63UriVn+SsdUcFLKJ02OF+IYEwgHwJVhE0gExHqtl7smcCSo
         pErlHXYyLvyil3I0H7w6u4HOy0eYqrFncxtVrBX4y8rZ3DL5Kki/4GOkhRpTld7tn6E/
         fayrInN9Gc/EvmVfYweeR/34WB9AciMOZ92wOSm4j1MhhhvI8aqBAsDEdL6OegM7OQBm
         h15PJka/h9m//t+CdIzd7csCa9YZYUAdMz9OPEBdAMS0PLsnb6JG/AQbv2pDNM5Vhip+
         xRMU6PHK5efxIUxWBFqvC9c0ykW849K+BR8ClFF0bFUXovnSRU481LJ642A7IGPJ9UbF
         y5yw==
X-Gm-Message-State: AOAM5336p74TFWZFB1NJt+nl160kOtzhF8esodA6YWuDhocHeYs/u894
        SQeZ/p+yz2akCbXL2x5CRm2gWapARZKYDbdwMsT0lIzGNHBKYoMl8dsnlFVJVEIgV3AQHvQMpy+
        7eGNWisbI7v/eN0QvpoJv
X-Received: by 2002:a1c:7313:: with SMTP id d19mr8669922wmb.147.1594212200016;
        Wed, 08 Jul 2020 05:43:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkoQtC57N6nn9Fjhc1r7NZTTbvaPCCGsS00bdHLaY5V5WFB96pVfk+xMJs0avi9JF/QeP6gw==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr8669908wmb.147.1594212199839;
        Wed, 08 Jul 2020 05:43:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id 26sm5701946wmj.25.2020.07.08.05.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 05:43:19 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] KVM: X86: Introduce kvm_check_cpuid()
To:     Xiaoyao Li <xiaoyao.li@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Jim Mattson <jmattson@google.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20200708065054.19713-1-xiaoyao.li@intel.com>
 <20200708065054.19713-4-xiaoyao.li@intel.com>
 <3a085ea6-1f2b-904a-99a4-e10ed00e99a0@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c691531-512a-41ef-883c-1831c75b8e8b@redhat.com>
Date:   Wed, 8 Jul 2020 14:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <3a085ea6-1f2b-904a-99a4-e10ed00e99a0@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/07/20 14:28, Xiaoyao Li wrote:
>> @@ -202,12 +208,16 @@ int kvm_vcpu_ioctl_set_cpuid(struct kvm_vcpu *vcpu,
>>           vcpu->arch.cpuid_entries[i].padding[2] = 0;
>>       }
>>       vcpu->arch.cpuid_nent = cpuid->nent;
>> +    r = kvm_check_cpuid(vcpu);
>> +    if (r) {
>> +        vcpu->arch.cpuid_nent = 0;
> 
> Paolo,
> 
> here lack a kvfree(cpuid_entries);
> Can you help fix it?
> 
> Apologize for it.

Actually I hadn't queued this patch; my mistake.  You can fix it and resend.

Paolo

