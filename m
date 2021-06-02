Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFCFC47083
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 07:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29E1A60720
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 07:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhFBHzO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:55:14 -0400
Received: from v-zimmta03.u-bordeaux.fr ([147.210.215.83]:59664 "EHLO
        v-zimmta03.u-bordeaux.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhFBHzN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jun 2021 03:55:13 -0400
X-Greylist: delayed 453 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Jun 2021 03:55:13 EDT
Received: from v-zimmta03.u-bordeaux.fr (localhost [127.0.0.1])
        by v-zimmta03.u-bordeaux.fr (Postfix) with ESMTP id EA5C318005E9
        for <linux-doc@vger.kernel.org>; Wed,  2 Jun 2021 09:45:53 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
        by v-zimmta03.u-bordeaux.fr (Postfix) with ESMTPSA id D761918000BC
        for <linux-doc@vger.kernel.org>; Wed,  2 Jun 2021 09:45:53 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
        (envelope-from <samuel.thibault@ens-lyon.org>)
        id 1loKf3-0063x5-7N; Wed, 02 Jun 2021 08:47:29 +0200
Date:   Wed, 2 Jun 2021 08:47:24 +0200
From:   Samuel Thibault <samuel.thibault@ens-lyon.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christopher Brannon <cmbrannon@cox.net>,
        William Hubbs <w.d.hubbs@gmail.com>,
        collins@gene3.ait.iastate.edu,
        Steve Holmes <steve.holmes88@gmail.com>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: Convert the Speakup guide to rst
Message-ID: <20210602064724.hzygl3qewillrlqr@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christopher Brannon <cmbrannon@cox.net>,
        William Hubbs <w.d.hubbs@gmail.com>, collins@gene3.ait.iastate.edu,
        Steve Holmes <steve.holmes88@gmail.com>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210531215737.8431-1-igormtorrente@gmail.com>
 <875yyxbenm.fsf@meer.lwn.net>
 <20210601220643.uzep2ju2zlcmpa57@begin>
 <874keh9qk9.fsf@meer.lwn.net>
 <20210601223743.carif4gkzcz5jo7j@begin>
 <87mts98aom.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mts98aom.fsf@meer.lwn.net>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-AV-Checked: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet, le mar. 01 juin 2021 16:47:05 -0600, a ecrit:
> Samuel Thibault <samuel.thibault@ens-lyon.org> writes:
> 
> > So we'd need Gene's, Christopher's, William's, and Steve's ack on adding
> > the GPL alternative to the GFDL-1.2 licence.
> 
> That would be great.
> 
> One other thing that crosses my mind...we'll need to remove the GFDL
> license text as well.

Yes, sure the SPDX tag will be enough.

Samuel
