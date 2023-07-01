Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461A3EB64DA
	for <linux-doc@archiver.kernel.org>; Sat,  1 Jul 2023 01:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjGABp2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 21:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGABp2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 21:45:28 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A414201;
        Fri, 30 Jun 2023 18:45:25 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 7E6E45C0175;
        Fri, 30 Jun 2023 21:45:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 30 Jun 2023 21:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688175922; x=1688262322; bh=0032OLr1UDIHP
        BMzcHue27WJgCny0p4WJDgbUYNu8EA=; b=dJey4+Zm9gZf8ekEbrM21L90x3SOo
        pfIiLfBqJvJmY2Yw99ZFQEEqRCodmowN41Ml5cHDf43SMJ8JEzrP7Z4jgWEgRNAl
        DPkN6U9UUnnpxIGDuTeafOrVOo1GOplOon+nuOX9YAgPeVmpozOP2bxPN5hSZWmr
        kFYHKl1pDuDAiRvmmBumHESN5CsOzWkBAPXykV4U4KtJVXUQ+F6Zs6V36oiyrzXC
        ZmK9DQgYeEE2FRgMN6xQpYQcQaQnRWzF2jotz3sLhd21hamoZgMN4/CSwSZQDiLf
        xCrKPaBwaXS7CCvP+hIilKoT2jak54LF9vn+W4fUx/Zw6gUGZa/Mlz8WQ==
X-ME-Sender: <xms:MoWfZPnM_D5ojVAQGN34ZYOk3qBwTmlXFmTd797j1kpb_6FXPJvOig>
    <xme:MoWfZC0YTR3PIe9KvxupWY0szeYpqryFdil4dyWyvHN46826XOpu76lkMehTFsCy9
    fMFkz_yDu6byWykMpU>
X-ME-Received: <xmr:MoWfZFoRaAQdGfXbJ6563uLVcIMwb5dnFc-q-iMSOofseHtJq5o0xbVHlcQ71iJlovT-W-A51wFG5Tl42qcuaXSNcLet1ltAkLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdejgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:MoWfZHmrwa-UkczVSH1DSvclkIqRXBrzlbPlt7C84zJ24putfJRNNA>
    <xmx:MoWfZN18VBOxvpJAnCxA2f3RKmR4vt51qgYEufEWIIkEigV4tS0rEA>
    <xmx:MoWfZGtUymWOII8pPighZAnz21xbJve4S24pTQAvmnBa79ssnDWfbA>
    <xmx:MoWfZGy8oldewttf8hlSKxbZQErvVZSthBUBnLQsMw8lc6y4HTId5Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 21:45:19 -0400 (EDT)
Date:   Sat, 1 Jul 2023 11:46:18 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Steven Rostedt <rostedt@goodmis.org>
cc:     Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org,
        tech-board-discuss@lists.linux-foundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Measurement, was Re: [Tech-board-discuss] [PATCH] Documentation:
 Linux Contribution Maturity Model and the wider community
In-Reply-To: <20230621100845.12588f48@gandalf.local.home>
Message-ID: <1f5b0227-dbf6-4294-8532-525b3e405dc2@linux-m68k.org>
References: <20230620212502.GI286961@mit.edu> <5490402b-8b9f-f52d-3896-41090e639e51@linux-m68k.org> <20230621100845.12588f48@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Wed, 21 Jun 2023, Steven Rostedt wrote:

> 
> If your point is mainly the second part of that paragraph, which is to 
> tie in metrics to reflect maintainer effectiveness, then I think I agree 
> with you there. One metric is simply the time a patch is ignored by a 
> maintainer on a mailing list (where the maintainer is Cc'd and it is 
> obvious the patch belongs to their subsystem). I know I fail at that, 
> especially when my work is pushing me to focus on other things.
> 

A useful metric when pushing for a higher patch rate is the rework rate.

I have found that 'Fixes' tags can be used to quantify this. I don't have 
scripts to do so but others probably do. (My purpose at the time was to 
quantify my own rework rate by counting my own commit hashes when they 
appeared in subsequent 'Fixes' tags.) Note that a low 'Fixes' count could 
indicate inadequate bug reporting processes so additional metrics may be 
needed.

Where the practices relating to 'Fixes' tagging and bug reporting are 
uniform across subsystems, it might be possible to compare the diverse 
processes and methodologies presently in use.

BTW. I assume that 'Fixes' tags are already being used to train AI models 
to locate bugs in existing code. If this could be used to evaluate new 
patches when posted, it might make the code review process more efficient.

The same approach could probably be generalized somewhat. For example, a 
'Modernizes' tag might be used to train an AI model to target design 
patterns that are being actively replaced anywhere in the code base.

The real pay-off from this kind of automation is that an improvement made 
by any reviewer gets amplified so as to reach across many subsystems and 
mailing lists -- but only when the automation gets scaled up and widely 
deployed. We already see this effect with Coccinelle semantic patches.
