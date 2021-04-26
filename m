Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F3EC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 12:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 981AB61178
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 12:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhDZMdO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50105 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233285AbhDZMdN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 08:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619440351;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q7ft+FJuoyaWZFH96qTL2gT73WOnML/rzPUiP2aXrO8=;
        b=RYihPoE9tcXVoApI2iCN3XnA3sfvwGILJufj7ZjrgVNwshf9r3vMPezcIqsR/sHHnAlube
        akbZi+RhZOMtfA4+xkKlSOB48A5lk+t8YH1QOkTrGuGCdQhc6SRMKuvUhNwVLgi7EUp2QE
        oDMBRcszbx7bky/L4Hx6owNQpbQstjI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-scfYAEJ6OuWg5zEiTDI2Fw-1; Mon, 26 Apr 2021 08:32:29 -0400
X-MC-Unique: scfYAEJ6OuWg5zEiTDI2Fw-1
Received: by mail-ed1-f71.google.com with SMTP id cz7-20020a0564021ca7b02903853d41d8adso13662136edb.17
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 05:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q7ft+FJuoyaWZFH96qTL2gT73WOnML/rzPUiP2aXrO8=;
        b=AJimOLp5j+T6SMhFI5kfeFurygnoP2r/UnXcCA84fFnrIVp0ry5TuRczR8DuuNSXfM
         dA1p/5VJn3uMyM9YQ6aygAEkYHHrTqPrfiTL4iK2G1XN6qb3ugyPyC9r4qrwqoMk775a
         W7G+J55/Z9swU62HVu67JwEDhD2yJLAFeBdRD0ZtQck3KKs3mxYcz+R+YZ5RQw8kGN4L
         fE2OCgaf2NXfzlzNTzmdCpiqzPop7t6TkeGu0PlIKpflzb68ODkMMA88pqK3j6U+nyi1
         soSjTuUUREbU+aQrDxun8B0gjQtqg/bdj/Ca9+ZtpOty9T+gWd3flZu8mWCtiehaLFM4
         RiAg==
X-Gm-Message-State: AOAM531R1wRal5QvI+Sc/CcNjuiDEEaJFRTR+6MzgJZZIy4MQdJDqRXN
        oLbrnSoSSX1SVOCYUHCFN1KSM6OUOAyMUcDbQimC4x9z5AX3g0kMLEB4Hpui7h3m8mxRTXjdBkk
        C5JSfMy0/ISnLX6uQglwB
X-Received: by 2002:a17:906:c09:: with SMTP id s9mr18213030ejf.145.1619440348590;
        Mon, 26 Apr 2021 05:32:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx98SpHqrIShgDQiQwvrRqUS98bHoMpJXRGL/rNx8PhCExMvUUt8bj4tfMYahD10Bk25Oebmw==
X-Received: by 2002:a17:906:c09:: with SMTP id s9mr18213015ejf.145.1619440348445;
        Mon, 26 Apr 2021 05:32:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y2sm2401527ejg.123.2021.04.26.05.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 05:32:27 -0700 (PDT)
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20210426111333.967729-1-mlevitsk@redhat.com>
 <20210426111333.967729-5-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 4/6] KVM: x86: Introduce KVM_GET_SREGS2 /
 KVM_SET_SREGS2
Message-ID: <898a9b18-4578-cb9d-ece7-f45ba5b7bb89@redhat.com>
Date:   Mon, 26 Apr 2021 14:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210426111333.967729-5-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26/04/21 13:13, Maxim Levitsky wrote:
> +	if (sregs2->flags & KVM_SREGS2_FLAGS_PDPTRS_VALID) {
> +
> +		if (!is_pae_paging(vcpu))
> +			return -EINVAL;
> +
> +		for (i = 0 ; i < 4 ; i++)
> +			kvm_pdptr_write(vcpu, i, sregs2->pdptrs[i]);
> +
> +		kvm_register_mark_dirty(vcpu, VCPU_EXREG_PDPTR);
> +		mmu_reset_needed = 1;
> +	}

I think this should also have

	else {
		if (is_pae_paging(vcpu))
			return -EINVAL;
	}

but perhaps even better, check it at the beginning:

	if ((sregs->cr4 & X86_CR4_PAE) &&
             !!(sregs->efer & EFER_LMA) == !!(sregs2->flags & KVM_SREGS2_FLAGS_PDPTRS_VALID))
		return -EINVAL;

which technically means the flag is redundant, but there is some value in
having the flag and not allowing the user to shoot itself in the foot.

Paolo

