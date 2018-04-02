Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 81F317DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 16:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752843AbeDBQlD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 12:41:03 -0400
Received: from mail-pl0-f46.google.com ([209.85.160.46]:42922 "EHLO
        mail-pl0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbeDBQlC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 12:41:02 -0400
Received: by mail-pl0-f46.google.com with SMTP id g20-v6so4802832plo.9
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kNs6Bvt92WgZyYfS+meAWMLmujaXzWQkApzNqQaZmag=;
        b=DO+MexaQyByQvqgzlvwfY+Y51E5Z+X23V+amRRbMFh6TOyMereTVudCNR6orwYT4Q6
         nVEZ/4uAPfs9lMLLkDOvWGuCTWKWuUw3zfV72BDsINJ5COg2N5zW+U9hdwPiHhDUiQWI
         IHJ/4M1QDYnGVwJ5OwOY8ccneCYs30sNoWKuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kNs6Bvt92WgZyYfS+meAWMLmujaXzWQkApzNqQaZmag=;
        b=DRmdx3UvDTRWO0IN/oTkAcYAMucwSmed0RrZA1M3hfGxp3wAZ40r1iCJ9XslYOMpBZ
         CHVoq1bTcBeNg+mrCSWPbcTX7C2qOYJooHWoKyDo11A9yCMgniWFebpYEorBf7ocJHRW
         olqn/+lsJx97jRx9SWVE3tM3XNkZy3V9SaGz3/K8UqHWyzrYZCmutlVD1AZu2fNeIBJS
         FpPy9ArBCmBWXN2x0Toxlayb+B/9nho+NhZPoaFwUgCr5sd7mXw+rpSRDVImVG8t6Wx6
         F+bY+rKA0KSOrQaevHwAYtaeedqzRBkXzHitqsVjihSvSeQiEEjaQVfV72l7YfNSPrJD
         EpWw==
X-Gm-Message-State: AElRT7GRSR1+D/3gOn5vbouHCJrJsHdHK8ThfA3M7ubF5Px4dxfLYy1B
        596GfTZ7nID22+1VziCXJM0OyA==
X-Google-Smtp-Source: AIpwx4/GXxh8FJdhD6Ax2nhkH3CKiCSOmBPjk+vlOqWiEoBOBwCEyiVargwEGVzemGHEoJf7bTreCg==
X-Received: by 2002:a17:902:3e5:: with SMTP id d92-v6mr10815656pld.104.1522687261858;
        Mon, 02 Apr 2018 09:41:01 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 5sm1976189pfh.133.2018.04.02.09.41.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Apr 2018 09:41:00 -0700 (PDT)
Date:   Mon, 2 Apr 2018 10:40:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v4 0/6] Coresight: Support panic kdump
Message-ID: <20180402164058.GA15452@xps15>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Leo,

Please see below (and in upcoming patches) my comments related to your latest
work.

Thanks,
Mathieu

