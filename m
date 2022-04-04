Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F75CC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  4 Apr 2022 03:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355252AbiDDDsC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Apr 2022 23:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346615AbiDDDsB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Apr 2022 23:48:01 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57AA27CF4
        for <linux-doc@vger.kernel.org>; Sun,  3 Apr 2022 20:46:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso4820392wml.5
        for <linux-doc@vger.kernel.org>; Sun, 03 Apr 2022 20:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIEWjwIftCsbXsyVaKrbxiQ3YI3B53hkXz7cL3Cg4Hk=;
        b=5NLJ/H5VwJU9/XJjgnCvziAUiVTZmUTWR+QTk5YqSNeNhj6yLp5udBH8IXnkRyqfen
         7ZMH7/kbxkU3fVc6e7d+20rQRfniY5BwYwRN1bTzqBHuoFPd4gjk6Crt17D/Ksd+WFBN
         YC24GmWYZZrG59JApll5m8/7lxBs3UV9MWI5+k+Od/BrzhtJ2E2QTr8RuOh+yOpBcvhj
         /gdekB1g6P+n/7lc7AqNcSR7dVbLUBfkvnw+VANgZor1xLG7MbPj6G32g8aEhsgczqTQ
         nupBrMvFISqcO3bnR+8PmjHidV4jhgdyjY3yxzgHjJt7aB73xNayUU/HkBphiwCVDdLB
         8GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIEWjwIftCsbXsyVaKrbxiQ3YI3B53hkXz7cL3Cg4Hk=;
        b=KHU5s7KHluctb8AMSyeru1oMGShytwIX02ZAgWdklo7na51kqWNPoeY4eHHqZ+uDbe
         FZRWENuZ8ekRzqXPpZcKFLxvg6x7k7GJD7xb+1K1yMN+bCayFmxvXP8rnNF0hZrNY7yG
         UvH/u2W+gTjgGUs45CdKxTTrPz0+EJMQedEFZ0OFXYYCur7r52tL4zYo81ATs0N05T++
         90i4y5elrkuRa/8W5e7ixEe6yxBTEGl7LFKWSs9CFGysjm7wSgwxO1RhhRj+vKbsSIWX
         9b1FvGWpW1kmcfsUjNUNaNwbJf1Nj5OCYXdbdz5mrL0qUw1i7D4hv6RnBixx8wyoxBCY
         fabQ==
X-Gm-Message-State: AOAM532idNpLB44Iftrzlk0ToLydpnNf2XT7Aq9An+PfBndhrmDebTIh
        NBK/7CYU7zi5KAwgc2qfj0RwkabJnEtJoFky3iRg+Q==
X-Google-Smtp-Source: ABdhPJxWy3ASdc1fdzlTkh/icaTSsaUSRXwwU+/7EXnNF1pjk9RZzqkcq+Ab3qtG3iS4I7Z32SL1kMxGGrKs6m5vxIg=
X-Received: by 2002:a05:600c:6d4:b0:38e:7622:9983 with SMTP id
 b20-20020a05600c06d400b0038e76229983mr450885wmn.93.1649043963147; Sun, 03 Apr
 2022 20:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220403065735.23859-1-bagasdotme@gmail.com>
In-Reply-To: <20220403065735.23859-1-bagasdotme@gmail.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 4 Apr 2022 09:14:53 +0530
Message-ID: <CAAhSdy0G4o16Qdt2ZPDAD5M6Updopdm43La2q4t6xVA540WXdw@mail.gmail.com>
Subject: Re: [PATCH RESEND] Documentation: kvm: Add missing line break in api.rst
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        KVM General <kvm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 3, 2022 at 12:28 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Add missing line break separator between literal block and description
> of KVM_EXIT_RISCV_SBI.
>
> This fixes:
> </path/to/linux>/Documentation/virt/kvm/api.rst:6118: WARNING: Literal block ends without a blank line; unexpected unindent.
>
> Fixes: da40d85805937d (RISC-V: KVM: Document RISC-V specific parts of KVM API, 2021-09-27)
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

For KVM RISC-V related patches, please CC kvm-riscv@lists.infradead.org

Otherwise, this looks good to me. I have queued this for RC fixes.

Thanks,
Anup

> ---
>  Documentation/virt/kvm/api.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 9f3172376ec3a6..a529f94b61edcd 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6115,6 +6115,7 @@ Valid values for 'type' are:
>                         unsigned long args[6];
>                         unsigned long ret[2];
>                 } riscv_sbi;
> +
>  If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
>  done a SBI call which is not handled by KVM RISC-V kernel module. The details
>  of the SBI call are available in 'riscv_sbi' member of kvm_run structure. The
>
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613
> --
> An old man doll... just what I always wanted! - Clara
>
