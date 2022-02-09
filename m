Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB168C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Feb 2022 07:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239692AbiBIHuj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Feb 2022 02:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239765AbiBIHui (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Feb 2022 02:50:38 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C4FC05CB88
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 23:50:39 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id v4so1438992pjh.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 23:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QqKVxwbotUmQ2gv29/Ifw62O6CKJJcLZd1ZfJrEloTs=;
        b=YrWjB/wG3IOXIY6Z8JgawTYjBigvmgVdhNxoOC6JtZGS5wUpjHQMgB8hEh4plHCPcv
         jXcTLiXf2wgz3aDWwUYjVnjMQcuvAMTQiQJNRfbXibWcRZ9Kv++RjTlx5YFTSOnHIYCI
         oNJ1TZTXbkrwPGJGBbV4w6V+55Xk5lr0LnZkfb9Eg4H5E2oWF+4BOGo+CBdd9i9Erhtw
         aTqSz8gPPgG/JPNCDBtztu0KB3Q3Lxckl1pEL0SxI8RlzGXh6Q9eqQr1MIPZ8mq7WTGj
         WLnb9xw0aaeTmQfF3tiQ7PuwYsAYMasTK/AnTWXxnNkryOLnOecnydN+r4mazZFP9SmW
         N0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QqKVxwbotUmQ2gv29/Ifw62O6CKJJcLZd1ZfJrEloTs=;
        b=y4hik8cpYKMGMXPAKJd9KKM48TRzE4MBW7VCo48DF6Cfg3tziZJdPH1w8KMofqfpSu
         x/l9WGNzPunWax1HxSd+uhBA0Y6bvDApuf1JUbLlrD9KpQwt5tuEyH9KtDxDdtoFr+89
         YwkgvIyp6EuyF3bosltQrxdnR/w5JXc7MnUGvcnB2bKS3026wv1btPWpqRYUMPVT1qaq
         AT9bDAVkkuASPyFDrlhPGa03ORSCCo7iBDyPh6v/DZkKap412WX5jo1dKGZZD/DyAG8n
         J+FIxhoGuGb3DPtJVjL6hgc3/6mvJjnx6F63u0iGCE+XFLRUscl98IoA87hvbKPmkIjd
         2rrw==
X-Gm-Message-State: AOAM533rMfU8aYG+Dtn5IbLdcsV2ZZ5VTiUL3IJ4DKA+18ZiSkaBINJn
        3x6MKOSRlmMHk/Y7PFX/sQ0XfA==
X-Google-Smtp-Source: ABdhPJxHZmmgiaaNf2b9aVXUBOyF81jNaxOQCqlMvp4GxTrwPFzrUzWX5hCSHHRS8CqFK6TypgkHHg==
X-Received: by 2002:a17:902:9694:: with SMTP id n20mr992799plp.125.1644393038849;
        Tue, 08 Feb 2022 23:50:38 -0800 (PST)
Received: from localhost ([136.185.132.167])
        by smtp.gmail.com with ESMTPSA id p1sm19731256pfh.98.2022.02.08.23.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 23:50:38 -0800 (PST)
Date:   Wed, 9 Feb 2022 13:20:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] cpufreq: Reintroduce ready() callback
Message-ID: <20220209075036.rpgzynwyjnfkbsbz@vireshk-i7>
References: <20220128032554.155132-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128032554.155132-1-bjorn.andersson@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27-01-22, 19:25, Bjorn Andersson wrote:
> This effectively revert '4bf8e582119e ("cpufreq: Remove ready()
> callback")' (except the Chinese translation), in order to reintroduce
> the ready callback.

I have added the Chinese translation back and applied both patches. Thanks.

-- 
viresh
