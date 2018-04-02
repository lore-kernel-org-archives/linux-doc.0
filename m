Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 605A57DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 20:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756804AbeDBUgJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 16:36:09 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:41004 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756412AbeDBUgI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 16:36:08 -0400
Received: by mail-pl0-f66.google.com with SMTP id bj1-v6so3237513plb.8
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 13:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U+gYwYEsk5Cnl+UDCu4TBUGdDz9cAC2GgRFKIj0Mx48=;
        b=Itxg5uSc8ZtIambOwWyLLcnN+ffGzV0sZL7UEnAK11Z9czRlvb/pPmheUZp5bFFjFX
         1gThIe5kQRwtHTqii9njjggOfF3iPWNp3A/D2JGh0uvLJoU82pxW27IQn3aB60ulYPbM
         adw0VaIt/YNLnYxO6AZ9YGhzZmeQlOwRVCDxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U+gYwYEsk5Cnl+UDCu4TBUGdDz9cAC2GgRFKIj0Mx48=;
        b=jH2vUyH02LLmcCpqXZdh5dQaMIPBJRMnujhKUq0b1wRvFmTDgHaplxAA9L2bdaACxg
         EMZ0ao/mbgXtK84ZXVqGC70nZFLXxLqqnly3Y0cm9uLC9U9sJmD7W9r+9fSWTXC/JeMO
         ZkwRuwQByiLCQnvTcGWY243YeS4IQGViSUcqqUfu3fi3zF/38WrntdZnwzbTdJhKwMYe
         AMbOBpt4avLHllr9d33ftn1lDNvBMaX/RldeSHl8RScCAaMl//3ROfrJvkpBgLD+n2EE
         KcWlU+vx6EOUeYzzH1rNp0EPYSZkujaEPuxnIh4Lg6pWctls+4pGK4bfAqHciWjL/t0P
         R7lQ==
X-Gm-Message-State: AElRT7FK7AXi1iZJSxkcQvkCVwnyOxsCzqTGauf7vZxnfBD7NCBM31r3
        Dbh4n2UGuuobYOoatezA0l77sQ==
X-Google-Smtp-Source: AIpwx4+U+ooFS55FzRW+rfQ20PoxbRJRuFS10W6Z7Mi3kecYptB0CQeq7tduj78qiFMmM6Lzet5Nvw==
X-Received: by 10.99.117.73 with SMTP id f9mr7317973pgn.242.1522701367401;
        Mon, 02 Apr 2018 13:36:07 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a9sm1814839pfn.158.2018.04.02.13.36.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Apr 2018 13:36:06 -0700 (PDT)
Date:   Mon, 2 Apr 2018 14:36:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v4 4/6] coresight: tmc: Hook callback for panic kdump
Message-ID: <20180402203604.GD15452@xps15>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
 <1522379724-30648-5-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522379724-30648-5-git-send-email-leo.yan@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 11:15:22AM +0800, Leo Yan wrote:
> Since Coresight panic kdump functionality has been ready, this patch is
> to hook panic callback function for ETB/ETF driver.  The driver data
> structure has allocated a buffer when the session started, so simply
> save tracing data into this buffer when panic happens and update buffer
> related info for kdump.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 30 +++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index e2513b7..d20d546 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -504,6 +504,35 @@ static void tmc_update_etf_buffer(struct coresight_device *csdev,
>  	CS_LOCK(drvdata->base);
>  }
>  
> +static void tmc_panic_cb(void *data)

I would call the function tmc_kdump_panic_cb()... That way there is absolutely
no confusion as to what it does.

> +{
> +	struct coresight_device *csdev = (struct coresight_device *)data;
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	unsigned long flags;
> +
> +	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
> +			 drvdata->config_type != TMC_CONFIG_TYPE_ETF))
> +		return;
> +
> +	if (drvdata->mode == CS_MODE_DISABLED)
> +		return;

This is racy - between the check and acquiring the spinlock someone may beat you
to it.

> +
> +	spin_lock_irqsave(&drvdata->spinlock, flags);

        if (drvdata->mode == CS_MODE_DISABLED)
                goto out;

        drvdata->mode = CS_MODE_DISABLED

> +
> +	CS_UNLOCK(drvdata->base);
> +
> +	tmc_flush_and_stop(drvdata);
> +	tmc_etb_dump_hw(drvdata);
> +
> +	CS_LOCK(drvdata->base);
> +
> +	/* Update buffer info for panic dump */
> +	csdev->kdump_buf = drvdata->buf;
> +	csdev->kdump_buf_sz = drvdata->len;

out:
> +
> +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +}
> +
>  static const struct coresight_ops_sink tmc_etf_sink_ops = {
>  	.enable		= tmc_enable_etf_sink,
>  	.disable	= tmc_disable_etf_sink,
> @@ -512,6 +541,7 @@ static const struct coresight_ops_sink tmc_etf_sink_ops = {
>  	.set_buffer	= tmc_set_etf_buffer,
>  	.reset_buffer	= tmc_reset_etf_buffer,
>  	.update_buffer	= tmc_update_etf_buffer,
> +	.panic_cb	= tmc_panic_cb,
>  };
>  
>  static const struct coresight_ops_link tmc_etf_link_ops = {
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
