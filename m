Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4586EC433E0
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 23:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0327764E09
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 23:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhB1X0O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Feb 2021 18:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhB1X0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Feb 2021 18:26:12 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3322C06174A
        for <linux-doc@vger.kernel.org>; Sun, 28 Feb 2021 15:25:30 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id g20so8776601plo.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Feb 2021 15:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=76O2c9N4y3dGLWw3Sw/w77yY9Cj/HXfeulU3Y99AsYg=;
        b=Hsd694dJnM2/tTs4mJqSJKXIriAGtm4xdmjTMi3y11CX3L2lmVlOgMZW0pQghSjtut
         rd5c63MmioIlfRz2u1FFcZkJnBicMqXiMeZZBwkef7P9tRHARMocWIJ0eo0IzyvhV5Va
         qaU80aFAs1SIsK7srgoP+up8YBYtn9sAh5JWcISwLdbcEpcOVRiG8SoCVklYJJ15cPsU
         lCnW9DMthlf2UHOdEO+4FPX9Lsv4WXRN/EZzfI5aTZpa8pIsuyPu29JesGBRUc9y/+dW
         Db4PqHCl2R6gOWF5RfOiymdXrtDrBR0KuNbcphHlTfAsqTaFea7R87LDz+wlFnzdFMra
         NW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=76O2c9N4y3dGLWw3Sw/w77yY9Cj/HXfeulU3Y99AsYg=;
        b=FaCm7jm82nclmsiVVQB4ioC8n/AdWClIPIAtubNKIk0eS0hMlIkfEsYk+m/pIjMpvL
         vRfrlo/ufLYQgjhtEk0Qbj3rS4KWKByZN2I18c8tqOvTOB2k35Y1tLuP/99XBBT1LFGu
         jhy37Dljw6gL4LehW2oTo6sJoAqQvaRin6hSf40365NbLxWXQko8iJ65CPI/LxfutALr
         VXnoVyFk7wpUVGcCNnGiZkR+FEoGB7B1ZXo5GybJMDfhzn9JXTN+tWnFMpJNvE7p2li8
         OgJmVNYBjt4YajnhtjLShqptWImYJKoC8kFxM3EX78QnGKM+dMmoyXexyd1zaIMoTdQ8
         UPlQ==
X-Gm-Message-State: AOAM530NOXqcelzuLGyCqD3qctxfXBNTHhBcIV2NhdNyQNPVGjMFp3y+
        uYLyDyduDAAaS4VgZt0Pb5ntIQ==
X-Google-Smtp-Source: ABdhPJxVVRI5YPPCbv5R1Hah/Ft1wK1lom7spiCJ7CKr7ReQKKgxDaBDfsBoADyBeabHlPv/wqfI9Q==
X-Received: by 2002:a17:90a:ce03:: with SMTP id f3mr14320931pju.195.1614554730101;
        Sun, 28 Feb 2021 15:25:30 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 1sm2580356pfh.90.2021.02.28.15.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 15:25:29 -0800 (PST)
Date:   Sun, 28 Feb 2021 16:25:27 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/10] coresight: config: Add preloaded configurations
Message-ID: <20210228232527.GC3631443@xps15>
References: <20210128170936.9222-1-mike.leach@linaro.org>
 <20210128170936.9222-9-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128170936.9222-9-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 28, 2021 at 05:09:34PM +0000, Mike Leach wrote:
