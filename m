Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65765C433DB
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 23:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21F9464E40
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 23:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbhBBXau (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Feb 2021 18:30:50 -0500
Received: from foss.arm.com ([217.140.110.172]:59976 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232201AbhBBXau (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Feb 2021 18:30:50 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3556631B;
        Tue,  2 Feb 2021 15:30:04 -0800 (PST)
Received: from [10.57.35.108] (unknown [10.57.35.108])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4358D3F694;
        Tue,  2 Feb 2021 15:30:00 -0800 (PST)
Subject: Re: [PATCH v2 6/7] perf cs-etm: Detect pid in VMID for kernel running
 at EL2
To:     Leo Yan <leo.yan@linaro.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Al Grant <al.grant@arm.com>
References: <20210202163842.134734-1-leo.yan@linaro.org>
 <20210202163842.134734-7-leo.yan@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <f5158216-c3d1-10bb-02eb-00ff9a78f617@arm.com>
Date:   Tue, 2 Feb 2021 23:29:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202163842.134734-7-leo.yan@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/2/21 4:38 PM, Leo Yan wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> The PID of the task could be traced as VMID when the kernel is running
> at EL2.  Teach the decoder to look for VMID when the CONTEXTIDR (Arm32)
> or CONTEXTIDR_EL1 (Arm64) is invalid but we have a valid VMID.
> 
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Al Grant <al.grant@arm.com>
> Co-developed-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 32 ++++++++++++++++---
>   1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index 3f4bc4050477..fb2a163ff74e 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -6,6 +6,7 @@
>    * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>    */
>   
> +#include <linux/coresight-pmu.h>
>   #include <linux/err.h>
>   #include <linux/list.h>
>   #include <linux/zalloc.h>
> @@ -491,13 +492,36 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
>   			const ocsd_generic_trace_elem *elem,
>   			const uint8_t trace_chan_id)
>   {
> -	pid_t tid;
> +	pid_t tid = -1;
> +	u64 pid_fmt;
> +	int ret;
>   
> -	/* Ignore PE_CONTEXT packets that don't have a valid contextID */
> -	if (!elem->context.ctxt_id_valid)
> +	ret = cs_etm__get_pid_fmt(trace_chan_id, &pid_fmt);
> +	if (ret)

Is this something we can cache in this function ? e.g,
	static u64 pid_fmt;

	if (!pid_pfmt)
		ret = cs_etm__get_pid_fmt(trace_chan_id, &pid_fmt);

As all the ETMs will be running at the same exception level.

> +		return OCSD_RESP_FATAL_SYS_ERR;
> +
> +	/*
> +	 * Process the PE_CONTEXT packets if we have a valid contextID or VMID.
> +	 * If the kernel is running at EL2, the PID is traced in CONTEXTIDR_EL2
> +	 * as VMID, Bit ETM_OPT_CTXTID2 is set in this case.
> +	 */
> +	switch (pid_fmt) {
> +	case BIT(ETM_OPT_CTXTID):
> +		if (elem->context.ctxt_id_valid)
> +			tid = elem->context.context_id;
> +		break;
> +	case BIT(ETM_OPT_CTXTID2) | BIT(ETM_OPT_CTXTID):

I would rather fix the cs_etm__get_pid_fmt() to return either of these
as commented. i.e, ETM_OPT_CTXTID or ETM_OPT_CTXTID2. Thus we don't
need the this case.


With the above two addressed:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
