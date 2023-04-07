Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506B7C76196
	for <linux-doc@archiver.kernel.org>; Fri,  7 Apr 2023 12:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240646AbjDGMF2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Apr 2023 08:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240678AbjDGMF1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Apr 2023 08:05:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09C58A5B;
        Fri,  7 Apr 2023 05:05:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BD1A60F87;
        Fri,  7 Apr 2023 12:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5B7C433EF;
        Fri,  7 Apr 2023 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680869122;
        bh=O1PgNY99xnStr1ysLAs1BX2iTotKJxWBIm8q8t8h7FE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A3BWCBHVMwHlO3r3sfy+Rpi2fFBvTr8G2at1muuXs3wnTMTc12JtAM0jVv1+kmicM
         uhf+vXhef0GYwiJXXkW815xf+QATj3GYgjLjiNbmdvlokpHx1fkpBiYZRlxnLcQ+Nj
         1fhJMDWQUbpH3kVcudRpZTNwRBEy7Dc2sp5F31os8FFSY2SmCXjQNJqMQOgMXAs2Ma
         gqZPVAQm3CWZcGzoH8oGSMN82djNJJj1rjQPQS05TncXDGZ0uQ4oqoEjcnkRCYr6SX
         RhBPke7pYYt1uSYVx5OMieBAvYOe29xk+ZvC1cwO5zXEbYzdXiXmAEU4gyfwUz9Bj1
         RSYIXBAgYWbMA==
Date:   Fri, 7 Apr 2023 14:05:17 +0200
From:   Simon Horman <horms@kernel.org>
To:     Chen Jiahao <chenjiahao16@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
        bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
        atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com
Subject: Re: [PATCH -next v3 0/2] support allocating crashkernel above 4G
 explicitly on riscv
Message-ID: <ZDAG/Re2CbuMFXOg@kernel.org>
References: <20230406220206.3067006-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406220206.3067006-1-chenjiahao16@huawei.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 07, 2023 at 06:02:04AM +0800, Chen Jiahao wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Hence this patchset introduces the parameter option crashkernel=X,[high,low].
> 
> One can reserve the crash kernel from high memory above DMA zone range
> by explicitly passing "crashkernel=X,high"; or reserve a memory range
> below 4G with "crashkernel=X,low". Besides, there are few rules need
> to take notice:
> 1. "crashkernel=X,[high,low]" will be ignored if "crashkernel=size"
>    is specified.
> 2. "crashkernel=X,low" is valid only when "crashkernel=X,high" is passed
>    and there is enough memory to be allocated under 4G.
> 3. When allocating crashkernel above 4G and no "crashkernel=X,low" is
>    specified, a 128M low memory will be allocated automatically for
>    swiotlb bounce buffer.
> See Documentation/admin-guide/kernel-parameters.txt for more information.
> 
> To verify loading the crashkernel, adapted kexec-tools is attached below:
> https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2

Are you planning to submit the kexec-tools patches too?