On Fri, Mar 30, 2018 at 11:15:18AM +0800, Leo Yan wrote:
> This patch set is to explore Coresight tracing data for postmortem
> debugging.  When kernel panic happens, the Coresight panic kdump can
> help to save on-chip tracing data and tracer metadata into DRAM, later
> relies on kdump and crash/perf tools to recovery tracing data for
> "offline" analysis.
> 
> The documentation is important to understand the purpose of Coresight
> panic kdump, the implementation of framework and usage. Patches 0001
> and patch 0002 are used for creating new sub directory for placing
> Coresight docs and add a new doc for Coresight panic kdump.
> 
> Patch 0003 introduces the simple panic kdump framework which provides
> helper functions can be used by Coresight devices, and it registers
> panic notifier for dump tracing data.
> 
> Patches 0004/0005 support panic kdump for ETB; Patch 0006 supports the
> kdump for ETMv4.
> 
> This patch set has been reworked by following suggestions at Linaro
> HKG18 connect (mainly suggestions from Mathieu, thanks a lot!), and
> it's rebased on acme git tree [1] with last commit 109d59b900e7 ('perf
> vendor events s390: Add JSON files for IBM z14').
> 
> Due Coresight kdump data structure has been changed significantly, the
> corresponding crash extension program also has been updated for this
> reason [2]; furthermore the crash extension program is updated to
> dynamically generate kernel buildid according to vmlinux elf info [3],
> this is a fixing for the old code which uses hard-coded buildid value.
> 
> This patch set has been verified on 96boards Hikey620 with Coresight
> enabling by the sysFS interface.  Also the updated crash extension
> program has been verified to cowork with Coresight panic kdump and it
> successfully extracts tracing data from the vmcore and finally can be
> decoded by perf tool.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git
> [2] https://git.linaro.org/people/leo.yan/crash.git/tree/extensions/csdump.c
> [3] https://git.linaro.org/people/leo.yan/crash.git/tree/extensions/csdump_buildid.c
> 
> Changes from v3:
> * Following Mathieu suggestion, reworked the panic kdump framework,
>   used kdump array to maintain source and sink device handlers;
> * According to Mathieu suggestion, optimized panic notifier to
>   firstly dump panic CPU tracing data and then dump other CPUs tracing
>   data;
> * Refined doc to reflect these implementation changes;
> * Changed ETMv4 driver to add source device handler at probe phase;
> * Refactored crash extension program to reflect kernel changes.
> 
> Changes from v2:
> * Add the two patches for documentation.
> * Following Mathieu suggestion, reworked the panic kdump framework,
>   removed the useless flag "PRE_PANIC".
> * According to comment, changed to add and delete kdump node operations
>   in sink enable/disable functions;
> * According to Mathieu suggestion, handle kdump node
>   addition/deletion/updating separately for sysFS interface and perf
>   method.
> 
> Changes from v1:
> * Add support to dump ETMv4 meta data.
> * Wrote 'crash' extension csdump.so so rely on it to generate 'perf'
>   format compatible file.
> * Refactored panic dump driver to support pre & post panic dump.
> 
> Changes from RFC:
> * Follow Mathieu's suggestion, use general framework to support dump
>   functionality.
> * Changed to use perf to analyse trace data.
> 
> Leo Yan (6):
>   doc: Add Coresight documentation directory
>   doc: Add documentation for Coresight panic kdump
>   coresight: Support panic kdump functionality
>   coresight: tmc: Hook callback for panic kdump
>   coresight: Set and clear sink device handler for kdump node
>   coresight: etm4x: Support panic kdump
> 
>  Documentation/trace/coresight-cpu-debug.txt        | 187 ----------
>  Documentation/trace/coresight.txt                  | 383 ---------------------
>  .../trace/coresight/coresight-cpu-debug.txt        | 187 ++++++++++
>  .../trace/coresight/coresight-panic-kdump.txt      | 130 +++++++
>  Documentation/trace/coresight/coresight.txt        | 383 +++++++++++++++++++++

Please use the -M option with git format-patch in order to prevent the metrics
associated with the renaming of files to be tallied.

>  MAINTAINERS                                        |   5 +-
>  drivers/hwtracing/coresight/Kconfig                |   9 +
>  drivers/hwtracing/coresight/Makefile               |   1 +
>  drivers/hwtracing/coresight/coresight-etm-perf.c   |   5 +
>  drivers/hwtracing/coresight/coresight-etm4x.c      |  27 ++
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  15 +
>  .../hwtracing/coresight/coresight-panic-kdump.c    | 199 +++++++++++
>  drivers/hwtracing/coresight/coresight-priv.h       |  12 +
>  drivers/hwtracing/coresight/coresight-tmc-etf.c    |  30 ++
>  drivers/hwtracing/coresight/coresight.c            |  16 +-
>  include/linux/coresight.h                          |   4 +
>  16 files changed, 1019 insertions(+), 574 deletions(-)
>  delete mode 100644 Documentation/trace/coresight-cpu-debug.txt
>  delete mode 100644 Documentation/trace/coresight.txt
>  create mode 100644 Documentation/trace/coresight/coresight-cpu-debug.txt
>  create mode 100644 Documentation/trace/coresight/coresight-panic-kdump.txt
>  create mode 100644 Documentation/trace/coresight/coresight.txt
>  create mode 100644 drivers/hwtracing/coresight/coresight-panic-kdump.c
> 
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
