Return-Path: <SRS0=24Yb=2X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F1C32767
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 03:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5ED55215A4
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 03:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="BNzJlPFk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgABDh2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jan 2020 22:37:28 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39735 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727549AbgABDh0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jan 2020 22:37:26 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so38044385wrt.6
        for <linux-doc@vger.kernel.org>; Wed, 01 Jan 2020 19:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w0dEwC+ZPQDMRnW2xQ00qFNHx6JYWygNg84CanVuBP4=;
        b=BNzJlPFkxZL8C3MkzPkV47XFCH4dSlnrY3A8/EowYF+Kw8g8lCGp7wBqI1ZuU/q/kp
         9+3UKO8XE9uPErHckqLv3Z3mB80zryYNo0/CYE7VXHcdglhWhM3F5VAjuzjjPZVxUDPE
         3QdcItiVds9wegvQHfe4GXJb2D28AnjN86MnF4vUOP3L3hPgbtsOCQkTIB3s89d5+q04
         CdNH43gXrUiWgwJG3KtsPpmbt9GPa/T9RphOyotquC/WwgD4pqFOC+od8AdU0wjERts/
         zPISwXgmnEqQeBR27T5/b1tMLPqtf9poK9W3KUnnw2wcbSKsybP9mffuIMj2G51pscUI
         B26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0dEwC+ZPQDMRnW2xQ00qFNHx6JYWygNg84CanVuBP4=;
        b=P2IikiydTQSV3jw9VvTuYYc4+U3bd0BoEzfUHiiEv/fmAt1+cDeZxLVU6ZnyYBCYBw
         7usvI1WCEEUDZNjEfdLU0bxj94tZia6id4ccy4WQNcTHk30yy40DhUwVk0GYSHAP0gkX
         X6ij2Anwgqh/qPqVmQr/B2xt7XuUDT3ibVBNSPYCbhiSaIQk+vEKJmtKBnV9xeRSTMm9
         9aURjM+OdWzAq84zYQc2RUiUkXEZZr9z9JenUJik9+VnNsJ5ER5vhrZ+4JYoZV7CN5nm
         08w1csOBqRtOmkuaQqFGhlnIH28IKzMTwk8dCJJBvoNi+MwDiucCw3A2/7/amC5tjjWJ
         XsxA==
X-Gm-Message-State: APjAAAWl+nEPSij17GmWPRWI4J10rOgI1KudpERA1L9sxTQCcRyYDpb5
        2w9scHBeL90b2RmQuqD0uFJRvyQq8HslD0z+Fn2mcA==
X-Google-Smtp-Source: APXvYqxqXtucJKxBehfjEtkkhKenfyWuNgyRLckpMYSqYIf7pkoTptD0U4Di9HzBQVBysqPrJgw/nJ67sHWcB6ld+fE=
X-Received: by 2002:adf:fa12:: with SMTP id m18mr76943743wrr.309.1577936244053;
 Wed, 01 Jan 2020 19:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20200102030954.41225-1-zong.li@sifive.com>
In-Reply-To: <20200102030954.41225-1-zong.li@sifive.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 2 Jan 2020 09:07:12 +0530
Message-ID: <CAAhSdy0NW9OTGOGoyZ7QmAOVbR_iF2ZM7b9eKDW0U1L+as-oaA@mail.gmail.com>
Subject: Re: [PATCH] riscv: gcov: enable gcov for RISC-V
To:     Zong Li <zong.li@sifive.com>
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 2, 2020 at 8:40 AM Zong Li <zong.li@sifive.com> wrote:
>
> This patch enables GCOV code coverage measurement on RISC-V.
> Lightly tested on QEMU and Hifive Unleashed board, seems to work as
> expected.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  Documentation/features/debug/gcov-profile-all/arch-support.txt | 2 +-
>  arch/riscv/Kconfig                                             | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> index 059d58a549c7..6fb2b0671994 100644
> --- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
> +++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d8efbaa78d67..a31169b02ec0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -64,6 +64,7 @@ config RISCV
>         select SPARSEMEM_STATIC if 32BIT
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select HAVE_ARCH_MMAP_RND_BITS if MMU
> +       select ARCH_HAS_GCOV_PROFILE_ALL
>
>  config ARCH_MMAP_RND_BITS_MIN
>         default 18 if 64BIT
> --
> 2.24.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

May be (not 100% sure) split this into two patches so that
Documentation patch can be taken by Jonathan.

Regards,
Anup
