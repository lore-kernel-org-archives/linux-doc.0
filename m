Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB3BB7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 18:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752857AbeFASyP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 14:54:15 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:33470 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752360AbeFASyO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 14:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7LOglo/T2CUbOuquioJS+YH/5wmbEvR8ydOOCGZB9lk=; b=zywBcBQhHd1lW2TDgiBfZ0DSLX
        Sor9jR1ztWEMcOLzYuMewrtDdbxi9Z4fcmRHEdTVF3Hg7Q1jh7x3oiBSaV97/MCQ0djvkSgkxh8+L
        96ojd4n8i0V0ibmMbENOzyqodETp6tA7ONpiGR7rDFGDMeXJlSNSyXb7eofojoHAIWa2eEi488mIm
        uUltUHiGJFe3N5ui6IIayHQtX4JvRLITtLtrY/1Vx4zunvAEWK/7CgSvNbc6tLVaIk0F1nE7lhTh1
        10Kl5hCyFQWOw7VzwLjnhPQv5KloHzNEoEzk+h5XAnnTupNWsnce1sQeKtRIdIHDINOtLiQUnNmOm
        uYGqPBpw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37352 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.89)
        (envelope-from <linux@roeck-us.net>)
        id 1fOpBk-001tKS-BU; Fri, 01 Jun 2018 18:54:13 +0000
Date:   Fri, 1 Jun 2018 11:54:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH linux-next v5 10/13] Documentation: hwmon: Add documents
 for PECI hwmon client drivers
