Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA05C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 23 Nov 2021 03:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233265AbhKWDtW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 22:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbhKWDtS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 22:49:18 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B03C061714
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 19:46:10 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p18so17371370wmq.5
        for <linux-doc@vger.kernel.org>; Mon, 22 Nov 2021 19:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bp7mEUVEt5QqG8xtFw9E/AxBIVfYeYYO56kVpuGbx0w=;
        b=KyN9plmEYyF3x0xQCMBvv/ru9mWfjMMKqxC5jgl0lp/npQTuCiJHJwFP7tGG1y5TJd
         viO7MgOcbUYXROE6Fdvaq95av8hNE8fIZB0y4/sEKguAibSAlzCbgZcjoRSbHOW5r2fr
         jyO8qXc6/Ye0pzZXBQ8o0vAe01kTq+rN81c1H2rp5T3Vl00al1Lk18B1qoyjtvojBKNn
         AIwNUdve229Uua8ERl9LLmtfTSEV0ud+DOu+8sjZYPUDL4fizeWm0DEur8ToXjkgehTE
         Z1/mJWLWkC2ZLy5Dxyg7XGLih5qK93mqgrkdMZjgRoKy+ZbQ9d8RmBWEsVkrU/UHOeBq
         ix0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bp7mEUVEt5QqG8xtFw9E/AxBIVfYeYYO56kVpuGbx0w=;
        b=jKdiDTvM9avKxMqn4xGQQI8xT2HCus8HhhxAL0QktovCzi5FvY6+zYxZS/8ULNw/tL
         lRkyMo/jpiEifzbPgxDHVH/9hdx6rqPSz2TF2PhTiTXiD3r428GpA/8UNxz5tQuG5H/w
         8XwWMoROmHu3LcBWZqyn+N2xKyqFwoIYraUVdTitX4FI+7eg6p4Zv0n1wZxphEfnX5uE
         JDWoK4xEN8Ho5fbqhjYMee5zNjs0qwYkGS8lv8WM9JrxL3FEYTEQnG4Pi4IzaLckdUdK
         8BlZLFiWt8rpJmgagOMjf6+WoSm9sU8w3iumg353LrWdQAedm9cfvrBeMuWOncoc2nYI
         S9tQ==
X-Gm-Message-State: AOAM532UtYRdRW7aPxXilQ34xXcbX0Gs27jGhwZ40bv9M0zJWDbJPGNe
        KXdE3u+0uIuTCmfymymkklhIX+fzQ37g+Kh2Nfi5cw==
X-Google-Smtp-Source: ABdhPJwF++wWUq50mUMTn31nsRbQkp7Q/pEnYoXUvcdHVH5A7NkAMXK0YWkEElOmdUQGxHy+cfheXIlQKhKS83s//+Q=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr3008380wmb.137.1637639168977;
 Mon, 22 Nov 2021 19:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org> <20211123015717.542631-4-guoren@kernel.org>
In-Reply-To: <20211123015717.542631-4-guoren@kernel.org>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 23 Nov 2021 09:15:57 +0530
Message-ID: <CAAhSdy3+hY1jwNAOrhE0kiCZPMRh4amY3+Mn-NR2TDFQ24orwQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] riscv: Add riscv.fwsz kernel parameter
To:     Guo Ren <guoren@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 23, 2021 at 7:27 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
> 4MB(32bit) in Linux. It's very wasteful to small memory footprint
> soc chip such as Allwinner D1s/F133. The kernel parameter gives a
> chance to users to set the proper size of the firmware and get
> more than 1.5MB of memory.

This kernel parameter is redundant see my comment on other patch.

regards,
Anup

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 9725c546a0d4..ee505743c8f4 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4964,6 +4964,9 @@
>                         [KNL] Disable ring 3 MONITOR/MWAIT feature on supported
>                         CPUs.
>
> +       riscv.fwsz=nn[KMG]
> +                       [RISC-V] Determine firmware size to save memory
> +
>         ro              [KNL] Mount root device read-only on boot
>
>         rodata=         [KNL]
> --
> 2.25.1
>
