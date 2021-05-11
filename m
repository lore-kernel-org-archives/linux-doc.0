Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670AEC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 02:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35B52611AB
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 02:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhEKC0k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 22:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhEKC0k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 May 2021 22:26:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0579DC061574;
        Mon, 10 May 2021 19:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=jVPeJnrx2zqwNR8mCLQ7BVg9Lcz/Fm736vaduJbaIE0=; b=Nami1P+T3Zn4n9qQb2ZvmclFpY
        HsJKTCvoz85s5tPxQFxjiuRsVOTIW3GLlv4DlyuldZ6eQYFaJjpOGYfV+v6zhyW9fKcpm1QHBo0D9
        uSm7zWq3c2GQpnSLmGTz2dym98GlozGdvQRe1ogR/gSleqoaL0G9X/ynt37K164yvye1l/vn8GH+J
        LRzrHJVh/34DqchMPr7g1dIHStjHNialUpxxspT3V9CA/ULs75RH7xQaNak0vsGEk3/yBRU05juNe
        y7Gw9MsedHem0WYYNqkvr/mNTOYglMp4PuO4EDp3vT6BViIXb3zqhZlDmoXzIvqVMkAhXJOVPmeA8
        neHWW9+w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lgI4T-006oN9-SW; Tue, 11 May 2021 02:24:40 +0000
Date:   Tue, 11 May 2021 03:24:29 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: Enlarge IO_SPACE_LIMIT needed for some SoC
Message-ID: <YJnq3Y3/I1kdV1Ov@casper.infradead.org>
References: <20210511021656.17719-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511021656.17719-1-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 11, 2021 at 04:16:54AM +0200, Ansuel Smith wrote:
> Ipq8064 SoC requires larger IO_SPACE_LIMIT on second and third pci port.

Do you really?  I mean, yes, theoretically, I understand it, the
hardware supports 64kB of I/O port space per root port.  But I/O
port space is rather deprecated these days.  My laptop has precisely
two devices with I/O ports, one with 64 bytes and the other with 32
bytes.  Would you really suffer by allocating 16kB of I/O port
space to each root port?
