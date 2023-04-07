Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16191C76196
	for <linux-doc@archiver.kernel.org>; Fri,  7 Apr 2023 12:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240629AbjDGMEY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Apr 2023 08:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240615AbjDGMEX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Apr 2023 08:04:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C91683F0;
        Fri,  7 Apr 2023 05:04:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C64D611DA;
        Fri,  7 Apr 2023 12:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD1AC433EF;
        Fri,  7 Apr 2023 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680869061;
        bh=HUoYspjdbgbF+auGyH8Dkb8DfJn7/2ux/sbLEBn5Zw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s4vlYCLyUDl8dCY3ktLig+sybIAlBRK9ce9MbL/snbo3irp+sdTZybezHP6b/ECEZ
         zjvwEud9PeYQYlmLJB+VaRFOt1uuhvdgNrRU4O+vsegGJj19CST4EBGEM389CLx7UK
         37rCQOlfDwk6BGhYeC2SYhpzgORnKoqYzAZcBZ/NwQNc7qGrJkFBclaF5YcwQAKB5Q
         yBiRCp0YKBfc/rX4/8R0fPqE4zs5kCiBNjrvDT+vEziSfT+OuG7zW8gDTLvCgz/+Ax
         ECF3eTIEYv2OMc0uaVFZ8gtNFlVSKOJFXQThA3d/CKxgDI7BtnUQrLnQWQJLXW2MJX
         efgysCmqU06zw==
Date:   Fri, 7 Apr 2023 14:04:15 +0200
From:   Simon Horman <horms@kernel.org>
To:     Chen Jiahao <chenjiahao16@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
        bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
        atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com
Subject: Re: [PATCH -next v3 2/2] docs: kdump: Update the crashkernel
 description for riscv
Message-ID: <ZDAGv7dMyirW9aqd@kernel.org>
References: <20230406220206.3067006-1-chenjiahao16@huawei.com>
 <20230406220206.3067006-3-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406220206.3067006-3-chenjiahao16@huawei.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 07, 2023 at 06:02:06AM +0800, Chen Jiahao wrote:
> Now "crashkernel=" parameter on riscv has been updated to support
> crashkernel=X,[high,low]. Through which we can reserve memory region
> above/within 32bit addressible DMA zone.
> 
> Here update the parameter description accordingly.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Reviewed-by: Simon Horman <horms@kernel.org>

