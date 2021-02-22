Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55635C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 18:52:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2EB464E20
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 18:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhBVSwK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 13:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhBVSvj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Feb 2021 13:51:39 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19568C06174A
        for <linux-doc@vger.kernel.org>; Mon, 22 Feb 2021 10:50:59 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id o22so299685pjs.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Feb 2021 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fWSnGOHQRw22BUkFu0CDCL0FRSrSJcNTmBm1h9SVnDQ=;
        b=jsxlSAjMjBVR/+KtLcVPGhKoV4qJ83UNQAH23qgvxynIJTgK43UTjb04xUVrrrrmIP
         DStorzSYehs5boEAg28nk+UbwRTsCnEZyalte0WxW/H2nH9WQZn2J5ZeaPgwAf7yMmK7
         gizTdNxNOvBFY26HLNnvusjh1l3wqIIiMSz9xCTYYIy2LwEOId/qmJ+zVVmJqWQLxXW2
         opr/aaEEvvKv3KXZs01EKiHIZ4oAnHM99G00tSRev6F2G0YQ/gGhmo21Rhpsdh66vA+r
         JKY/Hlco1IFJ0IznpsGZ51adgsTUai/piX0aYZQcyG4xJqvuXzq/VmXjT9z61Nk5re9l
         r+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fWSnGOHQRw22BUkFu0CDCL0FRSrSJcNTmBm1h9SVnDQ=;
        b=LNi6vN5/brrszDoH5VaiQXRlGY7BxWchk/1l4Nxf64My4Xz2SC2WnYdZF0/OG6fIMu
         P31ImdFmLjmpox6DWgTMTxS4bIaSKUDZluxmOovjIFSjHobl4I0JoOoPIqBNNT7AZdSt
         sbDnnsPx1n4IE6LZw3XEvdqX8utP5AJX644hBESnH0NhrwBoqvFz7yrJiXJVgXHftFrZ
         Esse5TBmUDT4ddDsBtGu5wpKTV/Tc/FVRw48V1RMNYjrov2OeFew9wmcEB3m02g87C2W
         0i4fwkKoDe5jDNhmdkPioOBSVbcfENiSDdOnjmnRuf0Xr1byXpNMt8peT9mU2oyW0tdR
         I0MQ==
X-Gm-Message-State: AOAM532UrCJIEgH7svRKTdEBmRojgvcjH32dzOXGYWkKkiW95GiawVwc
        mhwu5U89U87S9DAli0HHwfTQgbMwGq0oxw==
X-Google-Smtp-Source: ABdhPJxe3vfkvSEYm86oMzbeoUg9ThSJpfuio7psJ0LK+eXIWNzqLMP78vlcpVlkmHQ3M7gGzqSv3w==
X-Received: by 2002:a17:90a:114f:: with SMTP id d15mr23788815pje.1.1614019858365;
        Mon, 22 Feb 2021 10:50:58 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s16sm9261450pfs.39.2021.02.22.10.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 10:50:57 -0800 (PST)
Date:   Mon, 22 Feb 2021 11:50:55 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] coresight: syscfg: Initial coresight system
 configuration
Message-ID: <20210222185055.GA3239381@xps15>
References: <20210128170936.9222-1-mike.leach@linaro.org>
 <20210128170936.9222-2-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128170936.9222-2-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 28, 2021 at 05:09:27PM +0000, Mike Leach wrote:
