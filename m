Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8637C7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 17:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753057AbeDBR0j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 13:26:39 -0400
Received: from mail-pl0-f51.google.com ([209.85.160.51]:41677 "EHLO
        mail-pl0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752898AbeDBR0i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 13:26:38 -0400
Received: by mail-pl0-f51.google.com with SMTP id bj1-v6so2532335plb.8
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1SXa+tLY6wDNnhkxsgcyZbEGIaCrkvNGnUjFANqgmDM=;
        b=LxpeJwKtsLGOgj3xIr6L2N/o5rTNWJo7YPRRatpOptG58GvTgvdkXx1z+5BpJwCnZX
         yFQHdeGIdWgkhkL6g33Iykdqbtif+h/dYaS/Qx7vAkFRW65/52YN7uxyeltIcFUeg5i7
         ZU5YuVeP5Omdmyw/gOJEtX73gt5fCqiJNQgdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1SXa+tLY6wDNnhkxsgcyZbEGIaCrkvNGnUjFANqgmDM=;
        b=UcSNbfc45rRwPCqaK4GiGQI3mLxNkZDdGGr4rKtnSumQ7DcgrwP+5qqKZRICpAlukf
         gZ7A9LPxMXyM7/7/mFNjXqC40lN2tXuqyn/N9Apsbd1RVxLsoX7rHeRbcWeo9cnR2zII
         MKWwgjYNPR4dB2dxTGnyPdkstNNS7N86F+PhkW2wRBgHad+klmDHR1fxHYQBXhL5J20x
         /opFe/if/fTN1rMpilJfEZ4RfLRR9cmHany5IkRYhqEyvLovhp4acKP3TAVdwj7RYL2T
         oDgYQmG6KN52ScrFsRSGtA5ha4Pg1ZTCRPo9kjsX6vmMe2JSXaZ4giFYSWswabkWR04l
         VNpA==
X-Gm-Message-State: AElRT7ELPooCu5v8KSJUljKOfcK4XA0AF08QhRW5A7MMammtg1ygLUl5
        rgJDuJuyKjWTGPA77RN0xEmpRQ==
X-Google-Smtp-Source: AIpwx49GvXc/EViciGAXMNVuf3IdGecjwWSctEUb/w8sxrBzEXqHoEJTPqsuvi0RUSGxGjl2uTkCrQ==
X-Received: by 2002:a17:902:2e43:: with SMTP id q61-v6mr10490709plb.404.1522689997439;
        Mon, 02 Apr 2018 10:26:37 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 67sm1716135pfz.57.2018.04.02.10.26.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Apr 2018 10:26:36 -0700 (PDT)
Date:   Mon, 2 Apr 2018 11:26:34 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v4 2/6] doc: Add documentation for Coresight panic kdump
Message-ID: <20180402172634.GB15452@xps15>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
 <1522379724-30648-3-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1522379724-30648-3-git-send-email-leo.yan@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 11:15:20AM +0800, Leo Yan wrote:
> Add detailed documentation for Coresight panic kdump, which contains
> the idea for why need Coresight panic kdump and introduce the
> implementation of Coresight panic kdump framework; the last section is
> to explain what's usage.
> 
> Credits to Mathieu Poirier for many suggestions since the first version
> patch reviewing.  The suggestions include using an array to manage dump
> related info, this makes code scalable for more CPUs; the Coresight
> kdump driver and integration kdump flow with other Coresight devices
> also have many ideas from Mathieu.

Please remove the above paragraph.

> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>

And the above line too.

> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../trace/coresight/coresight-panic-kdump.txt      | 130 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/trace/coresight/coresight-panic-kdump.txt
> 
> diff --git a/Documentation/trace/coresight/coresight-panic-kdump.txt b/Documentation/trace/coresight/coresight-panic-kdump.txt
> new file mode 100644
> index 0000000..c02e520
> --- /dev/null
> +++ b/Documentation/trace/coresight/coresight-panic-kdump.txt
> @@ -0,0 +1,130 @@
> +		Coresight Panic Kdump
> +		=====================
> +
> +   Author:   Leo Yan <leo.yan@linaro.org>
> +   Date:     March 29th, 2018
> +
> +Introduction
> +------------
> +
> +Coresight has different sinks for trace data, the trace data is quite useful
> +for postmortem debugging.  Embedded Trace Buffer (ETB) is one type sink which
> +provides on-chip storage of trace data, usually uses SRAM as the buffer with
> +several KBs size; if the SoC designs to support 'Local ETF' (ARM DDI 0461B,
> +chapter 1.2.7), every CPU has one local ETB buffer so the per CPU trace data
> +can avoid being overwritten by each other.  Trace Memory Controller (TMC) is
> +another kind sink designed as a successor to the CoreSight ETB to capture trace
> +into DRAM.

I don't think details about the sinks themselves is worth adding here.  In my
opinion we can simply stick with the abstract notion of a sink and achieve the
same result. 

> +
> +After Linux kernel panic has occurred, the trace data keeps the last execution
> +flow before issues happen.  We could consider the trace data is quite useful for
> +postmortem debugging, especially when we can save trace data into DRAM and rely on

Even in documentation files please keep line wrapped to 80 characters (note that
checkpatch won't complain).  Console text from the command line (as added below)
is exempt from this rule.

> +kdump to preserve them into vmcore file; at the end, we can retrieve trace data
> +from vmcore file and "offline" to analyze the execution flow.
> +
> +
> +Implementation
> +--------------
> +
> +Coresight panic kdump is a simple framework to support Coresight dump
> +functionality when panic happens, it maintains an array for the dump, every array
> +item is dedicated to one specific CPU by using CPU number as an index.  For
> +'offline' recovery and analysis Coresight tracing data, except should to recovery

This paragraph as a whole is hard to read and the usage of the word 'except'
above doesn't not work in this context.  Please consider reviewing and/or get in
touch with me if you want to work on it together.  

> +tracing data for sinks, we also need to know CPU tracer configurations; for this
> +purpose, the array item is a structure which combines source and sink device
> +handlers, the device handler points to Coresight device structure which contains
> +dump info: dump buffer base address and buffer size.  Below diagram is to
> +present data structures relationship:
> +
> +  array: coresight_kdump_nodes
> +  +------+------+----------------------+
> +  | CPU0 | CPU1 |   ...                |
> +  +------+------+----------------------+
> +     |
> +     V
> +  coresight_kdump_node              coresight_device
> +  +-------------------+             +-------------------+
> +  |    source_csdev   | ----------> |    kdump_buf      |
> +  +-------------------+      /      +-------------------+
> +  |    sink_csdev     | ----'       |    kdump_buf_sz   |
> +  +-------------------+             +-------------------+
> +
> +Every CPU has its own tracer, we need save tracer registers for tracer ID and
> +configuration related information as metadata, the metadata is used by tracing
> +decoder.  But the tracer has the different configuration at the different phase,
> +below diagram explains tracer configurations for different time points: at the
> +system boot phase, the tracer is disabled so its registers have not been set;
> +after tracer has been enabled or when panic happens, tracer registers have been
> +configured, but we need to consider if there has CPU is locked up at panic phase
> +then this dead CPU has no chance to handle inter-processor interrupt for panic
> +dump; thus we choose tracer enabling phase to save tracer metadata.  Coresight
> +panic kdump provides API coresight_kdump_source() as helper function for
> +recording tracer metadata.
> +
> +                     Boot         Enabling     Panic
> +
> +  Timeline:  ------->|----------->|----------->|----------->
> +
> +  Tracer:            Disabled     Configured   Configured
> +  Sink:              Disabled     Enabled      Enabled with tracing data
> +                                    |            |
> +                                    |            `--> Tracing data dump
> +                                    |
> +                                    `--> Tracer metadata dump
> +
> +After enabling Coresight sink device, function coresight_kdump_sink() is used to
> +set sink device handler for related CPU; sink device handler points to Coresight
> +device structure, furthermore we can retrieve its ops structure and panic
> +callback 'panic_cb' in the ops structure. Coresight panic notifier takes panic CPU
> +tracing data with high priority to firstly invoke panic CPU sink callback function,
> +then the notifier iterates dump array and invoke callback functions one by one
> +for other CPUs.

Same comment as above - this last sentence needs reviewing.  While doing so
please avoid using "high priority" as it can confuse a reader in thinking that
scheduling classes are involved, which isn't the case.

> If one sink device is shared among CPUs, the sink panic
> +callback is invoked for the first traversed CPU node and other sequential CPUs
> +are skipped.
> +
> +
> +Usage
> +-----
> +
> +Build Linux kernel with enabling 'CONFIG_CORESIGHT_PANIC_KDUMP' configuration.
> +
> +After system booting up, we need firstly prepare dump-capture kernel, this can
> +refer doc [1] chapter 'Load the Dump-capture Kernel' for detailed steps.  Then
> +we need enable the Coresight tracer, this can use either perf framework method
> +or sysFS interface, please refer doc [2] chapter 'How to use the tracer modules'
> +for detailed steps.
> +
> +When kernel panic happens, the panic kdump records trace data and launches
> +dump-capture kernel, we can utilize the dump-capture kernel to save kernel dump
> +file, this can refer doc [1] chapter 'Write Out the Dump File'.
> +
> +After get kernel dump file, we can use 'crash' tool + csdump.so extension to
> +extract trace data and generate 'perf.data' file:
> +
> +  ./crash vmcore vmlinux
> +  crash> extend csdump.so
> +  crash> csdump output_dir
> +
> +  We can see in the 'output_dir' there will generate out three files:
> +  output_dir/
> +  ├── cstrace.bin       -> trace raw data
> +  ├── metadata.bin      -> meta data
> +  └── perf.data         -> 'perf' format compatible file

Humm... Saying that perf.data is a "perf format compatible file" is not
accurate as it can't be processed by "perf report".  This is because it doesn't
containt the PERF_RECORD_AUX event notifications and the mechanic for indexing
CS trace data lumps in the perf.data file.

This will likely lead to confusion and calls from many angry users.  As such I
suggest to:

1) Rename perf.data cskdump.data (unless you have a better name).
2) Add a comment to makes it clear that only "perf script" can be used with
cskdump.data

