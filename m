Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3C0C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 18 Nov 2022 16:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbiKRQHu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Nov 2022 11:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234455AbiKRQHt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 11:07:49 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBA21055D
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 08:07:47 -0800 (PST)
Received: (Authenticated sender: alex@ghiti.fr)
        by mail.gandi.net (Postfix) with ESMTPSA id 486D520003;
        Fri, 18 Nov 2022 16:07:40 +0000 (UTC)
Message-ID: <da4eaceb-9561-4744-d3c9-459b6a70783f@ghiti.fr>
Date:   Fri, 18 Nov 2022 17:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Documentation: riscv: Document the sv57 VM layout
Content-Language: en-US
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20221031180230.1420544-1-bjorn@kernel.org>
From:   Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20221031180230.1420544-1-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Björn,

On 10/31/22 19:02, Björn Töpel wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
>
> RISC-V has been supporting the "sv57" address translation mode for a
> while, but is has not been added to the VM layout documentation. Let
> us fix that.
>
> Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>   Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index 5b36e45fef60..35f76798b6e4 100644
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
> +   0000000000000000 |    0       | 00ffffffffffffff |   64 PB | user-space virtual memory, different per mm
> +  __________________|____________|__________________|_________|___________________________________________________________
> +                    |            |                  |         |
> +   0100000000000000 | +64     PB | feffffffffffffff | ~16K PB | ... huge, almost 64 bits wide hole of non-canonical


Very very nit but "+64" is not correctly aligned :)


> +                    |            |                  |         | virtual memory addresses up to the -64 PB
> +                    |            |                  |         | starting offset of kernel mappings.
> +  __________________|____________|__________________|_________|___________________________________________________________
> +                                                              |
> +                                                              | Kernel-space virtual memory, shared between all processes:
> +  ____________________________________________________________|___________________________________________________________
> +                    |            |                  |         |
> +   ff1bfffffee00000 |  -57    PB | ff1bfffffeffffff |    2 MB | fixmap
> +   ff1bffffff000000 |  -57    PB | ff1bffffffffffff |   16 MB | PCI io
> +   ff1c000000000000 |  -57    PB | ff1fffffffffffff |    1 PB | vmemmap
> +   ff20000000000000 |  -56    PB | ff5fffffffffffff |   16 PB | vmalloc/ioremap space
> +   ff60000000000000 |  -40    PB | ffdffffeffffffff |   32 PB | direct mapping of all physical memory
> +   ffdfffff00000000 |  - 8    PB | fffffffeffffffff |    8 PB | kasan


To me, the kasan start address is wrong, an sv57 kernel produces the 
following output for me:

[    0.000000]       fixmap : 0xff1bfffffee00000 - 0xff1bffffff000000   
(2048 kB)
[    0.000000]       pci io : 0xff1bffffff000000 - 0xff1c000000000000   
(  16 MB)
[    0.000000]      vmemmap : 0xff1c000000000000 - 0xff20000000000000   
(1024 TB)
[    0.000000]      vmalloc : 0xff20000000000000 - 0xff60000000000000   
(16384 TB)
[    0.000000]      modules : 0xffffffff01e2a000 - 0xffffffff80000000   
(2017 MB)
[    0.000000]       lowmem : 0xff60000000000000 - 0xff60000100000000   
(4096 MB)
[    0.000000]        kasan : 0xffdf000000000000 - 0xffffffff00000000   
(8447 TB)
[    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   
(2047 MB)

Because by definition, KASAN_SHADOW_START is aligned on PGDIR_SIZE 
(because it is easier to map this way).

And again very very nit: there is a space between the '-' and '8' :)


> +  __________________|____________|__________________|_________|____________________________________________________________
> +                                                              |
> +                                                              | Identical layout to the 39-bit one from here on:
> +  ____________________________________________________________|____________________________________________________________
> +                    |            |                  |         |
> +   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
> +   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
> +  __________________|____________|__________________|_________|____________________________________________________________


Thanks,

Alex

