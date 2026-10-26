Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008264;
	b=O2xY1Jog+lQgL4mAexUU4oFFHAVn82ZmUQBTeOpHwTKhWTp0qhLJvi6cjeN8yT74evyG
	 87MNhaKzXZErNtGrXz7HDuDEhlbIEqs8tqkjFXW7Eq8WcogYSRB8OB//or8c2XEkaxsks
	 rYh53M4zg0tiNR3GuwG/4GAmYoVB3jkTnO01IPaZX65T7ENtpWCtdIDIQo58T9HIT8Dbp
	 Ut2+EywMcwTt5nNuCMhE1+FaxpL969Z793KLfh5ljntmsVRDaowRwdtFKyOzRnQCI/8Jc
	 Kpy7HMh+swmI9mryQzRmlwGcVGy7pgreLGMgr6gA+n4r+85p04yMqK5Rtnw8420svaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WY39dyeqsgK86vcC/6EADKb5rGDw+mM3bQAPuS8Ym0k=;
	b=FsFhGsdMQgzjfr4vSzcwvvtKxpI+NKjwXBCaUCV2z3MW71unVETA/b5tLI5rCOlW2uy7
	 mqssMzGXraISHiZwDAHkKjm/bPAUnzNxrPNA6qeCqkMxj/d2ir2UAr9R8GBoPQm7WZkTI
	 Y7PagjrKlbPYa8Su59fU7VU6c5+jqmWaH7zqs9xe8+Os8MCyFLBdGfWhLhL87wkQX+j1/
	 P/Mh95/YUH375aQxr6ewkyFHq573UUXuIKJzLixdQG3sRA5zPstcORJzkjlCezWSwzj7n
	 6KhQToOAM2cnNXJGJwh/aj80fTyi5oyQDrSgY4GKR9v+ICQak29UA8ZikMtVL6x4NQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yGoSVEyI;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47D606A323
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B47D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yGoSVEyI
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2520738f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008261; x=1793613061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WY39dyeqsgK86vcC/6EADKb5rGDw+mM3bQAPuS8Ym0k=;
        b=yGoSVEyId6A5oJxom0U6sRuPXhyhJ+tCjjveCV24rOOBxCBzkMZj34tMy2/GJOx8I5
         VpAg2uZ2TkNJWfrZlfsKnIlDqcYKmtdOIgbUaf/h5uiVT+wFkEhLVmXvVvz12zBi4Q6s
         1uC6yyrnh2OM/tmwelKv7OMiyxQMz9QB02BW63X1Lae8t2fopJe74OlVmc3UtgYDwo4V
         yn831Rgz1UoJp3u9MydmG0ONAPRcKY07MD5aZkHB+8mw9g7W8gqKngFLiAgpFa+6GNGs
         474yNNfmFuQxETpF/TbKTUKOGqroy+3CajJhIC0ynRwZg0mYxDVM3kb/M7FheKAV+x+P
         MJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008261; x=1793613061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WY39dyeqsgK86vcC/6EADKb5rGDw+mM3bQAPuS8Ym0k=;
        b=vOvM8mY4zuxg4r4yND0nkrokTrYwMaPTU9eMlSxbl/iRCZmdECTw375gsLf4CAVNtI
         QkOCZmxQYl/0gdD+z4inbTdvj2Fc/mIZZzcxXpuOlwrs7sUwsRi60jGtNPR+l0CFdCdl
         eHY82qSVHhw+gGBHX6wlPUuiM5wXcEmB2C0Y3JQQdRpFH4wHBzEyPedeiBYg0UTe81mo
         7GO4xB1OxxGQYLtA7MPUgtBk1A02hUXwY/Lhd4Z/wjovywmi7OUJrr40ffCSOpCwmO1E
         EVjmI9Ae7a0QOToVdyCA5t+nECN3bc/hlDaMFqbHeocVZw+zrPDmoye03UvagDVYjyA7
         pU9g==
X-Forwarded-Encrypted: i=1; AKwUvBzACyufm13+2ITkQCmfZq1/GsajYliwRotbxaftgRla3sOGXR7LSACRbuyiQ/U1mzeJkrcwSfvgy+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbBxhs8kmELpH0oM6n8cc5dVn5AYZCiie3Wp/Z+TEygEIkIotk
	faha3MOZd7UJuAKWW1GHkCOedTsZ6y2p8ifeezwqsyyEKwLl9s5DJ078TOMFgjSnxpE=
