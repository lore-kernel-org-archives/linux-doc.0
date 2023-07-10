Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10C2EB64DA
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 19:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjGJTlU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjGJTlS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 15:41:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DFC18D
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 12:41:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso7600909e87.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689018075; x=1691610075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWqKm6QUIv0JSsGcZmR9jzvjSANP5a8f+sD83U2ywVQ=;
        b=VjwjN9xw0dHi1l+nsKHAm5isIeAJruQ+bySNLf7yg4TPoxSwFc5jy+SDXdJByzxQW1
         M6laBcQxkzlkjF52nlRWZ3xXEtpIwwf1XSMtN7qoTtKwvCL9QTUqFoMyeq++/UpNjzTL
         4gj5ImmuD997g2ALgR1Rb4TvQdYDNzzOoAiwjt5aWtBlPIm4q+KpYl2cPelcDbYdw2gW
         nBgnBJBQBDrzqmrveRqz84Msxy3ZG9PogFbjxGVxdWd9JzUcE/MnHL+Yzy/dN5FJbFV+
         9VYLUC8cPA+XQ9hLmoDkttzTi7ftToBvALBbHD6A77fQetcJ5tG6wsLvW6YjlxcU/NAM
         vLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689018075; x=1691610075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWqKm6QUIv0JSsGcZmR9jzvjSANP5a8f+sD83U2ywVQ=;
        b=FhsCUdzt+x4it/PfCQIzCqA+OH60qrn7U+/N2qaMIdGc6mUXqp1uy/WYhLV5Hnswtd
         Z7TNNDX82UHFybGOJYfnE9Ex/KtoxXYYzS/fgVZirIsyHbOLTwp6tU00cw2embYX5wvI
         df3zIH9evBeAfbswj1/QXBudMnHbBCMkILNOihBhZ17JyaXlRgDufFfwr1gE+KMK1jCJ
         KSsElY52GZOs41lDdTeNrjNlpFGewca+7yfqAZuul29w5ufvxKNU8cHM28EGpCtXYk/C
         0M9A1i3BeJN2pzrbRjb62/PINMJ/loAWJVsnet+LHGX5pLEkHuukFBis/TbIxAl0faX8
         m2NQ==
X-Gm-Message-State: ABy/qLYK+7VuDGt5RRThrOTB6sa5K6ekMI3j3MSYKN+jVLPbAPf4mYUU
        P1vhax/Ks+rxJEI+9XQQbxAp5rWVQ3HH2dzNLQ+MYQ==
X-Google-Smtp-Source: APBJJlFfPk6eGhRrtspJMFf8PNSfoVkKlSIQ/2OgWKw3VcG2CMd9n2TGvzY2gLP0RpFgSB++tX++jrG1oiLhplPpNt4=
X-Received: by 2002:a19:3814:0:b0:4fb:8fde:f60d with SMTP id
 f20-20020a193814000000b004fb8fdef60dmr9788957lfa.22.1689018075688; Mon, 10
 Jul 2023 12:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230710193329.2742-1-palmer@rivosinc.com>
In-Reply-To: <20230710193329.2742-1-palmer@rivosinc.com>
From:   Evan Green <evan@rivosinc.com>
Date:   Mon, 10 Jul 2023 12:40:39 -0700
Message-ID: <CALs-Hssm=hyjSwVyUu7QrWmG8FTDz+ubrGF0Lo7EhzJZhu2tbQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: RISC-V: hwprobe: Fix a formatting error
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     linux-riscv@lists.infradead.org, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de,
        andy.chiu@sifive.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 10, 2023 at 12:34=E2=80=AFPM Palmer Dabbelt <palmer@rivosinc.co=
m> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> I'm not sure what I was trying to do with the ':'s, but they're just
> rendered to HTML which looks odd.   This makes "fence.i" look like
> "mvendorid" and such, which is seems reasonable to me.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Ah whoops, I must have missed that one during the documentation cleanup. Th=
anks.

Reviewed-by: Evan Green <evan@rivosinc.com>
