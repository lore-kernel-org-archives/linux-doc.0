Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256AFC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 15:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241018AbiBOPvB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 10:51:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241002AbiBOPvA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 10:51:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F2B1C9FD7
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644940246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dLICeKJBXSwpSnP3JhYsPftkHusO2mSaNRauGzzS1kQ=;
        b=WyrXOidd6i59Ux4bmmVjQhC+7dbYzh9hH5dUBBgAset9mQMCru8uFG95xAPaoKY9eF0Tm0
        /zU/9q/y7uXD5LZ5JyY9Y2EY0gSXDAN8FpX/pr7cG7EJV8852qEE/DCLMGmv4hU0vD8Kla
        YnFqQnWhXhQFmpsgXtBJwKDqAIWzScs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-xdL9KItNPDSIFzbEu82x6w-1; Tue, 15 Feb 2022 10:50:44 -0500
X-MC-Unique: xdL9KItNPDSIFzbEu82x6w-1
Received: by mail-oo1-f72.google.com with SMTP id t10-20020a4ad0aa000000b002fd44c52176so12827861oor.9
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 07:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dLICeKJBXSwpSnP3JhYsPftkHusO2mSaNRauGzzS1kQ=;
        b=2n1XjjFkI6hJW1hZtZ0hCjVOmwgYL0G8LInc+UBGrwPuGfrGx5jiQPQCWv6yYHoV9Q
         hO+NliQ8R7eehJFKDiI9UzHe/ct9+jeAUNLhw+N+jCpZXYg697vSxTdHnlW90VrSK9of
         4syM+X4x0kpnXkrdW4sFH8n81VsjPzE7ffBz5d3yNI+oHsosP/f319LxeDBcbUkUhBUq
         KZzOtrHeOsw8WI7nr0M19ec/9R3XE9YJtvlbiuivQBb0S6/dmMmA/j9UCIBfjDC3bYqh
         zSxQ8P6KkJp2qyJ5uFFPx9WN7BkBCVJTeb2Hj/dOz1ZGGBcpYU2pmXBwopXRMQtobagu
         0Yew==
X-Gm-Message-State: AOAM531eU4Jj8bRFROZZqI1ocxkoobMeJlfAHqknNY6PG2uAgcVEUhhK
        P2DcVpkp4A+dD+YiUCMc40zXbL5Bx03rnSvmpRuuAHpCgZNX0pViOIHjX8L2486mtm41ChXghKI
        pYPw0Kjw2c2OT94gLrgxA
X-Received: by 2002:a9d:a28:: with SMTP id 37mr1098483otg.225.1644940243977;
        Tue, 15 Feb 2022 07:50:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbDHT+/ZKmI2sFiyJuItMHm4fmoZcrlrJeWNTWAPast7TEOmnI7Tbs6g1lSY552mvQQLiGwA==
X-Received: by 2002:a9d:a28:: with SMTP id 37mr1098472otg.225.1644940243774;
        Tue, 15 Feb 2022 07:50:43 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id c14sm4375713ots.71.2022.02.15.07.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 07:50:42 -0800 (PST)
Subject: Re: [PATCH v1 4/7] fpga: dfl: fix VF creation when ports have no
 local BAR space
To:     Tianfei zhang <tianfei.zhang@intel.com>, hao.wu@intel.com,
        mdf@kernel.org, yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, Matthew Gerlach <matthew.gerlach@linux.intel.com>
References: <20220214112619.219761-1-tianfei.zhang@intel.com>
 <20220214112619.219761-5-tianfei.zhang@intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <c527e9c7-4588-463b-8a6b-3db68d003d7a@redhat.com>
Date:   Tue, 15 Feb 2022 07:50:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220214112619.219761-5-tianfei.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2/14/22 3:26 AM, Tianfei zhang wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> When a port is not connected to the same PCIe endpoint as
> the FME, the port does not need to be released before being
> virtualized.  Fix VF creation code to handle this new use
Similar, how does this fit in with iofs, this looks like it would not be 
valid for the existing cards
> case.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
> ---
>   drivers/fpga/dfl.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
> index 26f8cf890700..cfc539a656f0 100644
> --- a/drivers/fpga/dfl.c
> +++ b/drivers/fpga/dfl.c
> @@ -1705,15 +1705,22 @@ EXPORT_SYMBOL_GPL(dfl_fpga_cdev_config_ports_pf);
>   int dfl_fpga_cdev_config_ports_vf(struct dfl_fpga_cdev *cdev, int num_vfs)
>   {
>   	struct dfl_feature_platform_data *pdata;
> -	int ret = 0;
> +	int ret = 0, port_count = 0;
>   
>   	mutex_lock(&cdev->lock);
> +
> +	list_for_each_entry(pdata, &cdev->port_dev_list, node) {
> +		if (pdata->dev)

This looks wrong,

pdata->dev is dereferenced below, if there is a case were (!pdata->dev) 
here there would be crash later.

> +			continue;
> +		port_count++;

how does this work when only some of the ports are handled in the new way ?

Tom

> +	}
> +
>   	/*
>   	 * can't turn multiple ports into 1 VF device, only 1 port for 1 VF
>   	 * device, so if released port number doesn't match VF device number,
>   	 * then reject the request with -EINVAL error code.
>   	 */
> -	if (cdev->released_port_num != num_vfs) {
> +	if (port_count && cdev->released_port_num != num_vfs) {
>   		ret = -EINVAL;
>   		goto done;
>   	}

