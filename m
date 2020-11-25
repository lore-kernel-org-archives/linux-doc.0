Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D34C56201
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 17:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EE3C206D9
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 17:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731385AbgKYROH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Nov 2020 12:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730445AbgKYROG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 12:14:06 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F4DC0613D4;
        Wed, 25 Nov 2020 09:14:06 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7832D9A8;
        Wed, 25 Nov 2020 17:14:06 +0000 (UTC)
Date:   Wed, 25 Nov 2020 10:14:05 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] docs/vm: hwpoison: fix spelling mistakes
Message-ID: <20201125101405.7ae6ff92@lwn.net>
In-Reply-To: <20201125165222.788910-1-f.suligoi@asem.it>
References: <20201125165222.788910-1-f.suligoi@asem.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 25 Nov 2020 17:52:22 +0100
Flavio Suligoi <f.suligoi@asem.it> wrote:

> Actions:
> 
> - fix spelling mistake
> - reduce some double spaces to a single one

Please don't make changes like that last one; double spaces are not an
error, and "fixing" them just adds noise to the history.

Thanks,

jon
