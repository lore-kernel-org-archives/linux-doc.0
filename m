Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C890C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 14:55:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D574B238E3
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 14:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732077AbhAUOzD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 09:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57831 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731552AbhAUOyM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 09:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611240765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=loDog159VD/YZKvAODyHGMsyyVC+ozXQO6jj7oflSm0=;
        b=X9ijhu+T/GkzrcmLK8PtZLjBdzbjrY1EaD/gw2+va0h6Xk9eMwFgfoWRJhgSh/NTANvpgE
        iVcfLlvgx2KjMc1FVW7U1iffBpTP5tYqsG7CMGhAtucIFwNySEUJKJ3m1CCK3NVu7TuZ9f
        hc1/M33Q1x2gddnVJ7VgUMlcywTTQQM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-0YOX6lCVOu2KWkFCFkSR8g-1; Thu, 21 Jan 2021 09:52:43 -0500
X-MC-Unique: 0YOX6lCVOu2KWkFCFkSR8g-1
Received: by mail-wr1-f69.google.com with SMTP id x12so1196252wrw.21
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 06:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=loDog159VD/YZKvAODyHGMsyyVC+ozXQO6jj7oflSm0=;
        b=r00dbVfvCNXJAuXLMXJ9odAoCm9hZ6JTpvpLuwJlXe7cuMSaZfbpCxHcXyEaNSJP5B
         uZsla+Z/217Z1ajLTHc+GlKnqoZo+XkQCI9RINIzVB6lxyoh9rf+BOCQmSQEYaLDkgpw
         1UCnnHI7g1lvRaJGMkD85mCIRhNG4v9zOyfVNl9QWcvIBS2KWNUPYGyAXAeeGnXEorTR
         NXA6fDP3M2B5EKz/vnj/rpr4I0+6oJEDVeh4RvUtaf9vA6VvFcUuJ/meThsgta6V6eWN
         NWm6ccyrNPGoZu79kkFFwFyk/TFF4j4XeANAy2euRFYg0BzXznWywJWRxWs+e3HOL70H
         2RZg==
X-Gm-Message-State: AOAM531ratQzbabTLgrHnJ6lNrGVby4munBKJJyh/jicVNbVb3OFrmwT
        AX0O0XstscBY5KTajQyE9WtZHsLc6j0AtiaS0dXwnMRIlcWiBrkx/wESoEITy8eg3I8iA0LGTgw
        wc6/5LWjx4WgekVIIGUsh
X-Received: by 2002:a05:6000:90:: with SMTP id m16mr14796891wrx.165.1611240762407;
        Thu, 21 Jan 2021 06:52:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTe5wBBwk9xIv6MUSk/XHCOU+J6DjPfd4tGzt152OLcgSMRBUxG5aHYa2I6DigvnCpGLXg/A==
X-Received: by 2002:a05:6000:90:: with SMTP id m16mr14796880wrx.165.1611240762266;
        Thu, 21 Jan 2021 06:52:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id a25sm7920265wmb.25.2021.01.21.06.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 06:52:41 -0800 (PST)
Subject: Re: [PATCH] KVM: Documentation: Update description of
 KVM_{GET,CLEAR}_DIRTY_LOG
To:     Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org
Cc:     corbet@lwn.net, wanghaibin.wang@huawei.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201208043439.895-1-yuzenghui@huawei.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4229828a-078f-0558-751a-3e56bec66aac@redhat.com>
Date:   Thu, 21 Jan 2021 15:52:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201208043439.895-1-yuzenghui@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/12/20 05:34, Zenghui Yu wrote:
> Update various words, including the wrong parameter name and the vague
> description of the usage of "slot" field.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>   Documentation/virt/kvm/api.rst | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 70254eaa5229..0eb236737f80 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -360,10 +360,9 @@ since the last call to this ioctl.  Bit 0 is the first page in the
>   memory slot.  Ensure the entire structure is cleared to avoid padding
>   issues.
>   
> -If KVM_CAP_MULTI_ADDRESS_SPACE is available, bits 16-31 specifies
> -the address space for which you want to return the dirty bitmap.
> -They must be less than the value that KVM_CHECK_EXTENSION returns for
> -the KVM_CAP_MULTI_ADDRESS_SPACE capability.
> +If KVM_CAP_MULTI_ADDRESS_SPACE is available, bits 16-31 of slot field specifies
> +the address space for which you want to return the dirty bitmap.  See
> +KVM_SET_USER_MEMORY_REGION for details on the usage of slot field.
>   
>   The bits in the dirty bitmap are cleared before the ioctl returns, unless
>   KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is enabled.  For more information,
> @@ -4427,7 +4426,7 @@ to I/O ports.
>   :Capability: KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
>   :Architectures: x86, arm, arm64, mips
>   :Type: vm ioctl
> -:Parameters: struct kvm_dirty_log (in)
> +:Parameters: struct kvm_clear_dirty_log (in)
>   :Returns: 0 on success, -1 on error
>   
>   ::
> @@ -4454,10 +4453,9 @@ in KVM's dirty bitmap, and dirty tracking is re-enabled for that page
>   (for example via write-protection, or by clearing the dirty bit in
>   a page table entry).
>   
> -If KVM_CAP_MULTI_ADDRESS_SPACE is available, bits 16-31 specifies
> -the address space for which you want to return the dirty bitmap.
> -They must be less than the value that KVM_CHECK_EXTENSION returns for
> -the KVM_CAP_MULTI_ADDRESS_SPACE capability.
> +If KVM_CAP_MULTI_ADDRESS_SPACE is available, bits 16-31 of slot field specifies
> +the address space for which you want to clear the dirty status.  See
> +KVM_SET_USER_MEMORY_REGION for details on the usage of slot field.
>   
>   This ioctl is mostly useful when KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
>   is enabled; for more information, see the description of the capability.
> 

Queued, thanks.

Paolo

