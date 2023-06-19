Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DE2EB64DB
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFTA5a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 20:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjFTA5Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 20:57:24 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B459710C8
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:57:21 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-25eee11a9f1so1289338a91.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222641; x=1689814641;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBIbwLVWMH//WD3Wf9PBLkgpgUav5DDPmHySKVJGkxs=;
        b=D3pBN2EIf32vLSdkOh29A1LHMm5TMF2J2yQIlV+iG12cgfQi7sW66+VtTSFTha4Qv9
         m1duhRu0twm1MEiaHVMvr3WRu4sndp7F+uut7wOSySJvDZdKfPntqjVVRWgJLKddienr
         n8Duylo2Pvc8Tza4BPUFHnahRdrp3xP2Tf0xJQ63Wa7jKdr/WRzCiZMfBIRErprrGRP7
         +tFi/s8npOZSaNj9aHIQg0ERzQBm0p/MbbOrZMctOiSxGP52VJ1hu1rSrTQTdub16CGJ
         g7pciOXrFZCZ4Rf9UBiijSVoRM+yCNWwUSlqWkv3sY3qDa3yi1XGSz8HTEHIYzA1U7Ox
         xMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222641; x=1689814641;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBIbwLVWMH//WD3Wf9PBLkgpgUav5DDPmHySKVJGkxs=;
        b=gwJTX/Sx10EenI2f4zdt6kUnh93IflQa1Obm9a20PNL/JlldZMsOpCkHOQrqTuj+WX
         MtYfErdZ/Lve/gRzainVmfVC8K2YyFMTf3escAsDVI68deNmdZmsuCaSafVnwQAAAYef
         fDVX4OJzhEDxu2IDEPySuDKk7vH61pebH80hnhRTMR/bwYbjQFQvHLMc+P2VBo2trpyu
         SZ75RSIjfgdDlBRcGTZIqZej2LX2H0qpwoDsco5mlHviofx+Mp08b1dei7k2zzMqcoO0
         kkCZPzRV0jgip7p7mlzJ0QQ6xGtp6osrnLb253wfuqPlNs/UDa5RxCcyfAOG6ms6Rg7E
         Hhxw==
X-Gm-Message-State: AC+VfDwi1WohRKPGnpfH/Xra/lLhIOgwbasLotsh0ClgyNgMlObXK6oj
        C9wbqoQiE+b5mRT2V+CfnLb5AQ==
X-Google-Smtp-Source: ACHHUZ40lV3Zh+E3IFDyCnE48Nl/azsICbkSdfKF13FTWfxhYHUs6IYph016dX3P9sIQF3XRMcLR4w==
X-Received: by 2002:a17:902:e543:b0:1b1:d51c:f3f6 with SMTP id n3-20020a170902e54300b001b1d51cf3f6mr11325151plf.57.1687222641217;
        Mon, 19 Jun 2023 17:57:21 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902988600b001b20dc1b3b9sm375264plp.104.2023.06.19.17.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:20 -0700 (PDT)
In-Reply-To: <20230509182504.2997252-1-evan@rivosinc.com>
References: <20230509182504.2997252-1-evan@rivosinc.com>
Subject: Re: [PATCH v2 0/3] RISC-V: Export Zba, Zbb to usermode via hwprobe
Message-Id: <168721242551.30028.288770602847866224.b4-ty@rivosinc.com>
Date:   Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Jisheng Zhang <jszhang@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Evan Green <evan@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Tue, 09 May 2023 11:25:00 -0700, Evan Green wrote:
> This change detects the presence of Zba, Zbb, and Zbs extensions and exports
> them per-hart to userspace via the hwprobe mechanism. Glibc can then use
> these in setting up hwcaps-based library search paths.
> 
> There's a little bit of extra housekeeping here: the first change adds
> Zba and Zbs to the set of extensions the kernel recognizes, and the second
> change starts tracking ISA features per-hart (in addition to the ANDed
> mask of features across all harts which the kernel uses to make
> decisions). Now that we track the ISA information per-hart, we could
> even fix up /proc/cpuinfo to accurately report extension per-hart,
> though I've left that out of this series for now.
> 
> [...]

Applied, thanks!

[1/3] RISC-V: Add Zba, Zbs extension probing
      https://git.kernel.org/palmer/c/c6699baf1064
[2/3] RISC-V: Track ISA extensions per hart
      https://git.kernel.org/palmer/c/82e9c66e81c8
[3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
      https://git.kernel.org/palmer/c/c0baf321038d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

