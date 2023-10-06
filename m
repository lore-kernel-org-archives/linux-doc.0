Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C4CE94139
	for <linux-doc@archiver.kernel.org>; Fri,  6 Oct 2023 23:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbjJFXq0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 19:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjJFXq0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 19:46:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D990BBD
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 16:46:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C5DC433C8;
        Fri,  6 Oct 2023 23:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696635984;
        bh=Pq01C981Zv06wLDwtBP59SVN9vwfDXqR3j48hP42BT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CT5WxByus3kfykzYYiDVlt36aOjgwnRSUKS18z2eAKEUGpij3RCsJk/Si1msnegKC
         5j9WNgYi0nPC9PIIsspd/2rrvMy/hp4AgWnUVYSiMH4krOb41WY69LaDkaKCQ5MdUm
         cHioX4EbnSCX2iYwE1nlEXTsAfXEth837ehY71Xd7XNqxg96tKm84meq5PjKlzl+q3
         0Yim3fPTxMlDeJkQ4msTiqAfycbQ2cTQE5I7/zyel1p21L4tuG6BkrzzF8m2i8HJ3l
         ET0B5mihZPRbNnGKSQOsyz+oTbSlXtjZEkH4ulc0n5Y+QTMzdc4rukEDrXWd00YSn7
         tAwYBXOd610dg==
Date:   Fri, 6 Oct 2023 16:46:23 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Tony Nguyen <anthony.l.nguyen@intel.com>
Cc:     davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
        netdev@vger.kernel.org,
        Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
        jacob.e.keller@intel.com, vaishnavi.tipireddy@intel.com,
        horms@kernel.org, leon@kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH net-next v4 5/5] ice: add documentation for FW logging
Message-ID: <20231006164623.6c09c4e5@kernel.org>
In-Reply-To: <20231005170110.3221306-6-anthony.l.nguyen@intel.com>
References: <20231005170110.3221306-1-anthony.l.nguyen@intel.com>
        <20231005170110.3221306-6-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  5 Oct 2023 10:01:10 -0700 Tony Nguyen wrote:
> From: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
> 
> Add documentation for FW logging in
> Documentation/networking/device-drivers/ethernet/intel/ice.rst

Wrong spelling, I think, because no such file.

> Signed-off-by: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
> Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>

> +Firmware (FW) logging
> +---------------------

I think you need empty lines after the headers.
Did you try to build this documentation and checked the warnings?

> +The driver supports FW logging via the debugfs interface on PF 0 only. In order
> +for FW logging to work, the NVM must support it. The 'fwlog' file will only get
> +created in the ice debugfs directory if the NVM supports FW logging.

Odd phrasing - "in order to work it needs to be supported"

also NVM == non-volatile memory, you mean the logging goes into NVM
or NVM as in FW in the NVM needs to support it?

> +Module configuration
> +~~~~~~~~~~~~~~~~~~~~
> +To see the status of FW logging, read the 'fwlog/modules' file like this::
> +
> +  # cat /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/modules
> +
> +To configure FW logging, write to the 'fwlog/modules' file like this::
> +
> +  # echo <fwlog_event> <fwlog_level> > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/modules
> +
> +where
> +
> +* fwlog_level is a name as described below. Each level includes the
> +  messages from the previous/lower level
> +
> +      *	NONE
> +      *	ERROR
> +      *	WARNING
> +      *	NORMAL
> +      *	VERBOSE

Is this going to give us a nice list when we render the docs?
White space looks odd.

> +* fwlog_event is a name that represents the module to receive events for. The
> +  module names are
> +
> +      *	GENERAL
> +      *	CTRL
> +      *	LINK
> +      *	LINK_TOPO
> +      *	DNL
> +      *	I2C
> +      *	SDP
> +      *	MDIO
> +      *	ADMINQ
> +      *	HDMA
> +      *	LLDP
> +      *	DCBX
> +      *	DCB
> +      *	XLR
> +      *	NVM
> +      *	AUTH
> +      *	VPD
> +      *	IOSF
> +      *	PARSER
> +      *	SW
> +      *	SCHEDULER
> +      *	TXQ
> +      *	RSVD
> +      *	POST
> +      *	WATCHDOG
> +      *	TASK_DISPATCH
> +      *	MNG
> +      *	SYNCE
> +      *	HEALTH
> +      *	TSDRV
> +      *	PFREG
> +      *	MDLVER
> +      *	ALL
> +
> +The name ALL is special and specifies setting all of the modules to the
> +specified fwlog_level.
> +
> +Example usage to configure the modules::
> +
> +  # echo LINK VERBOSE > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/modules
> +
> +Enabling FW log
> +~~~~~~~~~~~~~~~
> +Once the desired modules are configured the user enables logging. To do
> +this the user can write a 1 (enable) or 0 (disable) to 'fwlog/enable'. An
> +example is::
> +
> +  # echo 1 > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/enable

Hm, so we "select" the module and then enable / disable?

It'd feel more natural to steal the +/- thing from dynamic printing.
To enable:

 # echo '+LINK VERBOSE' > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/active

To disable:

 # echo '-LINK VERBOSE' > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/active

No?

> +Retrieving FW log data
> +~~~~~~~~~~~~~~~~~~~~~~
> +The FW log data can be retrieved by reading from 'fwlog/data'. The user can
> +write to 'fwlog/data' to clear the data. The data can only be cleared when FW
> +logging is disabled.

Oh, now it sounds like only one thing can be enabled at a time.
Can you clarify?

> The FW log data is a binary file that is sent to Intel and
> +used to help debug user issues.
> +
> +An example to read the data is::
> +
> +  # cat /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/data > fwlog.bin
> +
> +An example to clear the data is::
> +
> +  # echo 0 > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/data
> +
> +Changing how often the log events are sent to the driver
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The driver receives FW log data from the Admin Receive Queue (ARQ). The
> +frequency that the FW sends the ARQ events can be configured by writing to
> +'fwlog/resolution'. The range is 1-128 (1 means push every log message, 128
> +means push only when the max AQ command buffer is full). The suggested value is
> +10. The user can see what the value is configured to by reading
> +'fwlog/resolution'. An example to set the value is::
> +
> +  # echo 50 > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/resolution

Resolution doesn't sound quite right, batch_size maybe? 

> +Configuring the number of buffers used to store FW log data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The driver stores FW log data in a ring within the driver. The default size of
> +the ring is 256 4K buffers. Some use cases may require more or less data so
> +the user can change the number of buffers that are allocated for FW log data.
> +To change the number of buffers write to 'fwlog/nr_buffs'. The value must be one
> +of: 64, 128, 256, or 512. FW logging must be disabled to change the value. An
> +example of changing the value is::
> +
> +  # echo 128 > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/nr_buffs

Why 4K? The number of buffers is irrelevant to the user, why not let
the user configure the size in bytes (which his how much DRAM the
driver will hold hostage)?
