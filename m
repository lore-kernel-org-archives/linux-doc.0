Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2E3C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 13:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjFWNp6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 09:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjFWNp6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 09:45:58 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75042273B;
        Fri, 23 Jun 2023 06:45:34 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1ED08536;
        Fri, 23 Jun 2023 13:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1ED08536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1687527884; bh=0VYk5thHtjT5xHEhK0kF75qNfppi8BiOgDVpWrdH7Kg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WuljwBrLb3q7v9KVJXxZR3j9zD5T0xsQlCD1seXm4QydwyuxlAuACqMaGjsYwAIa7
         8f/aUpwZ8DkY5Alhd8cJpFol3jtHmEsQT8bNuN9VAu13oqQXWyjRaWw5HRzq5L47Wt
         GaflwEdwsc+MjeNfJrTmfTbpd4qhezTNyf2Ri3QuNVK5QVyvd5XlrJHutS9Ec3E6JB
         CHOakbuHy6REm+gWaxhiCGzzMl5z8n4O/CEFP/qqcKqqP4HYAJzBEfVohRqFsSYdem
         Oeooau0Fy2Csa+YX2CpbNWHmBplbrmsmeA+1Do5Sqr2bmj50hzrkC5LC20TTO7fpGd
         D0ACXh5IXjgYQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
In-Reply-To: <20230623095547.51881-2-alexghiti@rivosinc.com>
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
 <20230623095547.51881-2-alexghiti@rivosinc.com>
Date:   Fri, 23 Jun 2023 07:44:43 -0600
Message-ID: <87o7l6mgxg.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> This document describes the constraints and requirements of the early
> boot process in a RISC-V kernel.

Some quick comments...

> +The RISC-V kernel expects:
> +
> +  * `$a0` to contain the hartid of the current core.
> +  * `$a1` to contain the address of the devicetree in memory.

Single `backtick` quotes are probably not doing what you want.  If
you're looking for it to render in a monospace font, use ``double``
quotes instead.  But I'd also encourage you to keep that to a minimum to
avoid overly cluttering the plain-text document.

[...]

> +Virtual mapping installation
> +----------------------------
> +
> +The installation of the virtual mapping is done in 2 steps in the RISC-V kernel:
> +
> +1. :c:func:`setup_vm` installs a temporary kernel mapping in

Please don't use :c:func:.  If you just write setup_vm(), all the right
magic will happen.

> +   :c:var:`early_pg_dir` which allows discovery of the system memory. Only the

We also really just don't use :c:var: at all.  Kerneldoc doesn't
currently know about global variables...perhaps it should but that's not
the way of things now.

Thanks,

jon

