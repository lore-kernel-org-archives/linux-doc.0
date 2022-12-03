Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFEEC4321E
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 00:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234994AbiLCA47 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 19:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbiLCA45 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 19:56:57 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77603FC8
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 16:56:56 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 124so6455364pfy.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 16:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18IZ0m5toh803lbdbvk/IEmYiB7S5eI1v1wKhdMmz6I=;
        b=FxQVJ80S9QkHllGqaVUvnNBiW1xUrcSiYTno/9plqqGOFfeEqGXXEiGXeRlhf57k4O
         wP4zI/rjXepwujEZ5K0JDERtkOORTHTVW3murD7yOKYk8Rhu/0O9KizxLx868HXw4WzC
         hKwXODCFYDscH+gB6BFDyA2nHgRN+gug8OK2pFNSBzDVGu1H5v9Aajo1g9JTZL/GORFv
         WDY2evnKAQunFA+yeuF5UHiF7vo2oobtvTKYpGpIr59gP1UqjFZtpdn3Q02Q1ksrxtj6
         J8pBdK+4Q1NyTg6LZRIL69Dbyl0B1iTcJEeXtC57Mab4rMxHsXCIktj6tsebfqma8Keo
         6nTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18IZ0m5toh803lbdbvk/IEmYiB7S5eI1v1wKhdMmz6I=;
        b=6BBFvN3iFs02uSsFmAKN/Mp3Ej1hmGVvBjyWK5ChJbUw6EzvxPiKNOZJ5nEVbp5Tu5
         KNTrhDzmX11zH2FWnerd9iZGGcDU+SAAnJDYik/t6jR3+oznITBSlnQ/r+Ba6r9rcl6N
         N3kIQQh7tuRhucdr8FmMwjS3JwZnxitm/p+oqMM1aPrYpQ8n4qKiKja33S/CIF/s8z3z
         byTBBkaX3gO7o/gdDgi8lBlHWFzE7krJpUqPxPm6ngKZadO9WdWcdtBJTwmmowoZmeYH
         80kvUNxvG13brEiul2shfLjv3UwNVZN/3xD+zf7o/o1wzGs6X4JcNemjfmhx/oO6mLfq
         cijA==
X-Gm-Message-State: ANoB5plU8xm98YNxCFT8oCBaImNCOFdwqcZr8N4bs9qkdDgtB+G4hiNM
        V5y3Pyb0e3kLyt2eUCM41VwlTQ==
X-Google-Smtp-Source: AA0mqf7l8GDn2HO87/kOUsruTegFJYC7NPmDdYxV0Oo4X9myc0x/MCYGm6AFgGQ18JfhnX017FqfFw==
X-Received: by 2002:a63:ce10:0:b0:478:5e53:4742 with SMTP id y16-20020a63ce10000000b004785e534742mr13351694pgf.471.1670029015924;
        Fri, 02 Dec 2022 16:56:55 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x28-20020aa79a5c000000b0056b8181861esm5859524pfj.19.2022.12.02.16.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 16:56:55 -0800 (PST)
In-Reply-To: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH V5 0/2] Support VMCOREINFO export for RISCV64
Message-Id: <167002857934.4256.16584443879212253129.b4-ty@rivosinc.com>
Date:   Fri, 02 Dec 2022 16:49:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-e660e
Cc:     hschauhan@nulltrace.org, yixun.lan@gmail.com,
        kexec@lists.infradead.org, heinrich.schuchardt@canonical.com,
        linux-doc@vger.kernel.org, crash-utility@redhat.com,
        linux-kernel@vger.kernel.org, k-hagio-ab@nec.com,
        linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     mick@ics.forth.gr, corbet@lwn.net, alexandre.ghiti@canonical.com,
        vgoyal@redhat.com, bhe@redhat.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        bagasdotme@gmail.com, dyoung@redhat.com,
        Palmer Dabbelt <palmer@dabbelt.com>, heiko@sntech.de,
        Xianting Tian <xianting.tian@linux.alibaba.com>,
        guoren@kernel.org, anup@brainfault.org, aou@eecs.berkeley.edu
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 26 Oct 2022 22:42:06 +0800, Xianting Tian wrote:
> As disscussed in below patch set, the patch of 'describe VMCOREINFO export in Documentation'
> need to update according to Bagas's comments.
> https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D113444@kernel.org/
> 
> As others patches in above patch set already applied, so this patch set only contains below two
> patches.
> 
> [...]

Applied, thanks!

[1/2] RISC-V: Add arch_crash_save_vmcoreinfo support
      https://git.kernel.org/palmer/c/649d6b1019a2
[2/2] Documentation: kdump: describe VMCOREINFO export for RISCV64
      https://git.kernel.org/palmer/c/c5b4216929eb

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>
