Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80BCC4363A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78CF021481
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505812AbgJUVLA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 17:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440041AbgJUVLA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 17:11:00 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A876C0613CE;
        Wed, 21 Oct 2020 14:11:00 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DD49B2C8;
        Wed, 21 Oct 2020 21:10:59 +0000 (UTC)
Date:   Wed, 21 Oct 2020 15:10:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Akinobu Mita <akinobu.mita@gmail.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: lkdtm: Modernize and improve details
Message-ID: <20201021151058.5b5b4882@lwn.net>
In-Reply-To: <20201015224559.2137489-1-keescook@chromium.org>
References: <20201015224559.2137489-1-keescook@chromium.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 15 Oct 2020 15:45:59 -0700
Kees Cook <keescook@chromium.org> wrote:

> The details on using LKDTM were overly obscure. Modernize the details
> and expand examples to better illustrate how to use the interfaces.
> Additionally add missing SPDX header.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  .../fault-injection/provoke-crashes.rst       | 56 +++++++++++--------
>  1 file changed, 33 insertions(+), 23 deletions(-)

Applied, thanks.

jon
