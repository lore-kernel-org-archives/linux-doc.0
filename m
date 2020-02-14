Return-Path: <SRS0=xqSd=4C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4425FC35242
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 23:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0075F206B6
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 23:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XyWet7eH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgBNXKz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Feb 2020 18:10:55 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:35816 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgBNXKz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Feb 2020 18:10:55 -0500
Received: by mail-yb1-f193.google.com with SMTP id p123so5608173ybp.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2020 15:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R4zEiG9M2nzyirDMOJKoPf8/4dfn9S+XuRnFrH9sQ6c=;
        b=XyWet7eHMyp6S6IWx6Cartw8k9pGGGCDapQO47WtToplCNfHPfc3ZwAgSHrnFMXi5e
         L7o+OWpOn72Wzqhpzj+lltqH14MsQTaxXwcbcw1aCwTr8f/TUtdoeLRn9eA+k0q4+n3g
         sZZC1GYjQBpsgCPTahVK2AnM+ZJ3L+ut/9OeoTcEfVU+OBYS6nQqFQKu6ovlhB88o/GW
         Ah3jHPfAYPU7iD+0FBvS1VDel7UpDIaQhRbC8zVCb9cP/9ID/bKN2Pw1wWsAzISRJym5
         QV/tmfZj0pShUXZHkLYi6/vKPxlkBBBoBE1VDHT6L0PcyB5l+TN2PAk3KLz0kGxl3E9I
         Ph/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R4zEiG9M2nzyirDMOJKoPf8/4dfn9S+XuRnFrH9sQ6c=;
        b=OzHPCRnRABqsMAUftDzmGTVmDR9XV6fEjr2cs/704doCcKIOaYU+iXpDezVC+X6MnE
         64BxhUoA58+ThFsTcNmPd/dUmKDiVOCM+B/iroQoTo1pYlyl4mffnMhohz4Sl2GdmrsP
         505OPPOu7uRGbOzndECD2VckI+PMuj43qP/v0EaPy6hidrc2ZTABucjwi0L67T9nNFlJ
         VUfdIy0P2w0/mAL8Y6HW3YLjdfRoh9q9nE3Y2g6961FGRjJXyV9lKml9KWejkKXXzEMV
         Z98/Bqmgiz9dp09dRw1DxxJl6V2BIvRPFQUsb8fIzDdAhETHiPUbIkQ3AZdZhPu8zQ0d
         qU2Q==
X-Gm-Message-State: APjAAAXBMUQbagRtV1posTpyonJ4r4/I/zk8pZdZpVQWnCh65FrnGdq5
        qDUGhHoKXBTjLQb4ED2vNYWf0A==
X-Google-Smtp-Source: APXvYqyk1bdsJxDMEe/Qm6Vx/7uHGpcCH3yPcLvJFkaX91k7VyiUR506kCrmphDX3fiy8oOvN47Syg==
X-Received: by 2002:a25:ad27:: with SMTP id y39mr4844354ybi.517.1581721854000;
        Fri, 14 Feb 2020 15:10:54 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m203sm2908828ywc.10.2020.02.14.15.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 15:10:53 -0800 (PST)
Date:   Fri, 14 Feb 2020 16:10:51 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 6/6] coresight: docs: Add information about the
 topology representations.
Message-ID: <20200214231051.GC20024@xps15>
References: <20200211105808.27884-1-mike.leach@linaro.org>
 <20200211105808.27884-7-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211105808.27884-7-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 11, 2020 at 10:58:08AM +0000, Mike Leach wrote:
