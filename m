Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DCEC43217
	for <linux-doc@archiver.kernel.org>; Thu,  1 Dec 2022 19:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiLATVz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbiLATVy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Dec 2022 14:21:54 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C40B5D8B
        for <linux-doc@vger.kernel.org>; Thu,  1 Dec 2022 11:21:53 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so3047492pjd.5
        for <linux-doc@vger.kernel.org>; Thu, 01 Dec 2022 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4Gc9gN2otXkm8m4oox2qCrf5ekLmPGu19VnxyN13J8=;
        b=SwT6lk9yHqGS7ky29RXrRN8zcJ5CXFPRqx/GX4tTizpwqqlWwm1V74YvwYVdVv2ykZ
         e1RJx86pTwR+dPAYl8rF0+Hi9uVJs6zyHl2bR2RlSx8Jrw24pfvo13f6veiXcHvj3QJc
         Xv81/cHQxq3f8dLf3YfRAMfHHLv6uTDpoqFWIH2PXJZAMFD0fL5vvCDwQD8tDx5ZeZMh
         reCbklqNrpf7aH2tbl0MBkXx/St4C84QhVSnIOvL+ASXbKgI+YFcA9Eo31KzU6QUuPZz
         Gk1eRPxzlVaDz/SwfWpqJjqoJm470tmvI8akRxjk3kc5sef9HhyMNNT4chR6vUpltDoG
         nDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Gc9gN2otXkm8m4oox2qCrf5ekLmPGu19VnxyN13J8=;
        b=pdb6pj8+JetwdfP3+HTGFq4UZQ5f8Ai5tQG+/kAIge4TGOlc8ucLzt5HDoWPwz5k9e
         r3w+lg8Iu7CiF+UI1KfCtTxj980wGZVWyoXCVm404uzpRPT1YUaydfHJTrJu3W13ZQvF
         3ZDG2fnRXkk5WZ5j6uhDNSNGMJSbVE+QlX+JIsJe1ewtAYNzSEYHMnBi31/OHsKDCKOU
         c9C94TKu+D94yquQ69mdYlMJAgII23hhHVt65I6EZTAc9QY9Tacudc3jFCHadcmyJv+6
         qYo9x3G/nfG6Jbw1sDuersRCvcTlP46ArUWjhMSQuBnPiqmXNzRdnDOt1+rV/Eck31SN
         5oNA==
X-Gm-Message-State: ANoB5pnhtPIzXLbtAgpFTUhAGL4A3xFut3dZRVLYdasfZJoXPjXxd2WT
        oCHGnwjf1yOMAyJVg+pnGgJ6AM0pcAGu8Q==
X-Google-Smtp-Source: AA0mqf6YSgYKqisC65u2t1o8VgQbEtHbJDHD+4u2Q56HcmLYNyxLyceIQa1JS6cTUzwYSXW6klAy2w==
X-Received: by 2002:a17:902:f2c5:b0:189:1cc3:802a with SMTP id h5-20020a170902f2c500b001891cc3802amr50026912plc.56.1669922512296;
        Thu, 01 Dec 2022 11:21:52 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016d9b101413sm3980290pll.200.2022.12.01.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:21:51 -0800 (PST)
Date:   Thu, 01 Dec 2022 11:21:51 -0800 (PST)
X-Google-Original-Date: Thu, 01 Dec 2022 11:21:37 PST (-0800)
Subject:     Re: [PATCH] Documentation: riscv: note that counter access is part of the uABI
In-Reply-To: <20221201135110.3855965-1-conor.dooley@microchip.com>
CC:     corbet@lwn.net, Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 01 Dec 2022 05:51:10 PST (-0800), Conor Dooley wrote:
> Commit 5a5294fbe020 ("RISC-V: Re-enable counter access from userspace")
> fixed userspace access to CYCLE, TIME & INSTRET counters and left a nice
> comment in-place about why they must not be restricted. Since we now
> have a uABI doc in RISC-V land, add a section documenting it.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Based on an, as yet, unsent v2 of my other uABI changes. I don't expect
> it to be applicable, just getting a patch into patchwork while I don't
> forget about this.
> ---
>  Documentation/riscv/uabi.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 8d2651e42fda..638ddce56700 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -3,6 +3,13 @@
>  RISC-V Linux User ABI
>  =====================
>
> +Counter access
> +--------------
> +
> +Access to the CYCLE, TIME and INSTRET counters, now controlled by the SBI PMU
> +extension, were part of the ISA when the uABI was frozen & so remain accessible
> +from userspace.
> +
>  ISA string ordering in /proc/cpuinfo
>  ------------------------------------
>
>
> base-commit: 13ee7ef407cfcf63f4f047460ac5bb6ba5a3447d
> prerequisite-patch-id: d17a9ffb6fcf99eb683728da98cd50e18cd28fe8
> prerequisite-patch-id: 0df4127e3f4a0c02a235fea00bcb69cd94fabb38
> prerequisite-patch-id: 171724b870ba212b714ebbded480269accd83733

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I think I merged the last one of these, but if the doc folks pick it up 
that's fine with me.  Otherwise I'll take it when it comes back around, 
so folks have time to take a look.
