Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F52C4361A
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 23:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A37F0207CF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 23:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgLCXJA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Dec 2020 18:09:00 -0500
Received: from ms.lwn.net ([45.79.88.28]:57170 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgLCXJA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Dec 2020 18:09:00 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3CCCA24D3;
        Thu,  3 Dec 2020 23:08:20 +0000 (UTC)
Date:   Thu, 3 Dec 2020 16:08:19 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: kernel-doc: fix parsing function-like typedefs
Message-ID: <20201203160819.70cd8673@lwn.net>
In-Reply-To: <218ff56dcb8e73755005d3fb64586eb1841a276b.1606896997.git.mchehab+huawei@kernel.org>
References: <218ff56dcb8e73755005d3fb64586eb1841a276b.1606896997.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  2 Dec 2020 09:17:32 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Changeset 6b80975c6308 ("scripts: kernel-doc: fix typedef parsing")
> added support for things like:
> 
> 	typedef unsigned long foo();
> 
> However, it caused a regression on this prototype:
> 
> 	typedef bool v4l2_check_dv_timings_fnc(const struct v4l2_dv_timings *t, void *handle);
> 
> This is only noticed after adding a patch that checks if the
> kernel-doc identifier matches the typedef:
> 
> 	./scripts/kernel-doc -none $(git grep '^.. kernel-doc::' Documentation/ |cut -d ' ' -f 3|sort|uniq) 2>&1|grep expecting
> 	include/media/v4l2-dv-timings.h:38: warning: expecting prototype for typedef v4l2_check_dv_timings_fnc. Prototype was for typedef nc instead
> 
> The problem is that, with the new parsing logic, it is not
> checking for complete words at the type part.
> 
> Fix it by adding a \b at the end of each type word at the
> regex.
> 
> fixes: 6b80975c6308 ("scripts: kernel-doc: fix typedef parsing")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied, thanks.

jon
