Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A1DB77D071
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 03:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbeGWEA2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 00:00:28 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:44921 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725746AbeGWEA2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Jul 2018 00:00:28 -0400
Received: by mail-pl0-f67.google.com with SMTP id m16-v6so7597596pls.11
        for <linux-doc@vger.kernel.org>; Sun, 22 Jul 2018 20:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GbcTQteZutnrrp0ElE4r3n5F20XUyMblfKc3J+fOsFo=;
        b=Da85itihHX5wgStCUxWD2nFl6v7xTDNODyLsDgjWOnfk9KYPaDfc5QGTlLOyxtFiFu
         qIOTEo2NxDizfWggWhwtmAthjLV5uWNrQZti0K506txKy2Cl7s3e2kUxGr51OgV22NDS
         b9OCCIQUVEHT4d/5yivFHkeMhUf3eX/009Sjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GbcTQteZutnrrp0ElE4r3n5F20XUyMblfKc3J+fOsFo=;
        b=BI1aChvXWMowjC/Z5ey+PzFRilbhpwRJdC0+EwDWQYDrXkjj3afqx8hzqqxOiEvPZt
         Ure5E1HdB/9bwOiHUms2A3K5MwR+5AkIZdmH56gfxiHJnE90XTfK715/zEW+CktmTh6O
         U5I+GFEcQ7fsOIOiJ15DLluSzWmT//CfD9Ky/ycAEgcy27efrWFCkYAV7RO4lDJgoou6
         psp9q48x1rRQeifFY/yLiuLgtOCQjQqYjcA3zJKujt4JMvLQJTmHuFLiDg2SafemC6yZ
         a1E8LwRMx7q/EWm2LMpJPqgy/mvudZjRI4IWyDnoxqDOcXQMtAbIf0qena5paf6+e4CO
         kD1g==
X-Gm-Message-State: AOUpUlE8BEahsxDzlo338UzE+GK9AzpkyBsr5/oRCVDwIqlbM/+l0zUi
        gfyX3w4Z8Pz+Ur87wPDMcLnHDA==
X-Google-Smtp-Source: AAOMgpc2yePkGXoXPxwz/uyALuVFjZ08QhVcY7xCuad/ohWOOnHqU4SQND0r1cZcdY5DnKnpb/RuHQ==
X-Received: by 2002:a17:902:8c88:: with SMTP id t8-v6mr11087554plo.117.1532314889916;
        Sun, 22 Jul 2018 20:01:29 -0700 (PDT)
Received: from localhost ([122.172.26.112])
        by smtp.gmail.com with ESMTPSA id o27-v6sm15152698pfj.35.2018.07.22.20.01.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jul 2018 20:01:29 -0700 (PDT)
Date:   Mon, 23 Jul 2018 08:31:27 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Ruchi Kandoi <kandoiruchi@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] cpufreq: trace frequency limits change
Message-ID: <20180723030127.7v5aymf246gfsf5x@vireshk-i7>
References: <20180720222114.200311-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180720222114.200311-1-joel@joelfernandes.org>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20-07-18, 15:21, Joel Fernandes wrote:
> From: Ruchi Kandoi <kandoiruchi@google.com>
> 
> systrace used for tracing for Android systems has carried a patch for
> many years in the Android tree that traces when the cpufreq limits
> change.  With the help of this information, systrace can know when the
> policy limits change and can visually display the data. Lets add
> upstream support for the same.
> 
> Signed-off-by: Ruchi Kandoi <kandoiruchi@google.com>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> ---
> v1->v2: Minor changes suggested by Viresh
> 
>  Documentation/trace/events-power.rst |  1 +
>  drivers/cpufreq/cpufreq.c            |  1 +
>  include/trace/events/power.h         | 25 +++++++++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/trace/events-power.rst b/Documentation/trace/events-power.rst
> index a77daca75e30..2ef318962e29 100644
> --- a/Documentation/trace/events-power.rst
> +++ b/Documentation/trace/events-power.rst
> @@ -27,6 +27,7 @@ cpufreq.
>  
>    cpu_idle		"state=%lu cpu_id=%lu"
>    cpu_frequency		"state=%lu cpu_id=%lu"
> +  cpu_frequency_limits	"min=%lu max=%lu cpu_id=%lu"
>  
>  A suspend event is used to indicate the system going in and out of the
>  suspend mode:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index b0dfd3222013..4fd935df101e 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2236,6 +2236,7 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
>  
>  	policy->min = new_policy->min;
>  	policy->max = new_policy->max;
> +	trace_cpu_frequency_limits(policy->min, policy->max, policy->cpu);
>  
>  	policy->cached_target_freq = UINT_MAX;
>  
> diff --git a/include/trace/events/power.h b/include/trace/events/power.h
> index 908977d69783..f5bec45108b6 100644
> --- a/include/trace/events/power.h
> +++ b/include/trace/events/power.h
> @@ -148,6 +148,31 @@ DEFINE_EVENT(cpu, cpu_frequency,
>  	TP_ARGS(frequency, cpu_id)
>  );
>  
> +TRACE_EVENT(cpu_frequency_limits,
> +
> +	TP_PROTO(unsigned int min_freq, unsigned int max_freq,
> +		unsigned int cpu_id),
> +
> +	TP_ARGS(min_freq, max_freq, cpu_id),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, min_freq)
> +		__field(u32, max_freq)
> +		__field(u32, cpu_id)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->min_freq = min_freq;
> +		__entry->max_freq = max_freq;
> +		__entry->cpu_id = cpu_id;
> +	),
> +
> +	TP_printk("min=%lu max=%lu cpu_id=%lu",
> +		  (unsigned long)__entry->min_freq,
> +		  (unsigned long)__entry->max_freq,
> +		  (unsigned long)__entry->cpu_id)
> +);
> +
>  TRACE_EVENT(device_pm_callback_start,
>  
>  	TP_PROTO(struct device *dev, const char *pm_ops, int event),

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
