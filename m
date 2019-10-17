Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1DB8D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 17:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394905AbfJQRzM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 13:55:12 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32827 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394904AbfJQRzM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Oct 2019 13:55:12 -0400
Received: by mail-pg1-f194.google.com with SMTP id i76so1797177pgc.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2019 10:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xMgNa2J6ls/HD5ayqGJcA+YAUgf8k0JYvaclXJ7zCwI=;
        b=QI6kGDRkARPKQR/ErDbRYxcKV+DHgK5LPrYvrEnmPzjZm7O0gVd0TuaYBe8ZzKxCQa
         K1cB05AJbmv5MyyNu/xCocJ9EWT58H7/qKp1LTMAlKzzkbSVw8lMB3+6y8IT7IIcy6E2
         45w6BwFy2O1mYlNKZIYBbdvRNHVL++K9IS9vNd8orcDP7ic2kcuv+CZXnsUl1IHo/IZY
         rxCU8wPrqp741TTcwHmmPHPkTzrCD9h7nWjA3IUAtoJo69vCaGlEGhLTEe+Xs66Z/hwf
         SGQzgVESI4AsJ4J4kUmT1ONGIaoyrpInCy9PntgYp1e1D0erCSiRXrF+JxkHDp6raQAV
         pzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xMgNa2J6ls/HD5ayqGJcA+YAUgf8k0JYvaclXJ7zCwI=;
        b=tbVo1SGMC40h352YFAKBR2A2rUf7BIAX8iHSIIvUUD/8ktAKpOJpR8Tr+yyPFmxh0v
         8HoKVVsHbqyHVlKdfjj2pVd8X5xlg22p94n9+XidMhgKkWSGd8xyuP49JaaCcV13Eeub
         0zOFD+2dKQ/adLzBDI8a10x6A9GrUUhLfS3mM2jNl51vcv+7RCRS/l/ZoE2nfdlbeQKe
         /5CSFe5xuwPbSLcBdBLoCkj54Ay27uYxdU+oSKO4gXWLNMlovdW4PF8xDTsZlabcvyXv
         RZscuxFJAWRKh8WTYmSgVbI8hNSVTYHWgXlEZLC/g8ANMtnuWq/HwkzFpdwjURFJT9/P
         tYVw==
X-Gm-Message-State: APjAAAX1hIleCHyQKc5vYPZEXYiO8686qdqm7qeeiZ02CnrRsgsC+TH7
        PWck+d2F1hZFyV7swaWz24vPDA==
X-Google-Smtp-Source: APXvYqytRKs044Y0qrtLrIYszwSdvByHnqImd00Ux1wjxvpJfnDsPMGI8argRmHnrWK18d+c1rzdHg==
X-Received: by 2002:aa7:8a84:: with SMTP id a4mr1490876pfc.99.1571334911350;
        Thu, 17 Oct 2019 10:55:11 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k66sm3348801pjb.11.2019.10.17.10.55.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 10:55:10 -0700 (PDT)
Date:   Thu, 17 Oct 2019 11:55:08 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v3 01/11] coresight: etm4x: Fixes for ETM v4.4
 architecture updates.
Message-ID: <20191017175508.GA17991@xps15>
References: <20191015212004.24748-1-mike.leach@linaro.org>
 <20191015212004.24748-2-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015212004.24748-2-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mike,

