Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6BD7E7DD32
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 21:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754405AbeDBVem (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 17:34:42 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:37223 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754317AbeDBVel (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 17:34:41 -0400
Received: by mail-pl0-f66.google.com with SMTP id v5-v6so3903320plo.4
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 14:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=my/7ODWSnRSdp+KD1BTh9MmSkFYi9fn5/R5YAwbX9tI=;
        b=bduNZ9nO99NC97VG/zOCYOXvTSOEJi9a7zosn2MHia2jEARLBEtRtsJCjqOKeE4wpH
         iNpPHiyzkBothyWME+8qh6HY9kXuuV9YfNaEMfdkEFHKdUqVDMOkTilf5HOmoeU+F+x7
         br34rhf3os2nfc/PA8QCMuKbFSia0lkpqe+VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=my/7ODWSnRSdp+KD1BTh9MmSkFYi9fn5/R5YAwbX9tI=;
        b=A2GKWBazlDwBkD6qQL0xkz9w7oaiNlfIHGfM0DKpaTgJeggrVd5wSDBkZO9TIBte76
         zE7T6T8LO0jBwXZqTIUvWmQRVvo78ynugB6NA/tjx8Fu6orQZ/BYe0UfzBXquqSfYUIY
         KZp90QfjiEbsdi/Yik9kKHwKmycnnF5KfX2vCm6rf4mz0w2ipZUCsoocK62x9mWuYdhu
         xoK4sE8tPx40wIX8jxzqy0K+JRqalA648c58ZlwbYhxe0kjJw2qCHh8DZAW/ozruBGJ3
         0sTdPnpeFE5qtQinG+n9m++u8v+Gabik7lpLddfMR109LrJyD/caPhksOSpgs8pQU9Jz
         6JgQ==
X-Gm-Message-State: AElRT7E20CjbYgSQN180UFkQEUsqg+2fvpxNkMcePD5LDf3MXtDJL4Kz
        v8WuFFByEZF9/sv3oyWWL1HgKg==
X-Google-Smtp-Source: AIpwx49ha1FDrwKXkZAdsli7zao/K28ZNo7ZNCde3wpfBOjFabhPgdcEQ6MhLV1FpGMi33TfOEtOjg==
X-Received: by 2002:a17:902:a981:: with SMTP id bh1-v6mr11580161plb.255.1522704880958;
        Mon, 02 Apr 2018 14:34:40 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id w26sm2773204pfi.17.2018.04.02.14.34.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Apr 2018 14:34:40 -0700 (PDT)
Date:   Mon, 2 Apr 2018 15:34:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v4 5/6] coresight: Set and clear sink device handler for
 kdump node
Message-ID: <20180402213437.GE15452@xps15>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
 <1522379724-30648-6-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522379724-30648-6-git-send-email-leo.yan@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 11:15:23AM +0800, Leo Yan wrote:
> If Coresight path is enabled for specific CPU, the sink device handler
> need to be set to kdump node; on the other hand we also need to clear
> sink device handler when path is disabled.
> 
> This patch sets sink devices handler for kdump node for two separate
> Coresight enabling modes: CS_MODE_SYSFS and CS_MODE_PERF; and clear the
> handler when Coresight is disabled.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c |  5 +++++
>  drivers/hwtracing/coresight/coresight.c          | 16 ++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 8a0ad77..f8b159c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -139,6 +139,8 @@ static void free_event_data(struct work_struct *work)
>  	for_each_cpu(cpu, mask) {
>  		if (!(IS_ERR_OR_NULL(event_data->path[cpu])))
>  			coresight_release_path(event_data->path[cpu]);
> +
> +		coresight_kdump_sink(cpu, NULL);
>  	}
>  
>  	kfree(event_data->path);
> @@ -238,6 +240,9 @@ static void *etm_setup_aux(int event_cpu, void **pages,
>  		event_data->path[cpu] = coresight_build_path(csdev, sink);
>  		if (IS_ERR(event_data->path[cpu]))
>  			goto err;
> +
> +		if (coresight_kdump_sink(cpu, sink))
> +			goto err;

I remember telling you to use free_event_data() and etm_setup_aux().  _Maybe_ it
made sense in the previous patchset but in this one it won't work.  We need to
reflect the current trace context, as such use etm_event_start() and
etm_event_stop().

In etm_event_start() call coresight_kdump_sink(cpu, sink) just before
source_ops(csdev)->enable().  Similarly call coresight_kdump_sink(cpu, NULL)
right after source_ops(csdev)->disable() in etm_event_stop().

Find me on IRC if you want more information on this.

>  	}
>  
>  	if (!sink_ops(sink)->alloc_buffer)
> diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
> index 389c4ba..483a1f7 100644
> --- a/drivers/hwtracing/coresight/coresight.c
> +++ b/drivers/hwtracing/coresight/coresight.c
> @@ -272,6 +272,7 @@ static int coresight_enable_source(struct coresight_device *csdev, u32 mode)
>  static bool coresight_disable_source(struct coresight_device *csdev)
>  {
>  	if (atomic_dec_return(csdev->refcnt) == 0) {
> +

This newline shouldn't be part of this set.

>  		if (source_ops(csdev)->disable)
>  			source_ops(csdev)->disable(csdev, NULL);
>  		csdev->enable = false;
> @@ -612,6 +613,13 @@ int coresight_enable(struct coresight_device *csdev)
>  	if (ret)
>  		goto err_source;
>  
> +	cpu = source_ops(csdev)->cpu_id(csdev);
> +
> +	/* Set sink device handler into kdump node */
> +	ret = coresight_kdump_sink(cpu, sink);
> +	if (ret)
> +		goto err_kdump;
> +

Call coresight_kdump_sink() just before coresight_enable_source().  That way if
there is a dump just after coresight_enable_source() is called we get the chance
of getting some traces in the dump file. 

>  	switch (subtype) {
>  	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
>  		/*
> @@ -621,7 +629,6 @@ int coresight_enable(struct coresight_device *csdev)
>  		 * be a single session per tracer (when working from sysFS)
>  		 * a per-cpu variable will do just fine.
>  		 */
> -		cpu = source_ops(csdev)->cpu_id(csdev);
>  		per_cpu(tracer_path, cpu) = path;
>  		break;
>  	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
> @@ -636,6 +643,9 @@ int coresight_enable(struct coresight_device *csdev)
>  	mutex_unlock(&coresight_mutex);
>  	return ret;
>  
> +err_kdump:
> +	coresight_disable_source(csdev);
> +
>  err_source:
>  	coresight_disable_path(path);
>  
> @@ -659,9 +669,10 @@ void coresight_disable(struct coresight_device *csdev)
>  	if (!csdev->enable || !coresight_disable_source(csdev))
>  		goto out;
>  
> +	cpu = source_ops(csdev)->cpu_id(csdev);
> +
>  	switch (csdev->subtype.source_subtype) {
>  	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
> -		cpu = source_ops(csdev)->cpu_id(csdev);
>  		path = per_cpu(tracer_path, cpu);
>  		per_cpu(tracer_path, cpu) = NULL;
>  		break;
> @@ -674,6 +685,7 @@ void coresight_disable(struct coresight_device *csdev)
>  		break;
>  	}
>  
> +	coresight_kdump_sink(cpu, NULL);
>  	coresight_disable_path(path);
>  	coresight_release_path(path);
>  
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
