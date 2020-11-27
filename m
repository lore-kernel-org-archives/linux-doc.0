Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5D9C5519F
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 16:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B60D1206DF
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 16:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsX2bSd6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731169AbgK0Qs6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Nov 2020 11:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30106 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731337AbgK0Qs6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Nov 2020 11:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606495736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nGp/DntBx65LrgMqUH3vUA33NqIvtHitHZjJU3bsRLY=;
        b=KsX2bSd6PTCN4taIvzurQ22OtAY5MMYTKCpt4UM6T753FGzlqEuKUmn+xc3v2NoTeZQEMF
        cyAzV5xoKitG81MpZR1TZDrzM2o/VCSNLTyXksJF67ltqW5wQN05g/IUFuL4vuu8YoBgRe
        lZx6gsrR1uGKGNtn+Ktm4mqGi+T9upE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-nVl4OarHMPK3-RElWd9teA-1; Fri, 27 Nov 2020 11:48:54 -0500
X-MC-Unique: nVl4OarHMPK3-RElWd9teA-1
Received: by mail-ej1-f71.google.com with SMTP id y10so2159216ejg.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2020 08:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nGp/DntBx65LrgMqUH3vUA33NqIvtHitHZjJU3bsRLY=;
        b=FQbdjMfpBATAm3o+JSKqAfkFV4+XD1gyndpHkY+wTgqzr68ikeMlOrQVPvVfmaDbLl
         XzNh/LgGQPI7RmWhD47de8uR2aq2vbCFlG0HJg9m/KsVl6jG9GUiWTNNN9rHoQ7J1Vwh
         n3jIaIJAd4ScfUdzjkf++yo7YvP0KAdxTYyIvouxl8nhJ2GG4PpblSPi3o8FyDdhjmc5
         NvNMAG1DqEk/llSRoXqVNOnBSEl7XIDlctfgAMxudfEIKhmvbQO8Y4BU2XSIof/JNqrM
         EkyfB97avMIA/6w4tMQz5oE0OuNABauvQbTPayPtXDp4ZAraN7/3y9MHE2XgGNS/Ytj+
         3uFw==
X-Gm-Message-State: AOAM531dUpYHMkOSd+QsWspJowxbciP5E4bmgVpyfTxopF9GCd54YDSN
        OqXV8lyOellMp1xfQc+OjXWFSLL8+d00HuOwM31Pl73qvPfawE9xAy+9i7lNv/3D88nnPr2VeRj
        xBZkiot8oywWF/jbnsgI1xnVEyL6kdkXYN0mXJ7eEr+UcLXFR1sdkwYxu1a36kZfrZ1lWKruO
X-Received: by 2002:a17:906:6b82:: with SMTP id l2mr8531402ejr.241.1606495732866;
        Fri, 27 Nov 2020 08:48:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJUDCnzieJYN1ooH1FMZWePLUiObAU18Z7hCPD7yuVFtkt12b8hACer7ziwEvurg6/0HZMEQ==
X-Received: by 2002:a17:906:6b82:: with SMTP id l2mr8531363ejr.241.1606495732591;
        Fri, 27 Nov 2020 08:48:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id b20sm557564eja.30.2020.11.27.08.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 08:48:51 -0800 (PST)
Subject: Re: [PATCH] kvm/x86/mmu: use the correct inherited permissions to get
 shadow page
To:     Sean Christopherson <seanjc@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Lai Jiangshan <laijs@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Avi Kivity <avi@qumranet.com>, linux-doc@vger.kernel.org
References: <20201120095517.19211-1-jiangshanlai@gmail.com>
 <20201126000549.GC450871@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0724aeb9-3466-5505-8f12-a5899144e68f@redhat.com>
Date:   Fri, 27 Nov 2020 17:48:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126000549.GC450871@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26/11/20 01:05, Sean Christopherson wrote:
> On Fri, Nov 20, 2020, Lai Jiangshan wrote:
>> From: Lai Jiangshan <laijs@linux.alibaba.com>
>>
>> Commit 41074d07c78b ("KVM: MMU: Fix inherited permissions for emulated
>> guest pte updates") said role.access is common access permissions for
>> all ptes in this shadow page, which is the inherited permissions from
>> the parent ptes.
>>
>> But the commit did not enforce this definition when kvm_mmu_get_page()
>> is called in FNAME(fetch). Rather, it uses a random (last level pte's
>> combined) access permissions.
> 
> I wouldn't say it's random, the issue is specifically that all shadow pages end
> up using the combined set of permissions of the entire walk, as opposed to the
> only combined permissions of its parents.
> 
>> And the permissions won't be checked again in next FNAME(fetch) since the
>> spte is present. It might fail to meet guest's expectation when guest sets up
>> spaghetti pagetables.
> 
> Can you provide details on the exact failure scenario?  It would be very helpful
> for documentation and understanding.  I can see how using the full combined
> permissions will cause weirdness for upper level SPs in kvm_mmu_get_page(), but
> I'm struggling to connect the dots to understand how that will cause incorrect
> behavior for the guest.  AFAICT, outside of the SP cache, KVM only consumes
> role.access for the final/last SP.
> 

Agreed, a unit test would be even better, but just a description in the 
commit message would be enough.

Paolo