> Update the CoreSight documents to describe the new connections directory
> and the links between CoreSight devices in this directory.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../trace/coresight/coresight-ect.rst         |  5 +-
>  Documentation/trace/coresight/coresight.rst   | 85 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 1 deletion(-)
> 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> index 067cee91c857..3539af895832 100644
> --- a/Documentation/trace/coresight/coresight-ect.rst
> +++ b/Documentation/trace/coresight/coresight-ect.rst
> @@ -71,7 +71,7 @@ capable of generating or using trigger signals.::
>  
>    >$ ls /sys/bus/coresight/devices/etm0/cti_cpu0
>    channels  ctmid  enable  nr_trigger_cons mgmt  power  regs  subsystem
> -  triggers0 triggers1  uevent
> +  connections triggers0 triggers1  uevent
>  
>  *Key file items are:-*
>     * ``enable``: enables/disables the CTI.
> @@ -84,6 +84,9 @@ capable of generating or using trigger signals.::
>     * ``channels``: Contains the channel API - CTI main programming interface.
>     * ``regs``: Gives access to the raw programmable CTI regs.
>     * ``mgmt``: the standard CoreSight management registers.
> +   * ``connections``: Links to connected *CoreSight* devices. The number of
> +     links can be 0 to ``nr_trigger_cons``. Actual number given by ``nr_links``
> +     in this directory.
>  
>  
>  triggers<N> directories
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 108600ee1e12..0b73acb44efa 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -241,6 +241,91 @@ to the newer scheme, to give a confirmation that what you see on your
>  system is not unexpected. One must use the "names" as they appear on
>  the system under specified locations.
>  
> +Topology Representation
> +-----------------------
> +
> +Each CoreSight component has a ``connections`` directory which will contain
> +links to other CoreSight components. This allows the user to explore the trace
> +topology and for larger systems, determine the most appropriate sink for a
> +given source. The connection information can also be used to establish
> +which CTI devices are connected to a given component. This directory contains a
> +``nr_links`` attribute detailing the number of links in the directory.
> +
> +For an ETM source, in this case ``etm0`` on a Juno platform, a typical
> +arrangement will be::
> +
> +  linaro-developer:~# ls - l /sys/bus/coresight/devices/etm0/connections
> +  <file details>  cti_cpu0 -> ../../../23020000.cti/cti_cpu0
> +  <file details>  nr_links
> +  <file details>  out:0 -> ../../../230c0000.funnel/funnel2
> +
> +Following the out port to ``funnel2``::
> +
> +  linaro-developer:~# ls -l /sys/bus/coresight/devices/funnel2/connections
> +  <file details> in:0 -> ../../../23040000.etm/etm0
> +  <file details> in:1 -> ../../../23140000.etm/etm3
> +  <file details> in:2 -> ../../../23240000.etm/etm4
> +  <file details> in:3 -> ../../../23340000.etm/etm5
> +  <file details> nr_links
> +  <file details> out:0 -> ../../../20040000.funnel/funnel0
> +
> +And again to ``funnel0``::
> +
> +  linaro-developer:~# ls -l /sys/bus/coresight/devices/funnel0/connections
> +  <file details> in:0 -> ../../../220c0000.funnel/funnel1
> +  <file details> in:1 -> ../../../230c0000.funnel/funnel2
> +  <file details> nr_links
> +  <file details> out:0 -> ../../../20010000.etf/tmc_etf0
> +
> +Finding the first sink ``tmc_etf0``. This can be used to collect data
> +as a sink, or as a link to propagate further along the chain::
> +
> +  linaro-developer:~# ls -l /sys/bus/coresight/devices/tmc_etf0/connections
> +  <file details> cti_sys0 -> ../../../20020000.cti/cti_sys0
> +  <file details> in:0 -> ../../../20040000.funnel/funnel0
> +  <file details> nr_links
> +  <file details> out:0 -> ../../../20150000.funnel/funnel4
> +
> +via ``funnel4``::
> +
> +  linaro-developer:~# ls -l /sys/bus/coresight/devices/funnel4/connections
> +  <file details> in:0 -> ../../../20010000.etf/tmc_etf0
> +  <file details> in:1 -> ../../../20140000.etf/tmc_etf1
> +  <file details> nr_links
> +  <file details> out:0 -> ../../../20120000.replicator/replicator0
> +
> +and a ``replicator0``::
> +
> +  linaro-developer:~# ls -l /sys/bus/coresight/devices/replicator0/connections
> +  <file details> in:0 -> ../../../20150000.funnel/funnel4
> +  <file details> nr_links
> +  <file details> out:0 -> ../../../20030000.tpiu/tpiu0
> +  <file details> out:1 -> ../../../20070000.etr/tmc_etr0
> +
> +Arriving at the final sink in the chain, ``tmc_etr0``::
> +
> +  linaro-developer:~# ls -l /sys/bus/coresight/devices/tmc_etr0/connections
> +  <file details> cti_sys0 -> ../../../20020000.cti/cti_sys0
> +  <file details> in:0 -> ../../../20120000.replicator/replicator0
> +  <file details> nr_links
> +
> +As described below, when using sysfs it is sufficient to enable a sink and
> +a source for successful trace. The framework will correctly enable all
> +intermediate links as required.
> +
> +Note: ``cti_sys0`` appears in two of the connections lists above.
> +CTIs can connect to multiple devices and are arranged in a star topology
> +via the CTM. See (:doc:`coresight-ect`) [#fourth]_ for further details.
> +Looking at this device we see 4 connections::
> +
> +  linaro-developer:~# ls -l /sys/bus/coresight/devices/cti_sys0/connections
> +  <file details> nr_links
> +  <file details> stm0 -> ../../../20100000.stm/stm0
> +  <file details> tmc_etf0 -> ../../../20010000.etf/tmc_etf0
> +  <file details> tmc_etr0 -> ../../../20070000.etr/tmc_etr0
> +  <file details> tpiu0 -> ../../../20030000.tpiu/tpiu0
> +
> +
>  How to use the tracer modules
>  -----------------------------
>  
> -- 
> 2.17.1
> 
