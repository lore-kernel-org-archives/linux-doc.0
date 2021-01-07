Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCB9C433E6
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 21:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED005235F9
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 21:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbhAGVm5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Jan 2021 16:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbhAGVm5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jan 2021 16:42:57 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C01C0612F6
        for <linux-doc@vger.kernel.org>; Thu,  7 Jan 2021 13:42:17 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 789E5614F;
        Thu,  7 Jan 2021 21:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 789E5614F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610055736; bh=BwvX/fht3uZ2T+D3MQ2SNuFMrfIrQ5xKfcR+MNeny+E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EwNaqO5HPKxjrjWW0Ztfqbeuj6fTPc5Hi2brUBb2UP0Eyr+gpF0Zs5DMWvljQUDsI
         A2BuS2IIOWggoVuL8YKdIcmuNH2zXMExoNJZbk9p721mzi6QrdbldkuRN4IZif20uW
         mumIyK5CwS6OvGGlq/pR1mmnv4xyCaZK6ml9Kg5JMi8KpUs+hbjEvB3cR7bqyIRB3+
         hzl5GKGN0egJTZF4MOIfwBTe84dpxvQ61551m00c1VcnrlJOUbYTjeOd85wa2kPcyQ
         ynuWOxqa8i+FEbgtwHgTA9pEAOkjb31PID68+HYEzf4g3zMqSG2EwLWIN0b7m0QG0c
         wMyhzWV4aZXTg==
Date:   Thu, 7 Jan 2021 14:42:15 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: remove mention of ENABLE_MUST_CHECK
Message-ID: <20210107144215.7904dcac@lwn.net>
In-Reply-To: <20210105055815.GA5173@kernel.org>
References: <20210105055815.GA5173@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 5 Jan 2021 06:58:15 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> We removed ENABLE_MUST_CHECK in 196793946264 ("Compiler Attributes:
> remove CONFIG_ENABLE_MUST_CHECK"), so let's remove docs' mentions.
> 
> At the same time, fix the outdated text related to
> ENABLE_WARN_DEPRECATED that wasn't removed in 3337d5cfe5e08
> ("configs: get rid of obsolete CONFIG_ENABLE_WARN_DEPRECATED").
> 
> Finally, reflow the paragraph.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> A couple translations (it and zh) should consider updating this
> too, since they also have the mention -- Cc'ing their maintainers.
> 
>  Documentation/process/4.Coding.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks.

jon
