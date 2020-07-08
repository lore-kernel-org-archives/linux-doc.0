Return-Path: <SRS0=ZlxX=AT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795A1C433E0
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 12:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54EE22065C
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jul 2020 12:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DI/YnxSr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgGHMA7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jul 2020 08:00:59 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42231 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728942AbgGHMA6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 08:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594209656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hmKCNmXWHhIbbQdWVp5s2pqNmp2UrKc3xUPz10fSo04=;
        b=DI/YnxSrK4sNtUATjPSxHj3tFW89waMFnOrZ9GTtFEL0a9J608sVfjrt7VPJ4wDd6EwmKU
        Kjd97UmOjtI0VdZN04ErDSuiTg9hHT1shXDpqZLKzGaD4DwLHzLH12Aw7VK0qji54BUGYS
        RyeTC5pdwl6lTi+qHp+NrklTvFjcAeE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-JfQTbbB1MWKouEIn0AKRKg-1; Wed, 08 Jul 2020 08:00:53 -0400
X-MC-Unique: JfQTbbB1MWKouEIn0AKRKg-1
Received: by mail-wr1-f71.google.com with SMTP id y13so51764689wrp.13
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 05:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hmKCNmXWHhIbbQdWVp5s2pqNmp2UrKc3xUPz10fSo04=;
        b=VxfnB71kMzZ+jhnXAIQ97pGPWG9ZKArpF0HH8GmfgV3YbSWPIHrsB/M/ca830+3YO8
         YcJPV1a72Za7madrLJnV9/LGojtH08VqdPrRddNyFmu6w5t4xIa5rwx0sq1fc28guYCY
         VC+pbWWoqeyG8hCI9bNCaxK+iK7n9Km6+ssestYcLxGgsp9EwCNKQesoUFYbuYqv6cau
         /48wyooE+l1ojf5b7vhF51anqeVSWX06DZ0Dg8jGH6eD5cHaDt5/VTOd1oDujx+XiX6j
         ql5E03X28QIRH4u9/OgPp6KAjKr8nPVmYTH59Uo7LF9xjGupaJ2jPqaH8r6S5ayLnvXK
         fLvQ==
X-Gm-Message-State: AOAM533V1wcEOgrRLHKIJiXIIiCR7J7RXpth6VP8YcV3ytiAebYzbiKk
        wznhFNzweBQd1gaqdJ0+8is3NXzqHorJ9m89klLlqPV8jCpFdJPBzlTMR2PX3cSJY6dgx+nNRpr
        V428UMTMFn0Etp8C6aq6I
X-Received: by 2002:a7b:c116:: with SMTP id w22mr8656727wmi.97.1594209652181;
        Wed, 08 Jul 2020 05:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgDZMDB93ZlhsJ1XHsTJ4kZPxli+b1em/HHGjRGIBMn+xiyVQ/u5J5G/Zj7RI/Q8hS/gq2xQ==
X-Received: by 2002:a7b:c116:: with SMTP id w22mr8656716wmi.97.1594209651993;
        Wed, 08 Jul 2020 05:00:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id k126sm6226407wme.17.2020.07.08.05.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 05:00:51 -0700 (PDT)
Subject: Re: [PATCH v3 1/8] KVM: X86: Reset vcpu->arch.cpuid_nent to 0 if
 SET_CPUID* fails
To:     Xiaoyao Li <xiaoyao.li@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Jim Mattson <jmattson@google.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20200708065054.19713-1-xiaoyao.li@intel.com>
 <20200708065054.19713-2-xiaoyao.li@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fe0c23e6-491b-358b-8e94-94fb01cb3890@redhat.com>
Date:   Wed, 8 Jul 2020 14:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200708065054.19713-2-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/07/20 08:50, Xiaoyao Li wrote:
> +Note, when this IOCTL fails, KVM gives no guarantees that previous valid CPUID
> +configuration (if there is) is not corrupted. Userspace can get a copy of valid
> +CPUID configuration through KVM_GET_CPUID2 in case.
> +
>  ::

I assume you mean "of the resulting CPUID configuration".

Paolo

