Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2B717D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Sep 2019 09:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbfIQJbs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Sep 2019 05:31:48 -0400
Received: from foss.arm.com ([217.140.110.172]:53516 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbfIQJbs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Sep 2019 05:31:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EB1528;
        Tue, 17 Sep 2019 02:31:47 -0700 (PDT)
Received: from dawn-kernel.cambridge.arm.com (unknown [10.1.197.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A414A3F59C;
        Tue, 17 Sep 2019 02:31:46 -0700 (PDT)
Subject: Re: [PATCH v2 03/11] coresight: etm4x: Add missing API to set EL
 match on address filters
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org
References: <20190829213321.4092-1-mike.leach@linaro.org>
 <20190829213321.4092-4-mike.leach@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <b077b91a-fd92-a453-2e60-ad7079b5fb2b@arm.com>
Date:   Tue, 17 Sep 2019 10:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829213321.4092-4-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mike,

On 29/08/2019 22:33, Mike Leach wrote:
> TRCACATRn registers have match bits for secure and non-secure exception
> levels which are not accessible by the sysfs API.
> This adds a new sysfs parameter to enable this - addr_exlevel_s_ns.
> 

Looks good to me. Some minor nits below.

> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>   .../coresight/coresight-etm4x-sysfs.c         | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index cc8156318018..b520f3c1521f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1233,6 +1233,47 @@ static ssize_t addr_context_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(addr_context);
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
> +	if (kstrtoul(buf, 16, &val))
> +		return -EINVAL;

Can this be 0 instead of 16 to accept any base ?

> +
> +	if (val & ~0x7F)

minor nit: Do we need to use (GENMASK(14, 8) >> 8)  here instead of
hard coding the mask ?

> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->spinlock);
> +	idx = config->addr_idx;
> +	/* clear Exlevel_ns & Exlevel_s bits[14:12, 11:8] */

It may be worth adding a comment that bit[15] is RES0.

> +	config->addr_acc[idx] &= ~(GENMASK(14, 8));
> +	config->addr_acc[idx] |= (val << 8);
> +	spin_unlock(&drvdata->spinlock);
> +	return size;
> +}
> +static DEVICE_ATTR_RW(addr_exlevel_s_ns);
> +
>   static ssize_t seq_idx_show(struct device *dev,
>   			    struct device_attribute *attr,
>   			    char *buf)
> @@ -2038,6 +2079,7 @@ static struct attribute *coresight_etmv4_attrs[] = {
>   	&dev_attr_addr_stop.attr,
>   	&dev_attr_addr_ctxtype.attr,
>   	&dev_attr_addr_context.attr,
> +	&dev_attr_addr_exlevel_s_ns.attr,
>   	&dev_attr_seq_idx.attr,
>   	&dev_attr_seq_state.attr,
>   	&dev_attr_seq_event.attr,


Either ways, irrespective of the above comments :

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
