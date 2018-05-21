Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AC30D7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 10:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750978AbeEUKhR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 06:37:17 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:46722 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750883AbeEUKhR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 May 2018 06:37:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6AB1435;
        Mon, 21 May 2018 03:37:17 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F7563F25D;
        Mon, 21 May 2018 03:37:15 -0700 (PDT)
Date:   Mon, 21 May 2018 11:37:12 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Ganapatrao Kulkarni <gklkml16@gmail.com>
Cc:     Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <Will.Deacon@arm.com>, jnair@caviumnetworks.com,
        Robert Richter <Robert.Richter@cavium.com>,
        Vadim.Lomovtsev@cavium.com, Jan.Glauber@cavium.com
Subject: Re: [PATCH v4 2/2] ThunderX2: Add Cavium ThunderX2 SoC UNCORE PMU
 driver
Message-ID: <20180521103712.gofbrjdtghfwolmd@lakrids.cambridge.arm.com>
References: <20180425090047.6485-1-ganapatrao.kulkarni@cavium.com>
 <20180425090047.6485-3-ganapatrao.kulkarni@cavium.com>
 <20180426105938.y6unpt36lisb7kbr@lakrids.cambridge.arm.com>
 <CAKTKpr7Q7T9ZCTBi=LQR=XaAoihbBA3OKCO7yFobzNmR8EfyjQ@mail.gmail.com>
 <CAKTKpr61zBW_D6v_Ck1Lcp0NJ4wPFOpgbiM5aU_EtuiFU-qp4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKTKpr61zBW_D6v_Ck1Lcp0NJ4wPFOpgbiM5aU_EtuiFU-qp4Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ganapat,


Sorry for the delay in replying; I was away most of last week.

On Tue, May 15, 2018 at 04:03:19PM +0530, Ganapatrao Kulkarni wrote:
> On Sat, May 5, 2018 at 12:16 AM, Ganapatrao Kulkarni <gklkml16@gmail.com> wrote:
> > On Thu, Apr 26, 2018 at 4:29 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> >> On Wed, Apr 25, 2018 at 02:30:47PM +0530, Ganapatrao Kulkarni wrote:

> >>> +static int alloc_counter(struct thunderx2_pmu_uncore_channel *pmu_uncore)
> >>> +{
> >>> +     int counter;
> >>> +
> >>> +     raw_spin_lock(&pmu_uncore->lock);
> >>> +     counter = find_first_zero_bit(pmu_uncore->counter_mask,
> >>> +                             pmu_uncore->uncore_dev->max_counters);
> >>> +     if (counter == pmu_uncore->uncore_dev->max_counters) {
> >>> +             raw_spin_unlock(&pmu_uncore->lock);
> >>> +             return -ENOSPC;
> >>> +     }
> >>> +     set_bit(counter, pmu_uncore->counter_mask);
> >>> +     raw_spin_unlock(&pmu_uncore->lock);
> >>> +     return counter;
> >>> +}
> >>> +
> >>> +static void free_counter(struct thunderx2_pmu_uncore_channel *pmu_uncore,
> >>> +                                     int counter)
> >>> +{
> >>> +     raw_spin_lock(&pmu_uncore->lock);
> >>> +     clear_bit(counter, pmu_uncore->counter_mask);
> >>> +     raw_spin_unlock(&pmu_uncore->lock);
> >>> +}
> >>
> >> I don't believe that locking is required in either of these, as the perf
> >> core serializes pmu::add() and pmu::del(), where these get called.
> 
> without this locking, i am seeing "BUG: scheduling while atomic" when
> i run perf with more events together than the maximum counters
> supported

Did you manage to get to the bottom of this?

Do you have a backtrace?

It looks like in your latest posting you reserve counters through the
userspace ABI, which doesn't seem right to me, and I'd like to
understand the problem.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
