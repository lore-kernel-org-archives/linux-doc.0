Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92200C388F9
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 05:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EA1020729
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 05:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UPgyXL95"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgKKFO0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Nov 2020 00:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgKKFOZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 00:14:25 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9969C0613D1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 21:14:23 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id s35so96803pjd.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 21:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sul7TzPz5qF1XraO9vAG985VB9LlYhMpRl/uNls2UjU=;
        b=UPgyXL95q28Kgd5y6d93bt4A569RsW2McX9HlMQezIVbuFHdgFUecyO47PAmyrmTQ1
         u37QTkbuRqjAP52c2bu/EtjrNmaso1HkfRjYXojlzwABRJ3pGFKtEolAyVP2M2LhQCdw
         McX91JE3dV7dtbLXHF5lvIglLT7FwaHZB0uOfHKtS1sjp9opOJJ2Bb4Wr9MIfJMMi5+5
         U1DK+a/Dip5wE8riJwz+wmesvWH/1NFZXgfispH5TAAGLtWxYXNZIjp01HPwCf6R6Abv
         Ur9MhTe/ek+XHD8kzpQOaZ3ytC3FJwqLAAZusPs39q494zDvqwAc87wS7crysFA2Ic07
         5BPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sul7TzPz5qF1XraO9vAG985VB9LlYhMpRl/uNls2UjU=;
        b=PYXLT2xhqCQ8U1BWzE1/az094GbFlyQZBdiLVaPAW/w0JcaP0uhsLH1myimsti1nKU
         uEWY5C/IjN39E9xfTQ2DRl4Qtg73WnCIXMO3MUqM4uf9VQ73UqhrjoKnLOEvZTo+s/Ae
         yNLm+5/EquRkdDJTi6JdL8/vgdEO2qW5mF0sHwZMzH4dFPOCZdsHSt5v3IYC4CogJcyn
         2VgfVOkPZeOwjpzstlG//GR6LKOBHKqgdWYBT8OJH+qSU2lFuGEyeLXfbeuj3HH8vhvQ
         fEhYpbo6rYMkwoCphdS1kMosTsuB8zaKKN2QgmBJd/Ekj9Z3YRGOuSbHN+XuNbTMeicw
         uZEQ==
X-Gm-Message-State: AOAM532RN+nIvANBAHhdfMoNkW7TZzGiPBjJrNhUxoULLqhEFa2taEMO
        a/d9FX4irfsW8Am2fojs0KAT5A==
X-Google-Smtp-Source: ABdhPJwJzT/EbwsgNXsUfOzHkgAE5KhjmVJtC6toMBQcPdFliU6zf3qo2WyRHRlRIo42psh5F8tlzA==
X-Received: by 2002:a17:90b:351:: with SMTP id fh17mr2105299pjb.214.1605071663286;
        Tue, 10 Nov 2020 21:14:23 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id u197sm853670pfc.127.2020.11.10.21.14.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 21:14:22 -0800 (PST)
Date:   Wed, 11 Nov 2020 10:44:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Thomas Renninger <trenn@suse.com>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: stats: Switch to ktime and msec instead of
 jiffies and usertime
Message-ID: <20201111051420.wy7vapqx3gwcvzdw@vireshk-i7>
References: <0e0fb542b6f6b26944cb2cf356041348aeac95f6.1605006378.git.viresh.kumar@linaro.org>
 <5860b346-4eab-4018-87e4-a6313115fa2d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5860b346-4eab-4018-87e4-a6313115fa2d@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10-11-20, 11:36, Lukasz Luba wrote:
> I am not sure if these ktime_get() are not too heavy in the code path
> visited by the scheduler.

Ahh Right. I missed that.

> How about local_clock()?
> It's used in ./drivers/cpuidle/cpuidle.c to do similar accounting.

Will have a look.

-- 
viresh
