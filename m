Return-Path: <SRS0=GeCk=AY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7975C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jul 2020 16:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3DAE2067D
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jul 2020 16:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgGMQCv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jul 2020 12:02:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:35750 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729027AbgGMQCv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 13 Jul 2020 12:02:51 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CF8C260C;
        Mon, 13 Jul 2020 16:02:50 +0000 (UTC)
Date:   Mon, 13 Jul 2020 10:02:49 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu
Subject: Re: [PATCH] Documentation: coda: annotate duplicated words
Message-ID: <20200713100249.6c2eded4@lwn.net>
In-Reply-To: <d7c2d274-de28-193f-5a98-9e3e16c6c9d5@infradead.org>
References: <d7c2d274-de28-193f-5a98-9e3e16c6c9d5@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 7 Jul 2020 11:49:31 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> At first glance it appears that the coda.rst file contains doubled
> words "name name" in two places. Turns out it is just confusing
> (at least to me), so try to make it clear that the second 'name'
> is just the name of a struct field/member.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jan Harkes <jaharkes@cs.cmu.edu>
> Cc: coda@cs.cmu.edu
> Cc: codalist@coda.cs.cmu.edu
> ---
>  Documentation/filesystems/coda.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
