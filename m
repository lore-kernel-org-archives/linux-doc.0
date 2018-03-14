Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 13D167E69D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 08:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932372AbeCNIOr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 04:14:47 -0400
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35655 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752688AbeCNIO3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 04:14:29 -0400
Received: by mail-pg0-f67.google.com with SMTP id d1so1063416pgv.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Mar 2018 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fRV1FSPVOXogvb6qc6Yhp62KXcgrpdN/Qy4awJGTkbE=;
        b=AugeaC0gv/ksmhFPuRi161BAjp3JC8qMGTo+KXIbAdr1vjc3OfrizivsJB4phbfOAm
         tFrsnO0YeRJR6OdW21LDWtIuRThDdQvoi0BACwPPZuTFJyADJIXW1MvNV4jcM+dqng/5
         xoxDi61hOcmB0WTgmW6ZZCWIIHRsfiVhCMcN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fRV1FSPVOXogvb6qc6Yhp62KXcgrpdN/Qy4awJGTkbE=;
        b=eYk+p9dt3vYkwa7GdXvvv/HMhJWc87xvRr7yxNLeyLpABrpv9CORh/0OYZNCtc36cN
         4m6VDUDVw7h+Jd2p3/b6XVSrvqUThyzP5CMQ6XYlZL1dVN6J77PHU6bO3A1/6JMXZBC8
         +e233odr6kvUP7wj4mmkpic+0BGRPhVuvOZwUSrrH43UH5MNW9JfwzZYGdsqYJ5Z6vrB
         5erxO2+rJg0uIWcCinGNPvopYmY/TVcjxmUH3PzbD8SeLuw9aBmt/VQmiYGsE8lUtpRb
         9SYCxbWEX2/9fWalQ5xXs4EzyMs+dECbPRX8SmYUu5CFLAg5Mo6KN2XnD8DFmel1qsDq
         J3fQ==
X-Gm-Message-State: AElRT7HlBHdKcvU+5muLm3OjjpoHPYHOkb9OicgR7b3Do8KVkrvJiKf/
        Y/uCbTN8JeghWbiHt5YsjadQCQ==
X-Google-Smtp-Source: AG47ELsbqPVnE6kob4hHqeU7qRHnIqyqzo8q5hT3oUfH5s4y4Z4Yf7jFJgEecn088sxo+8h1eDFkKA==
X-Received: by 10.167.128.143 with SMTP id v15mr3491224pff.36.1521015269277;
        Wed, 14 Mar 2018 01:14:29 -0700 (PDT)
Received: from localhost ([223.226.75.205])
        by smtp.gmail.com with ESMTPSA id l190sm4151905pfc.41.2018.03.14.01.14.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Mar 2018 01:14:28 -0700 (PDT)
Date:   Wed, 14 Mar 2018 13:44:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH V4] thermal: Add cooling device's statistics in sysfs
Message-ID: <20180314081426.GG15832@vireshk-i7>
References: <6e557b90950723065d49c9a545146ce31d7dc6e1.1516096153.git.viresh.kumar@linaro.org>
 <1520924571.3766.8.camel@intel.com>
 <1521014472.2087.32.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521014472.2087.32.camel@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14-03-18, 16:01, Zhang Rui wrote:
> WARNING: please write a paragraph that describes the config symbol
> fully
> #147: FILE: drivers/thermal/Kconfig:18:
> +config THERMAL_STATISTICS
> 
> WARNING: Consider renaming function(s)
> 'thermal_cooling_device_total_trans_show' to 'total_trans_show'
> #391: FILE: drivers/thermal/thermal_sysfs.c:901:
> +}
> 
> WARNING: Consider renaming function(s)
> 'thermal_cooling_device_time_in_state_show' to 'time_in_state_show'
> #395: FILE: drivers/thermal/thermal_sysfs.c:905:
> +static DEVICE_ATTR(time_in_state, 0444,
> 
> WARNING: Consider renaming function(s)
> 'thermal_cooling_device_reset_store' to 'reset_store'
> #397: FILE: drivers/thermal/thermal_sysfs.c:907:
> +static DEVICE_ATTR(reset, 0200, NULL,
> thermal_cooling_device_reset_store);
> 
> WARNING: Consider renaming function(s)
> 'thermal_cooling_device_trans_table_show' to 'trans_table_show'
> #398: FILE: drivers/thermal/thermal_sysfs.c:908:
> +static DEVICE_ATTR(trans_table, 0444,
> 
> total: 0 errors, 5 warnings, 366 lines checked
> 
> 
> I'm okay with the first one because the description does not have to be
> larger than 3 lines.

Right.

> the last 4 warnings makes sense to me. I think we should rename the
> function and use DEVICE_ATTR_RO() and DEVICE_ATTR_WO() instead.
> 
> what do you think?

I got those warnings as well, and I quietly ignored them :)

I ignored the renaming part for the sake of consistency. The other existing
routines for similar purpose are named as:

thermal_cooling_device_type_show
thermal_cooling_device_max_state_show
thermal_cooling_device_cur_state_show
thermal_cooling_device_cur_state_store

for me it made more sense to follow that naming convention. And I didn't use the
_RO and _WO variants for the same reason.

Now here is what I propose now:

- You apply this patch as-is and ignore the warning.

- I will send few patches on top of that to do:
  - renaming of all such routines to shorter versions.
  - Use the _RO or _WO variants of the macro everywhere.

What do you say ?

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
