Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437D9C63697
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 16:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 086E921741
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 16:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K5NPkzil"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391174AbgKZQXq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 11:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390011AbgKZQXq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 11:23:46 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35613C0613D4;
        Thu, 26 Nov 2020 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=J/yD0KFriqWMZtNa1/eriAjfaLbTwrShtSXGHA91Qqg=; b=K5NPkzils6igylPVgbl+1esF0f
        xEzI5QMLfMEX0KgTXqboE+X4bWmnUW/Z5SekuMxAJZq+QYCwLAOHi85g4/x8hK92dQo6z0uuzcIYI
        +YUWiX9k0nw6q+Q3B20Oi0l7wp/0CCpUmjiU4EZ7NE4KRt7RGmJTuus3kubc0TygiTjwTm8irUWXG
        gRz/HaZGA19gBb4X4o5azgcd55gSeyCKO8NiElpskZsl7C/ft1Rd+MjrZ+aUgEJrPbRLZl7ujCadT
        psBDmdMn+xz5XFyWb3zYx9TSbT6GAcvM3VZi6h/MD/NtmJ4Ob4qrpJPnzVP+5C8cn9nn0PGlgDn5j
        zBeC1vBA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kiK3X-0000x3-2G; Thu, 26 Nov 2020 16:23:39 +0000
Date:   Thu, 26 Nov 2020 16:23:38 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     David Brazdil <dbrazdil@google.com>, kvmarm@lists.cs.columbia.edu,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 00/23] Opt-in always-on nVHE hypervisor
Message-ID: <20201126162338.GV4327@casper.infradead.org>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155746.GU4327@casper.infradead.org>
 <6a2a14af06232cdf2f5146cd8ec6fc35@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a2a14af06232cdf2f5146cd8ec6fc35@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 26, 2020 at 04:19:55PM +0000, Marc Zyngier wrote:
> On 2020-11-26 15:57, Matthew Wilcox wrote:
> > On Thu, Nov 26, 2020 at 03:53:58PM +0000, David Brazdil wrote:
> > > The hypervisor starts trapping host SMCs and intercepting host's PSCI
> > > CPU_ON/SUSPEND calls. It replaces the host's entry point with its own,
> > > initializes the EL2 state of the new CPU and installs the nVHE hyp
> > > vector
> > > before ERETing to the host's entry point.
> > 
> > I hate CPU people.  This is complete gibberish to anyone who doesn't
> > already have their head deep in ... whatever you're talking about.
> 
> What I hate the most is people having a go at other people because they
> don't understand what is being discussed. Who is at fault there?

The person who wrote an explanation that doesn't actually explain
anything?  If you're sending mail to a bunch of mailing lists which
aren't already familiar with what you're trying to do, the onus is on
you to do more explanation.
