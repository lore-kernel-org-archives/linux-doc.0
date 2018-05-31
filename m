Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,FSL_HELO_FAKE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8AC9C7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754455AbeEaKkW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:40:22 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:53791 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754346AbeEaKkU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 06:40:20 -0400
Received: by mail-wm0-f65.google.com with SMTP id a67-v6so52929891wmf.3;
        Thu, 31 May 2018 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s/kBbuOV6q3LEFqhsMjfvNwiyoeOVplTCdnKfjHR1Bk=;
        b=oEDLnokj0K9IabxkdDv/SECo8IT5qP9dUTkLwCWMnPBpDLVW2EJOwA30MvP3YihJbU
         uLDUadkerbN6uHJbqf561x1WOiZjuPD4QQRfQAimxWgpoDVkvHKYsdyTv1ETBlWb4/oi
         YNk9RAqkz0UY7xt2J9ImIj8vwqgTK95GkQz1dDCIYZQBCRrotIS1IkI0qUDRV06RCaZ+
         2houKEO9eNR8MM7uEAs/S0dYnDigus0fRv+NYG0HqwQZAjAUKAOHKyvz7dnHHYDcOj3+
         t8jjWKTkyZF7u5+baieKdo1iVRHGvDaRgOtke85lrwN3OFjiC/DNnXW06HvLQ1m6OUsW
         y+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=s/kBbuOV6q3LEFqhsMjfvNwiyoeOVplTCdnKfjHR1Bk=;
        b=QDeMVm32bh+kUNGUJFzBH9joAN2rEkIisVPlRnIyDb6Gui9cndB1wYwYWwXt4CWxGt
         qTtUXzuE3vRvZAkCUH+QWPvRwp5lJF8U4RZyIXDDReQhwAoK7emJK+WY6SdNuVhS70Xh
         qtYRzxiv/V3JO957qKDRcM+WCzUuDONKiy23GXp8nKp4wKmHt7WdGaARm6hMqJbB0A50
         MUVnSG1Y+/mTCINlSY3zrp/HZ2WcplgtYqg7N9Uru6noDmb/M0xT6w0TZdkZgkSEZz7A
         YR8SsWZVcIzcVIXZuAWSZTyIk5NaByu4w0ZQFGB1gqQ0rt+Wnevwam/oc8/FH8ih3jP1
         Xb5A==
X-Gm-Message-State: ALKqPwfiVFgFvgrFiQp9G59cORWipdxMp7WzxVzAdGEJ/pRA4oQlhtlv
        KJnEYz8VB0/NuGChC8G5E7c=
X-Google-Smtp-Source: ADUXVKI0LXoNla8Rzrr9sYzP6iw3IlWMakL1e9WMdGzN4cMsZps7zUoeP/eHRyk1r9IqDNMRsMQKrA==
X-Received: by 2002:a1c:ae0c:: with SMTP id x12-v6mr4235842wme.133.1527763218739;
        Thu, 31 May 2018 03:40:18 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id n18-v6sm14172741wrj.58.2018.05.31.03.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 May 2018 03:40:17 -0700 (PDT)
Date:   Thu, 31 May 2018 12:40:14 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Agustin Vega-Frias <agustinv@codeaurora.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andi Kleen <ak@linux.intel.com>, coresight@lists.linaro.org,
        Daniel Borkmann <daniel@iogearbox.net>,
        David Ahern <dsahern@gmail.com>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        He Kuang <hekuang@huawei.com>,
        Hendrik Brueckner <brueckner@linux.vnet.ibm.com>,
        Jin Yao <yao.jin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Kan Liang <kan.liang@linux.intel.com>, kim.phillips@arm.co,
        Kim Phillips <kim.phillips@arm.com>,
        Lakshman Annadorai <lakshmana@google.com>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>, netdev@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Robert Walker <robert.walker@arm.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Simon Que <sque@chromium.org>,
        Stephane Eranian <eranian@google.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Tor Jeremiassen <tor@ti.com>, Wang Nan <wangnan0@huawei.com>,
        Will Deacon <will.deacon@arm.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [GIT PULL 0/7] perf/urgent fixes
Message-ID: <20180531104014.GA29957@gmail.com>
References: <20180531103220.24684-1-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180531103220.24684-1-acme@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


* Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> Hi Ingo,
> 
> 	Please consider pulling,
> 
> - Arnaldo
> 
> Test results at the end of this message, as usual.
> 
> The following changes since commit f3903c9161f0d636a7b0ff03841628928457e64c:
> 
>   Merge tag 'perf-urgent-for-mingo-4.17-20180514' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/urgent (2018-05-15 08:20:45 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-urgent-for-mingo-4.17-20180531
> 
> for you to fetch changes up to 18a7057420f8b67f15d17087bf5c0863db752c8b:
> 
>   perf tools: Fix perf.data format description of NRCPUS header (2018-05-30 15:40:26 -0300)
> 
> ----------------------------------------------------------------
> perf/urgent fixes:
> 
> - Fix 'perf test Session topology' segfault on s390 (Thomas Richter)
> 
> - Fix NULL return handling in bpf__prepare_load() (YueHaibing)
> 
> - Fix indexing on Coresight ETM packet queue decoder (Mathieu Poirier)
> 
> - Fix perf.data format description of NRCPUS header (Arnaldo Carvalho de Melo)
> 
> - Update perf.data documentation section on cpu topology
> 
> - Handle uncore event aliases in small groups properly (Kan Liang)
> 
> - Add missing perf_sample.addr into python sample dictionary (Leo Yan)
> 
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> ----------------------------------------------------------------
> Arnaldo Carvalho de Melo (1):
>       perf tools: Fix perf.data format description of NRCPUS header
> 
> Kan Liang (1):
>       perf parse-events: Handle uncore event aliases in small groups properly
> 
> Leo Yan (1):
>       perf script python: Add addr into perf sample dict
> 
> Mathieu Poirier (1):
>       perf cs-etm: Fix indexing for decoder packet queue
> 
> Thomas Richter (2):
>       perf test: "Session topology" dumps core on s390
>       perf data: Update documentation section on cpu topology
> 
> YueHaibing (1):
>       perf bpf: Fix NULL return handling in bpf__prepare_load()
> 
>  tools/perf/Documentation/perf.data-file-format.txt |  10 +-
>  tools/perf/tests/topology.c                        |  30 ++++-
>  tools/perf/util/bpf-loader.c                       |   6 +-
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  12 +-
>  tools/perf/util/evsel.h                            |   1 +
>  tools/perf/util/parse-events.c                     | 130 ++++++++++++++++++++-
>  tools/perf/util/parse-events.h                     |   7 +-
>  tools/perf/util/parse-events.y                     |   8 +-
>  .../util/scripting-engines/trace-event-python.c    |   2 +
>  9 files changed, 185 insertions(+), 21 deletions(-)

Pulled, thanks a lot Arnaldo!

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
