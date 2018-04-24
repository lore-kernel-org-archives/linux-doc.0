Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 80DC87E677
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 13:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932845AbeDXNBi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 09:01:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:51789 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932502AbeDXNBi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Apr 2018 09:01:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Apr 2018 06:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,323,1520924400"; 
   d="scan'208";a="34250263"
Received: from jqi-mobl2.ccr.corp.intel.com ([10.249.169.96])
  by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2018 06:01:35 -0700
Message-ID: <1524574894.2597.27.camel@intel.com>
Subject: Re: [PATCH] thermal: core: fix emulation of subzero temps
From:   Zhang Rui <rui.zhang@intel.com>
To:     Kevin DuBois <kevindubois@google.com>, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, corbet@lwn.net, edubezval@gmail.com
Date:   Tue, 24 Apr 2018 21:01:34 +0800
In-Reply-To: <20180423175340.32598-1-kevindubois@google.com>
References: <20180423175340.32598-1-kevindubois@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 一, 2018-04-23 at 10:53 -0700, Kevin DuBois wrote:
> The current implementation casted away its sign.
> It was also using '0' to disable emulation, but 0C is a valid
> thermal reading. A large negative value (below absolute zero) now
> disables the emulation.

Makes sense to me.
> 
> Test: Build kernel with CONFIG_THERMAL_EMULATION=y, then write
> negative
> values to the emul_temp sysfs entry. Check the temp entry, and see
> the
> negative value. Write -INT_MAX to emul_temp, and see the proper
> sensor
> reading appear.
> Bug: 77599739

can you paste the bug link here?

> Signed-off-by: Kevin DuBois <kevindubois@google.com>
> 
> Change-Id: Iee1a4f0aacf7b4299b67c7f8f4effedf2d7a8425
> ---
>  Documentation/thermal/sysfs-api.txt |  2 +-
>  drivers/thermal/thermal_core.c      | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/thermal/sysfs-api.txt
> b/Documentation/thermal/sysfs-api.txt
> index 10f062ea6bc2..e240d9e165a0 100644
> --- a/Documentation/thermal/sysfs-api.txt
> +++ b/Documentation/thermal/sysfs-api.txt
> @@ -312,7 +312,7 @@ emul_temp
>  	this temperature to platform emulation function if
> registered or
>  	cache it locally. This is useful in debugging different
> temperature
>  	threshold and its associated cooling action. This is write
> only node
> -	and writing 0 on this node should disable emulation.
> +	and writing -INT_MAX on this node should disable emulation.

This is an ABI change. I'm not sure if there is any userspace tool
depends on this.
could you please resend the bug with a real bug link, and I will keep
it in my tree for a longer period to see if there is any objections.

thanks,
rui
>  	Unit: millidegree Celsius
>  	WO, Optional
>  
> diff --git a/drivers/thermal/thermal_core.c
> b/drivers/thermal/thermal_core.c
> index 768783ab3dac..650a6b124fc7 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -636,8 +636,8 @@ int get_tz_trend(struct thermal_zone_device *tz,
> int trip)
>  {
>  	enum thermal_trend trend;
>  
> -	if (tz->emul_temperature || !tz->ops->get_trend ||
> -	    tz->ops->get_trend(tz, trip, &trend)) {
> +	if ((tz->emul_temperature > THERMAL_TEMP_INVALID) ||
> +		!tz->ops->get_trend || tz->ops->get_trend(tz, trip,
> &trend)) {
>  		if (tz->temperature > tz->last_temperature)
>  			trend = THERMAL_TREND_RAISING;
>  		else if (tz->temperature < tz->last_temperature)
> @@ -904,7 +904,8 @@ int thermal_zone_get_temp(struct
> thermal_zone_device *tz, int *temp)
>  
>  	ret = tz->ops->get_temp(tz, temp);
>  
> -	if (IS_ENABLED(CONFIG_THERMAL_EMULATION) && tz-
> >emul_temperature) {
> +	if (IS_ENABLED(CONFIG_THERMAL_EMULATION) &&
> +		(tz->emul_temperature > THERMAL_TEMP_INVALID)) {
>  		for (count = 0; count < tz->trips; count++) {
>  			ret = tz->ops->get_trip_type(tz, count,
> &type);
>  			if (!ret && type == THERMAL_TRIP_CRITICAL) {
> @@ -961,6 +962,7 @@ static void thermal_zone_device_reset(struct
> thermal_zone_device *tz)
>  	struct thermal_instance *pos;
>  
>  	tz->temperature = THERMAL_TEMP_INVALID;
> +	tz->emul_temperature = THERMAL_TEMP_INVALID;
>  	tz->passive = 0;
>  	list_for_each_entry(pos, &tz->thermal_instances, tz_node)
>  		pos->initialized = false;
> @@ -1351,9 +1353,9 @@ emul_temp_store(struct device *dev, struct
> device_attribute *attr,
>  {
>  	struct thermal_zone_device *tz = to_thermal_zone(dev);
>  	int ret = 0;
> -	unsigned long temperature;
> +	int temperature;
>  
> -	if (kstrtoul(buf, 10, &temperature))
> +	if (kstrtoint(buf, 10, &temperature))
>  		return -EINVAL;
>  
>  	if (!tz->ops->set_emul_temp) {
> @@ -2296,6 +2298,7 @@ struct thermal_zone_device
> *thermal_zone_device_register(const char *type,
>  	tz->trips = trips;
>  	tz->passive_delay = passive_delay;
>  	tz->polling_delay = polling_delay;
> +	tz->emul_temperature = THERMAL_TEMP_INVALID;
>  	/* A new thermal zone needs to be updated anyway. */
>  	atomic_set(&tz->need_update, 1);
>  
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