> Creates an system management API to allow complex configurations and
> features to be programmed into a CoreSight infrastructure.
> 
> A feature is defined as a programming set for a device or class of
> devices.
> 
> A configuration is a set of features across the system that are enabled
> for a trace session.
> 
> The API will manage system wide configuration, and allow complex
> programmed features to be added to individual device instances, and
> provide for system wide configuration selection on trace capture
> operations.
> 
> This patch creates the initial data object and the initial API for
> loading configurations and features.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../hwtracing/coresight/coresight-config.h    | 167 +++++++++++++++
>  drivers/hwtracing/coresight/coresight-core.c  |  12 +-
>  .../hwtracing/coresight/coresight-etm-perf.c  |   2 +-
>  .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>  .../hwtracing/coresight/coresight-syscfg.c    | 197 ++++++++++++++++++
>  .../hwtracing/coresight/coresight-syscfg.h    |  54 +++++
>  7 files changed, 432 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-config.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-syscfg.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-syscfg.h
> 
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index f20e357758d1..4ce854c434b1 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -4,7 +4,7 @@
>  #
>  obj-$(CONFIG_CORESIGHT) += coresight.o
>  coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
> -		coresight-sysfs.o
> +		coresight-sysfs.o coresight-syscfg.o
>  obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
>  coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
>  		      coresight-tmc-etr.o
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> new file mode 100644
> index 000000000000..3fedf8ab3cee
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -0,0 +1,167 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 Linaro Limited, All rights reserved.
> + * Author: Mike Leach <mike.leach@linaro.org>
> + */
> +
> +#ifndef _CORESIGHT_CORESIGHT_CONFIG_H
> +#define _CORESIGHT_CORESIGHT_CONFIG_H
> +
> +#include <linux/coresight.h>
> +#include <linux/types.h>
> +
> +/* CoreSight Configuration Management - component and system wide configuration */
> +
> +/*
> + * Register type flags for register value descriptor:
> + * describe how the value is interpreted, and handled.
> + */
> +#define CS_CFG_REG_TYPE_STD		0x80	/* reg is standard reg */
> +#define CS_CFG_REG_TYPE_RESOURCE	0x40	/* reg is a resource */
> +#define CS_CFG_REG_TYPE_VAL_PARAM	0x08	/* reg value uses param */
> +#define CS_CFG_REG_TYPE_VAL_MASK	0x04	/* reg value bit masked */
> +#define CS_CFG_REG_TYPE_VAL_64BIT	0x02	/* reg value 64 bit */
> +#define CS_CFG_REG_TYPE_VAL_SAVE	0x01	/* reg value save on disable */
> +
> +/*
> + * flags defining what device class a feature will match to when processing a
> + * system configuration - used by config data and devices.
> + */
> +#define	CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
> +#define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> +
> +/* flags defining device instance matching - used in config match desc data. */
> +#define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> +
> +/*
> + * Limit number of presets in a configuration
> + * This is related to the number of bits (4) we use to select the preset on
> + * the perf command line. Preset 0 is always none selected.
> + * See PMU_FORMAT_ATTR(preset, "config:0-3") in coresight-etm-perf.c
> + */
> +#define CS_CFG_CONFIG_PRESET_MAX 15
> +
> +/**
> + * Parameter descriptor for a device feature.
> + *
> + * @name:  Name of parameter.
> + * @value: Initial or default value.
> + */
> +struct cscfg_parameter_desc {
> +	const char *name;
> +	u64 value;
> +};
> +
> +/**
> + * Representation of register value.
> + *
> + * Supports full 64 bit register value, or 32 bit value with optional mask
> + * value.
> + *
> + * @type:	define register usage and interpretation.
> + * @offset:	the address offset for register in the hardware device (per device specification).
> + * @hw_info:	optional hardware device type specific information. (ETM / CTI specific etc)
> + * @val64:	64 bit value.
> + * @val32:	32 bit value.
> + * @mask32:	32 bit mask when using 32 bit value to access device register.
> + */
> +struct cscfg_regval_desc {
> +	struct {
> +		u32 type:8;
> +		u32 offset:12;
> +		u32 hw_info:12;
> +	};
> +	union {
> +		u64 val64;
> +		struct {
> +			u32 val32;
> +			u32 mask32;
> +		};
> +	};
> +};
> +
> +/**
> + * Device feature descriptor - combination of registers and parameters to
> + * program a device to implement a specific complex function.
> + *
> + * @name:	feature name.
> + * @brief:	brief description of the feature.
> + * @item:	List entry.
> + * @match_flags: matching information if loading into a device
> + * @nr_params:  number of parameters used.
> + * @params:	array of parameters used.
> + * @nr_regs:	number of registers used.
> + * @reg:	array of registers used.
> + */
> +struct cscfg_feature_desc {
> +	const char *name;
> +	const char *brief;
> +	struct list_head item;
> +	u32 match_flags;
> +	int nr_params;
> +	struct cscfg_parameter_desc *params;

	struct cscfg_parameter_desc *params_desc;

> +	int nr_regs;
> +	struct cscfg_regval_desc *regs;

        struct cscfg_regval_desc *regs_desc;

That way I know exactly what I'm looking at when I see something like the
following in patch 03:

        reg_desc = &feat->desc->regs[i];

