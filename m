Return-Path: <SRS0=mLHd=DV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1E8C433E7
	for <linux-doc@archiver.kernel.org>; Wed, 14 Oct 2020 19:11:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7874C2078A
	for <linux-doc@archiver.kernel.org>; Wed, 14 Oct 2020 19:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389380AbgJNTLZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Oct 2020 15:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388775AbgJNTLZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Oct 2020 15:11:25 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FE3C061755;
        Wed, 14 Oct 2020 12:11:24 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 533DB739;
        Wed, 14 Oct 2020 19:11:24 +0000 (UTC)
Date:   Wed, 14 Oct 2020 13:11:22 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2 2/5] docs: automarkup.py: Fix regexes to solve sphinx
 3 warnings
Message-ID: <20201014131122.52305a86@lwn.net>
In-Reply-To: <20201013231218.2750109-3-nfraprado@protonmail.com>
References: <20201013231218.2750109-1-nfraprado@protonmail.com>
        <20201013231218.2750109-3-nfraprado@protonmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Oct 2020 23:13:17 +0000
Nícolas F. R. A. Prado <nfraprado@protonmail.com> wrote:

> The warnings were caused by the expressions matching words in the
> translated versions of the documentation, since any unicode character
> was matched.
> 
> Fix the regular expression by making the C regexes use ASCII

I don't quite understand this part, can you give an example of the kinds
of warnings you were seeing?

Thanks,

jon
