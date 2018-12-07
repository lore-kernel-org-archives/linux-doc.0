Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D89F97D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 12:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbeLGMCJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 07:02:09 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:42956 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbeLGMCJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Dec 2018 07:02:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD105EBD;
        Fri,  7 Dec 2018 04:02:08 -0800 (PST)
Received: from queper01-lin (queper01-lin.cambridge.arm.com [10.1.195.48])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 514E03F5AF;
        Fri,  7 Dec 2018 04:02:07 -0800 (PST)
Date:   Fri, 7 Dec 2018 12:02:05 +0000
From:   Quentin Perret <quentin.perret@arm.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        Doug Smythies <dsmythies@telus.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Giovanni Gherdovich <ggherdovich@suse.cz>
Subject: Re: [PATCH] cpuidle: Add 'above' and 'below' idle state metrics
Message-ID: <20181207120203.ohc7icj5wf3gbwi3@queper01-lin>
References: <1688146.Dmze7u1T7F@aspire.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688146.Dmze7u1T7F@aspire.rjw.lan>
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Rafael,

On Friday 07 Dec 2018 at 12:57:00 (+0100), Rafael J. Wysocki wrote:
> --- linux-pm.orig/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ linux-pm/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -145,6 +145,8 @@ What:		/sys/devices/system/cpu/cpuX/cpui
>  		/sys/devices/system/cpu/cpuX/cpuidle/stateN/power
>  		/sys/devices/system/cpu/cpuX/cpuidle/stateN/time
>  		/sys/devices/system/cpu/cpuX/cpuidle/stateN/usage
> +		/sys/devices/system/cpu/cpuX/cpuidle/stateN/high

That should be s/high/above I suppose.

> +		/sys/devices/system/cpu/cpuX/cpuidle/stateN/below

Other than that this seems really useful :-)

Thanks,
Quentin
