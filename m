Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFE0C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 15:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235409AbiBOP4O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 10:56:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240903AbiBOP4N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 10:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 10F4D9E57A
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 07:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644940563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i3mIIOmXcj6/r/dAaawDN7xnH7QVCOcxOFFmz07jm+Q=;
        b=HIzBbQf/nmCWpRL+/ydRDpyDxzfsEJ+EJcz1zIwPIDmT0hZ9PDAb/Ax12QucteDnYCZ4KA
        kwMfBAvLxXZ0v1RD6XGgab6p7xGAaz5e3+IEXqZo8ZLS0d6ZV1OnOCXRv5xeUJ4nqhwOdy
        lsZj0SyqNgk1fIZaNdwzrcXfnokqGpY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-PTuYXQgfNBaZFCTV-tA36w-1; Tue, 15 Feb 2022 10:56:00 -0500
X-MC-Unique: PTuYXQgfNBaZFCTV-tA36w-1
Received: by mail-ot1-f69.google.com with SMTP id h5-20020a9d5545000000b005acf19eed0fso486950oti.12
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 07:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=i3mIIOmXcj6/r/dAaawDN7xnH7QVCOcxOFFmz07jm+Q=;
        b=6jT+WJuJNeoQN4LXVqXeGhCWPJl/+rWSvJ63vBnSzVIgOAefQCWaam0rvEBWE+n3n5
         RofhjyNGkHZXyi6jNztlKaTCXA9NJVtQRbtv2v22x93g3shaa0Rpp9WoIEQVAWhnA4Cx
         pxHeKs20o/1jNM0EaShiZG0ciPmbO+/Vb+2HZ+QJd2QPKGVjkhY7tlBXjkNUsIsLCSzK
         1u4cmwgtBsDogik7xzVaoCY3MHlM3TVKMEDVLNAzb3Xai7OFl87QfjvIsCydA9fprP6O
         DfQhOAzaA4nbokswcL6SeBKzSSRQ7tK8EDc1QY5bOphU1P6l1edwjAK/IsVtmk0gXdbJ
         2SZA==
X-Gm-Message-State: AOAM531XsjJ7PsvjDkvMEFHbbce5LptlS6pQ8XSJL4z/FPYt73wd9CEJ
        OAIV1XrlouRRnrfnTXXa/kzYwO3HAINGKwqXuTn3qn2y2I5TcgjLfGfpiXCy0O8yQUuGFbK/IYJ
        Y6yrgNpAL8UIM+XUqtFap
X-Received: by 2002:a05:6808:1205:b0:2ce:6ee7:2ce3 with SMTP id a5-20020a056808120500b002ce6ee72ce3mr1776990oil.273.1644940559464;
        Tue, 15 Feb 2022 07:55:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT0N7UWtM9bq6RTOfVUzIg8R4uTIT/1lOf1KSFNx+RJEg3jRIhK+L4cRvOG7rSTMshuEG3UQ==
X-Received: by 2002:a05:6808:1205:b0:2ce:6ee7:2ce3 with SMTP id a5-20020a056808120500b002ce6ee72ce3mr1776983oil.273.1644940559280;
        Tue, 15 Feb 2022 07:55:59 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id e11sm637030oiw.3.2022.02.15.07.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 07:55:58 -0800 (PST)
Subject: Re: [PATCH v1 5/7] drivers: fpga: dfl: handle empty port list
To:     Tianfei zhang <tianfei.zhang@intel.com>, hao.wu@intel.com,
        mdf@kernel.org, yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, Matthew Gerlach <matthew.gerlach@linux.intel.com>
References: <20220214112619.219761-1-tianfei.zhang@intel.com>
 <20220214112619.219761-6-tianfei.zhang@intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <6fae1b06-f275-fc11-8a3f-92fd7c666396@redhat.com>
Date:   Tue, 15 Feb 2022 07:55:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220214112619.219761-6-tianfei.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2/14/22 3:26 AM, Tianfei zhang wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Not all FPGA designs managed by the DFL driver have a port.
> In these cases, don't write the Port Access Control register
> when enabling SRIOV.

Drop the 'drivers:' in the subject line.

This patch likely needs to moved to 4/7 since the last patch also 
iterated over the list.

Tom

>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> Signed-off-by: Tianfei Zhang <tianfei.zhang@intel.com>
> ---
>   drivers/fpga/dfl.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
> index cfc539a656f0..a5263ac258c5 100644
> --- a/drivers/fpga/dfl.c
> +++ b/drivers/fpga/dfl.c
> @@ -1708,6 +1708,8 @@ int dfl_fpga_cdev_config_ports_vf(struct dfl_fpga_cdev *cdev, int num_vfs)
>   	int ret = 0, port_count = 0;
>   
>   	mutex_lock(&cdev->lock);
> +	if (list_empty(&cdev->port_dev_list))
> +		goto done;
>   
>   	list_for_each_entry(pdata, &cdev->port_dev_list, node) {
>   		if (pdata->dev)

