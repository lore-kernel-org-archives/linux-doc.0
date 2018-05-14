Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 849C27D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 21:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752380AbeENVD3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 17:03:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56006 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752238AbeENVDZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 17:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hdMCU9GjrUP2DOzINR27cve6k8nPt6FKPeNwqgSC1xs=; b=fzIvYVHYBMyyjd7r3CEtpamTT
        uChcNMxKdpdeJk7munbxf9Of7Yqe2ebMM3FP6E+VUQLP49Y3eBsJWimb9QMI1WT2IJseiRgthksca
        v2cyy0sjleJj8jEExDBLfRN8wkg9mm/e4dN6zcp+vBLdzxI0y9YUp1+wK3mvaJS0PFJyYv17yNr4R
        m3SfLcqaJ8gzogoSOo3K5JT3FiAK3cSiwqto7G6WIPJFDhivCn7Q1ZGq7/niGduFD3J5oCrtUUT2g
        dGwJsa+bDJkAkFlLxjkh7F0BaozAyIfgo1I+WGLnLH4ecYWMidjC0i6Uw4mpnhYyCPNmf64aZp6e+
        W26rCoy5g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fIKcn-0001eu-FP; Mon, 14 May 2018 21:03:17 +0000
Subject: Re: [PATCH v3] coresight: documentation: update sysfs section
To:     Kim Phillips <kim.phillips@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
References: <20180507172915.c032cd71c07b1849bf419a5f@arm.com>
 <CANLsYkyQLan3XajOz2uuoOF8OQchGfeu2ZkZJ9H1Xm9q==aXTw@mail.gmail.com>
 <20180514121959.a9a3d2fb3d3d270849ffbc39@arm.com>
 <a09cbbb5-0237-31f5-dc81-d816c9ec26c5@infradead.org>
 <20180514141800.f1be30ce9d1f6ae20ca2d04c@arm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8bcf5490-aeea-e531-fc2d-e8aff8a62dbc@infradead.org>
Date:   Mon, 14 May 2018 14:03:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180514141800.f1be30ce9d1f6ae20ca2d04c@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/14/2018 12:18 PM, Kim Phillips wrote:
> - Align and show updated ls devices output from the TC2, based on
>   current driver
> 
> - Provide an example from an ETMv4 based system (Juno)
> 
> - Reflect changes to the way the RAM write pointer is accessed since
>   it got changed in commit 7d83d17795ef ("coresight: tmc: adding sysFS
>   management entries").
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Kim Phillips <kim.phillips@arm.com>

FWIW:
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> v3: address Randy Dunlap's showns->shown,  corrected - and + line merging
> v2: address Mathieu's comment about clarifying the sinks on the Juno
>     vs. TC2 platforms.
> 
>  Documentation/trace/coresight.txt | 43 +++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
> index 6f0120c3a4f1..15d2a0f1e1b8 100644
> --- a/Documentation/trace/coresight.txt
> +++ b/Documentation/trace/coresight.txt
> @@ -141,13 +141,25 @@ register the device with the core framework.  The unregister function takes
>  a reference to a "struct coresight_device", obtained at registration time.
>  
>  If everything goes well during the registration process the new devices will
> -show up under /sys/bus/coresight/devices, as showns here for a TC2 platform:
> +show up under /sys/bus/coresight/devices, as shown here for a TC2 platform:
>  
>  root:~# ls /sys/bus/coresight/devices/
> -replicator  20030000.tpiu    2201c000.ptm  2203c000.etm  2203e000.etm
> -20010000.etb         20040000.funnel  2201d000.ptm  2203d000.etm
> +20010000.etb   20040000.funnel	2201d000.ptm  2203d000.etm  replicator
> +20030000.tpiu  2201c000.ptm	2203c000.etm  2203e000.etm
>  root:~#
>  
> +and here for a Juno platform:
> +
> +root@juno:~# ls /sys/bus/coresight/devices/
> +20010000.etf	 20120000.replicator  22040000.etm     230c0000.funnel
> +20030000.tpiu	 20130000.funnel      220c0000.funnel  23140000.etm
> +20040000.funnel  20140000.etf	      22140000.etm     23240000.etm
> +20070000.etr	 20150000.funnel      23040000.etm     23340000.etm
> +root@juno:~# 
> +
> +Note that on Juno users can select the ETF, ETR and TPIU as a sink target while
> +on TC2, the ETB and TPIU can be selected.
> +
>  The functions take a "struct coresight_device", which looks like this:
>  
>  struct coresight_desc {
> @@ -193,16 +205,16 @@ the information carried in "THIS_MODULE".
>  How to use the tracer modules
>  -----------------------------
>  
> -Before trace collection can start, a coresight sink needs to be identify.
> +Before trace collection can start, a coresight sink needs to be identified.
>  There is no limit on the amount of sinks (nor sources) that can be enabled at
>  any given moment.  As a generic operation, all device pertaining to the sink
>  class will have an "active" entry in sysfs:
>  
>  root:/sys/bus/coresight/devices# ls
> -replicator  20030000.tpiu    2201c000.ptm  2203c000.etm  2203e000.etm
> -20010000.etb         20040000.funnel  2201d000.ptm  2203d000.etm
> +20010000.etb   20040000.funnel	2201d000.ptm  2203d000.etm  replicator
> +20030000.tpiu  2201c000.ptm	2203c000.etm  2203e000.etm
>  root:/sys/bus/coresight/devices# ls 20010000.etb
> -enable_sink  status  trigger_cntr
> +enable_sink  mgmt  power  subsystem  trigger_cntr  uevent
>  root:/sys/bus/coresight/devices# echo 1 > 20010000.etb/enable_sink
>  root:/sys/bus/coresight/devices# cat 20010000.etb/enable_sink
>  1
> @@ -216,16 +228,13 @@ trigger a trace capture:
>  root:/sys/bus/coresight/devices# echo 1 > 2201c000.ptm/enable_source
>  root:/sys/bus/coresight/devices# cat 2201c000.ptm/enable_source
>  1
> -root:/sys/bus/coresight/devices# cat 20010000.etb/status
> -Depth:          0x2000
> -Status:         0x1
> -RAM read ptr:   0x0
> -RAM wrt ptr:    0x19d3   <----- The write pointer is moving
> -Trigger cnt:    0x0
> -Control:        0x1
> -Flush status:   0x0
> -Flush ctrl:     0x2001
> -root:/sys/bus/coresight/devices#
> +
> +Observe the write pointer moving:
> +
> +root:/sys/bus/coresight/devices# cat 20010000.etb/mgmt/rwp
> +0x1a8
> +root:/sys/bus/coresight/devices# cat 20010000.etb/mgmt/rwp
> +0x19a6
>  
>  Trace collection is stopped the same way:
>  
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
