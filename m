Return-Path: <SRS0=FCgi=CJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C711C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 31 Aug 2020 22:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F06D207EA
	for <linux-doc@archiver.kernel.org>; Mon, 31 Aug 2020 22:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgHaW0m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Aug 2020 18:26:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:39074 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgHaW0m (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 31 Aug 2020 18:26:42 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 567DC537;
        Mon, 31 Aug 2020 22:26:42 +0000 (UTC)
Date:   Mon, 31 Aug 2020 16:26:41 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] submitting-patches.rst: streamline for git usage
Message-ID: <20200831162641.16e90bb8@lwn.net>
In-Reply-To: <20200827174237.121004-1-sir@cmpwn.com>
References: <20200827174237.121004-1-sir@cmpwn.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 27 Aug 2020 13:42:37 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> This document is a bit intimidating to new patch submitters, and this
> change streamlines it a bit. We presume git usage, because it's much
> easier to use and most devs coming at the kernel are likely to be
> familiar with it.
> 
> I've also added a couple of links to third-party resources which I have
> built, namely the following:
> 
> https://git-send-email.io
> https://useplaintext.email
> 
> I additionally removed information designed for subsystem and branch
> maintainers, as it's unlikely to be useful for a first-time contributor.
> Perhaps this documentation should be moved elsewhere?
> ---
>  Documentation/process/submitting-patches.rst | 169 +++++--------------
>  1 file changed, 40 insertions(+), 129 deletions(-)

So I am absolutely sympathetic with the idea of simplifying this
document... you should have seen it before the last pass I made.  I think
we want a number of these changes, but I do have some requests.

- Assuming use of Git makes sense to me; I don't think we need to be
  suggesting (or documenting) creating patches by hand at this point.  So
  that's all good.

- We have a document on configuring email clients for use in kernel
  development; we should be pointing there rather than to outside sites.
  There might well be a place for a pointer to useplaintext.email in
  Documentation/process/email-clients.rst, but that's a separate patch.

- In general we've been removing manual section numbers for the reasons
  amply demonstrated in this patch; maintaining them is a pain and, once
  you've gone through and changed them all, referring to sections by
  number doesn't work as well anymore.  My own feeling is that they should
  come out.

- Please don't just remove maintainer information like that.  If it needs
  a new home, fine, find a new home for it.  We have a nascent maintainers
  manual that could certainly use some help.

- Please split your work into multiple, single-purpose patches so that
  they can be reviewed more easily.

Thanks,

jon
