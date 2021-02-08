Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA189C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 20:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A305A64E6C
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 20:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhBHUd0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 15:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235187AbhBHUcy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 15:32:54 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA84C061786
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 12:32:13 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id m2so4267845pgq.5
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 12:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2Diyx5H7hFCC/qQRa303oUug00kOd545GuH0f7jDUVM=;
        b=JalFSW/vh4gTv+YNGSPEhDmtIsiiS/cJkcxfS1q4czqld/mlzNPCBAijomfLVeT7TG
         ErMI7Vjgt9VoQrMjSEAmmeqLacIGZISRfWxiLjK5PVIyrozTlhxpNMtQgDXF6Gl72UE4
         0785d7PAstzGgv935kTkayHBwH1/bVKlysddPZyoCHA64+jmIlxQAwEl9SnfhMOvKEsS
         AJZjkCeBfR4FEvIBArfwCkEaPo3y4oTOWSxwn5vv0Kfca9A03rCMeqC/CEHVmV3iPh0o
         xNO6Xry/Scun49rEan3AG3AbU8a2crduJVsZ4F8elayIOlZYeKisGvi5NO4DdDk9VDMS
         uyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2Diyx5H7hFCC/qQRa303oUug00kOd545GuH0f7jDUVM=;
        b=T9Udkbezw3Pq0TPh0Sr9mPNd7lNTB09ah6a81fv8BP48yUM06qJw1FMruAzlM8OklB
         rOkZBSE09fgLQAwoUJMi92yyYzIfdz2NmBBNJWeCY+qFny0eZL20v2o5Z9FH1f/g5gTC
         wQt40mFcJNJddvt1ZmdkSpU//GYTTb0QkbZM29gQWwyDM3oLF8kXI78/Ssl4dcV0+fCJ
         wRJrP0twJbVbxXhaYzc2aqEY65PljOLQi9xwv61fhDv5wEiY3Xq30tPb7bydVL1G8hxK
         INHztGjm/B8+Gr3ihUARDNJRFhvYaQ1tvedLMiXvU/yMDq+6X37SXlb07uvPhxMQXwAb
         L3KA==
X-Gm-Message-State: AOAM532W9BeARfVFrl8gt4pQb+xPYqrtZ2CG0OVu0DsWtqWwqTzEP+Iq
        I5ZpXS0aXhCUkFINFXhvOgQzIA==
X-Google-Smtp-Source: ABdhPJzZ5ECwgQA1DWDQxwWhv82fEMfnXpTs0U/RGTNSgT2vWuPkDTx+HVi3Iuq76if9cgVGHCmzZA==
X-Received: by 2002:a62:64c9:0:b029:1b9:6b48:7901 with SMTP id y192-20020a6264c90000b02901b96b487901mr19972798pfb.0.1612816332882;
        Mon, 08 Feb 2021 12:32:12 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z31sm147872pjj.47.2021.02.08.12.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 12:32:12 -0800 (PST)
Date:   Mon, 8 Feb 2021 13:32:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Al Grant <al.grant@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] perf cs-etm: Add helper cs_etm__get_pid_fmt()
Message-ID: <20210208203210.GC2077938@xps15>
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-7-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206150833.42120-7-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 06, 2021 at 11:08:31PM +0800, Leo Yan wrote:
> This patch adds helper function cs_etm__get_pid_fmt(), by passing
> parameter "traceID", it returns the PID format.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  tools/perf/util/cs-etm.c | 42 ++++++++++++++++++++++++++++++++++++++++
>  tools/perf/util/cs-etm.h |  1 +
>  2 files changed, 43 insertions(+)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index a2a369e2fbb6..b9c1d329a7f1 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/coresight-pmu.h>
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/log2.h>
> @@ -156,6 +157,47 @@ int cs_etm__get_cpu(u8 trace_chan_id, int *cpu)
>  	return 0;
>  }
>  
> +/*
> + * The returned PID format is presented by two bits:
> + *
> + *   Bit ETM_OPT_CTXTID: CONTEXTIDR or CONTEXTIDR_EL1 is traced;
> + *   Bit ETM_OPT_CTXTID2: CONTEXTIDR_EL2 is traced.
> + *
> + * It's possible that the two bits ETM_OPT_CTXTID and ETM_OPT_CTXTID2
> + * are enabled at the same time when the session runs on an EL2 kernel.
> + * This means the CONTEXTIDR_EL1 and CONTEXTIDR_EL2 both will be
> + * recorded in the trace data, the tool will selectively use
> + * CONTEXTIDR_EL2 as PID.
> + */
> +int cs_etm__get_pid_fmt(u8 trace_chan_id, u64 *pid_fmt)
> +{
> +	struct int_node *inode;
> +	u64 *metadata, val;
> +
> +	inode = intlist__find(traceid_list, trace_chan_id);
> +	if (!inode)
> +		return -EINVAL;
> +
> +	metadata = inode->priv;
> +
> +	if (metadata[CS_ETM_MAGIC] == __perf_cs_etmv3_magic) {
> +		val = metadata[CS_ETM_ETMCR];
> +		/* CONTEXTIDR is traced */
> +		if (val & BIT(ETM_OPT_CTXTID))
> +			*pid_fmt = BIT(ETM_OPT_CTXTID);
> +	} else {
> +		val = metadata[CS_ETMV4_TRCCONFIGR];
> +		/* CONTEXTIDR_EL2 is traced */
> +		if (val & (BIT(ETM4_CFG_BIT_VMID) | BIT(ETM4_CFG_BIT_VMID_OPT)))
> +			*pid_fmt = BIT(ETM_OPT_CTXTID2);
> +		/* CONTEXTIDR_EL1 is traced */
> +		else if (val & BIT(ETM4_CFG_BIT_CTXTID))
> +			*pid_fmt = BIT(ETM_OPT_CTXTID);
> +	}
> +
> +	return 0;
> +}
> +
>  void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
>  					      u8 trace_chan_id)
>  {
> diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> index 4ad925d6d799..7cc3bba0017d 100644
> --- a/tools/perf/util/cs-etm.h
> +++ b/tools/perf/util/cs-etm.h
> @@ -173,6 +173,7 @@ struct cs_etm_packet_queue {
>  int cs_etm__process_auxtrace_info(union perf_event *event,
>  				  struct perf_session *session);
>  int cs_etm__get_cpu(u8 trace_chan_id, int *cpu);
> +int cs_etm__get_pid_fmt(u8 trace_chan_id, u64 *pid_fmt);
>  int cs_etm__etmq_set_tid(struct cs_etm_queue *etmq,
>  			 pid_t tid, u8 trace_chan_id);
>  bool cs_etm__etmq_is_timeless(struct cs_etm_queue *etmq);
> -- 
> 2.25.1
> 
