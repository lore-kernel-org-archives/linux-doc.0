Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1A5C27C6D
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 22:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243960AbjHPWow (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 18:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347005AbjHPWoj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 18:44:39 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A95B1BF7;
        Wed, 16 Aug 2023 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=kfah8PV/SaG1+qbLS8sXtkthnC+KbrePk0P9kuFyEuY=; b=DUaGN9R3+GGPQEIUxR1hYC55o7
        7l73sIf+XQFTUXqgXHeKgN20iSYgRM04X4PYHU8rX/DnpD7ZzKkvGXRR5eYrh/+R8ZehUmOLe/ryH
        XJkKPOQYIIIa7jG/l5iysJE2fPZhzA9v2z83vx9myyNDRFkbBrXcEbPWDQuPp+ZrGhWoLNgL1zm3U
        ih1HJA3uAqcPw+Fmpl1BDmq9USou8z2QX4Wday59J3LAo/2EdTW6f4p6SiOIJClmD03FvoaF9kpIy
        R9SzDczxVIbi9blerj8+LIumsrdzAY/U4fVtS5UFzZcwKKzj9U89TBdqNgQoD9+RIzUHWE63S9IA3
        7LT2Jx3g==;
Received: from 50-198-160-193-static.hfc.comcastbusiness.net ([50.198.160.193] helo=[10.150.81.190])
        by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qWPFH-00DLBA-1Z;
        Wed, 16 Aug 2023 22:44:09 +0000
Message-ID: <ae2b7002-1230-95a1-33e8-91b1898a33ad@infradead.org>
Date:   Wed, 16 Aug 2023 15:43:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH net-next v3 5/5] ice: add documentation for FW logging
Content-Language: en-US
To:     Tony Nguyen <anthony.l.nguyen@intel.com>, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, edumazet@google.com,
        netdev@vger.kernel.org
Cc:     Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
        jacob.e.keller@intel.com, horms@kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
References: <20230815165750.2789609-1-anthony.l.nguyen@intel.com>
 <20230815165750.2789609-6-anthony.l.nguyen@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230815165750.2789609-6-anthony.l.nguyen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/15/23 09:57, Tony Nguyen wrote:
> From: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
> 
> Add documentation for FW logging in
> Documentation/networking/device-drivers/ethernet/intel/ice.rst
> 
> Signed-off-by: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
> Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
> ---
>  .../device_drivers/ethernet/intel/ice.rst     | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/Documentation/networking/device_drivers/ethernet/intel/ice.rst b/Documentation/networking/device_drivers/ethernet/intel/ice.rst
> index e4d065c55ea8..3ddef911faaa 100644
> --- a/Documentation/networking/device_drivers/ethernet/intel/ice.rst
> +++ b/Documentation/networking/device_drivers/ethernet/intel/ice.rst
> @@ -895,6 +895,123 @@ driver writes raw bytes by the GNSS object to the receiver through i2c. Please
>  refer to the hardware GNSS module documentation for configuration details.
>  
>  
> +Firmware (FW) logging
> +---------------------
> +The driver supports FW logging via the debugfs interface on PF 0 only. In order
> +for FW logging to work, the NVM must support it. The 'fwlog' file will only get
> +created in the ice debugfs directory if the NVM supports FW logging.
> +
> +Module configuration
> +~~~~~~~~~~~~~~~~~~~~
> +To see the status of FW logging then read the 'fwlog/modules' file like this::

                     of FW logging, read

> +
> +  # cat /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/modules
> +
> +To configure FW logging then write to the 'fwlog/modules' file like this::

                FW logging, write to

> +
> +  # echo <fwlog_event> <fwlog_level> > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/modules
> +
> +where
> +
> +* fwlog_level is a name as described below. Each level includes the
> +  messages from the previous/lower level
> +
> +      * NONE

Should NONE be aligned with the entries below?
Ah, they are aligned in the source file, but NONE uses a space after the '*'
while the others use a TAB after the '*'.

> +      *	ERROR
> +      *	WARNING
> +      *	NORMAL
> +      *	VERBOSE
> +
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
> +Once the desired modules are configured the user will enable the logging. To do

                                           the user enables logging. To do

> +this the user can write a 1 (enable) or 0 (disable) to 'fwlog/enable'. An
> +example is::
> +
> +  # echo 1 > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/enable
> +
> +Retrieving FW log data
> +~~~~~~~~~~~~~~~~~~~~~~
> +The FW log data can be retrieved by reading from 'fwlog/data'. The user can
> +write to 'fwlog/data' to clear the data. The data can only be cleared when FW
> +logging is disabled. The FW log data is a binary file that is sent to Intel and
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
> +
> +Configuring the number of buffers used to store FW log data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The driver stores FW log data in a ring within the driver. The default size of
> +the ring is 256 4K buffers. Some use cases may require more or less data so
> +the user can change the number of buffers that are allocated for FW log data.
> +To change the number of buffers write to 'fwlog/nr_buffs'. The value must be a
> +power of two and between the values 64-512. FW logging must be disabled to

or
The value must be one of: 64, 128, 256, or 512.

> +change the value. An example of changing the value is::
> +
> +  # echo 128 > /sys/kernel/debug/ice/0000\:18\:00.0/fwlog/nr_buffs
> +
> +
>  Performance Optimization
>  ========================
>  Driver defaults are meant to fit a wide variety of workloads, but if further
