Return-Path: <SRS0=ZlxX=AT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E4FC433DF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 13:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1196206F6
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 13:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="We3Hv+aZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgGHNaY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jul 2020 09:30:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47574 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729597AbgGHNaW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 09:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594215020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a08tCz9a1g45saZxljOnL0qxpDHyPSBjoSq9y4YxEWM=;
        b=We3Hv+aZNv0RW9LBOr4kt04VwO2RFDLtx//WsQh/k5HJQAXCPbhVNkgjxb5dqFGqoyjA9h
        /lMWJyYVxp2/5NAXm9/kQfqbj8yZsEPB5otRV+Up4QP7gauriji/LH+dCGS9MLarbiRWLc
        n8cq5RMmA6pInzjLf57/RX18P1WVni4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-pCFpNwonP3GONIJUVeHuKg-1; Wed, 08 Jul 2020 09:30:15 -0400
X-MC-Unique: pCFpNwonP3GONIJUVeHuKg-1
Received: by mail-wr1-f71.google.com with SMTP id y16so51931215wrr.20
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 06:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a08tCz9a1g45saZxljOnL0qxpDHyPSBjoSq9y4YxEWM=;
        b=f3DbkHl4mx3WYedMegUWGoHFPBNx8GcjU8UApVO33YQ30qI1+TIAGPKxOiKGxQbDoq
         8IOXKuTbTNzuYhvxv94BWcDjii9qDHn2FemdhL/5rdRsMpJ9nYyFjfiqdSnNLgCmST+i
         n4eybm62g5bFqwNHDmphAv+ixkMdsYNYExSNXVECXx9jvbFtDc9XywcaDj+iAkfI/cq+
         M6+Q/LNP2Vsr67hJJDCxEwmuJJVivNw5E8RP4mrhjf1Xuj9HXFDPKgUcrNOrnGJGdp3s
         dLbRjIWK4culQAC1lm9OeZnAKy63FIyN9pchBB6aNKRZ/BcsrqrDOGQ2mAxVarRiqDDc
         fehQ==
X-Gm-Message-State: AOAM533rcIo/6IxuaI/TI8MRivax87e40uaI+5GK+0/WqtbcWzcv6sqC
        xx1H0JJlg+qJ93I4FIRtkVph5w1z28eWysZjzMVJPE3ZZ0KOecKfapgVkxAnYcrm83WoAC0CUAT
        ZsPAdfe8baVBQSQbO1Q/P
X-Received: by 2002:adf:ff8d:: with SMTP id j13mr56984369wrr.11.1594215014789;
        Wed, 08 Jul 2020 06:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2jwWB+l1X8VbjFRDf1YAE71QxQJDyFYFq4dReBrjCyTz5nBbkC7IeqeRu5cmIiqtwLk5JWA==
X-Received: by 2002:adf:ff8d:: with SMTP id j13mr56984349wrr.11.1594215014525;
        Wed, 08 Jul 2020 06:30:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id e23sm5715619wme.35.2020.07.08.06.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 06:30:13 -0700 (PDT)
Subject: Re: [PATCH v3 4/8] KVM: X86: Split kvm_update_cpuid()
To:     Xiaoyao Li <xiaoyao.li@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Jim Mattson <jmattson@google.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20200708065054.19713-1-xiaoyao.li@intel.com>
 <20200708065054.19713-5-xiaoyao.li@intel.com>
 <ad349b28-bc62-e478-c610-e829974a8342@redhat.com>
 <92184f05-ca27-268c-ea72-f939fb1a0ab2@intel.com>
 <4123eb60-d89a-9112-dd7e-1a7627a0fc70@redhat.com>
 <0c0084cb-92c0-23fe-dc5a-441e4b04742c@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50a4b50e-0143-06dd-c75d-b76f1bbbe5ba@redhat.com>
Date:   Wed, 8 Jul 2020 15:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0c0084cb-92c0-23fe-dc5a-441e4b04742c@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/07/20 15:27, Xiaoyao Li wrote:
>>
> 
> I'm ok with kvm_vcpu_after_set_cpuid().
> 
> BTW there is an unknown for me regarding enter_smm(). Currently, it
> calls kvm_update_cpuid(). I'm not sure which part it really needs,
> update CPUID or update vcpu state based on CPUID?

It needs to update CPUID because it affects CR4.OSXSAVE among others.

Paolo

