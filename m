Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F92E7E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 08:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754324AbeDBISl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 04:18:41 -0400
Received: from exmail.andestech.com ([59.124.169.137]:51455 "EHLO
        ATCSQR.andestech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754139AbeDBISl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 04:18:41 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
        by ATCSQR.andestech.com with ESMTP id w328D3Iv059149;
        Mon, 2 Apr 2018 16:13:03 +0800 (GMT-8)
        (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.1.85) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 2 Apr 2018
 16:18:05 +0800
Date:   Mon, 2 Apr 2018 16:18:06 +0800
From:   Alan Kao <alankao@andestech.com>
To:     Alex Solomatnikov <sols@sifive.com>
CC:     Nick Hu <nickhu@andestech.com>, Jonathan Corbet <corbet@lwn.net>,
        "Peter Zijlstra" <peterz@infradead.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        "Albert Ou" <albert@sifive.com>,
        Namhyung Kim <namhyung@kernel.org>,
        <linux-riscv@lists.infradead.org>, Jiri Olsa <jolsa@redhat.com>,
        Greentime Hu <greentime@andestech.com>
Subject: Re: [PATCH 1/2] perf: riscv: preliminary RISC-V support
Message-ID: <20180402081806.GA24954@andestech.com>
References: <1522051075-6442-1-git-send-email-alankao@andestech.com>
 <1522051075-6442-2-git-send-email-alankao@andestech.com>
 <CAJ2AOiNQuMJoPZPxy2CDFD0vnxk8E+N-8xiir2nPYKjWJKxshQ@mail.gmail.com>
 <20180329023024.GA32659@andestech.com>
 <CAJ2AOiPNquo1hGrYjsDcCM4st5Exa7x_-xUV=QW_MCBVCCCkBw@mail.gmail.com>
 <20180402073611.GA7694@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180402073611.GA7694@andestech.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.1.85]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w328D3Iv059149
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi Alex,
 
On Mon, Apr 02, 2018 at 03:36:12PM +0800, Alan Kao wrote:
> On Sat, Mar 31, 2018 at 03:47:10PM -0700, Alex Solomatnikov wrote:
> 
> The original guess was that maybe, an counter value on a hart is picked
> as the minusend, and an old counter value on another hart was recorded
> as the subtrahend but numerically larger.  Then, the overflow causes 
> by that subtraction.  Please let me name this guess as 
> "cross-hart subtraction."
>
> > You can add a skew between cores in qemu, something like this:
> > 
> > case CSR_INSTRET:
> >         core_id()*return cpu_get_host_ticks()/10;
> >     break;
> > case CSR_CYCLE:
> >         return cpu_get_host_ticks();
> >     break;
> > 
> 
> However, I tried similar stuff to reproduce the phenomenon but in vain.
> It seems that the 
>
>               ***cross-hart subtration doesn't even happen, because generic
> code handles them.  ...

I am sorry that this observation is wrong.  With appropriate tweak, we
successfully reproduce the behavior and locate the the bug.

This will be fix in v2.


Thanks for the helps.
Alan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
