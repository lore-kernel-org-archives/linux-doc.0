Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FCFC47423
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 07:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 865AA207EA
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 07:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MCUrcoAH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgJBH6P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 03:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726275AbgJBH6P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 03:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601625493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tMgNt08CRRmOXK3CIWenyUlTQX/4sjp7rZl7HOrw3DA=;
        b=MCUrcoAHndWtbiWMIWhFj1Ce2cx20Jk5ky5nUgCtUd0aldh8eSIwJ8kd20/XdItV5LeWk+
        v8a47Nw5Ia5qkBF7HrJEgjqo70dEMYmos4sSYMJOHDtiatRTXoXSrvOcMC59KPbipOTL0C
        4ofsoVGZ69U6uns6y8oCeAVakpuQXks=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-0zsgYisMOv69dRDhdPco0Q-1; Fri, 02 Oct 2020 03:58:12 -0400
X-MC-Unique: 0zsgYisMOv69dRDhdPco0Q-1
Received: by mail-wr1-f71.google.com with SMTP id f18so245588wrv.19
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 00:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tMgNt08CRRmOXK3CIWenyUlTQX/4sjp7rZl7HOrw3DA=;
        b=YnQsPdYBRPoiReIDNV2j6QGrI++Ea3LufK7s+TpdZLdEW2YDR7yOAklMJzcw+ekX2s
         kuPSgU03dOF/n3oWTZDCs9o5m2/0F9K6TKFkRHeDj5JehlH/k8GrWiuO0GEl90yaoRVD
         5ByONm6kNHxnye1zvhtRy8THxbPImPxxCuva/ro9J/zCoyIynLSbEcZWrPDXhPtIdKAk
         ltbq3Gz/3rXiB0MF3skNmPK0X1SZFzXaX50eZ5ioO/GogQyTlhRso/ZKTf6Hg4hlzW2U
         2lk+sQ/jN67iu4ovvg9bBDh5pf6Dtsc7AhvVq2sWfNc+cgB4e6IFaj6pz51Obsp/2WCQ
         pYuA==
X-Gm-Message-State: AOAM5329tXOkpSRrLXdAxeKS5X8HqpUG+GijnUf/QNEQazVNqvZo8sdL
        uev/N/DXbbxZL2gwYxA97HtURq2Gr9AE3QW/POtzmDDRmaiGhjLazRi8jPBcgRCCxr6EcxW0ft2
        jQiz7sLQHH8Ug4Q4VBsBe
X-Received: by 2002:adf:a418:: with SMTP id d24mr1537772wra.80.1601625490926;
        Fri, 02 Oct 2020 00:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUO9y3AQg+kiMtHtpbAMV9S0Gq+elcdmP6P7MKm/4WwsJy3zoXR0uDgD0rnCYmyCKvBmBQ4A==
X-Received: by 2002:adf:a418:: with SMTP id d24mr1537748wra.80.1601625490656;
        Fri, 02 Oct 2020 00:58:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:11eb:3314:c22:e3c7? ([2001:b07:6468:f312:11eb:3314:c22:e3c7])
        by smtp.gmail.com with ESMTPSA id 76sm891200wma.42.2020.10.02.00.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 00:58:10 -0700 (PDT)
Subject: Re: [PATCH 2/6] docs: vcpu.rst: fix some build warnings
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Andrew Jones <drjones@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1601616399.git.mchehab+huawei@kernel.org>
 <b5385dd0213f1f070667925bf7a807bf5270ba78.1601616399.git.mchehab+huawei@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c3cb6146-4910-ea8e-f07c-9935cb971a18@redhat.com>
Date:   Fri, 2 Oct 2020 09:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b5385dd0213f1f070667925bf7a807bf5270ba78.1601616399.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/10/20 07:49, Mauro Carvalho Chehab wrote:
> As warned with make htmldocs:
> 
> 	.../Documentation/virt/kvm/devices/vcpu.rst:70: WARNING: Malformed table.
> 	Text in column margin in table line 2.
> 
> 	=======  ======================================================
> 	-ENODEV: PMUv3 not supported or GIC not initialized
> 	-ENXIO:  PMUv3 not properly configured or in-kernel irqchip not
> 	         configured as required prior to calling this attribute
> 	-EBUSY:  PMUv3 already initialized
> 	-EINVAL: Invalid filter range
> 	=======  ======================================================
> 
> The ':' character for two lines are above the size of the column.
> Besides that, other tables at the file doesn't use ':', so
> just drop them.
> 
> While here, also fix this warning also introduced at the same patch:
> 
> 	.../Documentation/virt/kvm/devices/vcpu.rst:88: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> By marking the C code as a literal block.
> 
> Fixes: 8be86a5eec04 ("KVM: arm64: Document PMU filtering API")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/virt/kvm/devices/vcpu.rst | 26 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index da7c2ef7dafc..2acec3b9ef65 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -67,25 +67,25 @@ irqchip.
>  :Returns:
>  
>  	 =======  ======================================================
> -	 -ENODEV: PMUv3 not supported or GIC not initialized
> -	 -ENXIO:  PMUv3 not properly configured or in-kernel irqchip not
> +	 -ENODEV  PMUv3 not supported or GIC not initialized
> +	 -ENXIO   PMUv3 not properly configured or in-kernel irqchip not
>  	 	  configured as required prior to calling this attribute
> -	 -EBUSY:  PMUv3 already initialized
> -	 -EINVAL: Invalid filter range
> +	 -EBUSY   PMUv3 already initialized
> +	 -EINVAL  Invalid filter range
>  	 =======  ======================================================
>  
> -Request the installation of a PMU event filter described as follows:
> +Request the installation of a PMU event filter described as follows::
>  
> -struct kvm_pmu_event_filter {
> -	__u16	base_event;
> -	__u16	nevents;
> +    struct kvm_pmu_event_filter {
> +	    __u16	base_event;
> +	    __u16	nevents;
>  
> -#define KVM_PMU_EVENT_ALLOW	0
> -#define KVM_PMU_EVENT_DENY	1
> +    #define KVM_PMU_EVENT_ALLOW	0
> +    #define KVM_PMU_EVENT_DENY	1
>  
> -	__u8	action;
> -	__u8	pad[3];
> -};
> +	    __u8	action;
> +	    __u8	pad[3];
> +    };
>  
>  A filter range is defined as the range [@base_event, @base_event + @nevents),
>  together with an @action (KVM_PMU_EVENT_ALLOW or KVM_PMU_EVENT_DENY). The
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