Message-ID: <20180601185411.GA27795@roeck-us.net>
References: <20180601182244.24028-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180601182244.24028-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id: guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 01, 2018 at 11:22:44AM -0700, Jae Hyun Yoo wrote:
> This commit adds hwmon documents for PECI cputemp and dimmtemp drivers.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/hwmon/peci-cputemp  | 78 +++++++++++++++++++++++++++++++
>  Documentation/hwmon/peci-dimmtemp | 50 ++++++++++++++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/hwmon/peci-cputemp
>  create mode 100644 Documentation/hwmon/peci-dimmtemp
> 
> diff --git a/Documentation/hwmon/peci-cputemp b/Documentation/hwmon/peci-cputemp
> new file mode 100644
> index 000000000000..821a9258f2e6
> --- /dev/null
> +++ b/Documentation/hwmon/peci-cputemp
> @@ -0,0 +1,78 @@
> +Kernel driver peci-cputemp
> +==========================
> +
> +Supported chips:
> +	One of Intel server CPUs listed below which is connected to a PECI bus.
> +		* Intel Xeon E5/E7 v3 server processors
> +			Intel Xeon E5-14xx v3 family
> +			Intel Xeon E5-24xx v3 family
> +			Intel Xeon E5-16xx v3 family
> +			Intel Xeon E5-26xx v3 family
> +			Intel Xeon E5-46xx v3 family
> +			Intel Xeon E7-48xx v3 family
> +			Intel Xeon E7-88xx v3 family
> +		* Intel Xeon E5/E7 v4 server processors
> +			Intel Xeon E5-16xx v4 family
> +			Intel Xeon E5-26xx v4 family
> +			Intel Xeon E5-46xx v4 family
> +			Intel Xeon E7-48xx v4 family
> +			Intel Xeon E7-88xx v4 family
> +		* Intel Xeon Scalable server processors
> +			Intel Xeon Bronze family
> +			Intel Xeon Silver family
> +			Intel Xeon Gold family
> +			Intel Xeon Platinum family
> +	Addresses scanned: PECI client address 0x30 - 0x37
> +	Datasheet: Available from http://www.intel.com/design/literature.htm
> +
> +Author:
> +	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +Description
> +-----------
> +
> +This driver implements a generic PECI hwmon feature which provides Digital
> +Thermal Sensor (DTS) thermal readings of the CPU package and CPU cores that are
> +accessible using the PECI Client Command Suite via the processor PECI client.
> +
> +All temperature values are given in millidegree Celsius and will be measurable
> +only when the target CPU is powered on.
> +
> +sysfs attributes
> +----------------
> +
> +temp1_label		"Die"
> +temp1_input		Provides current die temperature of the CPU package.
> +temp1_max		Provides thermal control temperature of the CPU package
> +			which is also known as Tcontrol.
> +temp1_crit		Provides shutdown temperature of the CPU package which
> +			is also known as the maximum processor junction
> +			temperature, Tjmax or Tprochot.
> +temp1_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
> +			the CPU package.
> +
> +temp2_label		"Tcontrol"
> +temp2_input		Provides current Tcontrol temperature of the CPU
> +			package which is also known as Fan Temperature target.
> +			Indicates the relative value from thermal monitor trip
> +			temperature at which fans should be engaged.
> +temp2_crit		Provides Tcontrol critical value of the CPU package
> +			which is same to Tjmax.
> +
> +temp3_label		"Tthrottle"
> +temp3_input		Provides current Tthrottle temperature of the CPU
> +			package. Used for throttling temperature. If this value
> +			is allowed and lower than Tjmax - the throttle will
> +			occur and reported at lower than Tjmax.
> +
> +temp4_label		"Tjmax"
> +temp4_input		Provides the maximum junction temperature, Tjmax of the
> +			CPU package.
> +
> +temp[5-*]_label		Provides string "Core X", where X is resolved core
> +			number.
> +temp[5-*]_input		Provides current temperature of each core.
> +temp[5-*]_max		Provides thermal control temperature of the core.
> +temp[5-*]_crit		Provides shutdown temperature of the core.
> +temp[5-*]_crit_hyst	Provides the hysteresis value from Tcontrol to Tjmax of
> +			the core.
> diff --git a/Documentation/hwmon/peci-dimmtemp b/Documentation/hwmon/peci-dimmtemp
> new file mode 100644
> index 000000000000..c54f2526188c
> --- /dev/null
> +++ b/Documentation/hwmon/peci-dimmtemp
> @@ -0,0 +1,50 @@
> +Kernel driver peci-dimmtemp
> +===========================
> +
> +Supported chips:
> +	One of Intel server CPUs listed below which is connected to a PECI bus.
> +		* Intel Xeon E5/E7 v3 server processors
> +			Intel Xeon E5-14xx v3 family
> +			Intel Xeon E5-24xx v3 family
> +			Intel Xeon E5-16xx v3 family
> +			Intel Xeon E5-26xx v3 family
> +			Intel Xeon E5-46xx v3 family
> +			Intel Xeon E7-48xx v3 family
> +			Intel Xeon E7-88xx v3 family
> +		* Intel Xeon E5/E7 v4 server processors
> +			Intel Xeon E5-16xx v4 family
> +			Intel Xeon E5-26xx v4 family
> +			Intel Xeon E5-46xx v4 family
> +			Intel Xeon E7-48xx v4 family
> +			Intel Xeon E7-88xx v4 family
> +		* Intel Xeon Scalable server processors
> +			Intel Xeon Bronze family
> +			Intel Xeon Silver family
> +			Intel Xeon Gold family
> +			Intel Xeon Platinum family
> +	Addresses scanned: PECI client address 0x30 - 0x37
> +	Datasheet: Available from http://www.intel.com/design/literature.htm
> +
> +Author:
> +	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +Description
> +-----------
> +
> +This driver implements a generic PECI hwmon feature which provides Digital
> +Thermal Sensor (DTS) thermal readings of DIMM components that are accessible
> +using the PECI Client Command Suite via the processor PECI client.
> +
> +All temperature values are given in millidegree Celsius and will be measurable
> +only when the target CPU is powered on.
> +
> +sysfs attributes
> +----------------
> +
> +temp[N]_label		Provides string "DIMM CI", where C is DIMM channel and
> +			I is DIMM index of the populated DIMM.
> +temp[N]_input		Provides current temperature of the populated DIMM.
> +
> +Note:
> +	DIMM temperature attributes will appear when the client CPU's BIOS
> +	completes memory training and testing.
> -- 
> 2.17.0
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
