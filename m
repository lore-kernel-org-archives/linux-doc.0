Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38C3D7D910
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 Oct 2019 16:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbfJRQUN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 Oct 2019 12:20:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34066 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbfJRQUN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Oct 2019 12:20:13 -0400
Received: by mail-pg1-f193.google.com with SMTP id k20so3654022pgi.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2019 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AfaDsoO7BDCXGgyE8y5qxoqYSMBNLuiSARlydbyM/90=;
        b=FTbgBZ5vtVNqpGtGdSBffTWWAIx3fnBiLdEpKNbpZA+54AMl6zQEr49O5HkIUH8f6O
         mBbfX4SP4T5L7t9akGbb/gte9X1407z6VyFcgTfEehvGYX+dJLiammsPWYOxLO9Eiy7T
         X1Rskbg6DJqCB4Ru3Omi1R6JN+DPpR9zbMrWfEKbLZjE1XqIYh0H4X+RKxNYniqLuXBv
         4unTBrr/Vv8u9xO4MsxqCxTq77sP0mE15qj9BAHwCo3aGYDlDrDW5dSAZ1rv09qOTZbq
         UDi+yHdNjpke0EqB6ndEtG97VZFoBtx4BzROPSEXK21RI1DG/jsCgU1SGBn/hLO5uQrf
         AmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AfaDsoO7BDCXGgyE8y5qxoqYSMBNLuiSARlydbyM/90=;
        b=nxZF9aEhveStPN5nYzR2TkJiexl/kUyO2zt7+BZoBdGCcjOn1/0f49FKOX/q8pYmAU
         ate5e4R3eshvZCnTDsQiFIxpCGeN9Vt5dPXM/ItpORXkvT5JC7rkje0q/4FYJAytEE6V
         6tyZJlSKT28VdxGNczZZtwTW/NfjQbU+ctaLl/3BhrXo/N5DuuZtNAdP2KFfs+gT0uEZ
         1WCroc4w0dJH08250Q8GltET9heFdI3MrxWjo/sil4D6OfLKh/kYA3fIqKCQy5hnhh9+
         6RiLB0cAbPIkQMef7iIy1kFhIZsV6kO3YLfJR3Mx71xSKc0cJzNdq7IarTMW/h3zmICJ
         PVoA==
X-Gm-Message-State: APjAAAV3jXWQKyRMLmcul4kjbMbH7DM9dIa0r8GxRcgFt64c9Hkism4g
        ph1cMwO5HJDeZ7f7ZOlinIWbvA==
X-Google-Smtp-Source: APXvYqxJ1HL+ziWwAjS4myLRHiFDTI9m8ZIK+FD2gmSTv14J9lcE2jG1nlETPvFeukkUFPioEtiG5Q==
X-Received: by 2002:a65:5541:: with SMTP id t1mr10923407pgr.39.1571415612233;
        Fri, 18 Oct 2019 09:20:12 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c4sm5751409pgd.3.2019.10.18.09.20.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:20:11 -0700 (PDT)
Date:   Fri, 18 Oct 2019 10:20:09 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v3 10/11] coresight: docs: Create common sub-directory
 for coresight trace.
Message-ID: <20191018162009.GB12883@xps15>
References: <20191015212004.24748-1-mike.leach@linaro.org>
 <20191015212004.24748-11-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015212004.24748-11-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 15, 2019 at 10:20:03PM +0100, Mike Leach wrote:
> There are two files in the Documentation/trace directory relating to
> coresight, with more to follow, so create a Documentation/trace/coresight
> directory and move existing files there. Update MAINTAINERS to reference
> this sub-directory rather than the individual files.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  Documentation/trace/{ => coresight}/coresight-cpu-debug.rst | 0
>  Documentation/trace/{ => coresight}/coresight.rst           | 2 +-
>  Documentation/trace/{ => coresight}/stm.rst                 | 0
>  MAINTAINERS                                                 | 3 +--
>  4 files changed, 2 insertions(+), 3 deletions(-)
>  rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
>  rename Documentation/trace/{ => coresight}/coresight.rst (99%)
>  rename Documentation/trace/{ => coresight}/stm.rst (100%)
> 
> diff --git a/Documentation/trace/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
> similarity index 100%
> rename from Documentation/trace/coresight-cpu-debug.rst
> rename to Documentation/trace/coresight/coresight-cpu-debug.rst
> diff --git a/Documentation/trace/coresight.rst b/Documentation/trace/coresight/coresight.rst
> similarity index 99%
> rename from Documentation/trace/coresight.rst
> rename to Documentation/trace/coresight/coresight.rst
> index 72f4b7ef1bad..835e8aa0bf8c 100644
> --- a/Documentation/trace/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -493,6 +493,6 @@ Details on how to use the generic STM API can be found here [#second]_.
>  
>  .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
>  
> -.. [#second] Documentation/trace/stm.rst
> +.. [#second] Documentation/trace/coresight/stm.rst
>  
>  .. [#third] https://github.com/Linaro/perf-opencsd
> diff --git a/Documentation/trace/stm.rst b/Documentation/trace/coresight/stm.rst
> similarity index 100%
> rename from Documentation/trace/stm.rst
> rename to Documentation/trace/coresight/stm.rst
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 296de2b51c83..f903160b507c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1608,8 +1608,7 @@ R:	Suzuki K Poulose <suzuki.poulose@arm.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/hwtracing/coresight/*
> -F:	Documentation/trace/coresight.rst
> -F:	Documentation/trace/coresight-cpu-debug.rst
> +F:	Documentation/trace/coresight/*
>  F:	Documentation/devicetree/bindings/arm/coresight.txt
>  F:	Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
>  F:	Documentation/ABI/testing/sysfs-bus-coresight-devices-*

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> -- 
> 2.17.1
> 
