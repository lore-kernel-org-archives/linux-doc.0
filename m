Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7922CC77B6E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Apr 2023 01:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjDNBhw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 21:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDNBhw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 21:37:52 -0400
Received: from utopia.booyaka.com (utopia.booyaka.com [74.50.51.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E091FF1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 18:37:50 -0700 (PDT)
Received: (qmail 28873 invoked by uid 1019); 14 Apr 2023 01:37:49 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 14 Apr 2023 01:37:49 -0000
Date:   Fri, 14 Apr 2023 01:37:49 +0000 (UTC)
From:   Paul Walmsley <paul@pwsan.com>
To:     Evan Green <evan@rivosinc.com>
cc:     Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com,
        heiko@sntech.de, Conor Dooley <conor@kernel.org>,
        vineetg@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 3/6] RISC-V: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_IMA
In-Reply-To: <20230407231103.2622178-4-evan@rivosinc.com>
Message-ID: <alpine.DEB.2.21.999.2304140137250.26968@utopia.booyaka.com>
References: <20230407231103.2622178-1-evan@rivosinc.com> <20230407231103.2622178-4-evan@rivosinc.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 7 Apr 2023, Evan Green wrote:

> We have an implicit set of base behaviors that userspace depends on,
> which are mostly defined in various ISA specifications.
> 
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul
