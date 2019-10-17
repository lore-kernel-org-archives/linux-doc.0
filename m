Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF4C27DC63
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 17:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441170AbfJQR5A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 13:57:00 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42371 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437965AbfJQR47 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Oct 2019 13:56:59 -0400
Received: by mail-pf1-f195.google.com with SMTP id q12so2119660pff.9
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2019 10:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CV+kRLoR1meiyrf+iynYFFOG1S0zGKS8gpnt6rsIY7A=;
        b=IY5uWHEiURxMmzWrpoOVU6aBy3Coo+9JB4mSX+nU2b1QJuEcV3zK8dq+Go2wM2smT4
         kN++rlfzW4+7pMs7OUMhWp5WOon+L5NkmPozkcrdHib00r4C0SIm0JP2mjpJnAu2xRRm
         0Kk9WbAZqJDVqgCHzHk037FzgZ7edJJ47aGEKGYIyfPY8Suh9n16hGMF+XG8ew9c2Jpo
         XqCfPTs6tJ0rsFWDnGYH7//61Iu8MmLuPgAftzr4BWOB5SMtYawaBrD5LhmsQXNihNxt
         lBqr6UJi8Vk2MRzA7dma8jv1FkUYBvGEibXfY4OdbtoU1xMQsSaXP7GXZJKZKpQsktjF
         mT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CV+kRLoR1meiyrf+iynYFFOG1S0zGKS8gpnt6rsIY7A=;
        b=tQN58/KOyxZPvGCtSRMlXe8SbpjXWVHjOYeZWI/mFwtCWONe0zyNDu2UuOG8/8Rho1
         p4ZWl5BQy27S1pgfAhIzm3FtiSpHm63m58Mew9/dpVUtSWruf6OAd+vw/S5EAX3ApWtr
         SZBt1iXhxavtlutoadkPwOWNnmQZkYz3DEDFyHDecFICd/k1M7ojYPnwSNhd5QjFLT/t
         llkWFbZjZN8ep3aszGzgr08Bw0tSvzykGn30VhIuMcCylwFEft3pDDdtq1rtR0sxT6XR
         S7LjC83RW8qabQb+gF8HoHkA/r9v5f+iNJdYk/JSsiRTQSSKYArTzSrD9gQOoz7wwiRZ
         5Dvg==
X-Gm-Message-State: APjAAAV9S0SUIuLZQez0A6n3TiRptiKmk1JawqINbP5w99PDC1c/aT11
        f/pUV9wwzd+2x0iP8M2Yurnvqq3ZLWE=
X-Google-Smtp-Source: APXvYqxgud/7Z7xQxOExpPNrp+fBYK+PDvAZ7nvGRfXd+cFljZ/QqQUhHWdRosPfhUtc/oq+Vg9kQA==
X-Received: by 2002:a63:9208:: with SMTP id o8mr5435470pgd.256.1571335018455;
        Thu, 17 Oct 2019 10:56:58 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t125sm4584578pfc.80.2019.10.17.10.56.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 10:56:57 -0700 (PDT)
Date:   Thu, 17 Oct 2019 11:56:55 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com,
        stable <stable@vger.kernel.org>
Subject: Re: [PATCH v3 02/11] coresight: etm4x: Fix input validation for
 sysfs.
Message-ID: <20191017175655.GB17991@xps15>
References: <20191015212004.24748-1-mike.leach@linaro.org>
 <20191015212004.24748-3-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015212004.24748-3-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 15, 2019 at 10:19:55PM +0100, Mike Leach wrote:
> A number of issues are fixed relating to sysfs input validation:-
> 
> 1) bb_ctrl_store() - incorrect compare of bit select field to absolute
> value. Reworked per ETMv4 specification.
> 2) seq_event_store() - incorrect mask value - register has two
> event values.
> 3) cyc_threshold_store() - must mask with max before checking min
> otherwise wrapped values can set illegal value below min.
> 4) res_ctrl_store() - update to mask off all res0 bits.
> 
> Reviewed-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Fixes: a77de2637c9eb ("coresight: etm4x: moving sysFS entries to a dedicated file")
> Cc: stable <stable@vger.kernel.org> # 4.9+
> ---
>  .../coresight/coresight-etm4x-sysfs.c         | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index b6984be0c515..cc8156318018 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -652,10 +652,13 @@ static ssize_t cyc_threshold_store(struct device *dev,
>  
>  	if (kstrtoul(buf, 16, &val))
>  		return -EINVAL;
> +
> +	/* mask off max threshold before checking min value */
> +	val &= ETM_CYC_THRESHOLD_MASK;
>  	if (val < drvdata->ccitmin)
>  		return -EINVAL;
>  
> -	config->ccctlr = val & ETM_CYC_THRESHOLD_MASK;
> +	config->ccctlr = val;
>  	return size;
>  }
>  static DEVICE_ATTR_RW(cyc_threshold);
> @@ -686,14 +689,16 @@ static ssize_t bb_ctrl_store(struct device *dev,
>  		return -EINVAL;
>  	if (!drvdata->nr_addr_cmp)
>  		return -EINVAL;
> +
>  	/*
> -	 * Bit[7:0] selects which address range comparator is used for
> -	 * branch broadcast control.
> +	 * Bit[8] controls include(1) / exclude(0), bits[0-7] select
> +	 * individual range comparators. If include then at least 1
> +	 * range must be selected.
>  	 */
> -	if (BMVAL(val, 0, 7) > drvdata->nr_addr_cmp)
> +	if ((val & BIT(8)) && (BMVAL(val, 0, 7) == 0))
>  		return -EINVAL;
>  
> -	config->bb_ctrl = val;
> +	config->bb_ctrl = val & GENMASK(8, 0);
>  	return size;
>  }
>  static DEVICE_ATTR_RW(bb_ctrl);
> @@ -1324,8 +1329,8 @@ static ssize_t seq_event_store(struct device *dev,
>  
>  	spin_lock(&drvdata->spinlock);
>  	idx = config->seq_idx;
> -	/* RST, bits[7:0] */
> -	config->seq_ctrl[idx] = val & 0xFF;
> +	/* Seq control has two masks B[15:8] F[7:0] */
> +	config->seq_ctrl[idx] = val & 0xFFFF;
>  	spin_unlock(&drvdata->spinlock);
>  	return size;
>  }
> @@ -1580,7 +1585,7 @@ static ssize_t res_ctrl_store(struct device *dev,
>  	if (idx % 2 != 0)
>  		/* PAIRINV, bit[21] */
>  		val &= ~BIT(21);
> -	config->res_ctrl[idx] = val;
> +	config->res_ctrl[idx] = val & GENMASK(21, 0);
>  	spin_unlock(&drvdata->spinlock);
>  	return size;

This one too, no need to send again.

>  }
> -- 
> 2.17.1
> 