> Preload set of configurations.
> 
> This patch creates a small set of preloaded configurations and features
> that are available immediately after coresight has been initialised.
> 
> The current set provides a strobing feature for ETMv4, that creates a
> periodic sampling of trace by switching trace generation on and off
> using counters in the ETM.
> 
> A configuration called "autofdo" is also provided that uses the 'strobing'
> feature and provides a couple of preset values, selectable on the perf
> command line.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  drivers/hwtracing/coresight/Makefile          |   3 +-
>  .../hwtracing/coresight/coresight-cfg-afdo.c  | 154 ++++++++++++++++++
>  .../coresight/coresight-cfg-preload.c         |  25 +++
>  .../coresight/coresight-cfg-preload.h         |  11 ++
>  drivers/hwtracing/coresight/coresight-core.c  |   6 +
>  .../hwtracing/coresight/coresight-syscfg.h    |   1 +
>  6 files changed, 199 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-cfg-afdo.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cfg-preload.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-cfg-preload.h
> 
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index ea544206204d..2707bfef1b76 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -4,7 +4,8 @@
>  #
>  obj-$(CONFIG_CORESIGHT) += coresight.o
>  coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
> -		coresight-sysfs.o coresight-syscfg.o coresight-config.o
> +		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
> +		coresight-cfg-preload.o coresight-cfg-afdo.o
>  obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
>  coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
>  		      coresight-tmc-etr.o
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-afdo.c b/drivers/hwtracing/coresight/coresight-cfg-afdo.c
> new file mode 100644
> index 000000000000..ff69fb3f4434
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-cfg-afdo.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2020 Linaro Limited. All rights reserved.
> + * Author: Mike Leach <mike.leach@linaro.org>
> + */
> +
> +#include "coresight-config.h"
> +#include "coresight-etm4x-cfg.h"
> +
> +/* preload configurations and features */
> +
> +/* preload in features for ETMv4 */
> +
> +/* strobe feature */
> +static struct cscfg_parameter_desc strobe_params[] = {
> +	{
> +		.name = "window",
> +		.value = 5000,
> +	},
> +	{
> +		.name = "period",
> +		.value = 10000,
> +	},
> +};
> +
> +static struct cscfg_regval_desc strobe_regs[] = {
> +	/* resource selectors */
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE,
> +		.offset = TRCRSCTLRn(2),
> +		.hw_info = ETM4_CFG_RES_SEL,
> +		.val32 = 0x20001,
> +	},
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE,
> +		.offset = TRCRSCTLRn(3),
> +		.hw_info = ETM4_CFG_RES_SEQ,
> +		.val32 = 0x20002,
> +	},
> +	/* strobe window counter 0 - reload from param 0 */
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE | CS_CFG_REG_TYPE_VAL_SAVE,
> +		.offset = TRCCNTVRn(0),
> +		.hw_info = ETM4_CFG_RES_CTR,
> +	},
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE | CS_CFG_REG_TYPE_VAL_PARAM,
> +		.offset = TRCCNTRLDVRn(0),
> +		.hw_info = ETM4_CFG_RES_CTR,
> +		.val32 = 0,
> +	},
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE,
> +		.offset = TRCCNTCTLRn(0),
> +		.hw_info = ETM4_CFG_RES_CTR,
> +		.val32 = 0x10001,
> +	},
> +	/* strobe period counter 1 - reload from param 1 */
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE | CS_CFG_REG_TYPE_VAL_SAVE,
> +		.offset = TRCCNTVRn(1),
> +		.hw_info = ETM4_CFG_RES_CTR,
> +	},
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE | CS_CFG_REG_TYPE_VAL_PARAM,
> +		.offset = TRCCNTRLDVRn(1),
> +		.hw_info = ETM4_CFG_RES_CTR,
> +		.val32 = 1,
> +	},
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE,
> +		.offset = TRCCNTCTLRn(1),
> +		.hw_info = ETM4_CFG_RES_CTR,
> +		.val32 = 0x8102,
> +	},
> +	/* sequencer */
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE,
> +		.offset = TRCSEQEVRn(0),
> +		.hw_info = ETM4_CFG_RES_SEQ,
> +		.val32 = 0x0081,
> +	},
> +	{
> +		.type = CS_CFG_REG_TYPE_RESOURCE,
> +		.offset = TRCSEQEVRn(1),
> +		.hw_info = ETM4_CFG_RES_SEQ,
> +		.val32 = 0x0000,
> +	},
> +	/* view-inst */
> +	{
> +		.type = CS_CFG_REG_TYPE_STD | CS_CFG_REG_TYPE_VAL_MASK,
> +		.offset = TRCVICTLR,
> +		.val32 = 0x0003,
> +		.mask32 = 0x0003,
> +	},
> +	/* end of regs */
> +};
> +
> +struct cscfg_feature_desc strobe = {
> +	.name = "strobing",
> +	.brief = "Generate periodic trace capture windows.\n"
> +	"parameter \'window\': a number of CPU cycles (W)\n"
> +	"parameter \'period\': trace enabled for W cycles every period x W cycles\n",
> +	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4,
> +	.nr_params = ARRAY_SIZE(strobe_params),
> +	.params = strobe_params,
> +	.nr_regs = ARRAY_SIZE(strobe_regs),
> +	.regs = strobe_regs,
> +};
> +
> +/* create an autofdo configuration */
> +
> +/* we will provide 9 sets of preset parameter values */
> +#define AFDO_NR_PRESETS		9
> +/* the total number of parameters in used features */
> +#define AFDO_NR_PARAM_SUM	ARRAY_SIZE(strobe_params)
> +
> +#define AFDO_MATCH_STROBING (CS_CFG_MATCH_INST_ANY | CS_CFG_MATCH_CLASS_SRC_ETM4)
> +
> +static struct cscfg_config_feat_ref afdo_refs[] = {
> +	{
> +		.name = "strobing",
> +		.match = {
> +			.match_flags = AFDO_MATCH_STROBING,
> +		},
> +	},
> +};
> +
> +/*
> + * set of presets leaves strobing window constant while varying period to allow
> + * experimentation with mark / space ratios for various workloads
> + */
> +static u64 afdo_presets[AFDO_NR_PRESETS][AFDO_NR_PARAM_SUM] = {
> +	{ 5000, 2 },
> +	{ 5000, 4 },
> +	{ 5000, 8 },
> +	{ 5000, 16 },
> +	{ 5000, 64 },
> +	{ 5000, 128 },
> +	{ 5000, 512 },
> +	{ 5000, 1024 },
> +	{ 5000, 4096 },
> +};
> +
> +struct cscfg_config_desc afdo = {
> +	.name = "autofdo",
> +	.brief = "Setup ETMs with strobing for autofdo\n"
> +	"Supplied presets allow experimentation with mark-space ratio for various loads\n",
> +	.nr_refs = ARRAY_SIZE(afdo_refs),
> +	.refs = afdo_refs,
> +	.nr_presets = AFDO_NR_PRESETS,
> +	.nr_total_params = AFDO_NR_PARAM_SUM,
> +	.presets = &afdo_presets[0][0],
> +};
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.c b/drivers/hwtracing/coresight/coresight-cfg-preload.c
> new file mode 100644
> index 000000000000..c7ec5cbdd990
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-cfg-preload.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2020 Linaro Limited. All rights reserved.
> + * Author: Mike Leach <mike.leach@linaro.org>
> + */
> +
> +#include "coresight-cfg-preload.h"
> +#include "coresight-config.h"
> +#include "coresight-syscfg.h"
> +
> +static struct cscfg_feature_desc *preload_feats[] = {
> +	&strobe,
> +	0
> +};
> +
> +static struct cscfg_config_desc *preload_cfgs[] = {
> +	&afdo,
> +	0
> +};
> +