X-Gm-Gg: AYBFou05CX3BTjcoMwt9LGwFk/SAh8IESdZqbtWiZnAXA0dVYryIadFJQfbDkrpI7Iw
	c3f9Dux7Q10hP8jiuTAtoYzCZCgBIFrIjsA7HHGhulJ9SfLIGRqb7wG1bVYtJLtEG033QwwThZF
	WGYrt5NTs1c+M8J0ujXvkcg/tOU1hHW5TLx8e/pWr+sPNgr9XyqjV9XlLEKBtKMdHU7p1tb2w98
	7JlhCD2RmHUeF0kiO7vCXaldNaG81TW9YF/pGgM+bIzexTXlKLEf6b1IWvJeXgJ7OdKTG8gmUEN
	ecyIYyJ7Na6KY1DasDHMolLUZAYitQ1O9heFzg4bDout3zunS1cuHnwUf+N2vE/UBB4LhTIVKuh
	YYycTHKutXPhjpRJfsfFGlx8fBNeWm98g5XNOMPjrG3KKkpfu8EvIUV2IyUYDWBDvog6lMU9j4h
	sNKBIORpL7S4GEdHb39+FesEgkJkUEODMph6JV7M1DoEEKNojU15cujr8xYH2yPpizeRvUELXOs
	ZJaIaO+uW8+9xcBBFbdUEAQtGfGfndUFFh2bI+sB1pscF1m/N5cN4KmseCwUgJw3/8EuOEZYuHN
	K5hI5Q==
X-Received: by 2002:adf:ec50:0:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-48e3eb9c57amr8289007f8f.56.1793008261337;
        Mon, 26 Oct 2026 02:51:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm14021561f8f.22.2026.10.26.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:51:00 -0700 (PDT)
