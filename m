Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3BC5C7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 10:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751905AbeEUKzQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 06:55:16 -0400
Received: from foss.arm.com ([217.140.101.70]:46970 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751078AbeEUKzQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 May 2018 06:55:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8CB61435;
        Mon, 21 May 2018 03:55:15 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDBA73F25D;
        Mon, 21 May 2018 03:55:13 -0700 (PDT)
Date:   Mon, 21 May 2018 11:55:11 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Ganapatrao Kulkarni <gklkml16@gmail.com>
Cc:     Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <Will.Deacon@arm.com>, jnair@caviumnetworks.com,
        Robert Richter <Robert.Richter@cavium.com>,
        Vadim.Lomovtsev@cavium.com, Jan.Glauber@cavium.com
Subject: Re: [PATCH v4 2/2] ThunderX2: Add Cavium ThunderX2 SoC UNCORE PMU
 driver
Message-ID: <20180521105511.6ztjk5conf7lfaiz@lakrids.cambridge.arm.com>
References: <20180425090047.6485-1-ganapatrao.kulkarni@cavium.com>
 <20180425090047.6485-3-ganapatrao.kulkarni@cavium.com>
 <20180426105938.y6unpt36lisb7kbr@lakrids.cambridge.arm.com>
 <CAKTKpr7Q7T9ZCTBi=LQR=XaAoihbBA3OKCO7yFobzNmR8EfyjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKTKpr7Q7T9ZCTBi=LQR=XaAoihbBA3OKCO7yFobzNmR8EfyjQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 05, 2018 at 12:16:13AM +0530, Ganapatrao Kulkarni wrote:
> On Thu, Apr 26, 2018 at 4:29 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Wed, Apr 25, 2018 at 02:30:47PM +0530, Ganapatrao Kulkarni wrote:

> >> + *
> >> + *  L3 Tile and DMC channel selection is through SMC call
> >> + *  SMC call arguments,
> >> + *   x0 = THUNDERX2_SMC_CALL_ID      (Vendor SMC call Id)
> >> + *   x1 = THUNDERX2_SMC_SET_CHANNEL  (Id to set DMC/L3C channel)
> >> + *   x2 = Node id
> >
> > How do we map Linux node IDs to the firmware's view of node IDs?
> >
> > I don't believe the two are necessarily the same -- Linux's node IDs are
> > a Linux-specific construct.
> 
> both are same, it is numa node id from ACPI/firmware.

I am very wary about assuming that the Linux nid will always be the same
as the ACPI node id.

For that to *potentially* be true, this driver should depend on
CONFIG_NUMA, NUMA must not be disabled on the command line, etc, or the
node id will always be NUMA_NO_NODE.

I would be *much* happier if we had an explicit mapping somewhere to the
ID the FW expects.

> > It would be much nicer if we could pass something based on the MPIDR,
> > which is a known HW construct, or if this implicitly affected the
> > current node.
> 
> IMO,  node id is sufficient.

I agree that *a* node ID is sufficient, I just don't think that we're
guaranteed to have the specific node ID the FW wants.

> > It would be vastly more sane for this to not be muxed at all. :/
> 
> i am helpless due to crappy hw design!

I'm certainly not blaming you for this! :)

I hope the HW designers don't make the same mistake in future, though...

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
