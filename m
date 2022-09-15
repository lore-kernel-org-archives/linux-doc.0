Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B7DECAAD3
	for <linux-doc@archiver.kernel.org>; Thu, 15 Sep 2022 13:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiIONP5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Sep 2022 09:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiIONP4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Sep 2022 09:15:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C4854C82;
        Thu, 15 Sep 2022 06:15:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 97BC3B8200F;
        Thu, 15 Sep 2022 13:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC51CC433D6;
        Thu, 15 Sep 2022 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663247752;
        bh=D99hEJwO1zg9kh/dzIgxfTC45cTYP3GG0gTzAtC2HGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DUBaRJeOmWDtl4Zx9/FCXZUMTevnyyFhK4aENnzetz0tBhjQizwVpnJLtbemjYix9
         1OL70DsII4MdyZ2K/fPnSvYNqdfC3lUo7tJ/0Xd1aYLH1Bz9Es0BkoRESDQf9dmAR6
         DrM31CjAuMHphyWumv12TgXKWX/LCGbMpeKmQcws=
Date:   Thu, 15 Sep 2022 15:16:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH v3] Documentation: remove magic number doc
Message-ID: <YyMlovoskUcHLEb7@kroah.com>
References: <731a3b01-1ade-6003-eb21-6b0a2c919750@gmail.com>
 <20220914233254.zcuaw23nl2wgs7f3@tarta.nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914233254.zcuaw23nl2wgs7f3@tarta.nabijaczleweli.xyz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 15, 2022 at 01:32:54AM +0200, наб wrote:
> The entire file blames back to the start of git
> (minus whitespace from the RST translation and a typo fix):
>   * there are changelog comments for March 1994 through to Linux 2.5.74
>   * struct tty_ldisc is two pointers nowadays, so naturally no magic
>   * GDA_MAGIC is defined but unused, and it's been this way
>     since start-of-git
>   * M3_CARD_MAGIC isn't defined, because
>     commit d56b9b9c464a ("[PATCH] The scheduled removal of some OSS
>     drivers") removed the entire driver in 2006
>   * CS_CARD_MAGIC likewise since
>     commit b5d425c97f7d ("more scheduled OSS driver removal") in 2007
>   * KMALLOC_MAGIC and VMALLOC_MAGIC were removed in
>     commit e38e0cfa48ac ("[ALSA] Remove kmalloc wrappers"),
>     six months after start of git
>   * SLAB_C_MAGIC has never even appeared in git
>     (removed in 2.4.0-test3pre6)
> 
> At a glance, the only ones still in use are in drivers which are mostly
> untouched since git (TTY, SLIP,
> SCSI (drivers/scsi/{arm/queue.c,ncr53c8xx.c}), &c.).
> 
> A rough estimate of magic numbers in the kernel is obtained by:
>   # git grep define | grep '_MAGIC\b' |
>     grep -ve IOC  -e ^tools/ -e '_IO[(WR]' -e _SUPER | wc -l
>   780
> Note that the word 'magic' may have different meaning from magic
> number context.
> There are also magic numbers which aren't listed here, like
> SR_EEPROM_MAGIC, L2TP_TUNNEL_MAGIC, and MD_SB_MAGIC.
> 
> Therefore, magic-number.rst is a low-value historial relic at best and
> misleading cruft at worst, so remove the documentation.
> 
> Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>

Please only remove the ones that are not used anymore.

Then work on actually removing the remaining ones (hint, the tty layer
should not need this and I'll gladly take patches), and only after they
are all gone, can you remove the whole file.

thanks,

greg k-h
