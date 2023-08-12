Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCCFC001DB
	for <linux-doc@archiver.kernel.org>; Sat, 12 Aug 2023 11:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237025AbjHLLDz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Aug 2023 07:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234822AbjHLLDy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Aug 2023 07:03:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4794AA3;
        Sat, 12 Aug 2023 04:03:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9C826393E;
        Sat, 12 Aug 2023 11:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D16C433C8;
        Sat, 12 Aug 2023 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691838237;
        bh=kGynukD4iBSVIRmizx2B8LAiBQh3DBn0A3VuJCt+Eb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zx0KJIv86xI0yRJz/LD88B+nQSHmtm0mKkcrRHkGI59+9fiqzKXA4Ao+QEbxzl1Ea
         GaLudH8q/rnl/TRDd21PSPGfokAo5Ca+Zq7jcgDvPnh7Myqyy+6neMqcK/2VnFxQdf
         5UHZSTdSx0i6tp5Fdo0tU7YVf8pMMLtWHEHa0QBQ=
Date:   Sat, 12 Aug 2023 13:03:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     stable@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 0/5] docs: stable-kernel-rules: improve structure and
 a few tweaks
Message-ID: <2023081237-sulphate-fifteen-0c18@gregkh>
References: <cover.1691219455.git.linux@leemhuis.info>
 <63380dd3-bce5-d295-ab14-13102f402c73@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63380dd3-bce5-d295-ab14-13102f402c73@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 05, 2023 at 09:54:25AM +0200, Thorsten Leemhuis wrote:
> [adding Sasha and Jon to the CC, seem I forget to do that on the cover
> letter; sorry!]
> 
> On 05.08.23 09:21, Thorsten Leemhuis wrote:
> > When adding something to this document earlier I noticed that readers
> > need to perform some back and forth to fully understand things; I also
> > noticed a few other aspects that seemed somewhat odd for me with my
> > background on writing and editing texts.
> > 
> > Find attached a few patches to improve things. The first three are
> > mainly moving text around to a structure which is somewhat clearer. They
> > leave quite a few rough edges behind that are fixed in in the last patch
> > of the series, which changes a few other changes as well; thx to the
> > prep patches the diff should be relative straight-forward to understand.
> > 
> > These patches are on-top of the following series that currently is in the 
> > driver-core-testing branch:
> > https://lore.kernel.org/all/cover.1689056247.git.linux@leemhuis.info/
> 
> FWIW, in case anyone wonders how the text looks in the end, see:
> 
> https://www.leemhuis.info/files/kernel/stable-rules/stable-kernel-rules.txt
> 
> https://www.leemhuis.info/files/kernel/stable-rules/Everything%20you%20ever%20wanted%20to%20know%20about%20Linux%20-stable%20releases%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html

Looks very good, thanks!

greg k-h
