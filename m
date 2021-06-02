Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A58BC4708F
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 03:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23CB4613B4
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 03:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhFBDC5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 23:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhFBDCz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 23:02:55 -0400
Received: from hurricane.the-brannons.com (hurricane.the-brannons.com [IPv6:2602:ff06:725:1:20::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4D4C061574;
        Tue,  1 Jun 2021 20:01:12 -0700 (PDT)
Received: from localhost (<unknown> [2602:3f:e0f9:dc00::2])
        by hurricane.the-brannons.com (OpenSMTPD) with ESMTPSA id 9c702b39 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Tue, 1 Jun 2021 19:54:31 -0700 (PDT)
From:   Chris Brannon <chris@the-brannons.com>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Christopher Brannon <chris@the-brannons.com>,
        William Hubbs <w.d.hubbs@gmail.com>,
        collins@gene3.ait.iastate.edu,
        Steve Holmes <steve.holmes88@gmail.com>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: Convert the Speakup guide to rst
References: <20210531215737.8431-1-igormtorrente@gmail.com>
        <875yyxbenm.fsf@meer.lwn.net> <20210601220643.uzep2ju2zlcmpa57@begin>
        <874keh9qk9.fsf@meer.lwn.net> <20210601223743.carif4gkzcz5jo7j@begin>
Date:   Tue, 01 Jun 2021 19:54:30 -0700
In-Reply-To: <20210601223743.carif4gkzcz5jo7j@begin> (Samuel Thibault's
        message of "Wed, 2 Jun 2021 00:37:43 +0200")
Message-ID: <87r1hldli1.fsf@the-brannons.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Samuel Thibault <samuel.thibault@ens-lyon.org> writes:

> So we'd need Gene's, Christopher's, William's, and Steve's ack on adding
> the GPL alternative to the GFDL-1.2 licence.

You have my ack.  Do whatever is needful.  I wish I didn't have to care about
this stuff.

-- 
Chris Brannon
Founder: Blind and Low Vision Unix Users Group (https://blvuug.org/).
Personal website: (https://the-brannons.com/)
Chat: IRC: teiresias on libera.chat and OFTC, XMPP: chris@chat.number89.net
