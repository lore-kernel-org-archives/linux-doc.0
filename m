Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C08C433E6
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 09:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D696C64F6F
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 09:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCSJb7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Mar 2021 05:31:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59384 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229865AbhCSJbs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Mar 2021 05:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616146308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xSRPqSlHasWOtKCAmIMpsOHFNUheb5Kd9GbHS0kbp9c=;
        b=Mcyrgt473KFucIX4zFquLx1NgqhXbOWwLmHyx5eWVDnrqcjNHe5LLCbwA9J1feTq/HOCaL
        xNc/63Dr0C6kf/5z68/YEF26CkmuvX8LFpSQH2LAMGhdaH58QBsNAydBfnNBT4C90fQ5qD
        EDh6hvr2+ZEMOJH7F8FcHxLpBret2y4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-EqlGGgfQNDy5IIM1ViTy7Q-1; Fri, 19 Mar 2021 05:31:46 -0400
X-MC-Unique: EqlGGgfQNDy5IIM1ViTy7Q-1
Received: by mail-ej1-f72.google.com with SMTP id h14so18022741ejg.7
        for <linux-doc@vger.kernel.org>; Fri, 19 Mar 2021 02:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xSRPqSlHasWOtKCAmIMpsOHFNUheb5Kd9GbHS0kbp9c=;
        b=mnqYwwng0uFqjzwgzaGxxPQLIpywLDLnBdFwJyTVZczWxvrnTzxZDva0ESBC6YFUfq
         M/mvVRxMDiavvHprRyLRZMJP//oAtQcxLUTopihNaS2ergfmdn7M8uLlymrhFe2ivU1O
         IkxBoJ2IeHOb8HNKYIUykKqiIinvtG3Z9Q7B1qQZtUMxIpHQD8HpLUha3f1eIsjcnCQR
         Uimwm62To4nhUl1DFNXk9GYEJggK4wvYBt3GoMMesUeYApl6hM4yhclsMCPEgnHQQB2P
         lyyTq5DdCiEFneuU3yghyKfl3B7pZQYgXzE0ggP0CBA/eZZz7hORfPK0XFgf0lY3wXrm
         tHgw==
X-Gm-Message-State: AOAM532sYGMqPNgBLM7aorntVfcwFQdSKiT4nDBPTFVPfMWCAVfIhoQC
        FND7H09hPFC3Vl6MGd13F3gnviLTWQ24r/l5X3N+P9CWtVb18a3Um+TKj+o1MFnj40neBybFdAH
        htt2q8eq3ZhMP5kvT2tPC
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr8391624eds.261.1616146304881;
        Fri, 19 Mar 2021 02:31:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3r72fWZ+WnHJwauh+tYRcGl/q0ZdX2psXYYooGwFbKXx25e3vDBNp41L0JN+IfnaYj0jlDQ==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr8391608eds.261.1616146304755;
        Fri, 19 Mar 2021 02:31:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id g21sm3349054ejd.6.2021.03.19.02.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 02:31:44 -0700 (PDT)
Subject: Re: [PATCH] documentation/kvm: additional explanations on
 KVM_SET_BOOT_CPU_ID
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Jones <drjones@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210319091650.11967-1-eesposit@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d48bf1b-208c-89fb-1150-b9d7f589e152@redhat.com>
Date:   Fri, 19 Mar 2021 10:31:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319091650.11967-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/03/21 10:16, Emanuele Giuseppe Esposito wrote:
> The ioctl KVM_SET_BOOT_CPU_ID fails when called after vcpu creation.
> Add this explanation in the documentation.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   Documentation/virt/kvm/api.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 38e327d4b479..bece398227f5 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1495,7 +1495,8 @@ Fails if any VCPU has already been created.
>   
>   Define which vcpu is the Bootstrap Processor (BSP).  Values are the same
>   as the vcpu id in KVM_CREATE_VCPU.  If this ioctl is not called, the default
> -is vcpu 0.
> +is vcpu 0. This ioctl has to be called before vcpu creation,
> +otherwise it will return EBUSY error.
>   
>   
>   4.42 KVM_GET_XSAVE
> 

Queued, thanks.

Paolo

