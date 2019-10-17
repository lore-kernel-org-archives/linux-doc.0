Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1860E7D917
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 20:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436894AbfJQURL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 16:17:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33826 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731007AbfJQURL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Oct 2019 16:17:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id b128so2356587pfa.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2019 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ofGJFITzq7+8vbxQSUKGGCUjUrfmHQGStzvLOkyKiXs=;
        b=AAS8hlkY+I6l43Mw/J/dsPGo1XhABdgHfowFi5scReMpiFSY/9Q5OsdOe8kxlvtRU9
         +PlspU1LVUSM2QTjj8YTgdln5gKrv5iJXZhDjQvb5JKmzh5PVR9fX5LL9ApuYcrCGmjl
         oWQnNv8BJnSHKwfSbjRYqpVb2lF6BbnWKLjR3dbLCgIXgjfYaNpWAB2atFD0JMIsWZ26
         HJ6AvdfifoNpw3lAjlKbuHrrMe+6c73SxPXcQlI0rm8RH6AujFuVrWteioiLu0SxNaXm
         uHXwAPP7YFJ2z7HSCqXmEQ7uD/DenqugMpF0FQEUvh9AZsDHYVJ2JqTvR1+CQEsPuyzu
         akfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ofGJFITzq7+8vbxQSUKGGCUjUrfmHQGStzvLOkyKiXs=;
        b=JFZAsqPYbHYIKq54zCMKS2M/7pkaHWi0E+qwHJMoclMPSwmH+wMNn25HxUnRSmT5cf
         3Z/e6MhzdsEfdikhNDonsAnLSi17LQBZ7NLyNBEZdPc5ujb5YQZrSQYqIzmC6pnsiHiv
         kjmcxG8WzpZhe0ZL/58z2eKyBWAmX6qTRdPZa0l/2fKrtlYOcPi6DkylszxExpnSatpX
         tAYW3Egxb1oSvQtdKDDoyZgO5CvrxWqVVKUiPTOCPVrJJqrc7Vew+kmyMfUY2DA1B9dx
         ZjycMxBDir6k6dohAlXAgA0eyfhmc0DxEPM4YFJDgdTdJYYxirScgDWq3XC2EPVKbHl+
         p9tA==
X-Gm-Message-State: APjAAAVSLG4abIqXynoh0Jq2K6ysPWURrfYshgexVzUTfUT/MV5ZQ8g0
        /mAVVpCc+wyHYkEcWiHoQkc+Vg==
X-Google-Smtp-Source: APXvYqx5pBJzpC1RW5OFSewc0MGoctOoaocgKQualnPldFL8Ka92ajSC7yt8FyqESkZsZb/5wmFZlA==
X-Received: by 2002:a17:90a:9dc5:: with SMTP id x5mr6666738pjv.85.1571343428709;
        Thu, 17 Oct 2019 13:17:08 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id f6sm3927504pfq.169.2019.10.17.13.17.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 13:17:08 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:17:06 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v3 08/11] coresight: etm4x: Add missing single-shot
 control API to sysfs
Message-ID: <20191017201705.GA16483@xps15>
References: <20191015212004.24748-1-mike.leach@linaro.org>
 <20191015212004.24748-9-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015212004.24748-9-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 15, 2019 at 10:20:01PM +0100, Mike Leach wrote:
> An API to control single-shot comparator operation was missing from sysfs.
> This adds the parameters to sysfs to allow programming of this feature.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../coresight/coresight-etm4x-sysfs.c         | 122 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-etm4x.c |  26 +++-
>  drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
>  3 files changed, 149 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index ca1a54411225..43b3f0976034 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -239,6 +239,7 @@ static ssize_t reset_store(struct device *dev,
>  	for (i = 0; i < drvdata->nr_resource; i++)
>  		config->res_ctrl[i] = 0x0;
>  
> +	config->ss_idx = 0x0;
>  	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
>  		config->ss_ctrl[i] = 0x0;
>  		config->ss_pe_cmp[i] = 0x0;
> @@ -1717,6 +1718,123 @@ static ssize_t res_ctrl_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(res_ctrl);
>  
> +static ssize_t sshot_idx_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	val = config->ss_idx;
> +	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +}
> +
> +static ssize_t sshot_idx_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t size)
> +{
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	if (kstrtoul(buf, 16, &val))
> +		return -EINVAL;
> +	if (val >= drvdata->nr_ss_cmp)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->spinlock);
> +	config->ss_idx = val;
> +	spin_unlock(&drvdata->spinlock);
> +	return size;
> +}
> +static DEVICE_ATTR_RW(sshot_idx);
> +
> +static ssize_t sshot_ctrl_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buf)
> +{
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	spin_lock(&drvdata->spinlock);
> +	val = config->ss_ctrl[config->ss_idx];
> +	spin_unlock(&drvdata->spinlock);
> +	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +}
> +
> +static ssize_t sshot_ctrl_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t size)
> +{
> +	u8 idx;
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	if (kstrtoul(buf, 16, &val))
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->spinlock);
> +	idx = config->ss_idx;
> +	config->ss_ctrl[idx] = val & GENMASK(24, 0);
> +	/* must clear bit 31 in related status register on programming */
> +	config->ss_status[idx] &= ~BIT(31);
> +	spin_unlock(&drvdata->spinlock);
> +	return size;
> +}
> +static DEVICE_ATTR_RW(sshot_ctrl);
> +
> +static ssize_t sshot_status_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	spin_lock(&drvdata->spinlock);
> +	val = config->ss_status[config->ss_idx];
> +	spin_unlock(&drvdata->spinlock);
> +	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(sshot_status);
> +
> +static ssize_t sshot_pe_ctrl_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	spin_lock(&drvdata->spinlock);
> +	val = config->ss_pe_cmp[config->ss_idx];
> +	spin_unlock(&drvdata->spinlock);
> +	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +}
> +
> +static ssize_t sshot_pe_ctrl_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t size)
> +{
> +	u8 idx;
> +	unsigned long val;
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct etmv4_config *config = &drvdata->config;
> +
> +	if (kstrtoul(buf, 16, &val))
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->spinlock);
> +	idx = config->ss_idx;
> +	config->ss_pe_cmp[idx] = val & GENMASK(7, 0);
> +	/* must clear bit 31 in related status register on programming */
> +	config->ss_status[idx] &= ~BIT(31);
> +	spin_unlock(&drvdata->spinlock);
> +	return size;
> +}
> +static DEVICE_ATTR_RW(sshot_pe_ctrl);
> +
>  static ssize_t ctxid_idx_show(struct device *dev,
>  			      struct device_attribute *attr,
>  			      char *buf)
> @@ -2173,6 +2291,10 @@ static struct attribute *coresight_etmv4_attrs[] = {
>  	&dev_attr_addr_exlevel_s_ns.attr,
>  	&dev_attr_addr_cmp_view.attr,
>  	&dev_attr_vinst_pe_cmp_start_stop.attr,
> +	&dev_attr_sshot_idx.attr,
> +	&dev_attr_sshot_ctrl.attr,
> +	&dev_attr_sshot_pe_ctrl.attr,
> +	&dev_attr_sshot_status.attr,
>  	&dev_attr_seq_idx.attr,
>  	&dev_attr_seq_state.attr,
>  	&dev_attr_seq_event.attr,
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index d5148afdbe80..dc3f507e7562 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -168,6 +168,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  			       drvdata->base + TRCRSCTLRn(i));
>  
>  	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +		/* always clear status bit on restart if using single-shot */
> +		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> +			config->ss_status[i] &= ~BIT(31);
>  		writel_relaxed(config->ss_ctrl[i],
>  			       drvdata->base + TRCSSCCRn(i));
>  		writel_relaxed(config->ss_status[i],
> @@ -467,6 +470,9 @@ static void etm4_disable_hw(void *info)
>  {
>  	u32 control;
>  	struct etmv4_drvdata *drvdata = info;
> +	struct etmv4_config *config = &drvdata->config;
> +	struct device *etm_dev = &drvdata->csdev->dev;
> +	int i;
>  
>  	CS_UNLOCK(drvdata->base);
>  
> @@ -489,6 +495,18 @@ static void etm4_disable_hw(void *info)
>  	isb();
>  	writel_relaxed(control, drvdata->base + TRCPRGCTLR);
>  
> +	/* wait for TRCSTATR.PMSTABLE to go to '1' */
> +	if (coresight_timeout(drvdata->base, TRCSTATR,
> +			      TRCSTATR_PMSTABLE_BIT, 1))
> +		dev_err(etm_dev,
> +			"timeout while waiting for PM stable Trace Status\n");
> +
> +	/* read the status of the single shot comparators */
> +	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +		config->ss_status[i] =
> +			readl_relaxed(drvdata->base + TRCSSCSRn(i));
> +	}
> +
>  	coresight_disclaim_device_unlocked(drvdata->base);
>  
>  	CS_LOCK(drvdata->base);
> @@ -595,6 +613,7 @@ static void etm4_init_arch_data(void *info)
>  	u32 etmidr4;
>  	u32 etmidr5;
>  	struct etmv4_drvdata *drvdata = info;
> +	int i;
>  
>  	/* Make sure all registers are accessible */
>  	etm4_os_unlock(drvdata);
> @@ -718,9 +737,14 @@ static void etm4_init_arch_data(void *info)
>  	drvdata->nr_resource = BMVAL(etmidr4, 16, 19) + 1;
>  	/*
>  	 * NUMSSCC, bits[23:20] the number of single-shot
> -	 * comparator control for tracing
> +	 * comparator control for tracing. Read any status regs as these
> +	 * also contain RO capability data.
>  	 */
>  	drvdata->nr_ss_cmp = BMVAL(etmidr4, 20, 23);
> +	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +		drvdata->config.ss_status[i] =
> +			readl_relaxed(drvdata->base + TRCSSCSRn(i));
> +	}
>  	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
>  	drvdata->numcidc = BMVAL(etmidr4, 24, 27);
>  	/* NUMVMIDC, bits[31:28] number of VMID comparators for tracing */
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index b873df38e7d8..4a695bf90582 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -227,6 +227,7 @@
>   * @cntr_val:	Sets or returns the value for a counter.
>   * @res_idx:	Resource index selector.
>   * @res_ctrl:	Controls the selection of the resources in the trace unit.
> + * @ss_idx:	Single-shot index selector.
>   * @ss_ctrl:	Controls the corresponding single-shot comparator resource.
>   * @ss_status:	The status of the corresponding single-shot comparator.
>   * @ss_pe_cmp:	Selects the PE comparator inputs for Single-shot control.
> @@ -270,6 +271,7 @@ struct etmv4_config {
>  	u32				cntr_val[ETMv4_MAX_CNTR];
>  	u8				res_idx;
>  	u32				res_ctrl[ETM_MAX_RES_SEL];
> +	u8				ss_idx;
>  	u32				ss_ctrl[ETM_MAX_SS_CMP];
>  	u32				ss_status[ETM_MAX_SS_CMP];
>  	u32				ss_pe_cmp[ETM_MAX_SS_CMP];

I have applied patches 4 to 8.  I will do the remaining patches tomorrow or
early next week.

Thanks,
Mathieu

> -- 
> 2.17.1
> 
