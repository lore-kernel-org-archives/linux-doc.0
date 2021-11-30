Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F5DC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 30 Nov 2021 09:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235629AbhK3JdJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234932AbhK3JdJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 04:33:09 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C63EC061748
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 01:29:50 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i5so42936998wrb.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 01:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=felncm1mZvr7zHi58upE9nlqocAVIX85FXINzUJHutc=;
        b=peF/Q3t+jU7+66L7aIjXgQKez3slgg6ejeSkmnTsgfFXIDQHPystltw+vw1xGaTgtZ
         uzgOiD6kqv4dmXisOnNDWPTHWD73dKb51iYt6ciFckQEs75XWaXilkZYk8OkkYlJ+8v/
         BQ7KfU+PjssUenDe8sMJ9BMf3lBBsCdm+ayPfzXtDgLsY0+selgl/9qc1st2y1WV63Bm
         7tWaNOakWezHwlsSoZYRH84No0kNnDuXqrsyJce8zlk//qh8wkWBx+/0DDBGPnU0rr5a
         qZmEuiF53bqJ57LHQFEKnLE5EsYETRsM+JCoyTQLlJa8kLgDXyggDDiCVgbXoMKTqaLk
         T4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=felncm1mZvr7zHi58upE9nlqocAVIX85FXINzUJHutc=;
        b=gOIaLKZTdbiKdP2k7WS6d0B+KXb2QtOIEMXaIG6P3dzuwHpQYjKAGppah0QYZil9D1
         sftlVp/L3UqxiHS8+q/HDOMVriLJNOu5tNRwNbS+vw+6t0vCLeQS7yC629u6WW/QdxpA
         9BvZ2afvxwfqM+fxfkv3Q+bx94BCSV5MnbR/kuxt7mDnSULaw7IJqDx5xRHzfLpg4aa2
         5KSh7ZM05J87WYXW/eT3B4h0EyH55ORrZ2fzAnlkAgKcCujrBg/EZkWXLB9bYzyF9m0J
         ZwFfadKFOQv+8nU+1cB18gMYHw0wAzTdv6qGIdrgucmdG8vGd4r/y8q2frPnYVKE9Tsy
         tKwg==
X-Gm-Message-State: AOAM5309RpYtZl7SpyFyYzuRzf7nIJ6SMgbZvRYdkawa4Aw4gHi471e8
        M5hyiBLwrbZtB7MgB+LNQHrUhA==
X-Google-Smtp-Source: ABdhPJzdiFz+5CZ4OQ0z1EP7aGFuMzQ2lbjLZk1z+q3SiGtYY12xMl+QVZchUrsQWGDeKbUSf9Hv7A==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr40618505wrd.300.1638264588653;
        Tue, 30 Nov 2021 01:29:48 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:7880:daae:2d50:bb5e? ([2a01:e34:ed2f:f020:7880:daae:2d50:bb5e])
        by smtp.googlemail.com with ESMTPSA id q24sm1714601wmj.21.2021.11.30.01.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 01:29:47 -0800 (PST)
Subject: Re: [PATCH 6/7] thermal: netlink: Add a new event to notify CPU
 capabilities change
To:     Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org
Cc:     x86@kernel.org, linux-doc@vger.kernel.org,
        Len Brown <len.brown@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Aubrey Li <aubrey.li@linux.intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Ricardo Neri <ricardo.neri@intel.com>,
        linux-kernel@vger.kernel.org
References: <20211106013312.26698-1-ricardo.neri-calderon@linux.intel.com>
 <20211106013312.26698-7-ricardo.neri-calderon@linux.intel.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <b51c9b2a-40d2-6575-7746-3059eec53519@linaro.org>
Date:   Tue, 30 Nov 2021 10:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211106013312.26698-7-ricardo.neri-calderon@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/11/2021 02:33, Ricardo Neri wrote:
> From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> 
> Add a new netlink event to notify change in CPU capabilities in terms of
> performance and efficiency.
> 
> Firmware may change CPU capabilities as a result of thermal events in the
> system or to account for changes in the TDP (thermal design power) level.
> 
> This notification type will allow user space to avoid running workloads
> on certain CPUs or proactively adjust power limits to avoid future events.
> 

[ ... ]

> +	[THERMAL_GENL_ATTR_CPU_CAPABILITY_ID]	= { .type = NLA_U32 },
> +	[THERMAL_GENL_ATTR_CPU_CAPABILITY_PERF]	= { .type = NLA_U32 },
> +	[THERMAL_GENL_ATTR_CPU_CAPABILITY_EFF]	= { .type = NLA_U32 },
>  };

AFAIU, 0 <= perf < 256 and 0 <= eff < 256, right?

Is the following true?

	0 <= perf + eff < 256



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
