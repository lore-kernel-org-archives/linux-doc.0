Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9FBB67DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 13:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758117AbeD0NP3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 09:15:29 -0400
Received: from foss.arm.com ([217.140.101.70]:39992 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758215AbeD0NP3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 09:15:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7231D1529;
        Fri, 27 Apr 2018 06:15:28 -0700 (PDT)
Received: from dupont (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60DB93F487;
        Fri, 27 Apr 2018 06:15:27 -0700 (PDT)
Date:   Fri, 27 Apr 2018 08:15:25 -0500
From:   Kim Phillips <kim.phillips@arm.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <Will.Deacon@arm.com>,
        <jnair@caviumnetworks.com>, <Robert.Richter@cavium.com>,
        <Vadim.Lomovtsev@cavium.com>, <Jan.Glauber@cavium.com>,
        <gklkml16@gmail.com>
Subject: Re: [PATCH v4 2/2] ThunderX2: Add Cavium ThunderX2 SoC UNCORE PMU
 driver
Message-Id: <20180427081525.f9dcc756678baf3bb6e6e473@arm.com>
In-Reply-To: <20180427093027.ngtuoezyh6mtz26p@lakrids.cambridge.arm.com>
References: <20180425090047.6485-1-ganapatrao.kulkarni@cavium.com>
        <20180425090047.6485-3-ganapatrao.kulkarni@cavium.com>
        <20180426170624.bfcba885431d57d0de2a3ddd@arm.com>
        <20180427093027.ngtuoezyh6mtz26p@lakrids.cambridge.arm.com>
Organization: Arm
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 27 Apr 2018 10:30:27 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> Hi Kim,
> 
> On Thu, Apr 26, 2018 at 05:06:24PM -0500, Kim Phillips wrote:
> > On Wed, 25 Apr 2018 14:30:47 +0530
> > Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com> wrote:
> > 
> > > +static int thunderx2_uncore_event_init(struct perf_event *event)
> 
> > This PMU driver can be made more user-friendly by not just silently
> > returning an error code such as -EINVAL, but by emitting a useful
> > message describing the specific error via dmesg.
> 
> As has previously been discussed on several occasions, patches which log
> to dmesg in a pmu::event_init() path at any level above pr_debug() are
> not acceptable -- dmesg is not intended as a mechanism to inform users
> of driver-specific constraints.

I disagree - drivers do it all the time, using dev_err(), dev_warn(), etc.

> I would appreciate if in future you could qualify your suggestion with
> the requirement that pr_debug() is used.

It shouldn't - the driver isn't being debugged, it's in regular use.

Thanks,

Kim
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
