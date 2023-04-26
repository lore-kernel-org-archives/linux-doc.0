Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F88FC7618E
	for <linux-doc@archiver.kernel.org>; Wed, 26 Apr 2023 16:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDZQqA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Apr 2023 12:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbjDZQp6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Apr 2023 12:45:58 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BB3659E
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 09:45:57 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1a68f2345c5so58326045ad.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682527556; x=1685119556;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yatjVq4XJpKuYfqw9iU5Uu3id4cVfMvHZW+dyEQj7X4=;
        b=ROPYuwymJIXdKR2mNFiFbms7bF34DxQulcyPoD2s8ls+l6DB2FjVlZvO7u5GF9MPuQ
         cdFwxm/1Wdzy7TIPTZ69Wr+YgUHOotkVJ7lnAfWkJ+f+59O5mxxR14YA5dVdOLDcas7l
         VrI6xsoMmtJ5Pv5IDSUJMq66LuSfXGyLRS8Qnv97ZkKXvzCn2wsVN9nRn1cVtoxSSXiT
         e0t5pUo4xzsce/7smaQtXT2frKjr1syw+iTOxFq/frawwnHjPZD+orX6kCf+XxBV2eN3
         1w+aG0j+ES+k3qrwnew12cvsaYLIY7zrqWLSFckf6BVWDB/+mI8M3pzDq0G5ogsIjjQk
         UAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682527556; x=1685119556;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yatjVq4XJpKuYfqw9iU5Uu3id4cVfMvHZW+dyEQj7X4=;
        b=QhhbMs3KlD+iF3QrGgRizmpotzN+GloTpx3smfzEIEEUTjg9b91V8UIq7FwieQiUe4
         tYJWnj3EF04UmHrzNGJVkLoUk7iF/FPOtX6WDJACkP6YtzuQfc/75w1OcfROjsCxDmXZ
         HOFusBVh6sjdH5yk6MVsQ7fNriQNiXdi/HQ9hTgnBCkG0YbfxQr2G6Y6Ri0G+AEU3351
         FesY3MoJybgq9ZGN5YVgPw/WM0Ewa+z+T4WKTkGnMYcrKyL/fgquB5n19kNUHoDdHKsH
         GHc4Wl8vSazh9qP2oBP1T/SErAFnN/3TXhT/PqZOcJ3m5g5XleofMLGbAWpH8c52k4Iz
         ieEA==
X-Gm-Message-State: AAQBX9cbCNEVU9eISjZvgXiRzqMi0yvsDvjieoWDnz/Imfb8YCRTGGCL
        bc4562Y8OocZvvr733Sb4ncKwg==
X-Google-Smtp-Source: AKy350aLlCXNGnDpwf2/bJmKJLs42syuWY18ObpLSP7pw47h7IOSJhgDcejLVqj4h9oiMCZCX1X0WQ==
X-Received: by 2002:a17:902:fb86:b0:1a5:4ff:33c0 with SMTP id lg6-20020a170902fb8600b001a504ff33c0mr18747856plb.12.1682527556692;
        Wed, 26 Apr 2023 09:45:56 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ab8200b001a0448731c2sm10176955plr.47.2023.04.26.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 09:45:56 -0700 (PDT)
In-Reply-To: <20230424092313.178699-1-alexghiti@rivosinc.com>
References: <20230424092313.178699-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v10 0/1] riscv: Allow to downgrade paging mode from the
 command line
Message-Id: <168252462351.26895.11552045445752621188.b4-ty@rivosinc.com>
Date:   Wed, 26 Apr 2023 08:57:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Mon, 24 Apr 2023 11:23:12 +0200, Alexandre Ghiti wrote:
> his new version gets rid of the limitation that prevented KASAN kernels
> to use the newly introduced parameters.
> 
> While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
> avoid relocating the kernel twice for KASLR"): it allows to use the fdt
> functions very early in the boot process with KASAN enabled by simply
> compiling a new version of those functions without instrumentation.
> 
> [...]

Applied, thanks!

[1/1] riscv: Allow to downgrade paging mode from the command line
      https://git.kernel.org/palmer/c/26e7aacb83df

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

