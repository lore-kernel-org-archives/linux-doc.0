Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E6E67D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 12:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbeLGMU3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 07:20:29 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:63655 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbeLGMU3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 07:20:29 -0500
Received: from 79.184.252.87.ipv4.supernova.orange.pl (79.184.252.87) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.183)
 id fe7aad0d448779bc; Fri, 7 Dec 2018 13:20:27 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Quentin Perret <quentin.perret@arm.com>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        Doug Smythies <dsmythies@telus.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Giovanni Gherdovich <ggherdovich@suse.cz>
Subject: Re: [PATCH] cpuidle: Add 'above' and 'below' idle state metrics
Date:   Fri, 07 Dec 2018 13:20:13 +0100
Message-ID: <2696247.uWQGDES4iU@aspire.rjw.lan>
In-Reply-To: <20181207120203.ohc7icj5wf3gbwi3@queper01-lin>
References: <1688146.Dmze7u1T7F@aspire.rjw.lan> <20181207120203.ohc7icj5wf3gbwi3@queper01-lin>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Friday, December 7, 2018 1:02:05 PM CET Quentin Perret wrote:
> Hi Rafael,
> 
> On Friday 07 Dec 2018 at 12:57:00 (+0100), Rafael J. Wysocki wrote:
> > --- linux-pm.orig/Documentation/ABI/testing/sysfs-devices-system-cpu
> > +++ linux-pm/Documentation/ABI/testing/sysfs-devices-system-cpu
> > @@ -145,6 +145,8 @@ What:		/sys/devices/system/cpu/cpuX/cpui
> >  		/sys/devices/system/cpu/cpuX/cpuidle/stateN/power
> >  		/sys/devices/system/cpu/cpuX/cpuidle/stateN/time
> >  		/sys/devices/system/cpu/cpuX/cpuidle/stateN/usage
> > +		/sys/devices/system/cpu/cpuX/cpuidle/stateN/high
> 
> That should be s/high/above I suppose.

Right, thanks for spotting this. :-)

> > +		/sys/devices/system/cpu/cpuX/cpuidle/stateN/below
> 
> Other than that this seems really useful :-)

Thanks!

