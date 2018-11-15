Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 496847D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Nov 2018 15:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388571AbeKPB4D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Nov 2018 20:56:03 -0500
Received: from foss.arm.com ([217.140.101.70]:36810 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388525AbeKPB4C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Nov 2018 20:56:02 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 274B280D;
        Thu, 15 Nov 2018 07:47:41 -0800 (PST)
Received: from brain-police (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD60E3F5BD;
        Thu, 15 Nov 2018 07:47:40 -0800 (PST)
Date:   Thu, 15 Nov 2018 15:47:39 +0000
From:   Will Deacon <will.deacon@arm.com>
To:     Alexander Graf <agraf@suse.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Brown <rbrown@suse.de>,
        Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v2] arm64: Make kpti command line options x86 compatible
Message-ID: <20181115154738.GB2062@brain-police>
References: <20181113152906.55802-1-agraf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113152906.55802-1-agraf@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 13, 2018 at 04:29:06PM +0100, Alexander Graf wrote:
> I've already stumbled over 2 cases where people got confused about how to
> disable kpti on AArch64. In both cases, they used existing x86_64 options
> and just applied that to an AArch64 system, expecting it to work.
> 
> I think it makes a lot of sense to have compatible kernel command line
> parameters whenever we can have them be compatible.
> 
> So this patch adds the pti= and no_pti kernel command line options, mapping
> them into the existing kpti= command line framework. It preserves the old
> syntax to maintain compatibility with older command lines.
> 
> While at it, the patch also marks the respective options as dual-arch.
> 
> Reported-by: Richard Brown <rbrown@suse.de>
> Signed-off-by: Alexander Graf <agraf@suse.de>
> 
> ---
> 
> v1 -> v2:
> 
>   - Actually make it compile. Sorry for the sloppy v1.
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  6 +++---
>  arch/arm64/kernel/cpufeature.c                  | 20 +++++++++++++++++++-
>  2 files changed, 22 insertions(+), 4 deletions(-)

This patch doesn't help though, right, because kpti= has already been
included with backports etc so the ship has sailed? Yeah, it's not ideal,
but we went over this before:

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-August/598395.html

The thing we really need is the sysfs interface hooking up so you can easily
check the state of the mitigation. Still waiting for a follow-up on that ;)

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-September/603412.html

Will
