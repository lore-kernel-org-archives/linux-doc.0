Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9887FC6FD20
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 20:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjCUU1s convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 16:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjCUU1r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 16:27:47 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B7B7AA5;
        Tue, 21 Mar 2023 13:27:42 -0700 (PDT)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1peiZr-00042j-6n; Tue, 21 Mar 2023 21:27:27 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Palmer Dabbelt <palmer@rivosinc.com>,
        Evan Green <evan@rivosinc.com>
Cc:     slewis@rivosinc.com, Conor Dooley <conor@kernel.org>,
        vineetg@rivosinc.com, Evan Green <evan@rivosinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guo Ren <guoren@kernel.org>,
        Jisheng Zhang <jszhang@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Philipp Tomsich <philipp.tomsich@vrull.eu>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Tsukasa OI <research_trasio@irq.a4lg.com>,
        Wei Fu <wefu@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/6] RISC-V: hwprobe: Support probing of misaligned access
 performance
Date:   Tue, 21 Mar 2023 21:27:25 +0100
Message-ID: <4204101.kQq0lBPeGt@diego>
In-Reply-To: <20230314183220.513101-5-evan@rivosinc.com>
References: <20230314183220.513101-1-evan@rivosinc.com>
 <20230314183220.513101-5-evan@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am Dienstag, 14. März 2023, 19:32:18 CET schrieb Evan Green:
> This allows userspace to select various routines to use based on the
> performance of misaligned access on the target hardware.
> 
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>

With the mentioned comment about the origin of the thead valie

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>


