Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A024ECAAD2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 23:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiH2Xkj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 19:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiH2Xki (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 19:40:38 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80602F658
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 16:40:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MGn4G5VpBz4x3w;
        Tue, 30 Aug 2022 09:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
        s=201707; t=1661816431;
        bh=kD9DT1iOOQycVbjPgR5ddjhaq7eIsg081yQ+aUUl9UE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ArosEJjFSvmrQqbI0FCPipkYSeCJqhCAuXeMbFuvIFnAGMTeFixxRZjlgtQd20vdc
         DIpc51GwcbDp0vgTyRK+GSjrdLNQMI/Pf5myeacSaETio82kcCwj7qFNX5ocWUzSWd
         IfB19atNBoCS03zZRO0zOZK/R5JnI7+DuoH4mjNFRiVF+6LSPRi+7IuvEn+TCedsTC
         I6z4wYj31mYgsDW+PlcBr0P5S74Iw48HJWdeSuyNYanJodEmuyh8ExJ0KqGGg04HOi
         1kCSEF+nNCQwZyrPx8uJ8rGhZknvzb80ITaQpaf27ROAH7nj4x5WqJi5Cs/M366ncH
         0nVEIbUlace7w==
Message-ID: <bc95ca95965e69aa434454b5f9fd02c378e35b1e.camel@ozlabs.org>
Subject: Re: [PATCH] Documentation: spufs: correct a duplicate word typo
From:   Jeremy Kerr <jk@ozlabs.org>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
        Jonathan Corbet <corbet@lwn.net>
Date:   Tue, 30 Aug 2022 07:40:28 +0800
In-Reply-To: <20220829232908.32437-1-rdunlap@infradead.org>
References: <20220829232908.32437-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3-2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

> Fix a typo of "or" which should be "of".

Nice, people are still reading the spufs docs! :D

Looks good to me, thanks for the patch.

Reviewed-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
