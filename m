Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1441BC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 20:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C704622DA7
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 20:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389239AbhARUKj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 15:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437707AbhARUKC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 15:10:02 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F99C061573;
        Mon, 18 Jan 2021 12:09:22 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E63E36E3;
        Mon, 18 Jan 2021 20:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E63E36E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611000562; bh=/qc4sI+d/qQsfNmrCR3YiQfbWy7XrqPIVXFuvYWWNlY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Rl65h/QO8uqqx+CNKBDsu42onqe8o3RgriKsRP4cXlQilbyxuUd1jnP+UQNOev5bG
         IQ23PCOSWBUhjb4vH0Mg1LoVDrFdb58AMuC+/QpnzgXPiQySFDpIRyxfAwuP5M0ppa
         fVPaN2stKK9qIXIRNZZuRn2CF0jxVD9OS6hCppwOmqfEFKCBrddHidBLhb8KMB6t+B
         1dw8DHX0PmBnVisunNbJti4sCgctNuGA0qcyqzndeAJ64etY9q2UojUGtUow2mEY1q
         dYNPkdFRpH/fI1tTgzlG7zv4IZZs4gGpDasZMFBTAGxeC2TB3SJex+y7BW4VsfHlEf
         1O2EYH5FtvpTw==
Date:   Mon, 18 Jan 2021 13:09:20 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] docs: submitting-patches: Emphasise the
 requirement to Cc: stable when using Fixes: tag
Message-ID: <20210118130920.791dcc0d@lwn.net>
In-Reply-To: <20210113163315.1331064-1-lee.jones@linaro.org>
References: <20210113163315.1331064-1-lee.jones@linaro.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Jan 2021 16:33:15 +0000
Lee Jones <lee.jones@linaro.org> wrote:

> Clear-up any confusion surrounding the Fixes: tag with regards to the
> need to Cc: the stable mailing list when submitting stable patch
> candidates.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
> v2:
>  - Link to the 'stable-kernel-rules' document as per Greg's request
> 
>  Documentation/process/submitting-patches.rst | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

jon
