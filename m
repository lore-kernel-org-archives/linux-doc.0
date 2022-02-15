Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E73C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 14:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239183AbiBOOvh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 09:51:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239184AbiBOOv0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 09:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A388119F10
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 06:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644936553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AQuhuF7IKOqYCKxv1Xz0llTmBI5LAygxnXZl/GDmFGk=;
        b=i8u7eTQg+lw5bhNC9w+48HIVL964cn52ihRbgHNb5i9xOhjcMbxk1Rn02s/+1a6ArRfqGK
        pjDDgjMvuE09sI1JWKow1uYofgLyi3yxXuZbBINc5tJ5BYgsPZ4BujFnPCGFWRMcPCyjC9
        mJ4u0XbEZti9l7bhdzyjyOEtCwKGIdw=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-2ChcdBuFOfC1kjOWnbUVKA-1; Tue, 15 Feb 2022 09:49:10 -0500
X-MC-Unique: 2ChcdBuFOfC1kjOWnbUVKA-1
Received: by mail-oo1-f72.google.com with SMTP id g8-20020a4aa708000000b002e8efc514a6so12725486oom.12
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 06:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AQuhuF7IKOqYCKxv1Xz0llTmBI5LAygxnXZl/GDmFGk=;
        b=04iXoNs3MKhJMkb7/rA4pA/kKcCYfCJkkUp8CXIJ61580vZZixb/gDkgljU/h/Vpt9
         /iVMFAnrG06OqA8BTcy07nsJkhOEpkchep5qtnUIoSLai3x6GPQR5oEn6dJN5ofMNI7m
         NNLhvwcavXk9xRAxll3Elel8VJQriuwX12zjzuNfiPdtAeuoGu1X+HcjXqlAQPEJuk8e
         mwl9I1W0sdGoXe2kf5SktpRKhEVirlFVohyl4slvNKR7J6+7PE+96DkSFnXLffG2bg4h
         nl12Yi9810fDvRzbOArkr7+5+Fz6mZRbnhRJTBgcI3f6gEznOFLhhTAiIBEwb81kJk2t
         5pMg==
X-Gm-Message-State: AOAM533F/o6pt/Mq8O8sy625eNsrOjv/9tu189D1kVKKrX6xWjk0CXWH
        8njM0jFDm/uyiM2em8KDOhtuDzViVeEB0zdRQJ5I4spV1HlJz1RJZp+s2nKCDW1cf9rzunyrJhW
        CNEifvBfdSmxNXM+ZRq2w
X-Received: by 2002:a9d:6a54:: with SMTP id h20mr1420689otn.69.1644936549409;
        Tue, 15 Feb 2022 06:49:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzai+xgP98JN0UjOQG8GF48r2lPVtIxEbdcn6aEWbM7Nij7yxY9X08kqNJaRqS2nI8+t+MGgw==
X-Received: by 2002:a9d:6a54:: with SMTP id h20mr1420684otn.69.1644936549204;
        Tue, 15 Feb 2022 06:49:09 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id v10sm13728219oto.53.2022.02.15.06.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 06:49:07 -0800 (PST)
Subject: Re: [PATCH v1 2/7] fpga: dfl: check feature type before parse irq
 info
To:     Tianfei zhang <tianfei.zhang@intel.com>, hao.wu@intel.com,
        mdf@kernel.org, yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net
References: <20220214112619.219761-1-tianfei.zhang@intel.com>
 <20220214112619.219761-3-tianfei.zhang@intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <0de9c8fb-0f04-684f-630c-1d13b0b55ba1@redhat.com>
Date:   Tue, 15 Feb 2022 06:49:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220214112619.219761-3-tianfei.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2/14/22 3:26 AM, Tianfei zhang wrote:
> From: Tianfei Zhang <tianfei.zhang@intel.com>
>
> The feature ID of "Port User Interrupt" and the
> "PMCI Subsystem" are identical, 0x12, but one is for FME,
> other is for Port. It should check the feature type While
> parsing the irq info in parse_feature_irqs().

This seems like a bug fix and not part of iofs feature.

Split this out of the patchset.

This is a workaround a hardware problem, there should be some comments 
to the effect that you can't trust _this_ or _that_ feature id and some 
special handling earlier.

The ambiguity of feature id is a problem, and this sort of bug will 
happen again.

What can be done to prevent this in the future ?

>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
> ---
>   drivers/fpga/dfl.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
> index 599bb21d86af..26f8cf890700 100644
> --- a/drivers/fpga/dfl.c
> +++ b/drivers/fpga/dfl.c
> @@ -940,9 +940,14 @@ static int parse_feature_irqs(struct build_feature_devs_info *binfo,
>   {
>   	void __iomem *base = binfo->ioaddr + ofst;
>   	unsigned int i, ibase, inr = 0;
> +	enum dfl_id_type type;
>   	int virq;
>   	u64 v;
>   
> +	type = feature_dev_id_type(binfo->feature_dev);
> +	if (type >= DFL_ID_MAX)
> +		return -EINVAL;
> +
>   	/*
>   	 * Ideally DFL framework should only read info from DFL header, but
>   	 * current version DFL only provides mmio resources information for
> @@ -959,16 +964,22 @@ static int parse_feature_irqs(struct build_feature_devs_info *binfo,
>   	 */
>   	switch (fid) {
>   	case PORT_FEATURE_ID_UINT:
> +		if (type != PORT_ID)
> +			break;

Instead of embedding a break in the switch, break the switch into fme 
switch and port switch

if (type == PORT_ID)

   port-switch

else if (type == FME_ID

   fme-switch

Tom

>   		v = readq(base + PORT_UINT_CAP);
>   		ibase = FIELD_GET(PORT_UINT_CAP_FST_VECT, v);
>   		inr = FIELD_GET(PORT_UINT_CAP_INT_NUM, v);
>   		break;
>   	case PORT_FEATURE_ID_ERROR:
> +		if (type != PORT_ID)
> +			break;
>   		v = readq(base + PORT_ERROR_CAP);
>   		ibase = FIELD_GET(PORT_ERROR_CAP_INT_VECT, v);
>   		inr = FIELD_GET(PORT_ERROR_CAP_SUPP_INT, v);
>   		break;
>   	case FME_FEATURE_ID_GLOBAL_ERR:
> +		if (type != FME_ID)
> +			break;
>   		v = readq(base + FME_ERROR_CAP);
>   		ibase = FIELD_GET(FME_ERROR_CAP_INT_VECT, v);
>   		inr = FIELD_GET(FME_ERROR_CAP_SUPP_INT, v);

