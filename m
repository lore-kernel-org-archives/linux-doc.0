Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CBFC4332F
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 05:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiKUFuU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 00:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiKUFuT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 00:50:19 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A150927911
        for <linux-doc@vger.kernel.org>; Sun, 20 Nov 2022 21:50:17 -0800 (PST)
Received: (Authenticated sender: alex@ghiti.fr)
        by mail.gandi.net (Postfix) with ESMTPSA id CF5CC1C000A;
        Mon, 21 Nov 2022 05:50:10 +0000 (UTC)
Message-ID: <026ac9c0-8994-c76a-9fb6-22abce7f1a3e@ghiti.fr>
Date:   Mon, 21 Nov 2022 06:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] Documentation: riscv: Document the sv57 VM layout
Content-Language: en-US
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20221118171556.1612190-1-bjorn@kernel.org>
From:   Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20221118171556.1612190-1-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Björn,

On 11/18/22 18:15, Björn Töpel wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
>
> RISC-V has been supporting the "sv57" address translation mode for a
> while, but is has not been added to the VM layout documentation. Let
> us fix that.
>
> Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
> ---
> v2: * Cosmestics (Alex)
>      * Corrected kasan address (Alex)
> ---
>   Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index 5b36e45fef60..3be44e74ec5d 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -97,3 +97,39 @@ RISC-V Linux Kernel SV48
>      ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
>      ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
>     __________________|____________|__________________|_________|____________________________________________________________
> +
> +
> +RISC-V Linux Kernel SV57
> +------------------------
> +
> +::
> +
> + ========================================================================================================================
> +      Start addr    |   Offset   |     End addr     |  Size   | VM area description
> + ========================================================================================================================
> +                    |            |                  |         |
> +   0000000000000000 |   0        | 00ffffffffffffff |   64 PB | user-space virtual memory, different per mm
> +  __________________|____________|__________________|_________|___________________________________________________________
> +                    |            |                  |         |
> +   0100000000000000 | +64     PB | feffffffffffffff | ~16K PB | ... huge, almost 64 bits wide hole of non-canonical
> +                    |            |                  |         | virtual memory addresses up to the -64 PB
> +                    |            |                  |         | starting offset of kernel mappings.
> +  __________________|____________|__________________|_________|___________________________________________________________
> +                                                              |
> +                                                              | Kernel-space virtual memory, shared between all processes:
> +  ____________________________________________________________|___________________________________________________________
> +                    |            |                  |         |
> +   ff1bfffffee00000 | -57     PB | ff1bfffffeffffff |    2 MB | fixmap
> +   ff1bffffff000000 | -57     PB | ff1bffffffffffff |   16 MB | PCI io
> +   ff1c000000000000 | -57     PB | ff1fffffffffffff |    1 PB | vmemmap
> +   ff20000000000000 | -56     PB | ff5fffffffffffff |   16 PB | vmalloc/ioremap space
> +   ff60000000000000 | -40     PB | ffdeffffffffffff |   32 PB | direct mapping of all physical memory
> +   ffdf000000000000 |  -8     PB | fffffffeffffffff |    8 PB | kasan
> +  __________________|____________|__________________|_________|____________________________________________________________
> +                                                              |
> +                                                              | Identical layout to the 39-bit one from here on:
> +  ____________________________________________________________|____________________________________________________________
> +                    |            |                  |         |
> +   ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
> +   ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
> +  __________________|____________|__________________|_________|____________________________________________________________


Thanks for the corrections, this looks great to me now, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