Perfect - thanks for making the change.

Mathieu

> +/* preload called with mutex locked */
> +int cscfg_preload(void)
> +{
> +	return cscfg_load_config_sets(preload_cfgs, preload_feats);
> +}
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.h b/drivers/hwtracing/coresight/coresight-cfg-preload.h
> new file mode 100644
> index 000000000000..fc4ac7faa93d
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-cfg-preload.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright(C) 2020 Linaro Limited. All rights reserved.
> + * Author: Mike Leach <mike.leach@linaro.org>
> + */
> +
> +/* declare preloaded configurations and features */
> +
> +/* from coresight-cfg-afdo.c */
> +extern struct cscfg_feature_desc strobe;
> +extern struct cscfg_config_desc afdo;
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6bd41de46648..633ddcffc6c7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1744,9 +1744,15 @@ static int __init coresight_init(void)
>  
>  	/* initialise the coresight syscfg API */
>  	ret = cscfg_init();
> +	if (ret)
> +		goto exit_perf_close;
> +
> +	/* preload builtin configurations */
> +	ret = cscfg_preload();
>  	if (!ret)
>  		return 0;
>  
> +exit_perf_close:
>  	etm_perf_exit();
>  exit_bus_unregister:
>  	bus_unregister(&coresight_bustype);
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
> index 301e26e1e98f..a8a6b21315d8 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.h
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.h
> @@ -47,6 +47,7 @@ struct cscfg_csdev_register {
>  /* internal core operations for cscfg */
>  int __init cscfg_init(void);
>  void __exit cscfg_exit(void);
> +int cscfg_preload(void);
>  
>  /* syscfg manager external API */
>  int cscfg_load_config_sets(struct cscfg_config_desc **cfg_descs,
> -- 
> 2.17.1
> 
