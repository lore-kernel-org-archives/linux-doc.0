Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F0277D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 18:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390125AbfJQSAi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 14:00:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46948 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfJQSAi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Oct 2019 14:00:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id e15so1767595pgu.13
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2019 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ToCE10/No6jJLIJ3g4BFJ/Azu6H7pIF5txzafJLRqpY=;
        b=NsFLwd0rgG+YrVVf9sUIC3v01ZiefqbHoZSeMhGo08M91vGRqHeucfBGTbn4D2s/oT
         +YzGZ1AMeuKnAh0Loz5Ji1LuUAVsdtXKKyEIacqTF/YDiCNmUwqgtgYctJVvNmBBnd4V
         9ZGnFM1WlNG+lImz7Dre7FAhWoCYkIq8Zdae/XAsRnWoBwiA2bkEaF4EppfeuBNLeUqY
         Cb8yG42vXMCqxN1/pJmNB9nj7NUgOdGYl90xpurWj4C23gpVwCqkUc48psVftcfQj76q
         plqiDMERAhxFzVklVusNtcHBcEb2EhpSe5eDr0TzouEmLp3JMqXgy+P8FX9GhXPzpZoj
         +AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ToCE10/No6jJLIJ3g4BFJ/Azu6H7pIF5txzafJLRqpY=;
        b=k/CKKqf41F4YNH4dvZCbGDdqZ+UaxthBRbtpt25BVUsRlPrbaskV6z6ShpmJlzetXj
         z/TK4jdVqKFm3oLQ/BVvLjZzFliTfneO8E5/r1t3jzie7hr62YiO4wC29tzBY1iLKh1Q
         fyJxWj6gxfeRkM7rWaYtlaraAPZkYz64cVNjvxrmgeCPm44d4XLMgd8KcGJT3nxbpnWa
         HRxMmlalF1fOIBXpYfNqV5yF0HrZNwy7vH5cQzwOq2PX8tE1wanoS86HRNyAyvCXe4BC
         rfU1Skb3KoWiElWQ+hiN9fM04eNJRpk0kuL4PAvYp5392wnDAh1/v5uEq2Pw056ETfFV
         S/LQ==
X-Gm-Message-State: APjAAAUhOFdSsfGCWxQPMIZhGCQfueYLaEnGdQg9pAdV24WPO+xWkq1W
        oLbhzsaKwkSh6aLzkAF373pEPQ==
X-Google-Smtp-Source: APXvYqwSZ5VwkOrc4Tmg7HP7z4Fnd/FGqOiQbf3KY2eiEeXBpjdvtvUyJ4ico8Mq5Uj6x+i7hlK80w==
X-Received: by 2002:a63:710:: with SMTP id 16mr5587646pgh.329.1571335237737;
        Thu, 17 Oct 2019 11:00:37 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q204sm3610512pfc.11.2019.10.17.11.00.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:00:37 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:00:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v3 03/11] coresight: etm4x: Add missing API to set EL
 match on address filters
Message-ID: <20191017180035.GC17991@xps15>
References: <20191015212004.24748-1-mike.leach@linaro.org>
 <20191015212004.24748-4-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015212004.24748-4-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 15, 2019 at 10:19:56PM +0100, Mike Leach wrote:
> TRCACATRn registers have match bits for secure and non-secure exception
> levels which are not accessible by the sysfs API.
> This adds a new sysfs parameter to enable this - addr_exlevel_s_ns.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../coresight/coresight-etm4x-sysfs.c         | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index cc8156318018..45fa7743eea4 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1233,6 +1233,47 @@ static ssize_t addr_context_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(addr_context);
>  
> +static ssize_t addr_exlevel_s_ns_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	u8 idx;
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	spin_lock(&drvdata->spinlock);
> +	idx = config->addr_idx;
> +	val = BMVAL(config->addr_acc[idx], 14, 8);
> +	spin_unlock(&drvdata->spinlock);
> +	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +}
> +
> +static ssize_t addr_exlevel_s_ns_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t size)
> +{
> +	u8 idx;
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val & ~((GENMASK(14, 8) >> 8))

This patch isn't compiling for me.  A parenthesis is missing to close the if().


> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->spinlock);
> +	idx = config->addr_idx;
> +	/* clear Exlevel_ns & Exlevel_s bits[14:12, 11:8], bit[15] is res0 */
> +	config->addr_acc[idx] &= ~(GENMASK(14, 8));
> +	config->addr_acc[idx] |= (val << 8);
> +	spin_unlock(&drvdata->spinlock);
> +	return size;
> +}
> +static DEVICE_ATTR_RW(addr_exlevel_s_ns);
> +
>  static ssize_t seq_idx_show(struct device *dev,
>  			    struct device_attribute *attr,
>  			    char *buf)
> @@ -2038,6 +2079,7 @@ static struct attribute *coresight_etmv4_attrs[] = {
>  	&dev_attr_addr_stop.attr,
>  	&dev_attr_addr_ctxtype.attr,
>  	&dev_attr_addr_context.attr,
> +	&dev_attr_addr_exlevel_s_ns.attr,
>  	&dev_attr_seq_idx.attr,
>  	&dev_attr_seq_state.attr,
>  	&dev_attr_seq_event.attr,
> -- 
> 2.17.1
> 
