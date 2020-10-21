Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FE1C4363A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1176124198
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:08:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505781AbgJUVId (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 17:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505713AbgJUVId (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 17:08:33 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54848C0613CE;
        Wed, 21 Oct 2020 14:08:33 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 90F247C0;
        Wed, 21 Oct 2020 21:08:31 +0000 (UTC)
Date:   Wed, 21 Oct 2020 15:08:29 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hui Su <sh_def@163.com>
Cc:     dsterba@suse.com, mchehab+huawei@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/cpu-load: format the example code.
Message-ID: <20201021150829.125bf59e@lwn.net>
In-Reply-To: <20201018170557.GA7670@rlk>
References: <20201018170557.GA7670@rlk>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 19 Oct 2020 01:05:57 +0800
Hui Su <sh_def@163.com> wrote:

> format the example code.
> 
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  Documentation/admin-guide/cpu-load.rst | 63 ++++++++++++++------------
>  1 file changed, 33 insertions(+), 30 deletions(-)

Hmm...this document wasn't always that way; it looks like maybe the code
got mangled during the RST conversion.

I question the value of this document in general...but as long as we have
it the code might as well look right, so I've applied this, thanks.

jon
