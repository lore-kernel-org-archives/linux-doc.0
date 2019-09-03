Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 80B007D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Sep 2019 19:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfICTnB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Sep 2019 15:43:01 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42121 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfICTnA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Sep 2019 15:43:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id w22so3029927pfi.9
        for <linux-doc@vger.kernel.org>; Tue, 03 Sep 2019 12:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jqS4LZj7GCXcMpIWK1p7V9DDKxit0DzVNM8rv4iaZkc=;
        b=iPCj0bbjVWVBlhmozsfP360xvqnAXINzA9eQNHZREkvxtrIbnof+9jAr/VyF/6ZTx/
         kT9drqKpzS6ZeBhxqPWeOt2Jh92SsC9Qjq0ijh8tjOrHk8Fsz3pvkrC2NkqqujZ+HWwI
         BiJhjuFan8WMVN44u//G3Qlkwh69yczxQjpN4XbcgM3873Xl2oFV3RK4pz5HnuRVr4My
         G6kjg7P4SLkBYhaR8XGDxkbv/G1GMYV2LUy6yh1b41HPFbK4RzYMwy6LPtSjbPPE3Pt8
         rsDc89VwuS42/EESvsGkgyruyQHx6MLymEO+sPOglB6nkR1TL9icxgDBvGqxUwFmzZDO
         Lhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jqS4LZj7GCXcMpIWK1p7V9DDKxit0DzVNM8rv4iaZkc=;
        b=NJkcidqgaMUBqnYXQaLf/sJmQ07t+F4VuGBxu2QXcfjpCoV2F8uzbTsniLGCRiwpAz
         C7UZZEv2OLa5n7OX9m6W6ZM12BxiqxaLzO+hxSGtFB2bV7EDkq1UMAPOydzf0Tpidpx0
         echwA4Y3gEtREPGrpekLy/q8mlRdEJ1STjo6Jc9CcmZJcWfISMmcVluSW7MzlTuF5KUg
         MgIoHRIR8DGPiaD1seqi41PKwaBIwMEr9b7KJ2GXY3yEQrwOtaSjD802+n1Fw8bmMXA5
         vYqDfKkB3r4yf5jE2Akd7VUls9zTc+O191w9WArNS7ontHziENJ3TKSpsU0fJUCmMsZr
         gKAQ==
X-Gm-Message-State: APjAAAUrZAXJ9tx557WE88+w+PtjvpbGNYLlrKJgcxVLOWLzeEgvosQg
        4EUmejavkpofoFPWKKaRipwtoA==
X-Google-Smtp-Source: APXvYqyMhQxQKHAMImOYls4+Io1Wj2+LeUNx4o568XpTDWPBvpxYqLXAe3/jjVw6G9X0c/PzYoFr2g==
X-Received: by 2002:a65:64ce:: with SMTP id t14mr31464662pgv.137.1567539779461;
        Tue, 03 Sep 2019 12:42:59 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x22sm2416485pfi.139.2019.09.03.12.42.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 12:42:58 -0700 (PDT)
Date:   Tue, 3 Sep 2019 13:42:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com, corbet@lwn.net,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 09/11] coresight: etm4x: docs: Update ABI doc for
 sysfs features added.
Message-ID: <20190903194256.GB25787@xps15>
References: <20190829213321.4092-1-mike.leach@linaro.org>
 <20190829213321.4092-10-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829213321.4092-10-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 29, 2019 at 10:33:19PM +0100, Mike Leach wrote:
> Update document to include the new sysfs features added during this
> patchset.
> 
> Updated to reflect the new sysfs component nameing schema.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../testing/sysfs-bus-coresight-devices-etm4x | 183 +++++++++++-------
>  1 file changed, 115 insertions(+), 68 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> index 36258bc1b473..112c50ae9986 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> @@ -1,4 +1,4 @@
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/enable_source
> +What:		/sys/bus/coresight/devices/etm<N>/enable_source
>  Date:		April 2015
>  KernelVersion:  4.01
>  Contact:        Mathieu Poirier <mathieu.poirier@linaro.org>
> @@ -8,82 +8,82 @@ Description:	(RW) Enable/disable tracing on this specific trace entiry.
>  		of coresight components linking the source to the sink is
>  		configured and managed automatically by the coresight framework.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/cpu
> +What:		/sys/bus/coresight/devices/etm<N>/cpu
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) The CPU this tracing entity is associated with.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_pe_cmp
> +What:		/sys/bus/coresight/devices/etm<N>/nr_pe_cmp
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of PE comparator inputs that are
>  		available for tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_addr_cmp
> +What:		/sys/bus/coresight/devices/etm<N>/nr_addr_cmp
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of address comparator pairs that are
>  		available for tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_cntr
> +What:		/sys/bus/coresight/devices/etm<N>/nr_cntr
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of counters that are available for
>  		tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_ext_inp
> +What:		/sys/bus/coresight/devices/etm<N>/nr_ext_inp
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates how many external inputs are implemented.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/numcidc
> +What:		/sys/bus/coresight/devices/etm<N>/numcidc
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of Context ID comparators that are
>  		available for tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/numvmidc
> +What:		/sys/bus/coresight/devices/etm<N>/numvmidc
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of VMID comparators that are available
>  		for tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/nrseqstate
> +What:		/sys/bus/coresight/devices/etm<N>/nrseqstate
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of sequencer states that are
>  		implemented.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_resource
> +What:		/sys/bus/coresight/devices/etm<N>/nr_resource
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of resource selection pairs that are
>  		available for tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_ss_cmp
> +What:		/sys/bus/coresight/devices/etm<N>/nr_ss_cmp
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Indicates the number of single-shot comparator controls that
>  		are available for tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/reset
> +What:		/sys/bus/coresight/devices/etm<N>/reset
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(W) Cancels all configuration on a trace unit and set it back
>  		to its boot configuration.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mode
> +What:		/sys/bus/coresight/devices/etm<N>/mode
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> @@ -91,302 +91,349 @@ Description: 	(RW) Controls various modes supported by this ETM, for example
>  		P0 instruction tracing, branch broadcast, cycle counting and
>  		context ID tracing.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/pe
> +What:		/sys/bus/coresight/devices/etm<N>/pe
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls which PE to trace.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/event
> +What:		/sys/bus/coresight/devices/etm<N>/event
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls the tracing of arbitrary events from bank 0 to 3.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/event_instren
> +What:		/sys/bus/coresight/devices/etm<N>/event_instren
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls the behavior of the events in bank 0 to 3.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/event_ts
> +What:		/sys/bus/coresight/devices/etm<N>/event_ts
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls the insertion of global timestamps in the trace
>  		streams.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/syncfreq
> +What:		/sys/bus/coresight/devices/etm<N>/syncfreq
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls how often trace synchronization requests occur.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/cyc_threshold
> +What:		/sys/bus/coresight/devices/etm<N>/cyc_threshold
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Sets the threshold value for cycle counting.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/bb_ctrl
> +What:		/sys/bus/coresight/devices/etm<N>/bb_ctrl
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls which regions in the memory map are enabled to
>  		use branch broadcasting.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/event_vinst
> +What:		/sys/bus/coresight/devices/etm<N>/event_vinst
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls instruction trace filtering.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/s_exlevel_vinst
> +What:		/sys/bus/coresight/devices/etm<N>/s_exlevel_vinst
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) In Secure state, each bit controls whether instruction
>  		tracing is enabled for the corresponding exception level.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/ns_exlevel_vinst
> +What:		/sys/bus/coresight/devices/etm<N>/ns_exlevel_vinst
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) In non-secure state, each bit controls whether instruction
>  		tracing is enabled for the corresponding exception level.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_idx
> +What:		/sys/bus/coresight/devices/etm<N>/addr_idx
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Select which address comparator or pair (of comparators) to
>  		work with.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_instdatatype
> +What:		/sys/bus/coresight/devices/etm<N>/addr_instdatatype
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls what type of comparison the trace unit performs.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_single
> +What:		/sys/bus/coresight/devices/etm<N>/addr_single
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Used to setup single address comparator values.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_range
> +What:		/sys/bus/coresight/devices/etm<N>/addr_range
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Used to setup address range comparator values.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_idx
> +What:		/sys/bus/coresight/devices/etm<N>/seq_idx
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Select which sequensor.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_state
> +What:		/sys/bus/coresight/devices/etm<N>/seq_state
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Use this to set, or read, the sequencer state.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_event
> +What:		/sys/bus/coresight/devices/etm<N>/seq_event
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Moves the sequencer state to a specific state.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_reset_event
> +What:		/sys/bus/coresight/devices/etm<N>/seq_reset_event
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Moves the sequencer to state 0 when a programmed event
>  		occurs.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/cntr_idx
> +What:		/sys/bus/coresight/devices/etm<N>/cntr_idx
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Select which counter unit to work with.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/cntrldvr
> +What:		/sys/bus/coresight/devices/etm<N>/cntrldvr
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) This sets or returns the reload count value of the
>  		specific counter.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/cntr_val
> +What:		/sys/bus/coresight/devices/etm<N>/cntr_val
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) This sets or returns the current count value of the
>                  specific counter.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/cntr_ctrl
> +What:		/sys/bus/coresight/devices/etm<N>/cntr_ctrl
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls the operation of the selected counter.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/res_idx
> +What:		/sys/bus/coresight/devices/etm<N>/res_idx
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Select which resource selection unit to work with.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/res_ctrl
> +What:		/sys/bus/coresight/devices/etm<N>/res_ctrl
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description: 	(RW) Controls the selection of the resources in the trace unit.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/ctxid_idx
> +What:		/sys/bus/coresight/devices/etm<N>/ctxid_idx
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(RW) Select which context ID comparator to work with.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/ctxid_pid
> +What:		/sys/bus/coresight/devices/etm<N>/ctxid_pid
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(RW) Get/Set the context ID comparator value to trigger on.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/ctxid_masks
> +What:		/sys/bus/coresight/devices/etm<N>/ctxid_masks
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(RW) Mask for all 8 context ID comparator value
>  		registers (if implemented).
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/vmid_idx
> +What:		/sys/bus/coresight/devices/etm<N>/vmid_idx
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(RW) Select which virtual machine ID comparator to work with.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/vmid_val
> +What:		/sys/bus/coresight/devices/etm<N>/vmid_val
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(RW) Get/Set the virtual machine ID comparator value to
>  		trigger on.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/vmid_masks
> +What:		/sys/bus/coresight/devices/etm<N>/vmid_masks
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(RW) Mask for all 8 virtual machine ID comparator value
>  		registers (if implemented).
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcoslsr
> +What:		/sys/bus/coresight/devices/etm<N>/addr_exlevel_s_ns
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> +Description:	(RW) Set the Exception Level matching bits for secure and
> +		non-secure exception levels.
> +
> +What:		/sys/bus/coresight/devices/etm<N>/vinst_pe_cmp_start_stop
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> +Description:	(RW) Access the start stop control register for PE input
> +		comparators.
> +
> +What:		/sys/bus/coresight/devices/etm<N>/addr_cmp_view
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> +Description:	(R) Print the current settings for the selected address
> +		comparator.
> +
> +What:		/sys/bus/coresight/devices/etm<N>/sshot_idx
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> +Description:	(RW) Select the single shot control register to access.
> +
> +What:		/sys/bus/coresight/devices/etm<N>/sshot_ctrl
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> +Description:	(RW) Access the selected single shot control register.
> +
> +What:		/sys/bus/coresight/devices/etm<N>/sshot_status
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> +Description:	(R) Print the current value of the selected single shot
> +		status register.
> +
> +What:		/sys/bus/coresight/devices/etm<N>/sshot_pe_ctrl
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> +Description:	(RW) Access the selected single show PE comparator control
> +		register.
> +

