Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_SORBS_WEB autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E45977D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Jan 2019 04:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfACEFu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 23:05:50 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43056 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfACEFu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 23:05:50 -0500
Received: by mail-pg1-f194.google.com with SMTP id v28so15428358pgk.10
        for <linux-doc@vger.kernel.org>; Wed, 02 Jan 2019 20:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JmAMGJjbEFUPnx8DvRbshnXJTlBhiy6DyguNEsgLwy8=;
        b=d3toxlsEWaTM6cQSgoT4SikTmtF41ajWQc3Etgu5pwM8gA9mj53knElJ3h2Kn0akGA
         kua0Crfx5uHRnxdIWpN8AwLyoL0cy7J8WX5SfWdlcOig5OEN1gbgHSnBCC7vyZyziAih
         ZBwjwnFyBwmZDfezQUXu7hxY20/VA4SQOQlAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JmAMGJjbEFUPnx8DvRbshnXJTlBhiy6DyguNEsgLwy8=;
        b=CqckrapcHIidGnmCbQ50YahQHAPNX6ptntdJWePIs5skrYGkV/UpR+JlSFV36tYeyc
         ZYBHzuETdjN6rghsFXQgBWWL34Tw+nPja6e2yczL7r0Q1RzLGK34Or8Iaq4iVDZ5wbNe
         93+FUSiiXZWRgVQn3Z1dmioOlB97fxVwGlrv82yOCZLEU82Cm9JCDVCn0dN38Nyb0Riq
         2LA7jAOTbVt0GdHwT52N54fLXkBF2F4Q1qoUZVgyl/wFOfm4mv7s8Ib8oxKKg3Ur7ehG
         QnbnpyTs1W41eKBM8sFiKZqL0u3YNp/WYy4JuonCbkzMA7igVU8eZM0QXTM0JMa/tCxs
         Am5Q==
X-Gm-Message-State: AA+aEWYF+4hefg+8hi0OhuF+LM7J4Z4kyD2jlSW0qCKv+aWDQCWJyvzi
        BtiYzOtKJQEGmn5FzC9TrrA+zQ==
X-Google-Smtp-Source: AFSGD/XTtfrNIruOc5jNb6iakAaXp140Rq3MM5fVVRHyLgF6gXNyIyarybEgmO5lkU+GTmkDyTcogg==
X-Received: by 2002:a62:61c3:: with SMTP id v186mr47245662pfb.55.1546488349386;
        Wed, 02 Jan 2019 20:05:49 -0800 (PST)
Received: from localhost ([122.166.131.155])
        by smtp.gmail.com with ESMTPSA id z9sm153089019pfd.99.2019.01.02.20.05.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jan 2019 20:05:48 -0800 (PST)
Date:   Thu, 3 Jan 2019 09:35:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] cpufreq / Documentation: Update cpufreq MAINTAINERS entry
Message-ID: <20190103040546.akeyvennctxnfcw7@vireshk-i7>
References: <7154380.sNYZWJVSaJ@aspire.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7154380.sNYZWJVSaJ@aspire.rjw.lan>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02-01-19, 12:13, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Update the MAINTAINERS entry for cpufreq by making it clear that it
> is not just drivers and adding current documentation records to it.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  MAINTAINERS |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Index: linux-pm/MAINTAINERS
> ===================================================================
> --- linux-pm.orig/MAINTAINERS
> +++ linux-pm/MAINTAINERS
> @@ -3888,7 +3888,7 @@ L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/ethernet/ti/cpmac.c
>  
> -CPU FREQUENCY DRIVERS
> +CPU FREQUENCY SCALING FRAMEWORK
>  M:	"Rafael J. Wysocki" <rjw@rjwysocki.net>
>  M:	Viresh Kumar <viresh.kumar@linaro.org>
>  L:	linux-pm@vger.kernel.org
> @@ -3896,6 +3896,8 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
>  T:	git git://git.linaro.org/people/vireshk/linux.git (For ARM Updates)
>  B:	https://bugzilla.kernel.org
> +F:	Documentation/admin-guide/pm/cpufreq.rst
> +F:	Documentation/admin-guide/pm/intel_pstate.rst
>  F:	Documentation/cpu-freq/
>  F:	Documentation/devicetree/bindings/cpufreq/
>  F:	drivers/cpufreq/

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
