Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C86E7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 12:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbeLFMeA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 07:34:00 -0500
Received: from foss.arm.com ([217.140.101.70]:49520 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728482AbeLFMeA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Dec 2018 07:34:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBF78A78;
        Thu,  6 Dec 2018 04:33:59 -0800 (PST)
Received: from edgewater-inn.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA6D43F575;
        Thu,  6 Dec 2018 04:33:59 -0800 (PST)
Received: by edgewater-inn.cambridge.arm.com (Postfix, from userid 1000)
        id C9B881AE0BAD; Thu,  6 Dec 2018 12:34:20 +0000 (GMT)
Date:   Thu, 6 Dec 2018 12:34:20 +0000
From:   Will Deacon <will.deacon@arm.com>
To:     "Kulkarni, Ganapatrao" <Ganapatrao.Kulkarni@cavium.com>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "Nair, Jayachandran" <Jayachandran.Nair@cavium.com>,
        "Richter, Robert" <Robert.Richter@cavium.com>,
        "Lomovtsev, Vadim" <Vadim.Lomovtsev@cavium.com>,
        Jan Glauber <Jan.Glauber@cavium.com>,
        "gklkml16@gmail.com" <gklkml16@gmail.com>
Subject: Re: [PATCH v11 0/2] Add ThunderX2 SoC Performance Monitoring Unit
 driver
Message-ID: <20181206123420.GA26473@arm.com>
References: <20181206115053.7665-1-ganapatrao.kulkarni@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181206115053.7665-1-ganapatrao.kulkarni@cavium.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ganapat,

On Thu, Dec 06, 2018 at 11:51:24AM +0000, Kulkarni, Ganapatrao wrote:
> This patchset adds PMU driver for Cavium's ThunderX2 SoC UNCORE devices.
> The SoC has PMU support in L3 cache controller (L3C) and in the
> DDR4 Memory Controller (DMC).
> 
> 
> v11:
> 	Updated Patch 2 with minor comments.

Thanks. I've pushed this out on my perf/updates branch:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=perf/updates

but note that I did make some spelling and formatting changes to the
Documentation patch, as well as removal of the event descriptions (they
should be part of the perf tool, as is done for the other system PMUs).

Will
