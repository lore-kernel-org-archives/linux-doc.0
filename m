Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF1AE7E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 14:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750826AbeCPO1H (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 10:27:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750766AbeCPO1H (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:27:07 -0400
Received: from devbox (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61153217D2;
        Fri, 16 Mar 2018 14:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61153217D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mhiramat@kernel.org
Date:   Fri, 16 Mar 2018 23:26:59 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     oleg@redhat.com, peterz@infradead.org, srikar@linux.vnet.ibm.com,
        acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, gregkh@linuxfoundation.org,
        huawei.libin@huawei.com, hughd@google.com, jack@suse.cz,
        jglisse@redhat.com, jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com
Subject: Re: [PATCH 8/8] trace_uprobe/sdt: Document about reference counter
Message-Id: <20180316232659.4a9a31eac46c6b30105d2bce@kernel.org>
In-Reply-To: <e991f9e2-6488-7739-548d-6ca28c57826d@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
        <20180313125603.19819-9-ravi.bangoria@linux.vnet.ibm.com>
        <20180314225021.64109239de8b14b0aec1e1c5@kernel.org>
        <ec9c4ef7-0117-7c7c-64bc-f6bf4261721d@linux.vnet.ibm.com>
        <20180315214750.fc1d53d01045d8e6c1e8e491@kernel.org>
        <e991f9e2-6488-7739-548d-6ca28c57826d@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 16 Mar 2018 15:12:38 +0530
Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:

> On 03/15/2018 06:17 PM, Masami Hiramatsu wrote:
> > Hi Ravi,
> >
> > On Wed, 14 Mar 2018 20:52:59 +0530
> > Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
> >
> >> On 03/14/2018 07:20 PM, Masami Hiramatsu wrote:
> >>> On Tue, 13 Mar 2018 18:26:03 +0530
> >>> Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
> >>>
> >>>> No functionality changes.
> >>> Please consider to describe what is this change and why, here.
> >> Will add in next version.
> > Thanks, and could you also move this before perf-probe patch?
> > Also Could you make perf-probe check the tracing/README whether
> > the kernel supports reference counter syntax or not?
> >
> > perf-tool can be used on older (or stable) kernel.
> 
> Sure, Will do that.

Please see scan_ftrace_readme@util/probe-file.c :)
It is easy to expand the pattern table.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
