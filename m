Return-Path: <SRS0=Pvk/=3Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294E7C35247
	for <linux-doc@archiver.kernel.org>; Wed,  5 Feb 2020 17:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07EEB217F4
	for <linux-doc@archiver.kernel.org>; Wed,  5 Feb 2020 17:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbgBERcF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Feb 2020 12:32:05 -0500
Received: from ms.lwn.net ([45.79.88.28]:52612 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgBERcF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Feb 2020 12:32:05 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2819D60C;
        Wed,  5 Feb 2020 17:32:05 +0000 (UTC)
Date:   Wed, 5 Feb 2020 10:32:03 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sameer Rahmani <lxsameer@gnu.org>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: build warnings related to missing blank
 lines after explicit markups has been fixed
Message-ID: <20200205103203.39012f24@lwn.net>
In-Reply-To: <20200203201543.24834-1-lxsameer@gnu.org>
References: <20200203201543.24834-1-lxsameer@gnu.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  3 Feb 2020 20:15:43 +0000
Sameer Rahmani <lxsameer@gnu.org> wrote:

> Fix for several documentation build warnings related to missing blank lines
> after explicit mark up.
> 
> Exact warning message:
>  WARNING: Explicit markup ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
> ---
>  Documentation/doc-guide/contributing.rst       | 1 +
>  Documentation/doc-guide/maintainer-profile.rst | 1 +
>  Documentation/trace/kprobetrace.rst            | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)

Argh.  I ask people to look for warnings, then add two
myself...embarrassing.  Many thanks for fixing these, applied.

If I'm not mistaken, this is your first accepted kernel patch.
Congratulations, and I'm glad you started with documentation!

jon
