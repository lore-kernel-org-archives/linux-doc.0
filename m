Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FDAC76188
	for <linux-doc@archiver.kernel.org>; Wed,  5 Apr 2023 14:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238104AbjDEOYf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Apr 2023 10:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238073AbjDEOYc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Apr 2023 10:24:32 -0400
X-Greylist: delayed 1614 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 05 Apr 2023 07:24:11 PDT
Received: from utopia.booyaka.com (utopia.booyaka.com [74.50.51.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813813C3F
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 07:24:11 -0700 (PDT)
Received: (qmail 20339 invoked by uid 1019); 5 Apr 2023 13:57:16 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Apr 2023 13:57:16 -0000
Date:   Wed, 5 Apr 2023 13:57:16 +0000 (UTC)
From:   Paul Walmsley <paul@pwsan.com>
To:     Evan Green <evan@rivosinc.com>
cc:     Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com,
        vineetg@rivosinc.com, heiko@sntech.de,
        Conor Dooley <conor@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Tobias Klauser <tklauser@distanz.ch>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/6] RISC-V: Add a syscall for HW probing
In-Reply-To: <20230327163203.2918455-3-evan@rivosinc.com>
Message-ID: <alpine.DEB.2.21.999.2304051354280.19052@utopia.booyaka.com>
References: <20230327163203.2918455-1-evan@rivosinc.com> <20230327163203.2918455-3-evan@rivosinc.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 27 Mar 2023, Evan Green wrote:

> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> system call that quite does this, so let's just provide an arch-specific
> one to probe for hardware capabilities.  This currently just provides
> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> the future.
> 
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Folks are already building RISC-V systems with cores that have different 
feature sets inside the same Linux system image - just like some ARM 
vendors are - so it makes sense to pass this information onto userspace.

By the way, Evan, did you intend to update the copyright dates to include 
2023?

Beyond that, 

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul
