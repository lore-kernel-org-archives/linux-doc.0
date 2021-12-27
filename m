Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361EAC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 27 Dec 2021 04:18:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbhL0ESI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Dec 2021 23:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235184AbhL0ESI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Dec 2021 23:18:08 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2749C06173E
        for <linux-doc@vger.kernel.org>; Sun, 26 Dec 2021 20:18:07 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id f125so12789637pgc.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Dec 2021 20:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hBwHcbOLbODluezLkfU899o5k+HtfijYIO+0bx3J3EA=;
        b=wO63sFsISf2zVMzmS2HzyM2Xf1Ao8xLtpBWfuR6oqkHeMlDibp35OIhrVZX7VJL/C4
         Yij7TZczAIxGmR62A1ZTUCaaCtHr20KwpKBRAQJIQQ1O3KNOXs+dzv59SHNPeDhcaBJ8
         hG8A+6wdHbVKPTRx+OWGiwWbA3DWYBsABEEVWBARkjieFAHPEy78wYRFDciazuqsqYGi
         buT7KNQXgE/O/WFJdRMt3CBSzGaiFYdDzlqihmkYHbUG4Xvka4Hvcl0HhzMWk+xuQ0rm
         i9e/1BQMMhqLB75CGfwS0wqOLoBuqR6UP7avtUQjd1WaI/ZOE1w2XBjq3i0KUARKOKyC
         6qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hBwHcbOLbODluezLkfU899o5k+HtfijYIO+0bx3J3EA=;
        b=W74v3DUu4pu0X678CIgL7I7abh7VHXcqWOEAlpRAkacow7VO3xQT0eelrMMIulTMuc
         HwyXVCq7TiFxjE2Q+VjG5AMtIyeQmlMfGoU2HhKHH0baIcksAq1cBAKAHyTmgjwERU7X
         e6gULCUiv5iGNhPr+Osy1ifsrrrfFkUCgcJh19TE7ZrY+TOGeRVWxCxjopReQ/lLWIT9
         4Aty0JK5AWKMB8jAvijNyQtUOnEVVkGQS8Z7xabl1VAk4nUddtcedBVNMbLjMdwrCYQf
         hbH1u3yPnG0e/tXzC1MfwVb70ziXNFMlgcmJcL/FSjrs5hAS4dtFMSFSAKUIxNkNPypi
         S/rQ==
X-Gm-Message-State: AOAM532pV3oHnccZMCieetFrQSRyxiGNzz4qIUZjlDxMCHPr2wOV3Lfn
        9ms8SOFcakIbhnvxhRQjblkPdQ==
X-Google-Smtp-Source: ABdhPJwzdvVbN3OacQ1pmlJ8L62kW98FhV72kJKnoUS3A5ZCROz0j1Fbum4pCtSepUiKK9joOPhWUg==
X-Received: by 2002:a63:6f4d:: with SMTP id k74mr5645320pgc.208.1640578687348;
        Sun, 26 Dec 2021 20:18:07 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id f20sm16446187pfe.166.2021.12.26.20.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 20:18:06 -0800 (PST)
Date:   Mon, 27 Dec 2021 09:48:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     rafael.j.wysocki@intel.com, rafael@kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, zhengbin13@huawei.com
Subject: Re: [PATCH] Documentation: power: Update outdated contents in opp.rst
Message-ID: <20211227041805.47cquwvyfaqco7bm@vireshk-i7>
References: <20211226081839.13948-1-tangyizhou@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211226081839.13948-1-tangyizhou@huawei.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26-12-21, 16:18, Tang Yizhou wrote:
> Three problems have been revised:
> 1. CONFIG_PM_OPP no longer depends on CONFIG_PM.
> 2. opp_find_freq_{ceil, floor} is renamed as dev_pm_opp_find_freq_{ceil,
>    floor}.
> 3. Make it clear that the 'opp' struct is actually dev_pm_opp.
> 
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  Documentation/power/opp.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied. Thanks.

-- 
viresh