Message-ID: <aaaaa762-e0cc-4894-aed9-b160a70e0ddc@linaro.org>
Date: Mon, 26 Oct 2026 09:50:59 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <02268c4958153f6d2e549e4bd7b93f11ed79fa90.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <02268c4958153f6d2e549e4bd7b93f11ed79fa90.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 05:48, Amir Ayupov wrote:
> Add ETMv4 configuration 'pmu_pulse' with 'extout_pulse' feature which
> requires an ETE whose PMU counts its external outputs
> (CS_CFG_MATCH_CAP_TRCEXTOUT): event 1 selects the always-true
> resource and drives TRCEXTOUT1 PMU event which pulses on every cycle
> while the trace unit is enabled.
> 
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>   .../trace/coresight/coresight-config.rst      |  5 ++
>   .../trace/coresight/coresight-perf.rst        | 15 +++++
>   drivers/hwtracing/coresight/Makefile          |  1 +
>   .../coresight/coresight-cfg-pmu-pulse.c       | 55 +++++++++++++++++++
>   .../coresight/coresight-cfg-preload.c         |  2 +
>   .../coresight/coresight-cfg-preload.h         |  2 +
>   6 files changed, 80 insertions(+)
>   create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
> 
> diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
> index 6d5ffa6f73471..3eed728bf0de1 100644
> --- a/Documentation/trace/coresight/coresight-config.rst
> +++ b/Documentation/trace/coresight/coresight-config.rst
> @@ -129,6 +129,11 @@ The following steps take place in the operation of a configuration.
>   
>   5) At the end of the perf session, the configuration will be disabled.
>   
> +The built-in 'pmu_pulse' configuration pulses ETM external output 1 for a PMU
> +event to count. It only pulses while the ETM is enabled, so combined with AUX
> +pause and resume the PMU event can time each trace window (see
> +coresight-perf.rst).
> +
>   
>   Viewing Configurations and Features
>   ===================================
> diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
> index 0a77741a431ef..6770a455c6b59 100644
> --- a/Documentation/trace/coresight/coresight-perf.rst
> +++ b/Documentation/trace/coresight/coresight-perf.rst
> @@ -109,6 +109,21 @@ Example for triggering AUX pause and resume with PMU event::
>           -e cycles/aux-action=pause,period=10000000/ \
>           -e cycles/aux-action=resume,period=1050000/ -- sleep 1
>   
> +ETM-timed pause events
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +The built-in ``pmu_pulse`` configuration pulses ETM external output 1 on every
> +cycle of allowed trace, and a PMU event counting that output pauses trace after
> +``N`` pulses, here 1000 cycles::
> +
> +  perf record -a -e cs_etm/pmu_pulse,aux-action=start-paused/u \
> +    -e cycles/aux-action=resume,period=10000000/u \
> +    -e trcextout1/aux-action=pause,period=1000/u \
> +    -- sleep 1
> +
> +Each window is about ``N`` traced cycles plus the pause interrupt latency.
> +The configuration only loads on an ETE whose PMU counts its external outputs.
> +
>   Perf test - Verify kernel and userspace perf CoreSight work
>   -----------------------------------------------------------
>   
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index ab16d06783a57..568e797ac5a17 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CORESIGHT) += coresight.o
>   coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
>   		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
>   		coresight-cfg-preload.o coresight-cfg-afdo.o coresight-cfg-pstop.o \
> +		coresight-cfg-pmu-pulse.o \
>   		coresight-syscfg-configfs.o coresight-trace-id.o
>   obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
>   coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
> new file mode 100644
> index 0000000000000..61472154dd02a
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Pulse ETM external output 1 on every traced cycle for a PMU event to count.
> + * Based on coresight-cfg-afdo.c
> + */
> +
> +#include "coresight-config.h"
> +
> +/* ETMv4 includes and features */
> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> +#include "coresight-etm4x-cfg.h"
> +
> +/*
> + * extout_pulse feature: event 1 selects the always-true resource, so ETM
> + * external output 1 pulses on every cycle while the trace unit is enabled. A
> + * PMU event counting that output (TRCEXTOUT1), for example with
> + * aux-action=pause, then fires after as many traced cycles as its sample
> + * period. Event 0 is avoided because it is the trace unit trigger, and the
> + * TRBE driver treats a detected trigger as fatal.
> + */
> +static struct cscfg_regval_desc extout_pulse_regs[] = {
> +	/* event 1: resource selector 1 (always true), drives external output 1 */
> +	{
> +		.type = CS_CFG_REG_TYPE_STD | CS_CFG_REG_TYPE_VAL_MASK,
> +		.offset = TRCEVENTCTL0R,
> +		.val32 = 0x0100,
> +		.mask32 = 0xff00,
> +	},
> +	/* end of regs */
> +};
> +
> +struct cscfg_feature_desc extout_pulse_etm4x = {
> +	.name = "extout_pulse",
> +	.description = "Pulse external output 1 on every traced cycle.\n",
> +	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4 | CS_CFG_MATCH_CAP_TRCEXTOUT,
> +	.nr_regs = ARRAY_SIZE(extout_pulse_regs),
> +	.regs_desc = extout_pulse_regs,
> +};
> +
> +/* create a pmu_pulse configuration */
> +
> +static const char *pmu_pulse_ref_names[] = {
> +	"extout_pulse",
> +};
> +
> +struct cscfg_config_desc pmu_pulse_etm4x = {
> +	.name = "pmu_pulse",
> +	.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
> +	"to count as TRCEXTOUT1\n",
> +	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
> +	.feat_ref_names = pmu_pulse_ref_names,
> +};
> +
> +/* end of ETM4x configurations */
> +#endif	/* IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) */
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.c b/drivers/hwtracing/coresight/coresight-cfg-preload.c
> index 4980e68483c5b..a9a60a1c40845 100644
> --- a/drivers/hwtracing/coresight/coresight-cfg-preload.c
> +++ b/drivers/hwtracing/coresight/coresight-cfg-preload.c
> @@ -14,6 +14,7 @@ static struct cscfg_feature_desc *preload_feats[] = {
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>   	&strobe_etm4x,
>   	&gen_etrig_etm4x,
> +	&extout_pulse_etm4x,
>   #endif
>   	NULL
>   };
> @@ -22,6 +23,7 @@ static struct cscfg_config_desc *preload_cfgs[] = {
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>   	&afdo_etm4x,
>   	&pstop_etm4x,
> +	&pmu_pulse_etm4x,
>   #endif
>   	NULL
>   };
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.h b/drivers/hwtracing/coresight/coresight-cfg-preload.h
> index 291ba530a6a52..0058627f65ae5 100644
> --- a/drivers/hwtracing/coresight/coresight-cfg-preload.h
> +++ b/drivers/hwtracing/coresight/coresight-cfg-preload.h
> @@ -12,4 +12,6 @@ extern struct cscfg_feature_desc strobe_etm4x;
>   extern struct cscfg_config_desc afdo_etm4x;
>   extern struct cscfg_feature_desc gen_etrig_etm4x;
>   extern struct cscfg_config_desc pstop_etm4x;
> +extern struct cscfg_feature_desc extout_pulse_etm4x;
> +extern struct cscfg_config_desc pmu_pulse_etm4x;
>   #endif

Reviewed-by: James Clark <james.clark@linaro.org>

