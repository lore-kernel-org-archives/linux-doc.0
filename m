Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B3FC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 07:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 443B26109E
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 07:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348050AbhICHl7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Sep 2021 03:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52060 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348007AbhICHl6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Sep 2021 03:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630654858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m2Gk1gYDhm7oWdNwheDfEhB69vSHBptODccZaywq6VI=;
        b=cxLVwprhnJWNIpI6yzztbHfSK/UNLfgKz7N402Z5v54N62E1CpH9RQAolSDxK8NfT1BfPk
        9Muq8GDzhhxuGM49LwSVM3V5IwvnLl3wiT7Uu4IVO+PovY6VakgwZDY9pb+MzEGiDd7iVg
        qYFjPiQSeQ2hiG99wCEGuxAZVjY3VVQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-hM0ae5XDN4CkDu9W305rnA-1; Fri, 03 Sep 2021 03:40:57 -0400
X-MC-Unique: hM0ae5XDN4CkDu9W305rnA-1
Received: by mail-wr1-f70.google.com with SMTP id t15-20020a5d42cf000000b001565f9c9ee8so1291040wrr.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Sep 2021 00:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=m2Gk1gYDhm7oWdNwheDfEhB69vSHBptODccZaywq6VI=;
        b=oUlLNXbK4jFq4oBzkbAebB/R9qYri9AQs+g2GdYYioPe2SFvFt6EcUC6imqxzQ0apU
         mwZBF0nZPFIJI7bteLiLX9V/1+urFtZAypxDPak+XAQceOzP8RORQSex2zEZQkeM+6aM
         hdjanRyFycsNUkqpQ9xvgxg5KRWPasMeDl/ULWOAkoFXlD0AWg2KRXF3IxyQT/nzZ/ue
         VWU9sRCH6tB1TZOVe/XfBU0AeLGtWF+ZkIA5TtYWSODeY4Zh0KdVEap2Q/w87P7PN1/+
         /0Kiudz9C4cJqCBDuHoLe/g9WOHwXB4jsizw8t+02QhJvksWdsQj+grbhNxGnA8j07WL
         zP1g==
X-Gm-Message-State: AOAM531y7/MD6UWJJajPm40TL1ApTskkWJ+xWMDyPMy1k6yFeIlWs70N
        6PfbtVJLLtUBxWJSMLF/kZG+FM6YrTz0QrQPgLL0hkoPqndYYH/tr9g6AVAIA0OX0zTSML6JkAe
        GDDIN9qMV48RwZFFz/e/C
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr2386324wrq.263.1630654855933;
        Fri, 03 Sep 2021 00:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBvBmc/wTAPRQ7Yv14HcqIk/YmtYTtuC3HB1QfbK/IRroOVGU4Pdtb7PhRFhAOb6trK6S1jA==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr2386308wrq.263.1630654855762;
        Fri, 03 Sep 2021 00:40:55 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id i5sm3220951wrc.86.2021.09.03.00.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 00:40:55 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 6/6] x86/kvm: add boot parameter for setting max number
 of vcpus per guest
In-Reply-To: <bb4ebe24-1de5-82b8-001d-1c0f9f28861b@suse.com>
References: <20210701154105.23215-1-jgross@suse.com>
 <20210701154105.23215-7-jgross@suse.com>
 <87h7gx2lkt.fsf@vitty.brq.redhat.com>
 <1ddffb87-a6a2-eba3-3f34-cf606a2ecba2@suse.com>
 <878s292k75.fsf@vitty.brq.redhat.com>
 <62679c6a-2f23-c1d1-f54c-1872ec748965@suse.com>
 <8735sh2fr7.fsf@vitty.brq.redhat.com>
 <bb4ebe24-1de5-82b8-001d-1c0f9f28861b@suse.com>
Date:   Fri, 03 Sep 2021 09:40:53 +0200
Message-ID: <87lf4em7i2.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Juergen Gross <jgross@suse.com> writes:

> On 14.07.21 15:21, Vitaly Kuznetsov wrote:
>> Juergen Gross <jgross@suse.com> writes:
>> 
>>> On 14.07.21 13:45, Vitaly Kuznetsov wrote:
>>>
>>>> Personally, I'd vote for introducing a 'ratio' parameter then so
>>>> generally users will only have to set 'kvm.max_vcpus'.
>>>
>>> Okay.
>>>
>>> Default '4' then? Or '2 ^ (topology_levels - 2)' (assuming a
>>> topology_level of 3 on Intel: thread/core/socket and 4 on EPYC:
>>> thread/core/package/socket).
>> 
>> I'd suggest we default to '4' for both Intel and AMD as we haven't given
>> up completely on cross-vendor VMs (running AMD VMs on Intel CPUs and
>> vice versa). It would be great to leave a comment where the number comes
>> from of course.
>> 
>
> Thinking more about it I believe it would be better to make the
> parameter something like "additional vcpu-id bits" with a default of
> topology_levels - 2 (cross-vendor VMs are so special that I think the
> need to specify another value explicitly in this case is acceptable).
>
> Reasons are:
>
> - the ability to specify factor values not being a power of 2 is weird
> - just specifying the additional number of bits would lead to compatible
>    behavior (e.g. a max vcpu-id of 1023 with max_vcpus being 288 and the
>    default value of 1)
> - the max vcpu-id should (normally) be 2^n - 1

Sounds good to me! 

Also, there's an ongoing work to raise the default KVM_MAX_VCPUS number
by Eduardo (Cc):

https://lore.kernel.org/kvm/20210831204535.1594297-1-ehabkost@redhat.com/

It would be great if you could unify your efforts)

-- 
Vitaly

