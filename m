Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC13EC5519F
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 00:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87110246BC
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 00:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgKSAR2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 19:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgKSAR2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Nov 2020 19:17:28 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F1BC0613D4;
        Wed, 18 Nov 2020 16:17:28 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4943C2B2;
        Thu, 19 Nov 2020 00:17:28 +0000 (UTC)
Date:   Wed, 18 Nov 2020 17:17:27 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 21/26] docs: reporting-bugs: details on writing
 and sending the report
Message-ID: <20201118171727.5105df6a@lwn.net>
In-Reply-To: <f01ecda5c1509643f6543a6e2dd5a4cbaa1ee420.1605203187.git.linux@leemhuis.info>
References: <cover.1605203187.git.linux@leemhuis.info>
        <f01ecda5c1509643f6543a6e2dd5a4cbaa1ee420.1605203187.git.linux@leemhuis.info>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 12 Nov 2020 18:58:58 +0100
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> That's also why this commit removes scripts/ver_linux as well: the
> details it collects are only needed in some situations. And some (a
> lot?) distributions do not ship it anyway; a better, more modern script
> would likely resist in tools/, which would increase chances that distros
> shipping it as part of packages like "linux-tools".

Unless you're really sure that nobody us using this script, for whatever
reason, you can't really delete it, though.  It's been patched a couple of
times this year, so somebody is paying attention.  Probably safest to just
leave it there.

jon
