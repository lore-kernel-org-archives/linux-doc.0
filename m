Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D426AC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 14 Apr 2022 09:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238109AbiDNJLY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Apr 2022 05:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241565AbiDNJLX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Apr 2022 05:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8AC7F6E574
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649927337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EXK01xwL5FfymBT2O/wpbjGm/1sDlFHcoIHw2SavFDU=;
        b=B06tffjLZSX1XnvvZA+ozn+tQWpM5Jcmyiag3mzobVOeiWdedUkdctcnhe7+gVyeOmUOu9
        9Om/KHnT0XS9r1aKaXAkhMrjwh1t2rwVyp86Vh3lHmY+jBA5oxN8KCJ71kvAjnUShYBMJH
        aqeHiq6eWy3YJYgOp7A4MB3yLA9fQ3E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-YDOMtDKaOLy8rMGP0kxKCQ-1; Thu, 14 Apr 2022 05:08:48 -0400
X-MC-Unique: YDOMtDKaOLy8rMGP0kxKCQ-1
Received: by mail-wm1-f69.google.com with SMTP id i66-20020a1c3b45000000b0038eab4e0feaso2129013wma.9
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 02:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EXK01xwL5FfymBT2O/wpbjGm/1sDlFHcoIHw2SavFDU=;
        b=jdV4m7HAgSiyC2kf1FPVRPdDGXG8LBXg8JBAtnuKataN9yXUNOuGwKUGowrAFh/6fD
         hFJw38CzwY8AwgF8y3nxsHd+zMamFpo45XLxcl1tWUo48NMPw7Jv7sN/P5G91c3vndcU
         1AKxN/lrCxdXKF3agmDmCdqhiWPsHqdgrC50/wGpg/aknFgP9DckPEQa2TMEw01ABexk
         STF6GMGTyyGsZxYrD1dhGfXNwdi0xvF72TNY7VJ8RWM6irLNL82y80x2keKh7t6MGThk
         BrBg1kdK14PgodkcAE29ClzMnZIWOjvZRH5vNU6tHKyJM3gnEnf4WpHv7co0gi2hn3D5
         3Pew==
X-Gm-Message-State: AOAM533DNKXjYTc95SIWImM+w3TFjuXjoaIWv8U0GJU6WgqRlffHiBZ+
        JePlxiIi/EEAoQ2+ALM1Ym4ZUa88SXyrHnW5iWcH2P8ixFXWaN52s2UMLVQXcGZ5ZEqTBQ3wmCx
        nItSDJmpTBziVNH8QMCXD
X-Received: by 2002:a5d:64a5:0:b0:205:8e66:e9b1 with SMTP id m5-20020a5d64a5000000b002058e66e9b1mr1312050wrp.464.1649927327730;
        Thu, 14 Apr 2022 02:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAXM3iNNx7LZYO7MKlv+Z8ZcSXxb0BvT2R6br6VU+ZZLHt08JHqpN2CnaubzNSWxNIqo5rdQ==
X-Received: by 2002:a5d:64a5:0:b0:205:8e66:e9b1 with SMTP id m5-20020a5d64a5000000b002058e66e9b1mr1312028wrp.464.1649927327531;
        Thu, 14 Apr 2022 02:08:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b0038cbd8c41e9sm4947976wmq.12.2022.04.14.02.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 02:08:46 -0700 (PDT)
Message-ID: <683974e7-5801-e289-8fa4-c8a8d21ec1b2@redhat.com>
Date:   Thu, 14 Apr 2022 11:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH V3 3/4] KVM: X86: Alloc role.pae_root shadow page
Content-Language: en-US
To:     Lai Jiangshan <jiangshanlai@gmail.com>,
        Sean Christopherson <seanjc@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Lai Jiangshan <jiangshan.ljs@antgroup.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        linux-doc@vger.kernel.org
References: <20220330132152.4568-1-jiangshanlai@gmail.com>
 <20220330132152.4568-4-jiangshanlai@gmail.com> <YlXrshJa2Sd1WQ0P@google.com>
 <CAJhGHyD-4YFDhkxk2SQFmKe3ooqw_0wE+9u3+sZ8zOdSUfbnxw@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJhGHyD-4YFDhkxk2SQFmKe3ooqw_0wE+9u3+sZ8zOdSUfbnxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/14/22 11:07, Lai Jiangshan wrote:
>> I don't think this will work for shadow paging.  CR3 only has to be 32-byte aligned
>> for PAE paging.  Unless I'm missing something subtle in the code, KVM will incorrectly
>> reuse a pae_root if the guest puts multiple PAE CR3s on a single page because KVM's
>> gfn calculation will drop bits 11:5.
> 
> I forgot about it.


Isn't the pae_root always rebuilt by

         if (!tdp_enabled && memcmp(mmu->pdptrs, pdpte, sizeof(mmu->pdptrs)))
                 kvm_mmu_free_roots(vcpu->kvm, mmu, KVM_MMU_ROOT_CURRENT);

in load_pdptrs?  I think reuse cannot happen.

Paolo

