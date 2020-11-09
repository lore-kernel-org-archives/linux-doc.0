Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB29EC388F7
	for <linux-doc@archiver.kernel.org>; Mon,  9 Nov 2020 18:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 944812068D
	for <linux-doc@archiver.kernel.org>; Mon,  9 Nov 2020 18:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbgKISVi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Nov 2020 13:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgKISVi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Nov 2020 13:21:38 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAECC0613CF;
        Mon,  9 Nov 2020 10:21:38 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5B71E60B;
        Mon,  9 Nov 2020 18:21:37 +0000 (UTC)
Date:   Mon, 9 Nov 2020 11:21:36 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 00/26] Make reporting-bugs easier to grasp and
 yet more detailed
Message-ID: <20201109112136.0634a356@lwn.net>
In-Reply-To: <7910cf25-4aa9-e33d-704c-33ab91ab713b@leemhuis.info>
References: <cover.1601541165.git.linux@leemhuis.info>
        <7910cf25-4aa9-e33d-704c-33ab91ab713b@leemhuis.info>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 9 Nov 2020 12:01:56 +0100
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> @Jon: I'd be really appreciate to hear your thoughts on this.

Seems like it's time to post a new version with all of your feedback so
far reflected, and we'll go from there?

Thanks,

jon
