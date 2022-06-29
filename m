Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E858C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jun 2022 03:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiF2DE0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 23:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiF2DEZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 23:04:25 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0AD2E69D
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 20:04:24 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r9so11881031ljp.9
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 20:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++WUn6YWC597uiCMSeDnIpUHpj2oOE2KiL2d4SpB610=;
        b=EJP8RzLkFpWeiMPkSzH1ceJgAOxWbR/wbYMvkuScG6GnCTr4iBRU58MqN/IXNtlWSb
         4Cg3tY5jKO66yP5IvYXKHbb3j+K/WgjNhdZKxxA/hY8rdCd+tcF3nJTr/ONHbMYH0UdU
         8yUOUneF8bi7bcL2G9PFIMy0koyUIvL2oVKaBRjYUpKj+S87rxAMY9GqfXxMyUqrprJ/
         MdlLznmRbaNIAjX8qPmhd0rlz+FVpx9JYO8r/Fv6RFk88ZrCxCEgjKz9Ff6BBeHoWzuf
         kl0ElBriXE1COr0oxILkeieXTuTDVp/Eguo3lCGTW9sKfRjhc24gU6Bx9k9wAIT48Op4
         nNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++WUn6YWC597uiCMSeDnIpUHpj2oOE2KiL2d4SpB610=;
        b=k+XGkLatBHbzrfuSk4KnfqRVJcZvqtReLz/EKa5DPU99Efgp9UkSF2lMGIpbsfBB+E
         4XpZBkDiwKBifDtzGq9SwuePKSKrBbCkK9E6bpWcBzAVRW5iD+RjVthE1JojmB5REpnJ
         kI8st89EqCJOfb+Jr6AsG65Rjt4IJc+Y0AYcePhWGTlpyoMnB/c8wY9NNLnW1rvmOIlm
         O8kXb9hiC9yiQdv/mEvilyrkeEd9N1moOf+ZhfaMn21dRRSg3dySbTGurz4e+P2Rr66A
         9q4o4IaY3ubDZ2aCg4YyLUeP0gy4vYky4jPF1w3xSCdl+GWnEe7FT2hkwDV9u8IeHPBP
         mCLA==
X-Gm-Message-State: AJIora96913F8Q5J8oI1odRp8LanhLoSsRnKqowSTADT51HDiaECBLp3
        AHpDPvtudD3p/gvr5t9tFRKWpSFPK3cDwb0TIcM96ZlK7dE=
X-Google-Smtp-Source: AGRyM1uRBBRRuIG+P9ngVeLVE/hfy2MWkprtaZWZgg13UAHgHOQ+ZaC5sJw7uBZzycFZkvS52m8OFvLs71iCP1A0vNQ=
X-Received: by 2002:a2e:8881:0:b0:255:7790:25e6 with SMTP id
 k1-20020a2e8881000000b00255779025e6mr496195lji.525.1656471862553; Tue, 28 Jun
 2022 20:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220629013240.65386-1-yizhou.tang@shopee.com> <20220629013240.65386-2-yizhou.tang@shopee.com>
In-Reply-To: <20220629013240.65386-2-yizhou.tang@shopee.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 29 Jun 2022 11:03:46 +0800
Message-ID: <CAJy-AmnM6hZkT4wLC=qgF-LkPN25zq2Dk_XnNykn0iNwHKxfaw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Show the Chinese translation of spinlocks
To:     yizhou.tang@shopee.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        robin.lubin@shopee.com, Haosong Huang <huangh@sea.com>,
        "Wu X.C." <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 29, 2022 at 9:32 AM <yizhou.tang@shopee.com> wrote:
>
> From: Tang Yizhou <yizhou.tang@shopee.com>
>
> Last time I forgot to edit locking/index.rst so the Chinese translation
> of spinlocks hasn't been shown on web yet.
>
> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  Documentation/translations/zh_CN/locking/index.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
> index 700df8a2bb70..76a8be9bf78b 100644
> --- a/Documentation/translations/zh_CN/locking/index.rst
> +++ b/Documentation/translations/zh_CN/locking/index.rst
> @@ -14,6 +14,8 @@
>  .. toctree::
>      :maxdepth: 1
>
> +    spinlocks
> +
>  TODOList:
>
>      * locktypes
> @@ -24,7 +26,6 @@ TODOList:
>      * rt-mutex-design
>      * rt-mutex
>      * seqlock
> -    * spinlocks
>      * ww-mutex-design
>      * preempt-locking
>      * pi-futex
> --
> 2.34.1
>
