Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D54C7EE30
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 21:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjB1V7d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 16:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjB1V7c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 16:59:32 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2062C2FCF1
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 13:59:19 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id n5so6706427pfv.11
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 13:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677621558;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcPXNEsEpksofsMgrJKoW+2Dw41GYFuZiABYuzNl9Gs=;
        b=za5fWNg2Nv2HD9fejIfGBhGN1pMgo+aOFuLl+8D0p02BS02PEImNrgQqCIrppjORuf
         Ivb6x0gnS0BZbVUteSyLJCe4dTk4zpZynrOz2UWb8qWvNDF+yf/sciJYzrRNEgvxLC9u
         E+F8Jm5xh8TCc/I/byatHLr26L45EWG8pwgxY8bbdXhQsB74QJZvbs2lRJR9Za0eJQrh
         P5GUabS7IWGFucgrRD6J0IOa6HasWQ1XTi4OIfCkZYZytf9vQdJlGOg3RL3s8CWEpn5/
         z2Z6M46w39AsDLnnsLxujw5xk3E+JuicdzOsa2t4XB/n/cM5AaEnJbKx5Syy42mM5qGb
         HD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677621558;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcPXNEsEpksofsMgrJKoW+2Dw41GYFuZiABYuzNl9Gs=;
        b=vhdhQeAzMJTATdYZXHyPZWj3jp6dLjhrvQZhYKyFLMg3bblNy0c/HOH/Ms7bfpUvPR
         5PPiWBMgqfFtvUtDFKXnTFyMjpWUiRYBHImsvDC2tq797MHcnc6NfLWFLFGWrtJzLk+z
         vLlg6I7CAHx8oqX7j+jJCMk/l+za0CCG4kF1yFkSdrhO+agPYotSt+8Wqkyk2/pCau0a
         KfZD10EomDujCIy+G+agtkldaVd8Gi4bZjE28QgYt1YeLYVrDLlSnqaHJIkzpmjrSJtA
         IXpxpAcJmmjJEC5Ysh4hcItXgI3yNMW0t0He8BZYOlaRThvofvZnqEjB2+mgoaoia8Z4
         Or1Q==
X-Gm-Message-State: AO0yUKWZ9scCfn3zhSS6P5JXsrY2GGX91HbPDDVU81M/NARLeoAfQHi8
        /J7FJqRJ6e6voleSmyC/+bqnWw==
X-Google-Smtp-Source: AK7set9MF/vBgDRK4NIoF28WqhT66X4p2Sfvcjoa4aaWatAUerjrnyBRKlu55zK+kgH1S0F08yes8A==
X-Received: by 2002:a62:1887:0:b0:5df:9809:2e3f with SMTP id 129-20020a621887000000b005df98092e3fmr2660388pfy.32.1677621558446;
        Tue, 28 Feb 2023 13:59:18 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e18-20020a656892000000b004fbd91d9716sm6185873pgt.15.2023.02.28.13.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 13:59:17 -0800 (PST)
Date:   Tue, 28 Feb 2023 13:59:17 -0800 (PST)
X-Google-Original-Date: Tue, 28 Feb 2023 13:58:23 PST (-0800)
Subject:     Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
In-Reply-To: <20230227105941.2749193-1-suagrfillet@gmail.com>
CC:     alexs@kernel.org, siyanteng@loongson.cn, robh@kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        leyfoon.tan@starfivetech.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        suagrfillet@gmail.com
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     suagrfillet@gmail.com, corbet@lwn.net
Message-ID: <mhng-90a89c61-02e7-4f1a-b18d-189d9b7fff72@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 27 Feb 2023 02:59:41 PST (-0800), suagrfillet@gmail.com wrote:
> This commit 7d2078310cbf ("dt-bindings: arm: move cpu-capacity to a
> shared loation") updates some references about capacity-dmips-mhz
> property in this document.
>
> The list of architectures using capacity-dmips-mhz omits RISC-V, so
> supplements it here.
>
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  Documentation/scheduler/sched-capacity.rst                    | 2 +-
>  Documentation/translations/zh_CN/scheduler/sched-capacity.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/scheduler/sched-capacity.rst b/Documentation/scheduler/sched-capacity.rst
> index 8e2b8538bc2b..e2c1cf743158 100644
> --- a/Documentation/scheduler/sched-capacity.rst
> +++ b/Documentation/scheduler/sched-capacity.rst
> @@ -258,7 +258,7 @@ Linux cannot currently figure out CPU capacity on its own, this information thus
>  needs to be handed to it. Architectures must define arch_scale_cpu_capacity()
>  for that purpose.
>
> -The arm and arm64 architectures directly map this to the arch_topology driver
> +The arm, arm64, and RISC-V architectures directly map this to the arch_topology driver
>  CPU scaling data, which is derived from the capacity-dmips-mhz CPU binding; see
>  Documentation/devicetree/bindings/cpu/cpu-capacity.txt.
>
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-capacity.rst b/Documentation/translations/zh_CN/scheduler/sched-capacity.rst
> index e07ffdd391d3..8cba135dcd1a 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-capacity.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-capacity.rst
> @@ -231,7 +231,7 @@ CFS调度类基于实体负载跟踪机制（Per-Entity Load Tracking, PELT）
>  当前，Linux无法凭自身算出CPU算力，因此必须要有把这个信息传递给Linux的方式。每个架构必须为此
>  定义arch_scale_cpu_capacity()函数。
>
> -arm和arm64架构直接把这个信息映射到arch_topology驱动的CPU scaling数据中（译注：参考
> +arm、arm64和RISC-V架构直接把这个信息映射到arch_topology驱动的CPU scaling数据中（译注：参考
>  arch_topology.h的percpu变量cpu_scale），它是从capacity-dmips-mhz CPU binding中衍生计算
>  出来的。参见Documentation/devicetree/bindings/cpu/cpu-capacity.txt。

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com> # English
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Happy to take this through the RISC-V tree, but I'll hold off for a bit 
and let the doc folks have a chance to chime in (or just pick it up).  
I'm planning on sending something later this week either way.
