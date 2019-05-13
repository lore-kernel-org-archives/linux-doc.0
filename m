Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF10B7D8A4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 13 May 2019 09:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbfEMJoR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 13 May 2019 05:44:17 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36766 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfEMJoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 May 2019 05:44:17 -0400
Received: by mail-ot1-f68.google.com with SMTP id c3so11137037otr.3
        for <linux-doc@vger.kernel.org>; Mon, 13 May 2019 02:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TXYVyM1elY/e/gwr441pJoxadHFYtIz0EH7uksaUA00=;
        b=GQawiz8mlWxh/yf7/DiecVKQmIl48uHHnfbDs6NwSWdi9y+D4Kf5bCLwsxaGnEIUZf
         nrUE6T/lrxJFWLvhe10ToW17PX+6WZ7PWEf4xSPOXb8k1DSLt7O2Juet2Lgt5lC759eq
         g1/2yARQtJwd9CIw7tB136d5woqAAOHI8bNZLOCKr92a6YDS5/J3WlNpe+gEZ05/VpR8
         xBK5t6xm5FLjWabkFaYeqqAUPHhVrHYsN5daplbQKzmXrU6omOOpWIp9oBDSDKGEQLEE
         NVXTCZ3tJt/VjAwmPbgBz0t9AjLNN3OsPpyEBbIDeOrWVTKi2ZQkX7y2xbus1kqxTGmq
         bnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TXYVyM1elY/e/gwr441pJoxadHFYtIz0EH7uksaUA00=;
        b=A3Yy9yQJNsKia2ROlaRpkZDV2MI5wv2Gut8nD0OC+HuKL2Ggy1ZoWcclPUWqZ315Ws
         dhLM7suXf4m4ooUR0/oACI566DOMgFrp7vK14RZheyXKXMzhO+sBI1qT3S9elXvcrtbd
         i3FADZrjPng4Rre/+/B6oTQXqmYYLnG+GBi3JI4jLAxl6MBL1mth5ecbvHd9ORK3zZAM
         zyLNsQytUei4s6FmdtdpilmT24MB3h1acxlqY5zopPl6TDvDSEHiT46JSpfxrpIAz+T5
         4Yb9oDo7OTE2gw21rgYd/kQCJou9FiDKOz7yIRxrIRH714JzAdkStTiDtxbcW630DS+C
         O4aw==
X-Gm-Message-State: APjAAAWS6R8sRKeSsKFYcDUoxBMfJVVgmDKVW8UFVcc50jSsZw8TuG0Q
        1q5y7tP+VLrFJLRSHzLBoumFKbB7AKTtpadJsxQYRw==
X-Google-Smtp-Source: APXvYqzaNT+TgVDjenXnFHOeex93upzugiVccOLalDaA6Ieg0c7UGMs4NUZH4TszrKklUoDkyyO8dIHeKn7h76sHRXU=
X-Received: by 2002:a9d:6855:: with SMTP id c21mr14592075oto.151.1557740656833;
 Mon, 13 May 2019 02:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <1557728917-49079-1-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1557728917-49079-1-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 13 May 2019 10:44:05 +0100
Message-ID: <CAFEAcA-S6Kh8yUqVZVA8gtDdRscgVaTfC4CwxngoS2ZPt6K9ww@mail.gmail.com>
Subject: Re: [RFC PATCH V2] kvm: arm64: export memory error recovery
 capability to user space
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Christoffer Dall <christoffer.dall@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, Zheng Xiang <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 13 May 2019 at 07:32, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> When user space do memory recovery, it will check whether KVM and
> guest support the error recovery, only when both of them support,
> user space will do the error recovery. This patch exports this
> capability of KVM to user space.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> v1->v2:
> 1. check whether host support memory failure instead of RAS capability
>    https://patchwork.kernel.org/patch/10730827/
>
> v1:
> 1. User space needs to check this capability of host is suggested by Peter[1],
> this patch as RFC tag because user space patches are still under review,
> so this kernel patch is firstly sent out for review.
>
> [1]: https://patchwork.codeaurora.org/patch/652261/
> ---

I thought the conclusion of the thread on the v1 patch was that
userspace doesn't need to specifically ask the host kernel if
it has support for this -- if it does not, then the host kernel
will just never deliver userspace any SIGBUS with MCEERR code,
which is fine. Or am I still confused?

thanks
-- PMM
