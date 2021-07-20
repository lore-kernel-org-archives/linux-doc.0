Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7EEC07E9D
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 02:05:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D3E661107
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jul 2021 02:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhGTBYo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 21:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353432AbhGTAEb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 20:04:31 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4060CC0613DE
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 17:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=6BHoWhMhBT+v636WJiHHf5j9frWKyJ5kGcIaNwO4veE=; b=Za30svkjl+1dICLyPVyigmTKE6
        YNAyoyxuJvWgxdy/GUIt9A5ZwBv19r47OAydmljpw1tpMu5iLvF9DB/ipQmfCVxAUgiTGfWHSrFd3
        P/GLhnkNhpKVFeI84X7IcDvzDpeR2MCEkloDlFPvm3Fpl7aEkaxBgWGxq75OuuKBD5hx69Ey7mPd+
        s34WEmcgoQVl9sFXctGUEtOGUpcCpdWyMfIUjf+i3a23go8TABCujkvBUpSKCEHU/qIdr3HJQXosY
        BFj0DjDpLrXbgnXIE0voC0834xQQkRNK5zYAoNW39/F0IvljwPbKBDpTST77+8j8ga4U61cOCMN8h
        J/oruW5Q==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m5dsi-00BYpF-Hv
        for linux-doc@vger.kernel.org; Tue, 20 Jul 2021 00:45:08 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: having trouble generating some Doc. warnings
Message-ID: <c31ca05a-9800-0808-29c7-580c7da145da@infradead.org>
Date:   Mon, 19 Jul 2021 17:45:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


kernel test robot reports kernel-doc problems like:

>> drivers/pinctrl/aspeed/pinmux-aspeed.c:61: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Query the enabled or disabled state for a mux function's signal on a pin

where the source code is:

/**
 * Query the enabled or disabled state for a mux function's signal on a pin
 *
 * @ctx: The driver context for the pinctrl IP
 * @expr: An expression controlling the signal for a mux function on a pin
 * @enabled: True to query the enabled state, false to query disabled state


However, I cannot get kernel-doc to report such warnings even though I use
$ make W=1 htmldocs

What else do I need to do? What am I doing wrong?


Update: I can get this warning if I check only one file.
How can I do this for the entire kernel source tree?


thanks.
-- 
~Randy

