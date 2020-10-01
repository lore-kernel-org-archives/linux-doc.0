Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDF5C4741F
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 21:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50F8F20796
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 21:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733122AbgJAVlE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 17:41:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:39388 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733113AbgJAVlE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Oct 2020 17:41:04 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 53769537;
        Thu,  1 Oct 2020 21:41:04 +0000 (UTC)
Date:   Thu, 1 Oct 2020 15:41:00 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/52] scripts: kernel-doc: make it more compatible
 with Sphinx 3.x
Message-ID: <20201001154100.2f7e89b8@lwn.net>
In-Reply-To: <c7b04d8f20f44d4d2eb797d8694bd7546f95ac05.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
        <c7b04d8f20f44d4d2eb797d8694bd7546f95ac05.1601467849.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 30 Sep 2020 15:24:27 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> With Sphinx 3.x, the ".. c:type:" tag was changed to accept either:
> 
> 	.. c:type:: typedef-like declaration
> 	.. c:type:: name
> 
> Using it for other types (including functions) don't work anymore.
> 
> So, there are newer tags for macro, enum, struct, union, and others,
> which doesn't exist on older versions.
> 
> Add a check for the Sphinx version and change the produced tags
> accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kernel-doc | 71 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 65 insertions(+), 6 deletions(-)

So this seems generally good, but I do wonder if we shouldn't just pass
the sphinx version into kernel-doc as a parameter?  We're already doing a
version check in the makefile, we should be able to capture the result and
pass it in, maybe?  

jon