On my side I will review the crash extensions you referred to in the cover
letter.  I may have more comments once I've done so.

> +
> +Finally use 'perf' tool for offline analysis:
> +
> +  ./perf script -v -F cpu,event,ip,sym,symoff -i perf.data -k vmlinux --kallsyms /proc/kallsyms
> +  [001]         instructions:  ffff000008559ad0 pl011_console_write+0x90
> +  [001]         instructions:  ffff000008559230 pl011_read+0x0
> +  [001]         instructions:  ffff00000855924c pl011_read+0x1c
> +  [001]         instructions:  ffff000008559ae0 pl011_console_write+0xa0
> +  [001]         instructions:  ffff000008559ad0 pl011_console_write+0x90
> +  [001]         instructions:  ffff000008559230 pl011_read+0x0
> +  [001]         instructions:  ffff00000855924c pl011_read+0x1c
> +  [001]         instructions:  ffff000008559ae0 pl011_console_write+0xa0
> +  [001]         instructions:  ffff000008559ad0 pl011_console_write+0x90
> +  [001]         instructions:  ffff000008559230 pl011_read+0x0
> +  [001]         instructions:  ffff00000855924c pl011_read+0x1c
> +
> +[1] Documentation/kdump/kdump.txt
> +[2] Documentation/trace/coresight/coresight.txt
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7ee1fdc..cc1243b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1333,6 +1333,7 @@ S:	Maintained
>  F:	drivers/hwtracing/coresight/*
>  F:	Documentation/trace/coresight/coresight.txt
>  F:	Documentation/trace/coresight/coresight-cpu-debug.txt
> +F:	Documentation/trace/coresight/coresight-panic-kdump.txt
>  F:	Documentation/devicetree/bindings/arm/coresight.txt
>  F:	Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
>  F:	Documentation/ABI/testing/sysfs-bus-coresight-devices-*
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
