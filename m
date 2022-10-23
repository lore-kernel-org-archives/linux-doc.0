Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F9CC3A59D
	for <linux-doc@archiver.kernel.org>; Sun, 23 Oct 2022 17:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiJWRvF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 23 Oct 2022 13:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiJWRvE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 Oct 2022 13:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0305466F01
        for <linux-doc@vger.kernel.org>; Sun, 23 Oct 2022 10:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666547463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D09MWv0UvzUmBKDXwZPzEI59Y82igwH0mMVX8RFHjcA=;
        b=EpW2aYsSLlwNjDIRbfNdXxyD42LuGvVfxHF8SEZGhbVAeccFpXDNbN9lCMWPN709ATiT8E
        9uizsGZO2kYnud2mTi8wJvj1dxiXdzE24ld+GvqGJHHh1MvBGb5FCWbxRIfwODFY2l1NAt
        2WhP+MWbOqD/v16lV6XWnYlTHu10Wpc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-xCN4m6N4Py-VSpl5Dj-9KQ-1; Sun, 23 Oct 2022 13:51:01 -0400
X-MC-Unique: xCN4m6N4Py-VSpl5Dj-9KQ-1
Received: by mail-lf1-f72.google.com with SMTP id i9-20020ac25229000000b004a24f6e0f78so2113497lfl.23
        for <linux-doc@vger.kernel.org>; Sun, 23 Oct 2022 10:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D09MWv0UvzUmBKDXwZPzEI59Y82igwH0mMVX8RFHjcA=;
        b=grAYguUJdVJUk0i290WAhAOUns5RghSLsA6u+UdlIIdeIXUqTrQBT4X/vpK5tcnlp3
         0DbKy4kiVyw5LiYmiY1Au2r96cbjkb7gW3ZGZ4nbEg8vg6NfFsM9gfMYV2WGExVI/IDT
         s9cl6APm/P00//GYWV/16lsmdLuvRuUQW55IgD+h3MUx7cSfg01dQzjPHfTnPsRP7ltD
         KohXzJmP0swuEV7pfYQJDLTn6T5+oAIWffe5ipvDDwOgm4ZS4yrdCEopA5HFi2yzrCUe
         GfaFD9OeqNVcSRSV1lmwdK69Wtf2IVivMJL9/Ia596VMILaHhcgq+b6UnJi/d29Nfpkh
         i4wg==
X-Gm-Message-State: ACrzQf019p3LlkhHQynefs8bK/AbAB8y6a09KKi3EL9JonoGByS0DtNQ
        a1ckGONRXNPPvScnCaDmQPHpH7mF2tRPAYs249cOP/+1mGZAwsQuEa4bMRNw4RbrNlGDR8OU3PM
        SEl1Ko/N6QwROL3NpGpeg
X-Received: by 2002:a19:740b:0:b0:4a6:4e23:f1a1 with SMTP id v11-20020a19740b000000b004a64e23f1a1mr6704609lfe.648.1666547458778;
        Sun, 23 Oct 2022 10:50:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lselhb4mBLW2XIV0vJT8VL/BMXi1ZtLK17hfsJ/qDg+TASFANunS0l1JbfqLOFrZxQJtg7g==
X-Received: by 2002:a17:907:9611:b0:78d:bb06:90a3 with SMTP id gb17-20020a170907961100b0078dbb0690a3mr24419521ejc.233.1666547448280;
        Sun, 23 Oct 2022 10:50:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id d14-20020a170906304e00b0078250005a79sm14429105ejd.163.2022.10.23.10.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 10:50:47 -0700 (PDT)
Message-ID: <62500f94-b95b-1e16-4aa2-f67905fab01a@redhat.com>
Date:   Sun, 23 Oct 2022 19:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/4] KVM: introduce memory transaction semaphore
Content-Language: en-US
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        kvm@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221022154819.1823133-1-eesposit@redhat.com>
 <20221022154819.1823133-4-eesposit@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221022154819.1823133-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/22/22 17:48, Emanuele Giuseppe Esposito wrote:
> +static DECLARE_RWSEM(memory_transaction);

This cannot be global, it must be per-struct kvm.  Otherwise one VM can 
keep the rwsem indefinitely while a second VM hangs in 
KVM_KICK_ALL_RUNNING_VCPUS.

It can also be changed to an SRCU (with the down_write+up_write sequence 
changed to synchronize_srcu_expedited) which has similar characteristics 
to your use of the rwsem.

Paolo

