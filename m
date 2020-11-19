Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE88C5519F
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 00:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BDAB246EB
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 00:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgKSAFs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 19:05:48 -0500
Received: from ms.lwn.net ([45.79.88.28]:47404 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgKSAFs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Nov 2020 19:05:48 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4F6412B2;
        Thu, 19 Nov 2020 00:05:48 +0000 (UTC)
Date:   Wed, 18 Nov 2020 17:05:47 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 08/26] docs: reporting-bugs: make readers check
 the taint flag
Message-ID: <20201118170547.4fabd38b@lwn.net>
In-Reply-To: <d21b7ead04852d3de7dd6892fe5e27aca1f345ff.1605203187.git.linux@leemhuis.info>
References: <cover.1605203187.git.linux@leemhuis.info>
        <d21b7ead04852d3de7dd6892fe5e27aca1f345ff.1605203187.git.linux@leemhuis.info>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 12 Nov 2020 18:58:45 +0100
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> +If your kernel is tainted, study
> +:ref:`Documentation/admin-guide/tainted-kernels.rst <taintedkernels>` to find
> +out why. Try to eliminate the reason. Often it's caused by one these three
> +things:

One little detail that jumped at me just now: the automarkup extension now
understands Documentation/whatever and makes a cross-reference, so there's
no need for an explicit :ref: for those.

Thanks,

jon
