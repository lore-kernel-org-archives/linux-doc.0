Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B58C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B8B122B51
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404004AbhAKUBw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389880AbhAKUBw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 15:01:52 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757DCC061786;
        Mon, 11 Jan 2021 12:01:12 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 03A669A8;
        Mon, 11 Jan 2021 20:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 03A669A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610395272; bh=DTdgwVb8vb1yigbzXAtWWLTa0+pE5qUOEPoDlGFiLi8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=omPh6kk8G0GVYViVHlFBe2+e4TnHwHwH01S9b+4UzHEhihjTDOsi8VS4zeVxWL5OT
         0bgNRvPLdcZ6qbABTfhcYnkQChmOu9lFWl4ftn1ZbdNC510ucSF+cF/ZwmjZAYs9XW
         W7M/p0CsPZYQcfTz/d1zFvq2bjiH2GQylNxolZ8OM308g9kkG5U4qX9wG0x4A7ADJ2
         /m2w1ktHnXQgiIWgg6O9EjzXeByHzUosIHlG4RArKILh2lteYFITkCE5xWPUn6pPfg
         99FJa4CFSkNtvVNscL2xVaaBMfX3jwS/7Tc+2l7W/ggX5wYy/YtN/cjY11b6yYKubc
         B1E31PxxBr3+Q==
Date:   Mon, 11 Jan 2021 13:01:10 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ALSA: Fix reference to mixart.rst
Message-ID: <20210111130110.72358aa9@lwn.net>
In-Reply-To: <20210101221942.1068388-1-j.neuschaefer@gmx.net>
References: <20210101221942.1068388-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  1 Jan 2021 23:19:42 +0100
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> MIXART.txt has been converted to ReST and renamed. Fix the reference
> in alsa-configuration.rst.
> 
> Fixes: 3d8e81862ce4 ("ALSA: doc: ReSTize MIXART.txt")
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/sound/alsa-configuration.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Takashi, I'm assuming you'll pick this one up; let me know if you'd rather
I took it.

Thanks,

jon
