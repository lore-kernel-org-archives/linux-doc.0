Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AF9C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jul 2023 19:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjGMTI5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jul 2023 15:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjGMTI4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 15:08:56 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 653581993;
        Thu, 13 Jul 2023 12:08:53 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 716E61570;
        Thu, 13 Jul 2023 12:09:35 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (unknown [10.37.36.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1495E3F67D;
        Thu, 13 Jul 2023 12:08:50 -0700 (PDT)
Date:   Thu, 13 Jul 2023 20:08:48 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Cc:     Will Deacon <will@kernel.org>, corbet@lwn.net,
        catalin.marinas@arm.com, maz@kernel.org, quic_pkondeti@quicinc.com,
        quic_kaushalk@quicinc.com, quic_satyap@quicinc.com,
        quic_shashim@quicinc.com, quic_songxue@quicinc.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Add the arm64.nolse_atomics command line option
Message-ID: <ZLBLwG2LJ4gZLfbh@FVFF77S0Q05N.cambridge.arm.com>
References: <20230710093751.GC32673@willie-the-truck>
 <5cf15f85-0397-96f7-4110-13494551b53b@quicinc.com>
 <20230711082226.GA1554@willie-the-truck>
 <84f0994a-26de-c20a-a32f-ec8fe41df3a3@quicinc.com>
 <20230711102510.GA1809@willie-the-truck>
 <67c2621f-4cad-2495-9785-7737246d3e90@quicinc.com>
 <ZK5X9bXQT7GBxNHj@FVFF77S0Q05N.emea.arm.com>
 <604ac52d-4336-744f-2ab8-44d1c93fbaa8@quicinc.com>
 <ZK_d86ApI1FCHhTL@FVFF77S0Q05N.cambridge.arm.com>
 <e02b9969-a3ca-a80d-1d32-25d2bf4c72b6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e02b9969-a3ca-a80d-1d32-25d2bf4c72b6@quicinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 13, 2023 at 10:08:34PM +0800, Aiqun(Maria) Yu wrote:
> On 7/13/2023 7:20 PM, Mark Rutland wrote:
> > Are you saying that LSE atomics to *cacheable* mappings do not work on your
> > system?
> > 
> > Specifically, when using a Normal Inner-Shareable Inner-Writeback
> > Outer-Writeback mapping, do the LSE atomics work or not work?
> *cacheable* mapping have the LSE atomic is not working if far atomic is
> performed.

Thanks for confirming; the fact that this doesn't work on *cacheable* memory is
definitely a major issue. I think everyone is confused here because of the
earlier mention of non-cachable accesses (which don't matter).

I know that some CPU implementations have EL3 control bits to force LSE atomics
to be performed near (e.g. in Cortex-A55, the CPUECTLR.ATOM control bits),
which would avoid the issue while still allowing the LSE atomics to be used.

If those can be configured in EL3 firmware, that would be a preferable
workaround.

Can you say which CPUs are integrated in this system? and/or can you check if
such control bits exist?

Thanks,
Mark.
 
