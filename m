Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ED4C6FD1D
	for <linux-doc@archiver.kernel.org>; Mon, 20 Mar 2023 14:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjCTOhs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbjCTOhn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Mar 2023 10:37:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755A724107;
        Mon, 20 Mar 2023 07:37:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 22E98614D6;
        Mon, 20 Mar 2023 14:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACE4C4339B;
        Mon, 20 Mar 2023 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679323041;
        bh=OfZgDqFXBUdIMyEH4oAv+asfs2VQIn/ZVquHlPB1Saw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mePrb7L1qo6GFjZ+3oszM9GYvUm5Z5vLScmvI8JzM/ZNKNBUfwEYNcKwzAzTLEOgm
         Ckmn9rJmyHQIVVbogmyIwW8D+bzk77R1l+ZbjWZ+fuxY2ZmXjf3Tc4cQb2DO+XE3zQ
         o6e65hvEssUKre2r+kDZswa7udIh9lAcYis4L8jp2nowJGyb6R26vhxZqVsoc9wRGX
         eWg1GQRQIunmaKgvpBAJYph0Pgy7QSmOGpD4tIWXmQGczGazwKZ9vgYkE1hbHW1gmU
         itlTWjoGRVPD46Y5ZLt/LCjyUHjkOggzmu+VdVH6c6zUldzOhVOl3V9NQ9LGPgbOE5
         EX/xP5LIpIBCw==
Date:   Mon, 20 Mar 2023 15:37:14 +0100
From:   Simon Horman <horms@kernel.org>
To:     Chen Jiahao <chenjiahao16@huawei.com>
Cc:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
        bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
        atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH -next 2/2] docs: kdump: Update the crashkernel
 description for riscv
Message-ID: <ZBhvmqlyyvLOUot1@kernel.org>
References: <20230320204244.1637821-1-chenjiahao16@huawei.com>
 <20230320204244.1637821-3-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320204244.1637821-3-chenjiahao16@huawei.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 21, 2023 at 04:42:44AM +0800, Chen Jiahao wrote:
> Now "crashkernel=" parameter on riscv has been updated to support
> crashkernel=X,[high,low]. Through which we can reserve memory region
> above/within 32bit addressible DMA zone.
> 
> Here update the parameter description accordingly.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Reviewed-by: Simon Horman <horms@kernel.org>

