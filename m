Return-Path: <SRS0=KUUv=ED=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135BAC56201
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 22:08:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B80B924724
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 22:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730169AbgJ1WIA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730156AbgJ1WH6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Oct 2020 18:07:58 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F3BC0613CF;
        Wed, 28 Oct 2020 15:07:57 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 666BF7F9;
        Wed, 28 Oct 2020 17:18:47 +0000 (UTC)
Date:   Wed, 28 Oct 2020 11:18:46 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] kernel-doc: fix typedef function parser
Message-ID: <20201028111846.582c5b20@lwn.net>
In-Reply-To: <cover.1603792384.git.mchehab+huawei@kernel.org>
References: <cover.1603792384.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 27 Oct 2020 11:20:35 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This small series contain the latest version of the typedef parsing
> fixes that we've been discussing as:
> 
> 	[PATCH v3 01/56] scripts: kernel-doc: fix typedef parsing
> 
> As I said there, at least while discussing it, I opted to split the
> patch in two.
> 
> The first one changes the regex;
> The second one is just a cleanup that splits the 3 arguments into 3
> vars.
> 
> From my side, I'm not 100% confident if the second patch is
> worth or not. 
> 
> The advantage of it is that it makes easier to read the regex. 
> It also also makes clearer about the differences between
> the two typedef regex'es that are used there. 
> 
> On the other hand, using a site like regex101.com to
> test it is harder, as one needs to copy-and-paste 3 expressions
> instead of just one.
> 
> So, when appliying, feel free to decide to either:
> 
> 	-  merge both as-is (two separate patches);
> 	-  fold them into a single patch;
> 	- drop the second patch.

I've gone ahead and applied them both.  Anything that makes the kernel-doc
script more understandable and maintainable is a step in the right
direction, I think.

Thanks,

jon
