Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A975D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Apr 2018 05:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751259AbeDEFD0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Apr 2018 01:03:26 -0400
Received: from exmail.andestech.com ([59.124.169.137]:13575 "EHLO
        ATCSQR.andestech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751117AbeDEFDZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Apr 2018 01:03:25 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
        by ATCSQR.andestech.com with ESMTP id w354vCY1026741;
        Thu, 5 Apr 2018 12:57:12 +0800 (GMT-8)
        (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.1.85) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 5 Apr 2018
 13:02:28 +0800
Date:   Thu, 5 Apr 2018 13:02:29 +0800
From:   Alan Kao <alankao@andestech.com>
To:     Palmer Dabbelt <palmer@sifive.com>
CC:     Albert Ou <albert@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Alex Solomatnikov <sols@sifive.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
Message-ID: <20180405050229.GA24451@andestech.com>
References: <20180403142902.GA10563@andestech.com>
 <mhng-9b55b1b6-08a7-499d-a645-ada1ef5f9df1@palmer-si-x1c4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <mhng-9b55b1b6-08a7-499d-a645-ada1ef5f9df1@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.1.85]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w354vCY1026741
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 03, 2018 at 03:45:17PM -0700, Palmer Dabbelt wrote:
> On Tue, 03 Apr 2018 07:29:02 PDT (-0700), alankao@andestech.com wrote:
> >On Mon, Apr 02, 2018 at 08:15:44PM -0700, Palmer Dabbelt wrote:
> >>On Mon, 02 Apr 2018 05:31:22 PDT (-0700), alankao@andestech.com wrote:
> >>>This implements the baseline PMU for RISC-V platforms.
> >>>
> >>>To ease future PMU portings, a guide is also written, containing
> >>>perf concepts, arch porting practices and some hints.
> >>>
> >>>Changes in v2:
> >>> - Fix the bug reported by Alex, which was caused by not sufficient
> >>>   initialization.  Check https://lkml.org/lkml/2018/3/31/251 for the
> >>>   discussion.
> >>>
> >>>Alan Kao (2):
> >>>  perf: riscv: preliminary RISC-V support
> >>>  perf: riscv: Add Document for Future Porting Guide
> >>>
> >>> Documentation/riscv/pmu.txt         | 249 +++++++++++++++++++
> >>> arch/riscv/Kconfig                  |  12 +
> >>> arch/riscv/include/asm/perf_event.h |  76 +++++-
> >>> arch/riscv/kernel/Makefile          |   1 +
> >>> arch/riscv/kernel/perf_event.c      | 468 ++++++++++++++++++++++++++++++++++++
> >>> 5 files changed, 802 insertions(+), 4 deletions(-)
> >>> create mode 100644 Documentation/riscv/pmu.txt
> >>> create mode 100644 arch/riscv/kernel/perf_event.c
> >>
> >>I'm having some trouble pulling this into my tree.  I think you might have
> >>another patch floating around somewhere, as I don't have any
> >>arch/riscv/include/asm/perf_event.h right now.
> >>
> >>Do you mind rebasing this on top of linux-4.16 so I can look properly?
> >>
> >>Thanks!
> >
> >Sorry for the inconvenience, but this patch was based on Alex's patch at
> >https://github.com/riscv/riscv-linux/pull/124/files.  I thought that one
> >had already been picked into your tree.
> >
> >Any ideas?
> 
> Thanks, it applies on top of that.  I'm going to play around with this a
> bit, but it looks generally good.

Note that to make it work better when wraparound occurs, you should change the
value of *.counter_width* into the width of real hardware counters.  This is
because this patch does not handle wraparound checking, so using a wider
bit mask may sometimes report a extremely large number.

Ideally this should be done by adding a Kconfig option called 
"Hifive Unleashed PMU" which automatically sets the width an reuses most of the
baseline codes.  What do you think about this?

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
