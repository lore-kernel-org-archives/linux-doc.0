Return-Path: <SRS0=3V3V=AK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44BAC433DF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Jun 2020 20:45:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81745206C0
	for <linux-doc@archiver.kernel.org>; Mon, 29 Jun 2020 20:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OQ0O/ji3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730428AbgF2Upy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731570AbgF2TN5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:13:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E395C014AA4
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 01:04:04 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z13so15535788wrw.5
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 01:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wJu5T05EGIesmOT82QcK4tvM42NAPTrHSyac4x7F7pM=;
        b=OQ0O/ji3YWaPUA5LVTl2z+7oIv8oHPXXajbTo7gN+ypY32l7m2S8IHDthtPNy8PmUI
         3/RB2boMvLnFXERxlvImDeRSrAmCnr84vqbj+hoK2UVr5jSFPlXCeqfbMYmnw1DtZoCz
         wfz1yX5KxVKQ6+reINQnT84GX4kzt3f1463mWC00vcmx89o7eIJH2WBtTTb6QhFyW9zQ
         hvK7Bmre+NIIGJTAvrlFsQZAcOAzcIg6D0DdL6rfZhqpV/wAzAA6fh29DpdZ9ZNAxsLf
         s3cb2tlXJHAcIrAd+N8AfFxDQm6sFD8UFJa97ojLl9pmTExTdys+BJ+NBS1K6M7wPhlo
         e2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wJu5T05EGIesmOT82QcK4tvM42NAPTrHSyac4x7F7pM=;
        b=nMeTundv/jkKV/LalukvdeeJzKXlRC8ec5zeh5MG/8brR1WfRZC0rDTJXR6Q6Ojsg0
         9BhMqzZzEX/w11cTaA/urtwCKJmcrTEmQnyAx1kDv4HnfqWknV/VFkvcvSJKpSl5HBre
         t6NNs3FFu+/afF6qC8ZabSg8K/SIsMS8/rrj0H5wMUjvhsakOJiKZMuyaZIRlV11soT5
         xCCvy4NZyWIqcdkR4UC5qs9GHrD1lYjC4LfZV/AUNIpkj+FieA6R46p4/kNsrdSoeNEw
         Xnr1cQzuIZJlvedlBWSdNp6LUzlbEZCwpgj0s86WxQlkJ5saDEO1PjAy7xIYSycEIa62
         XIlQ==
X-Gm-Message-State: AOAM532pmnQlgwJVr/G+5BGiQaHj8dj0Lx/iaNwdtuDIhqkfIqGrtQEo
        zCIN/UTv/lW1KeJfX1DIijls6Q==
X-Google-Smtp-Source: ABdhPJxjhHOLK/OLS+QpmEsbDw2KsR8ghE7pxziLY6KM8n7B0r5tY5LBX2zBH+b5fLJzKBlhjiImZg==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr16758755wru.115.1593417842938;
        Mon, 29 Jun 2020 01:04:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id a2sm31496362wrn.68.2020.06.29.01.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 01:04:02 -0700 (PDT)
Date:   Mon, 29 Jun 2020 09:03:58 +0100
From:   Quentin Perret <qperret@google.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel-team@android.com, tkjos@google.com, adharmap@codeaurora.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] cpufreq: Specify default governor on command line
Message-ID: <20200629080358.GA1217385@google.com>
References: <cover.1593143118.git.viresh.kumar@linaro.org>
 <7eb38608b2b32c0c72dfb160c51206ec42e74e35.1593143118.git.viresh.kumar@linaro.org>
 <20200626155750.GA540785@google.com>
 <20200629020843.erntkwfprgi5ugqu@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629020843.erntkwfprgi5ugqu@vireshk-i7>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday 29 Jun 2020 at 07:38:43 (+0530), Viresh Kumar wrote:
> On 26-06-20, 16:57, Quentin Perret wrote:
> > Do we need both cpufreq_param_governor and default_governor?
> > Could we move everything to only one of them? Something a little bit
> > like that maybe?
> 
> No because we want to fallback to the default governor when the
> governor shown by the cpufreq_param_governor is valid but missing.

But that would still work with my suggestion no? You still fallback to
calling cpufreq_default_governor() in cpufreq_init_policy() if
get_governor(default_governor) doesn't succeed, so we should be covered.

Thanks,
Quentin