I didn't notice this in the first round - please split further.  So one patch to
address the etm<N> and another for adding new features.

For patches 1, 3, 4 and 8:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcoslsr
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the OS Lock Status Register (0x304).
>  		The value it taken directly  from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpdcr
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpdcr
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Power Down Control Register
>  		(0x310).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpdsr
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpdsr
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Power Down Status Register
>  		(0x314).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trclsr
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trclsr
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the SW Lock Status Register
>  		(0xFB4).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcauthstatus
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcauthstatus
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Authentication Status Register
>  		(0xFB8).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcdevid
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcdevid
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Device ID Register
>  		(0xFC8).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcdevtype
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcdevtype
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Device Type Register
>  		(0xFCC).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr0
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr0
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Peripheral ID0 Register
>  		(0xFE0).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr1
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr1
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Peripheral ID1 Register
>  		(0xFE4).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr2
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr2
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Peripheral ID2 Register
>  		(0xFE8).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr3
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr3
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the Peripheral ID3 Register
>  		(0xFEC).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcconfig
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcconfig
>  Date:		February 2016
>  KernelVersion:	4.07
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the trace configuration register
>  		(0x010) as currently set by SW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trctraceid
> +What:		/sys/bus/coresight/devices/etm<N>/mgmt/trctraceid
>  Date:		February 2016
>  KernelVersion:	4.07
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Print the content of the trace ID register (0x040).
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr0
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr0
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Returns the tracing capabilities of the trace unit (0x1E0).
>  		The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr1
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr1
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Returns the tracing capabilities of the trace unit (0x1E4).
>  		The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr2
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr2
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> @@ -394,7 +441,7 @@ Description:	(R) Returns the maximum size of the data value, data address,
>  		VMID, context ID and instuction address in the trace unit
>  		(0x1E8).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr3
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr3
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> @@ -403,42 +450,42 @@ Description:	(R) Returns the value associated with various resources
>  		architecture specification for more details (0x1E8).
>  		The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr4
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr4
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Returns how many resources the trace unit supports (0x1F0).
>  		The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr5
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr5
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Returns how many resources the trace unit supports (0x1F4).
>  		The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr8
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr8
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Returns the maximum speculation depth of the instruction
>  		trace stream. (0x180).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr9
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr9
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Returns the number of P0 right-hand keys that the trace unit
>  		can use (0x184).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr10
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr10
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:	(R) Returns the number of P1 right-hand keys that the trace unit
>  		can use (0x188).  The value is taken directly from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr11
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr11
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> @@ -446,7 +493,7 @@ Description:	(R) Returns the number of special P1 right-hand keys that the
>  		trace unit can use (0x18C).  The value is taken directly from
>  		the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr12
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr12
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> @@ -454,7 +501,7 @@ Description:	(R) Returns the number of conditional P1 right-hand keys that
>  		the trace unit can use (0x190).  The value is taken directly
>  		from the HW.
>  
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr13
> +What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr13
>  Date:		April 2015
>  KernelVersion:	4.01
>  Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> -- 
> 2.17.1
> 
