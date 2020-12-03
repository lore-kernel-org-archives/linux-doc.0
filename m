Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D0FC4361A
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 22:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05556222F9
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 22:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729682AbgLCWqY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Dec 2020 17:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729654AbgLCWqY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Dec 2020 17:46:24 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E98C061A4F;
        Thu,  3 Dec 2020 14:45:43 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1E89520AF;
        Thu,  3 Dec 2020 22:45:43 +0000 (UTC)
Date:   Thu, 3 Dec 2020 15:45:42 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     Julia.Lawall@lip6.fr, cocci@systeme.lip6.fr,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.lkml@markovi.net, nicolas.palix@imag.fr,
        Gilles.Muller@lip6.fr
Subject: Re: [PATCH v2] Documentation: Coccinelle: Improve command example
 for debugging patches
Message-ID: <20201203154542.6d526394@lwn.net>
In-Reply-To: <20201126075730.w6brpeuviefmsxhl@adolin>
References: <20201126075730.w6brpeuviefmsxhl@adolin>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 26 Nov 2020 13:27:30 +0530
Sumera Priyadarsini <sylphrenadin@gmail.com> wrote:

> Modify Coccinelle documentation to clarify usage of make command to
> run coccicheck on a folder.
> 
> Changes in v2:
> - Give example of folder instead of file
> - Add note
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  Documentation/dev-tools/coccinelle.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied, thanks.

jon
