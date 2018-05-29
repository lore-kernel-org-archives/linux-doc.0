Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D6797D09D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 13:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933548AbeE2Nc3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 09:32:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:55462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933444AbeE2Nc2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 May 2018 09:32:28 -0400
Received: from jouet.infradead.org (unknown [179.97.41.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE1A62086D;
        Tue, 29 May 2018 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527600748;
        bh=Vap7I5mWaw1/QfnbGDNWQRpr76t836565DTbXinNMYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kIXS9FQ+aMzXmxpL1QVKwKvE6nBOTxBQLrj4GlXrWbcnqsYlzre+ekGU9tpSDC65b
         mBNN5ohtHmwaUYYrPQqHYA0+SPmUHD/dS6Kvayctxfm8KPKWN2+7owbINVSvn9IQB/
         +/19kQyC1RduDUxn+dgFHIBGx/TOq0BVbjVHWU8M=
Received: by jouet.infradead.org (Postfix, from userid 1000)
        id AFD0A1468D9; Tue, 29 May 2018 10:32:24 -0300 (-03)
Date:   Tue, 29 May 2018 10:32:24 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        Robert Walker <Robert.Walker@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Kim Phillips <kim.phillips@arm.co>,
        Tor Jeremiassen <tor@ti.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        coresight@lists.linaro.org
Subject: Re: [RFT v3 0/4] Perf script: Add python script for CoreSight trace
 disassembler
Message-ID: <20180529133224.GA20886@kernel.org>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
 <20180528200326.GJ25467@kernel.org>
 <CANLsYkzn5qyzjxMiCPQ1GxyNjhHJp-2H6Lds11HP9rG5xug0FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzn5qyzjxMiCPQ1GxyNjhHJp-2H6Lds11HP9rG5xug0FA@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, May 28, 2018 at 03:53:42PM -0600, Mathieu Poirier escreveu:
> On 28 May 2018 at 14:03, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > Em Mon, May 28, 2018 at 04:44:59PM +0800, Leo Yan escreveu:
> >> This patch series is to support for using 'perf script' for CoreSight
> >> trace disassembler, for this purpose this patch series adds a new
> >> python script to parse CoreSight tracing event and use command 'objdump'
> >> for disassembled lines, finally this can generate readable program
> >> execution flow for reviewing tracing data.
> >>
> >> Patch 0001 is one fixing patch to generate samples for the start packet
> >> and exception packets.
> >>
> >> Patch 0002 is the prerequisite to add addr into sample dict, so this
> >> value can be used by python script to analyze instruction range.
> >>
> >> Patch 0003 is to add python script for trace disassembler.
> >>
> >> Patch 0004 is to add doc to explain python script usage and give
> >> example for it.
> >>
> >> This patch series has been rebased on acme git tree [1] with the commit
> >> 19422a9f2a3b ("perf tools: Fix kernel_start for PTI on x86") and tested
> >> on Hikey (ARM64 octa CA53 cores).
> >
> > Thanks, applied to perf/core.
> 
> Please hold off on that Arnaldo - I'm currently reviewing the set and
> I think some things can be improved.

Ok, I dropped all but the one adding sample->addr to the python
dictionary, that is ok to cherry pick.

- Arnaldo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
