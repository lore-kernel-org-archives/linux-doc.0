Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D41C4338F
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 12:24:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BAE560F44
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 12:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbhGZLoM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jul 2021 07:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30989 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234013AbhGZLoL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jul 2021 07:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627302280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DDjfF9jVeDMoFc1B4dOVhxT79PSNsJ6sGo3EB2J45Z8=;
        b=SB6DPgcxOzZKnDaEQW10OA/7AokPUeKFwoZsAdieRmdzDZdDP62MYkmBOPIBkoVEKE3Mqv
        UKSQn22izCmUA4YQ7ft9T2xBVHUddiFvj/U4M786cVw+Ps5Ls4vlpF3GpmqNkOXBjCjTiU
        wCugUV/e087TP7caoDGgLzZRMzvVmY4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-7dwRj-VjMViJVEeFstlv3w-1; Mon, 26 Jul 2021 08:24:38 -0400
X-MC-Unique: 7dwRj-VjMViJVEeFstlv3w-1
Received: by mail-ej1-f69.google.com with SMTP id a19-20020a1709063e93b0290551ea218ea2so2036493ejj.5
        for <linux-doc@vger.kernel.org>; Mon, 26 Jul 2021 05:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DDjfF9jVeDMoFc1B4dOVhxT79PSNsJ6sGo3EB2J45Z8=;
        b=fj2rIiudfJx09R52YRS7y5HoCEXx2ysuo2T3NJeW8CzQqIbAmHxsWrYBcFOPrRpbBz
         7Idgb2XQB5TRT0Pcq3Sh6BgTSzwtc6om4BUq2CtQJl3p/rYEY391751vnQ66DbkN6XSg
         sMx1zc45Dql8LnrTmVwKf33zqvSrb/1EmiUOSkWT92PWU3MIncvgBgc3jTs+D44XJsyA
         iop03G1YOMkXu8ao9oT/ci4gCvfEjhRGE48CyWK6Ve81hlWM4UCKh/xCfooH/SJaYrQs
         SqH8Ul0Fi6LkYfHcNcTGvl3FOu0hZUnyPROppds5P1vIRZpmsGj5pJRapm0YaWLKYQiV
         0A1Q==
X-Gm-Message-State: AOAM533v4Yo5iWSp0YTLxzQXEWZxgAoYYJzwurMTWnZ31oexXi8/1zjM
        aTkGy2tvwGbDU55uqe1LxWlcwlimCOOEb8B5FGp1HgmAysd6gV4oPJC3x9s2s3T4yyM4jA+yv9X
        1Q3SKdALE7KbYARd3KlWO
X-Received: by 2002:a17:906:d182:: with SMTP id c2mr17290004ejz.111.1627302277400;
        Mon, 26 Jul 2021 05:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHIrfwkyZm8Yfwj+xDDNtyOpn8y/O1RuhdN7DCM8I94rvXBFT7vKWMLBIq7lE4HOVX1eYWeg==
X-Received: by 2002:a17:906:d182:: with SMTP id c2mr17289991ejz.111.1627302277249;
        Mon, 26 Jul 2021 05:24:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id f5sm14029987ejj.45.2021.07.26.05.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 05:24:36 -0700 (PDT)
Subject: Re: [PATCH] KVM: Documentation: Fix KVM_CAP_ENFORCE_PV_FEATURE_CPUID
 name
To:     Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
Cc:     Sean Christopherson <seanjc@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
References: <20210722092628.236474-1-vkuznets@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <614722bc-4538-042d-cf35-c3b2885a350a@redhat.com>
Date:   Mon, 26 Jul 2021 14:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722092628.236474-1-vkuznets@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22/07/21 11:26, Vitaly Kuznetsov wrote:
> 'KVM_CAP_ENFORCE_PV_CPUID' doesn't match the define in
> include/uapi/linux/kvm.h.
> 
> Signed-off-by: Vitaly Kuznetsov<vkuznets@redhat.com>
> ---
>   Documentation/virt/kvm/api.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index b9ddce5638f5..52eba4a275ad 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -7049,7 +7049,7 @@ In combination with KVM_CAP_X86_USER_SPACE_MSR, this allows user space to
>   trap and emulate MSRs that are outside of the scope of KVM as well as
>   limit the attack surface on KVM's MSR emulation code.
>   
> -8.28 KVM_CAP_ENFORCE_PV_CPUID
> +8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
>   -----------------------------
>   
>   Architectures: x86
> -- 2.31.1
> 

Queued, thanks.

Paolo

