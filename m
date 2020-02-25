Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF33FC35DF5
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F1F821556
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgBYKGu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 05:06:50 -0500
Received: from ms.lwn.net ([45.79.88.28]:53048 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727016AbgBYKGu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 05:06:50 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 85475750;
        Tue, 25 Feb 2020 10:06:47 +0000 (UTC)
Date:   Tue, 25 Feb 2020 03:06:42 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH 6/7] docs: remove nompx kernel parameter and intel_mpx
 from index.rst
Message-ID: <20200225030642.0c0e84a8@lwn.net>
In-Reply-To: <a4d6c6c7-7901-7584-fc90-a8f933b2e238@intel.com>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
        <934144ad8199db837c3b21479e6966c597706dab.1582361738.git.mchehab+huawei@kernel.org>
        <a4d6c6c7-7901-7584-fc90-a8f933b2e238@intel.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 24 Feb 2020 09:30:09 -0800
Dave Hansen <dave.hansen@intel.com> wrote:

> On 2/22/20 1:00 AM, Mauro Carvalho Chehab wrote:
> > -	nompx		[X86] Disables Intel Memory Protection Extensions.
> > -			See Documentation/x86/intel_mpx.rst for more
> > -			information about the feature.  
> 
> Thanks for finding this.
> 
> But, it does make me wonder if we should remove it outright or leave a
> stub reminding folks that "nompx" probably shouldn't be reused for a
> while.  Maybe something like:
> 
> 	nompx	[X86] Previously, disabled Intel Memory Protection
> 		Extensions.  Code removed in v5.6.
> 
Is the concern that people might still be booting kernels with that
option, even though it's gone?  If that's the case, probably what should
really happen is a check within the code to issue a warning telling those
users that MPX is an ex-parrot.  That would also have the effect of
deterring reuse... ?

Thanks,

jon
