Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ADEC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 09:22:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9B156103B
	for <linux-doc@archiver.kernel.org>; Tue, 19 Oct 2021 09:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbhJSJYw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Oct 2021 05:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbhJSJYv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Oct 2021 05:24:51 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2399AC061749
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 02:22:39 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id p21so11194967wmq.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fptJv6XvoZk9YouChC4oUHOD/enMQbUqo6YfTUG11j8=;
        b=qHoQS2s76kBlprES0oGRziR9C5WQdcSO2SRygtuQ+41hE/s5IDtpq3tEADGZHIJ4+U
         VVfBkwLBJhtJHMEu+eftbbpNpZoD8Ja0+GL9GkVPJfgdFUJOhcZWpg3xINz7Yx9vMHbl
         M45X0oYiL5fFJI0xwYBz93K8WtjDVBNuHNqF4E79yiViVTSce7jJLYc/DH1eumrLWG/V
         puPNq7f0+ZyREiB6mbuhxEeYkrptIs6uLKgKdiKHp0mDZmbTkXzbMSy9mjz+3/7zH1cC
         APzCsqUddfIGZ72pHIJThOZTJ/iK+1/0LiCiD3zcBeFYmdorAkDWA8HVqnijqW2g5hAc
         /lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fptJv6XvoZk9YouChC4oUHOD/enMQbUqo6YfTUG11j8=;
        b=h/cW7IsvG5uw6d3J2ywMaSMUOeftegE5ciX4ylSI/8D59OXyn/TokUOX9NdVVClyph
         s1wFdJWC9yuZA2BoCGQ5HSMKaNIHsyQ28meKHWyhER9I4QmLvRI0+DXCLBKIpMaVNchj
         Q0taWUjj6U3FqEdHsdohdM9/rznjarbB/YBDJzXnLdKCvwAxu3r4vDyTz/nOjAjHbo9X
         wns0dW6xmGy29UdIVsUu+pdNzxlBhBzxDbhFhbUVOFr3fe2CXLCDw+q7h/OlRxpoI1Wo
         EGJVT9w3fYlPtiwyWhTlnC8ed1os6BUOJD6OXEm7SggzY49PMgP3E22q+7YN98YiAJ8b
         HVWw==
X-Gm-Message-State: AOAM530GjGzf+1LTdK6z7U/+7yOj2PL0gaReT5o3I3jtLsc2bxhDJWqv
        oJj1AF2IY4W4bli7TFPtX9agpD9ryCSCut2DzqzA0w==
X-Google-Smtp-Source: ABdhPJwQXDbqWUPeLTbC5CeRI9I3z7fchT4UiWD2mQAInmdDfeB1n/lMV05DAx2AdM1cIee8iuAMlgLiMMne7h40TPg=
X-Received: by 2002:a05:600c:354c:: with SMTP id i12mr4817048wmq.59.1634635357474;
 Tue, 19 Oct 2021 02:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org> <1f62fdbd0dd9298a19c491447a4b415a8ef3bd69.1634630486.git.mchehab+huawei@kernel.org>
In-Reply-To: <1f62fdbd0dd9298a19c491447a4b415a8ef3bd69.1634630486.git.mchehab+huawei@kernel.org>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 19 Oct 2021 14:52:26 +0530
Message-ID: <CAAhSdy0Rp8gf_OHy-qi1aDhCouMXYe_4qcFUUZkZCs2BCRPNog@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] Documentation: update vcpu-requests.rst reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 1:34 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> renamed: Documentation/virtual/kvm/vcpu-requests.rst
> to: Documentation/virt/kvm/vcpu-requests.rst.
>
> Update its cross-reference accordingly.
>
> Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

>
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/
>
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index c44cabce7dd8..260ce0779a32 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -912,7 +912,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  * Ensure we set mode to IN_GUEST_MODE after we disable
>                  * interrupts and before the final VCPU requests check.
>                  * See the comment in kvm_vcpu_exiting_guest_mode() and
> -                * Documentation/virtual/kvm/vcpu-requests.rst
> +                * Documentation/virt/kvm/vcpu-requests.rst
>                  */
>                 vcpu->mode = IN_GUEST_MODE;
>
> --
> 2.31.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
