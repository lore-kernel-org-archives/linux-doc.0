Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CB6C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 09:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiJUJUa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 05:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbiJUJUW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 05:20:22 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7754D172
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 02:20:10 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b12so3467422edd.6
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dx9BLQvoaMG7DqLRzNjziMyZfaDs9wLP+FXBSPFHhbs=;
        b=IeIxqcDmqci/XYp27ASgSvY6TjvAGWP/vX/molOxDSmIuy7nlPwsqNXvyWOh1us0ib
         ZhLFgG63gxnmye6K4Amw4GCCR0+P89qu4znB7dqQ9GxmQUjkTQMvqYrsj18vXHZUQ39U
         pA/Bl6dutCzAzLfOmxE3JwQ1TmLjT3ZD3JjjIIpEhQQgMN+e2wQAUNK5+sInnRR2BK/5
         grar90MbZaVV5vbAbyWsufG7rfi46s+wwMSOb/x/fkFh/grlv62jm0kSjJx97GrUJuNu
         DqqnqXhLv1neufChA2ufsJSMD6lPW44+v25S7WcmcFauO0rat4XTLDA8QKhJOl8NwiV/
         HWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx9BLQvoaMG7DqLRzNjziMyZfaDs9wLP+FXBSPFHhbs=;
        b=skv/xS0gPR211BzxHTMGXBdHzYWdfcLtPSTJv8yUpJHjE0LqXtrc5G2w5hnepIUYsP
         OhXdoQamuJeEOnagJnwihyjoueW1gsXl3d9C2iY4nJp3MIJ8FS7IqD5SmtIR8lDDzfIg
         617AheUTNxEBAM/9CLfv0Cf/BUDKi2wpKY4UzMpVXhXXFjcbUwpneigyetVZGK70wyzV
         arQklEBgdkYnulIeyXHIGQcFlu0rnbVXzwBLZhTKxr+o0eDuEjKDL46PsKD6HoOmH8pE
         hOM+IaoULfJIQck44K5amIf1OqYHTW8FdnIQ+NpoQiHjA3C+LI7+wememgXrM16PeO0u
         chFg==
X-Gm-Message-State: ACrzQf2/InfO2q7gJ0gyu8i5j+nJxq3zOY5ICi6w1x/WOjsmBF/3nAoC
        d4ZsGBf9M+Y6+IA/x6dn/JjMO78oS00HUY0abiCc3A==
X-Google-Smtp-Source: AMsMyM4ViG6lPBW24+5VDOQDsyFITJgNpDWDPYpNTvRQlLFCfnqWgoKjdiQklUs7JhwSnR6O19xJEIw8Y4SYmtdlBpk=
X-Received: by 2002:aa7:c98d:0:b0:45c:6451:320e with SMTP id
 c13-20020aa7c98d000000b0045c6451320emr16384826edt.172.1666344003494; Fri, 21
 Oct 2022 02:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <20221020175334.1820519-4-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-4-maciej.kwapulinski@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 11:19:51 +0200
Message-ID: <CACRpkdZLJa7NXjO6PrpRYG7e0W_8W2fMWRR1mMqtpx1MQ7kVFA@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] gna: read hardware info
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Maciej,

thanks for your patch!

Overall I really appreciate the attempt to use DRM, this looks so much
smoother than the previous iterations.

On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>
> Get the hardware information from register MMIO_IBUFFS
>
> Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

> +static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
> +{
> +       return readl(gna_priv->iobase + reg);
> +}

If you are consistently using functions like this to read/write registers,
you are just re-implmeneting regmap-mmio, see
drivers/base/regmap/regmap-mmio.c
or look in drivers selecting REGMAP_MMIO and the neat tricks
they do to read/write and update registers with regmap.

Yours,
Linus Walleij
