Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50CAC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 21:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DEAC64F2C
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 21:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbhBYVw1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 16:52:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhBYVwO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Feb 2021 16:52:14 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43209C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Feb 2021 13:51:25 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id b21so4725707pgk.7
        for <linux-doc@vger.kernel.org>; Thu, 25 Feb 2021 13:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CYvg/O3koZWMfVOTf8PwAS4cBLMkQ4+DUOBTdtis/0Q=;
        b=nsG6R/Niwz/fN1QMeTZFoE8vZSoTJ9sHqzL5OAklqWYTe2KC0TxA8qLD1iFab7mKJm
         T8WVWbRVCLma2niPU7kL5lVY13OJmYQMyFSiQDlPb23iqz4f4x6oWTJdFf24cXWfdPL4
         zPk6DaE2906Nj3UxHZEKdpHuhRgpyqjpKqk/xEEWX/iUA/cUbbrR1bfHVcz/bnxm3Zjz
         olp+/I3Nai+l2t4913bVD5unrRxvm8aqPTisiES1pJ+yGueO9exTT4ff69CIpgL8cdIe
         Yo/XX1T4V33ps/E8+IbvUdm8D7L6Rr2LtmUVJHAOBXVf1Pl7xvAyz4yIqmo9QF38M5yO
         yEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CYvg/O3koZWMfVOTf8PwAS4cBLMkQ4+DUOBTdtis/0Q=;
        b=QrWXmgWAtC+SqKnNroFJwtTHR8WM2zYnSGSBmoHjcT7sFal8TAEV/ej7IWbH8pUWkR
         tTeZoE4+Sc8UytfeDZQcbgl1meyxR0rclIeRlaTFkzuPHMx4Z7v8gd2IWjtj8M8IIx9e
         fpuM9kq8GfDmXEi0nluoRFMGzFBLhK2OybOTe3SQDuOZucOYglSHfypdrqroL0z9xPiA
         gfsmJIH9h3TX68HBPsh9fCwT/8o5hNegNMUzKrU2NfhUtgQF0Egvw+s3NpJbF8Lnugay
         4RDSpvH6ad85rod9NUz29xq0Qbq8Ct4c0ipEouXN76BHeeHSIFIowpluwVMCAx60TeWq
         puUg==
X-Gm-Message-State: AOAM533SuEVw0rwWxa4a2e15dy0IFMUoC3O2LP0bKrxbl7r2qDI73t7p
        Qr3E3ujVGy4cO6oAwE584MLNBw==
X-Google-Smtp-Source: ABdhPJwjpz3YtwDnrpywcvLk6YW5Zhwu/J28xvqrPtp5cJzIwbYF28o5tlE/6/HByPVyGUBBTHccAQ==
X-Received: by 2002:a62:6585:0:b029:1b9:d8d9:1af2 with SMTP id z127-20020a6265850000b02901b9d8d91af2mr5111484pfb.17.1614289884558;
        Thu, 25 Feb 2021 13:51:24 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 2sm7011553pfi.116.2021.02.25.13.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:51:24 -0800 (PST)
Date:   Thu, 25 Feb 2021 14:51:22 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        yabinc@google.com, corbet@lwn.net, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, tingwei@codeaurora.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/10] coresight: etm-perf: Update to activate
 selected configuration
Message-ID: <20210225215122.GC3567106@xps15>
References: <20210128170936.9222-1-mike.leach@linaro.org>
 <20210128170936.9222-7-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128170936.9222-7-mike.leach@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 28, 2021 at 05:09:32PM +0000, Mike Leach wrote:
> Add calls to activate the selected configuration as perf starts
> and stops the tracing session.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 14 +++++++++++++-
>  drivers/hwtracing/coresight/coresight-etm-perf.h |  2 ++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index e270bb1e0f7d..5c1aeddabc59 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -178,6 +178,10 @@ static void free_event_data(struct work_struct *work)
>  	/* Free the sink buffers, if there are any */
>  	free_sink_buffer(event_data);
>  
> +	/* clear any configuration we were using */
> +	if (event_data->config_id_hash)
> +		cscfg_deactivate_config(event_data->config_id_hash);
> +
>  	for_each_cpu(cpu, mask) {
>  		struct list_head **ppath;
>  
> @@ -236,7 +240,7 @@ static void etm_free_aux(void *data)
>  static void *etm_setup_aux(struct perf_event *event, void **pages,
>  			   int nr_pages, bool overwrite)
>  {
> -	u32 id;
> +	u32 id, config_id;

config_id, cfg_hash, id_hash...

>  	int cpu = event->cpu;
>  	cpumask_t *mask;
>  	struct coresight_device *sink = NULL;
> @@ -253,6 +257,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>  		sink = coresight_get_sink_by_id(id);
>  	}
>  
> +	/* check if user wants a coresight configuration selected */
> +	config_id = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
> +	if (config_id) {
> +		if (cscfg_activate_config(config_id))
> +			goto err;
> +		event_data->config_id_hash = config_id;
> +	}
> +
>  	mask = &event_data->mask;
>  
>  	/*
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 3646a3837a0b..751d768939d8 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -49,12 +49,14 @@ struct etm_filters {
>   * @work:		Handle to free allocated memory outside IRQ context.
>   * @mask:		Hold the CPU(s) this event was set for.
>   * @snk_config:		The sink configuration.
> + * @config_id_hash:	The id of any coresight config selected.
>   * @path:		An array of path, each slot for one CPU.
>   */
>  struct etm_event_data {
>  	struct work_struct work;
>  	cpumask_t mask;
>  	void *snk_config;
> +	u32 config_id_hash;

Please align this with the naming convention you will be using above and
throughout.

More comments tomorrow.

Thanks,
Mathieu

>  	struct list_head * __percpu *path;
>  };
>  
> -- 
> 2.17.1
> 
