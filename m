Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648AEC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 07:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235559AbiAKHiH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jan 2022 02:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348554AbiAKHiH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 02:38:07 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE70C06173F
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 23:38:06 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id p5so37523376ybd.13
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 23:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yf33CC/XiS/kgcK1CL8eoIvVfoQAWPZKbWU7rj6UwaY=;
        b=q6MKF8QTnvQ2Rm2gV/GLPGVwWBpfWsetdEUYjYBsBOsSZddEp6nJRQ4nTXp8qwjLIs
         ePcCD+xXOvuqb8hvi7P0unTgkt70exfkQL80n7iyv7AUZ5P3rEkCE7CMfgPPFRRThJak
         kF8UyvfaKaWSjPlwcT35iLlrvxD3Otciy1QG2sKZTjEdOw4nIGrFJf/SysmEpXXp/4gw
         RucNmQO2QBBx7XUxJfP12FV1eX1qPJOXtmzgTCSjiAu6PAqX5+qGC6Ktku1hnVw1zMB0
         9QkstX/V9+VDPwNT7YWGQylhRnO4DBtyq1ElrdV2c8M1oKSEe8wm+Xeupye6VdPUvUxK
         21AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yf33CC/XiS/kgcK1CL8eoIvVfoQAWPZKbWU7rj6UwaY=;
        b=LxfC3PoUpTlTjUopgZCwtRF3Rdr6QhaDUbGsm8sCFRGSqElvP48GDvkzo7zuSCQqg3
         iAfoPVEsm59u54F1CpQV4xBHxdGQl028UoWFd4G9s039YTy9M4y+jXp+jTwAVC3doe7M
         m1P7ElS09xNrpWlX1cW9I7J5/BIC6r/dmQUgNZLi3RiIfBAlRqGh2XA5xm8LBq2q5PF2
         yds0/XDWa4jA6pwgYhlTzkGRVCUB3v1GEdDdRbkMBh0Ini1EX7NjND666KcM12qmI6QG
         MVeqDqr9xwUhF2+uMnVNKPdHVu2buIdBFaUAic4f40k05fy6sib1RMRPiJWviDjB38zT
         zNtg==
X-Gm-Message-State: AOAM5335be5cSALePv+OAG6fQIC/LVDqzB64Hmf8z17qdflFAI1Z//9q
        7h+bwl35W15R4LeF8W1+VXKTRkKu4S5d0ixxkwCqj2xC5FH2qNKB
X-Google-Smtp-Source: ABdhPJzbBWeos2d2FzHLSEI8QB5LzEGME+nUKnv/5V3yyL3vAYE9/aOfcL4vBuBgVdL7aOoQWuURMKUN4IHqQxPdVp8=
X-Received: by 2002:a25:a04a:: with SMTP id x68mr4437240ybh.200.1641886686031;
 Mon, 10 Jan 2022 23:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20211209091414.559574-1-siyanteng@loongson.cn>
In-Reply-To: <20211209091414.559574-1-siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 11 Jan 2022 15:37:44 +0800
Message-ID: <CAEensMz=E8PxM1LP3nSK8vTwCaMNCuYU8X5F4W1riRsKg=v1fQ@mail.gmail.com>
Subject: Re: [PATCH] docs/virt: add a blank line and some - to kvm api
To:     vkuznets@redhat.com
Cc:     pbonzini@redhat.com, Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=889=E6=97=
=A5=E5=91=A8=E5=9B=9B 17:15=E5=86=99=E9=81=93=EF=BC=9A
>
> Since 0e691ee7b5034 ("KVM:Documentation: Fix KVM_CAP_ENFORCE_PV_FEATURE_C=
PUID name") which
> introduced awarning:
>
> /home/siyanteng/mainline/linux/Documentation/virt/kvm/api.rst:6046: WARNI=
NG: Literal block ends without a blank line; unexpected unindent.
> /home/siyanteng/mainline/linux/Documentation/virt/kvm/api.rst:7296: WARNI=
NG: Title underline too short.
>
> 8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
> -----------------------------
> /home/siyanteng/mainline/linux/Documentation/virt/kvm/api.rst:7296: WARNI=
NG: Title underline too short.
>
> 8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
> -----------------------------
>
> Add 8 "-" for (8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID)
> Add a blank line.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/virt/kvm/api.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index aeeb071c7688..a77c4533821f 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6043,6 +6043,7 @@ Valid values for 'type' are:
>                         unsigned long args[6];
>                         unsigned long ret[2];
>                 } riscv_sbi;
> +
>  If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
>  done a SBI call which is not handled by KVM RISC-V kernel module. The de=
tails
>  of the SBI call are available in 'riscv_sbi' member of kvm_run structure=
. The
> @@ -7293,7 +7294,7 @@ trap and emulate MSRs that are outside of the scope=
 of KVM as well as
>  limit the attack surface on KVM's MSR emulation code.
>
>  8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
> ------------------------------
> +-------------------------------------
>
>  Architectures: x86
>
> --
> 2.27.0
>

Ping


Thanks,
Yanteng
