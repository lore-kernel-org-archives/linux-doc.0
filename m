Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 99FBF7DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 19:48:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753104AbeDPTsc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 15:48:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56422 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751210AbeDPTsc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 15:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0yzIq55eUQPb+lVvlkWnrt3KAnkW1nhTpOlIEUbenBo=; b=L2VgpRBU9Ct1yB5aSfhb0yosI
        kjDQ1L3lqWfe0g5hSPovb7xbJ6P1oRcqNw8CAR0Q/wA5lp9hgtNWHIWPGOXyindjn9tSfQsgweQ+5
        8gly86NfgUJ1v7f0sAgdsWQPKGA/buwM0UAWXtZ77PeBGSOp4ibaLKMhDLNsSQ84GH2OsxauEf4a9
        jbaxdW7+pqu/7jbNr4a0LhlzISr0E5iPA1PuZCQRHm6MRHZoex4RxTfT1Msp/gSYZd0IGqDMa+1H+
        WP3jKEAAFonE7r2YDRcBbXcxlZd6y8BeoEYY+kAzShnK2Uq9UzKknO51As4F4qsy2kbUxwp3O981F
        BRzCrznUg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f8A75-0004HO-7w; Mon, 16 Apr 2018 19:48:31 +0000
Subject: Re: [PATCH 2/3] coresight: Add section for integration with the perf
 tools
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben.Gainey@arm.com
References: <1523907327-20979-1-git-send-email-mathieu.poirier@linaro.org>
 <1523907327-20979-3-git-send-email-mathieu.poirier@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fd4b5238-c995-c374-60c0-e4a32f644ae4@infradead.org>
Date:   Mon, 16 Apr 2018 12:48:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523907327-20979-3-git-send-email-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/16/2018 12:35 PM, Mathieu Poirier wrote:
> Adding a section that document how to use the Coresight framework and
> drivers from the perf tools.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  Documentation/trace/coresight.txt | 50 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
> index 710c75b6c73f..8caae8050a60 100644
> --- a/Documentation/trace/coresight.txt
> +++ b/Documentation/trace/coresight.txt
> @@ -187,9 +187,18 @@ that can be performed on them (see "struct coresight_ops").  The
>  specific to that component only.  "Implementation defined" customisations are
>  expected to be accessed and controlled using those entries.
>  
> +
>  How to use the tracer modules
>  -----------------------------
>  
> +There is two ways to use the Coresight framework: 1) using the perf cmd line

   There are two ways

> +tools and 2) interacting directly with the Coresight devices using the sysFS
> +interface.  Preference is given to the former as using the sysFS interface
> +requires a deep understanding of the Coresight HW.  The following sections
> +provide details on using both methods.
> +
> +1) Using the sysFS interface:
> +
>  Before trace collection can start, a coresight sink needs to be identify.

                                                                   identified.

>  There is no limit on the amount of sinks (nor sources) that can be enabled at
>  any given moment.  As a generic operation, all device pertaining to the sink
> @@ -295,6 +304,47 @@ Instruction     13570831        0x8026B584      E28DD00C        false   ADD
>  Instruction     0       0x8026B588      E8BD8000        true    LDM      sp!,{pc}
>  Timestamp                                       Timestamp: 17107041535
>  
> +2) Using perf framework:
> +
> +Coresight tracers are represented using the Perf framework's Performance
> +Monitoring Unit (PMU) abstraction.  As such the perf framework takes charge of
> +controlling when tracing gets enabled based on when the process of interest is
> +scheduled.  When configured in a system, Coresight PMUs will be listed when
> +queried by the perf command line tool:
> +
> +	linaro@linaro-nano:~$ ./perf list pmu
> +
> +		List of pre-defined events (to be used in -e):
> +
> +		cs_etm//                                    [Kernel PMU event]
> +
> +	linaro@linaro-nano:~$
> +
> +Regardless of the number of tracers available in a system (usually equal to the
> +amount of processor core), the "cs_etm" PMU will be listed only once.

?                      cores),

> +
> +A Coresight PMU works the same way as any other PMUs, i.e the name of the PMU is

                                         any other PMU, i.e.

> +listed along with configuration options within forward slashes '/'.  Since a
> +Coresight system will typically have more than one sink, the name of the sink to
> +work with needs to be specified as an event option.  Names for sink to choose
> +from are listed in sysFS under ($SYSFS)/bus/coresight/devices:
> +
> +	root@linaro-nano:~# ls /sys/bus/coresight/devices/
> +		20010000.etf   20040000.funnel  20100000.stm  22040000.etm
> +		22140000.etm  230c0000.funnel  23240000.etm 20030000.tpiu
> +		20070000.etr     20120000.replicator  220c0000.funnel
> +		23040000.etm  23140000.etm     23340000.etm
> +
> +	root@linaro-nano:~# perf record -e cs_etm/@20070000.etr/u --per-thread program
> +
> +The syntax within the forward slashes '/' is important.  The '@' character
> +tells the parser that a sink is about to be specified and that this is the IP

Can we get away from using "IP" and call it a device or (hardware) module or
something more descriptive?

> +to use for the trace session.
> +
> +More information on the above and other example on how to use Coresight with
> +the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
> +repository [3].


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
