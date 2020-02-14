Return-Path: <SRS0=xqSd=4C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019D3C35242
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 23:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDE52206B6
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 23:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arZTtfq3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgBNXRK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Feb 2020 18:17:10 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:43177 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgBNXRK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Feb 2020 18:17:10 -0500
Received: by mail-yw1-f68.google.com with SMTP id f204so5001903ywc.10
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2020 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pyTRBMCVp91QtDenhmoQzqMCfGd84Vh8aWQ/JT+Qq5M=;
        b=arZTtfq3IuYFvYo4HsF0usZchn45O4hmIUeyrGFD/a5oAV5Xkt+NDc184e6GsSzXNu
         /3gVxkEfd4dp6kfe+8FkaL+zdU6LWhjf/sAyDl58QJGzHCopc7SzoygYknUGJ6P7d/xR
         S0dNSKpD1PbIebPkxz5NPbfkIVSHhFp8jTe61rUQJmb1RFij/Jjsrso7s7O1V9MLTC++
         n/n/scvbt1Bc+VEKkMc39HOJutbPYGtU4rRl1ol+8euo+PXpDVFo/E76/FUq6NKU9R1P
         NQWmnfNKjCiF9F0XA2q++UvQif8XKWpESlzDdGV6+ZIpfhP7m1Z0cfWyDPxd1CTPx15C
         ZDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pyTRBMCVp91QtDenhmoQzqMCfGd84Vh8aWQ/JT+Qq5M=;
        b=iqEkObf9b/5DcZOOCCzuuJc04XzwWwCJOmfN7ME1kRtitgpY7HWE0cwmXRp3g/r5df
         GXUIJJtXos/NV5tRvXsKZOPfTNmwAionXQMyXkW0RKEdKU/PVQRslG1gsGhOKX+WtGD+
         d7h0GTAXBqHh/w/5keMKxzly/PWqAiUd3XeV/17Th7PC4qc25EiUyH+E4Td5kgDXi71M
         wB4UV8OR+320VIJtTUhZcalCpawOc4ur/BUHkS7FVKjd+EaOcqq73BqNSVBEGJtC0cSL
         29vMyPpxYVnUxgboK1cgu26cJCdBqqSrVa76u/2uxVoe5T9arSGmwfKnNsYA+YwROrmd
         2Yeg==
X-Gm-Message-State: APjAAAW28IMRfRskXOnVR5bJDD3REWrZ3mkcNX//fMWJVIxQVjoSBGua
        TBaZ7udFkQWPTaY1pmlQCXikzg==
X-Google-Smtp-Source: APXvYqztSlqL5qyucSaXldZIzGpZYX2jVlDz5jrdS7qSUp8e7UOzwZCvE3AoF5wpajH9JbVUGqBi4Q==
X-Received: by 2002:a81:99c7:: with SMTP id q190mr4725618ywg.480.1581722229050;
        Fri, 14 Feb 2020 15:17:09 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q130sm3171455ywg.52.2020.02.14.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 15:17:08 -0800 (PST)
Date:   Fri, 14 Feb 2020 16:17:06 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 3/6] coresight: Add generic sysfs link creation
 functions.
Message-ID: <20200214231706.GD20024@xps15>
References: <20200211105808.27884-1-mike.leach@linaro.org>
 <20200211105808.27884-4-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211105808.27884-4-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 11, 2020 at 10:58:05AM +0000, Mike Leach wrote:
> To allow the connections between coresight components to be represented
> in sysfs, generic methods for creating sysfs links between two coresight
> devices are added.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/Makefile          |   3 +-
>  drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>  drivers/hwtracing/coresight/coresight-sysfs.c | 124 ++++++++++++++++++
>  include/linux/coresight.h                     |  20 +++
>  4 files changed, 150 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-sysfs.c
> 
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 0e3e72f0f510..19497d1d92bf 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -2,7 +2,8 @@
>  #
>  # Makefile for CoreSight drivers.
>  #
> -obj-$(CONFIG_CORESIGHT) += coresight.o coresight-etm-perf.o coresight-platform.o
> +obj-$(CONFIG_CORESIGHT) += coresight.o coresight-etm-perf.o \
> +			   coresight-platform.o coresight-sysfs.o
>  obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o \
>  					     coresight-tmc-etf.o \
>  					     coresight-tmc-etr.o
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 1cad642f27aa..a4a658d46045 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -153,6 +153,10 @@ struct coresight_device *coresight_get_sink_by_id(u32 id);
>  struct list_head *coresight_build_path(struct coresight_device *csdev,
>  				       struct coresight_device *sink);
>  void coresight_release_path(struct list_head *path);
> +int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
> +void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
> +int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
> +void coresight_remove_conns_sysfs_group(struct coresight_device *csdev);
>  
>  #ifdef CONFIG_CORESIGHT_SOURCE_ETM3X
>  extern int etm_readl_cp14(u32 off, unsigned int *val);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> new file mode 100644
> index 000000000000..17d565941e5e
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, Linaro Limited, All rights reserved.
> + * Author: Mike Leach <mike.leach@linaro.org>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +
> +#include "coresight-priv.h"
> +
> +/*
> + * Connections group - links attribute.
> + * Count of created links between coresight components in the group.
> + */
> +static ssize_t nr_links_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct coresight_device *csdev = to_coresight_device(dev);
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", csdev->nr_links);
> +}
> +static DEVICE_ATTR_RO(nr_links);
> +
> +static struct attribute *coresight_conns_attrs[] = {
> +	&dev_attr_nr_links.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group coresight_conns_group = {
> +	.attrs = coresight_conns_attrs,
> +	.name = "connections",
> +};
> +
> +/*
> + * Create connections group for CoreSight devices.
> + * This group will then be used to collate the sysfs links between
> + * devices.
> + */
> +int coresight_create_conns_sysfs_group(struct coresight_device *csdev)
> +{
> +	int ret = 0;
> +
> +	if (!csdev)
> +		return -EINVAL;
> +
> +	ret = sysfs_create_group(&csdev->dev.kobj, &coresight_conns_group);
> +	if (ret)
> +		return ret;
> +
> +	csdev->has_conns_grp = true;

The only place coresight_create_conns_sysfs_group() is used is in
coresight_register() where an error is returned to driver probe() functions if
an error occurs.  Have you found places where csdev->has_conns_grp is needed?
If not please remove.

> +	return ret;
> +}
> +
> +void coresight_remove_conns_sysfs_group(struct coresight_device *csdev)
> +{
> +	if (!csdev)
> +		return;
> +
> +	if (csdev->has_conns_grp) {
> +		sysfs_remove_group(&csdev->dev.kobj, &coresight_conns_group);
> +		csdev->has_conns_grp = false;
> +	}
> +}
> +
> +int coresight_add_sysfs_link(struct coresight_sysfs_link *info)
> +{
> +	int ret = 0;
> +
> +	if (!info)
> +		return -EINVAL;
> +	if (!info->orig || !info->target ||
> +	    !info->orig_name || !info->target_name)
> +		return -EINVAL;
> +	if (!info->orig->has_conns_grp || !info->target->has_conns_grp)
> +		return -EINVAL;
> +
> +	/* first link orig->target */
> +	ret = sysfs_add_link_to_group(&info->orig->dev.kobj,
> +				      coresight_conns_group.name,
> +				      &info->target->dev.kobj,
> +				      info->orig_name);
> +	if (ret)
> +		return ret;
> +
> +	/* second link target->orig */
> +	ret = sysfs_add_link_to_group(&info->target->dev.kobj,
> +				      coresight_conns_group.name,
> +				      &info->orig->dev.kobj,
> +				      info->target_name);
> +
> +	/* error in second link - remove first - otherwise inc counts */
> +	if (ret) {
> +		sysfs_remove_link_from_group(&info->orig->dev.kobj,
> +					     coresight_conns_group.name,
> +					     info->orig_name);
> +	} else {
> +		info->orig->nr_links++;
> +		info->target->nr_links++;
> +	}
> +
> +	return ret;
> +}
> +
> +void coresight_remove_sysfs_link(struct coresight_sysfs_link *info)
> +{
> +	if (!info)
> +		return;
> +	if (!info->orig || !info->target ||
> +	    !info->orig_name || !info->target_name)
> +		return;
> +
> +	sysfs_remove_link_from_group(&info->orig->dev.kobj,
> +				     coresight_conns_group.name,
> +				     info->orig_name);
> +
> +	sysfs_remove_link_from_group(&info->target->dev.kobj,
> +				     coresight_conns_group.name,
> +				     info->target_name);
> +
> +	info->orig->nr_links--;
> +	info->target->nr_links--;
> +}
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 193cc9dbf448..a2ec25e02ca9 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -148,6 +148,20 @@ struct coresight_connection {
>  	struct coresight_device *child_dev;
>  };
>  
> +/**
> + * struct coresight_sysfs_link - representation of a connection in sysfs.
> + * @orig:		Originating (master) coresight device for the link.
> + * @orig_name:		Name to use for the link orig->target.
> + * @target:		Target (slave) coresight device for the link.
> + * @target_name:	Name to use for the link target->orig.
> + */
> +struct coresight_sysfs_link {
> +	struct coresight_device *orig;
> +	const char *orig_name;
> +	struct coresight_device *target;
> +	const char *target_name;
> +};
> +
>  /**
>   * struct coresight_device - representation of a device as used by the framework
>   * @pdata:	Platform data with device connections associated to this device.
> @@ -165,6 +179,9 @@ struct coresight_connection {
>   * @ea:		Device attribute for sink representation under PMU directory.
>   * @ect_dev:	Associated cross trigger device. Not part of the trace data
>   *		path or connections.
> + * @nr_links:   number of sysfs links created to other components from this
> + *		device. These will appear in the "connections" group.
> + * @has_conns_grp: Have added a "connections" group for sysfs links.
>   */
>  struct coresight_device {
>  	struct coresight_platform_data *pdata;
> @@ -180,6 +197,9 @@ struct coresight_device {
>  	struct dev_ext_attribute *ea;
>  	/* cross trigger handling */
>  	struct coresight_device *ect_dev;
> +	/* sysfs links between components */
> +	int nr_links;
> +	bool has_conns_grp;
>  };

With the above: 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  /*
> -- 
> 2.17.1
> 
