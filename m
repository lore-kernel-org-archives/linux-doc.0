Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C56EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 17:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjFVRYL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jun 2023 13:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjFVRYK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jun 2023 13:24:10 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22011FF5
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 10:24:04 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98d25cbbb43so124588466b.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687454643; x=1690046643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7NlwJWhRn9vHCeh97jNIwU31z0pZlGYxYgOuGVCJzI=;
        b=dvJcLE41E36YYhtUQ7PHGfwyAcquKBKIJIlyikv838sTlsaqDoPFbYGMCezfpxq/x7
         0FebxD1wbfRTwgHRwX5iwd5wHAutXUzl+ON0b36Cue9o+0FSeeIwgSEgjLK8iEqaTM53
         0hphiRi+FdMFlv9VOsnV97CfvqiH9Hk5obMLsmY5nMQcY7HbA+hdCM+6oJnlQgrRht53
         E392BMbVXiXyO10U0h9+ewm3Nu4sFjNkdLPB3cNFcV/u/E/BXBRKtipXoeNTQsaQ7Bwo
         Ze/XO/y41b8Hl4M3NrITrqybEZNrXZ+qBPlSbjJFTy5VYnvoHAcMtph9vE13v3SFFsJA
         C1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687454643; x=1690046643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7NlwJWhRn9vHCeh97jNIwU31z0pZlGYxYgOuGVCJzI=;
        b=EhuD6jc3U+iZOZVgPiKsJ0wqCYK0mEyXUqjRSOpCYdX8L2JgJVctTFg9lWQq9FqsBx
         8SBqoLYBI5+wn7ElWuhTLdheV7ylNBKjBt0wDinjho8H0ycPodBp270GNdXtJq7lbPMg
         /VyS2MZgr1G+Yixyx6ziGgc9xQNpWUmrroz1EqYCTOzjmxp3sayJPPvC8G05UDtOx8FH
         cYHAAXe6W4UX8YbHXNSkbdiSQdabgtPJ2b1795DSYKZsNLWNbKj9kxjahNJ6tLc2i2vw
         M2C3teYdVnT3b/xSNBa/Zbst+pPkFvzZa2qaE7IYAEhT+EYTCjU97oaPfUAMxPQ6cVgA
         M32w==
X-Gm-Message-State: AC+VfDywznNmlxRNdv8h8O30t5/gEKU+DXh+vP1FXsK91l8qTSonBB6g
        Wjx4fV4HplTti5yfpQWN89s4mQ==
X-Google-Smtp-Source: ACHHUZ7P3Qy5Z4td/nDkOO2K8MDAWad9Trpj9+x3B2xC+pr7mISzhOGHYtMtsPwiPVOnhaT68CrZhQ==
X-Received: by 2002:a17:906:4793:b0:965:ff38:2fbb with SMTP id cw19-20020a170906479300b00965ff382fbbmr18956070ejc.1.1687454643258;
        Thu, 22 Jun 2023 10:24:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lu4-20020a170906fac400b009889c4bd8absm4911712ejb.216.2023.06.22.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:24:02 -0700 (PDT)
Date:   Thu, 22 Jun 2023 19:23:56 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <20230622-4af59422f118ea634836d351@orel>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-d6da578719f8af903d6746ef@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621-d6da578719f8af903d6746ef@orel>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 21, 2023 at 02:19:50PM +0200, Andrew Jones wrote:
> On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
...
> > +Hardware description
> > +--------------------
> > +
> > +The firmware can pass either a devicetree or ACPI tables to the RISC-V kernel.
> > +
> > +The devicetree is either passed directly to the kernel from the previous stage
> > +using the `$a1` register, or when booting with UEFI, it can be passed using the
> > +EFI configuration table.
> > +
> > +The ACPI tables are passed to the kernel using the EFI configuration table. In
> > +this case, a tiny devicetree is still created by the EFI stub. Please refer to
> > +"EFI stub and devicetree" tree section below for details about this devicetree.
>                              ^ redundant 'tree' here
>

Can whoever applies this drop this 'tree' I pointed while applying?

Thanks,
drew