On Tue, Oct 15, 2019 at 10:19:54PM +0100, Mike Leach wrote:
> ETMv4.4 adds in support for tracing secure EL2 (per arch 8.x updates).
> Patch accounts for this new capability.
> 
> Reviewed-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../hwtracing/coresight/coresight-etm4x-sysfs.c   | 12 ++++++------
>  drivers/hwtracing/coresight/coresight-etm4x.c     |  5 ++++-
>  drivers/hwtracing/coresight/coresight-etm4x.h     | 15 +++++++++++----
>  3 files changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index 219c10eb752c..b6984be0c515 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -738,7 +738,7 @@ static ssize_t s_exlevel_vinst_show(struct device *dev,
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	struct etmv4_config *config = &drvdata->config;
>  
> -	val = BMVAL(config->vinst_ctrl, 16, 19);
> +	val = (config->vinst_ctrl & ETM_EXLEVEL_S_VICTLR_MASK) >> 16;
>  	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>  }
>  
> @@ -754,8 +754,8 @@ static ssize_t s_exlevel_vinst_store(struct device *dev,
>  		return -EINVAL;
>  
>  	spin_lock(&drvdata->spinlock);
> -	/* clear all EXLEVEL_S bits (bit[18] is never implemented) */
> -	config->vinst_ctrl &= ~(BIT(16) | BIT(17) | BIT(19));
> +	/* clear all EXLEVEL_S bits  */
> +	config->vinst_ctrl &= ~(ETM_EXLEVEL_S_VICTLR_MASK);
>  	/* enable instruction tracing for corresponding exception level */
>  	val &= drvdata->s_ex_level;
>  	config->vinst_ctrl |= (val << 16);
> @@ -773,7 +773,7 @@ static ssize_t ns_exlevel_vinst_show(struct device *dev,
>  	struct etmv4_config *config = &drvdata->config;
>  
>  	/* EXLEVEL_NS, bits[23:20] */
> -	val = BMVAL(config->vinst_ctrl, 20, 23);
> +	val = (config->vinst_ctrl & ETM_EXLEVEL_NS_VICTLR_MASK) >> 20;
>  	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>  }
>  
> @@ -789,8 +789,8 @@ static ssize_t ns_exlevel_vinst_store(struct device *dev,
>  		return -EINVAL;
>  
>  	spin_lock(&drvdata->spinlock);
> -	/* clear EXLEVEL_NS bits (bit[23] is never implemented */
> -	config->vinst_ctrl &= ~(BIT(20) | BIT(21) | BIT(22));
> +	/* clear EXLEVEL_NS bits  */
> +	config->vinst_ctrl &= ~(ETM_EXLEVEL_NS_VICTLR_MASK);
>  	/* enable instruction tracing for corresponding exception level */
>  	val &= drvdata->ns_ex_level;
>  	config->vinst_ctrl |= (val << 20);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 8f98701cadc5..efe120925f9d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -648,6 +648,7 @@ static void etm4_init_arch_data(void *info)
>  	 * TRCARCHMAJ, bits[11:8] architecture major versin number
>  	 */
>  	drvdata->arch = BMVAL(etmidr1, 4, 11);
> +	drvdata->config.arch = drvdata->arch;
>  
>  	/* maximum size of resources */
>  	etmidr2 = readl_relaxed(drvdata->base + TRCIDR2);
> @@ -799,6 +800,7 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
>  static u64 etm4_get_access_type(struct etmv4_config *config)
>  {
>  	u64 access_type = etm4_get_ns_access_type(config);
> +	u64 s_hyp = (config->arch & 0x0f) >= 0x4 ? ETM_EXLEVEL_S_HYP : 0;
>  
>  	/*
>  	 * EXLEVEL_S, bits[11:8], don't trace anything happening
> @@ -806,7 +808,8 @@ static u64 etm4_get_access_type(struct etmv4_config *config)
>  	 */
>  	access_type |= (ETM_EXLEVEL_S_APP	|
>  			ETM_EXLEVEL_S_OS	|
> -			ETM_EXLEVEL_S_HYP);
> +			s_hyp			|
> +			ETM_EXLEVEL_S_MON);
>  
>  	return access_type;
>  }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 546d790cb01b..b873df38e7d8 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -181,17 +181,22 @@
>  /* PowerDown Control Register bits */
>  #define TRCPDCR_PU			BIT(3)
>  
> -/* secure state access levels */
> +/* secure state access levels - TRCACATRn */
>  #define ETM_EXLEVEL_S_APP		BIT(8)
>  #define ETM_EXLEVEL_S_OS		BIT(9)
> -#define ETM_EXLEVEL_S_NA		BIT(10)
> -#define ETM_EXLEVEL_S_HYP		BIT(11)
> -/* non-secure state access levels */
> +#define ETM_EXLEVEL_S_HYP		BIT(10)
> +#define ETM_EXLEVEL_S_MON		BIT(11)
> +/* non-secure state access levels - TRCACATRn */
>  #define ETM_EXLEVEL_NS_APP		BIT(12)
>  #define ETM_EXLEVEL_NS_OS		BIT(13)
>  #define ETM_EXLEVEL_NS_HYP		BIT(14)
>  #define ETM_EXLEVEL_NS_NA		BIT(15)
>  
> +/* secure / non secure masks - TRCVICTLR, IDR3 */
> +#define ETM_EXLEVEL_S_VICTLR_MASK	GENMASK(19, 16)
> +/* NS MON (EL3) mode never implemented */
> +#define ETM_EXLEVEL_NS_VICTLR_MASK	GENMASK(22, 20)
> +
>  /**
>   * struct etmv4_config - configuration information related to an ETMv4
>   * @mode:	Controls various modes supported by this ETM.
> @@ -238,6 +243,7 @@
>   * @vmid_mask0:	VM ID comparator mask for comparator 0-3.
>   * @vmid_mask1:	VM ID comparator mask for comparator 4-7.
>   * @ext_inp:	External input selection.
> + * @arch:	ETM architecture version (for arch dependent config).
>   */
>  struct etmv4_config {
>  	u32				mode;
> @@ -280,6 +286,7 @@ struct etmv4_config {
>  	u32				vmid_mask0;
>  	u32				vmid_mask1;
>  	u32				ext_inp;
> +	u8				arch;
>  };

I am applying this patch, no need to send it again.

>  
>  /**
> -- 
> 2.17.1
> 
