Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4BBC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F785613C6
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234442AbhDARoC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbhDARjG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 13:39:06 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FABC031169
        for <linux-doc@vger.kernel.org>; Thu,  1 Apr 2021 09:53:56 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so4998894pjb.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=opZpqvsKBsI6VYq138fXrWfaN6YGeUQyxcS+8w6v06c=;
        b=zyQRNsvsA9LyQidoA1ch2aMxTysyo4s72aUu6/nXPD6YOT0doXN4COWofYcRSdBXLK
         fxF7ePO8YBbA1bIPzpxIL0mmgajnn9eT1XlKIN97lsNhc3y0oYb2Lc7icx3Pf1aDnzr/
         +sx6AW/ZGNo25YgzOQIuE2/r1Xa7zEAVi42VDyPxtHWv/I6nbOnZkFcsjCerQny1sT2m
         0mqdRRXI9xNjCtMgAyv3B0b9OjMphUbiH66QnOihnMF49qQi7b+6pOyrz3GpriebnP6o
         BxZ22EI/QELKYnvdueqv8l3eg41xRX6W6NRgn3R7SNZLJEFcJ1sg2FO9uaocJwzuouqG
         n02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=opZpqvsKBsI6VYq138fXrWfaN6YGeUQyxcS+8w6v06c=;
        b=MM/DIV4TmKuwz26rvZAVi7+txYZtxF5fF705MdA/Jtb9hOELbWpjDEvpACXrk7VNML
         xelV9RjEElSOLgbLnncXyUtVFRdwBbOtP8uaGM/1YUSrNf/WC+9WR86mlxv0bz9JSQ/i
         5jXYUHTxTY3kOMDhi/dxRX7UlLIgs3gxvYMg+NcB/kkw3Bj+YoaNdz11E1td5O3IJzU1
         K/LbguPyQg6/jWjeksccPyr4r1Mjo1AUFYuTMaRmzVm4P4ZfylfZVOQMYUB4w5FASnB9
         6IeSCF5JChG7m0+ek61zZlYtvsDksnTRCapLxiyVF4iha6ltWx1ZS7ikWdCE6MljO6UN
         Inwg==
X-Gm-Message-State: AOAM530kv7VqeUXbQS82W6PemnCb+FrwRV9CN1hL0tVCGlwaR21QtR9g
        BUremGQ8VF/ccNXBDqzG8if9Lg==
X-Google-Smtp-Source: ABdhPJzebmFG08KQlbsAdWpiNfw7N9cydtdTFMIvPyPRVFw/mXPRQEzgELZQ7HN3vPDPmXw8q9kobQ==
X-Received: by 2002:a17:902:7d95:b029:e7:3780:3c5f with SMTP id a21-20020a1709027d95b02900e737803c5fmr8793961plm.59.1617296036123;
        Thu, 01 Apr 2021 09:53:56 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j10sm5817403pjs.11.2021.04.01.09.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:53:55 -0700 (PDT)
Date:   Thu, 1 Apr 2021 10:53:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/10] coresight: etm-perf: Update to activate
 selected configuration
Message-ID: <20210401165353.GB145043@xps15>
References: <20210316180400.7184-1-mike.leach@linaro.org>
 <20210316180400.7184-7-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316180400.7184-7-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 16, 2021 at 06:03:56PM +0000, Mike Leach wrote:
> Add calls to activate the selected configuration as perf starts
> and stops the tracing session.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 14 +++++++++++++-
>  drivers/hwtracing/coresight/coresight-etm-perf.h |  2 ++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 66bda452a2f4..9128f59864a8 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -196,6 +196,10 @@ static void free_event_data(struct work_struct *work)
>  	/* Free the sink buffers, if there are any */
>  	free_sink_buffer(event_data);
>  
> +	/* clear any configuration we were using */
> +	if (event_data->cfg_hash)
> +		cscfg_deactivate_config(event_data->cfg_hash);
> +
>  	for_each_cpu(cpu, mask) {
>  		struct list_head **ppath;
>  
> @@ -254,7 +258,7 @@ static void etm_free_aux(void *data)
>  static void *etm_setup_aux(struct perf_event *event, void **pages,
>  			   int nr_pages, bool overwrite)
>  {
> -	u32 id;
> +	u32 id, cfg_hash;
>  	int cpu = event->cpu;
>  	cpumask_t *mask;
>  	struct coresight_device *sink = NULL;
> @@ -271,6 +275,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>  		sink = coresight_get_sink_by_id(id);
>  	}
>  
> +	/* check if user wants a coresight configuration selected */
> +	cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
> +	if (cfg_hash) {
> +		if (cscfg_activate_config(cfg_hash))
> +			goto err;
> +		event_data->cfg_hash = cfg_hash;
> +	}
> +
>  	mask = &event_data->mask;
>  
>  	/*
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index ba617fe2217e..468f7799ab4f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -49,12 +49,14 @@ struct etm_filters {
>   * @work:		Handle to free allocated memory outside IRQ context.
>   * @mask:		Hold the CPU(s) this event was set for.
>   * @snk_config:		The sink configuration.
> + * @cfg_hash:		The hash id of any coresight config selected.
>   * @path:		An array of path, each slot for one CPU.
>   */
>  struct etm_event_data {
>  	struct work_struct work;
>  	cpumask_t mask;
>  	void *snk_config;
> +	u32 cfg_hash;
>  	struct list_head * __percpu *path;
>  };
>  
> -- 
> 2.17.1
> 
