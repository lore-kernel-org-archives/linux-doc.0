Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D553C46467
	for <linux-doc@archiver.kernel.org>; Wed,  4 Jan 2023 08:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbjADIwN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Jan 2023 03:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234648AbjADIvn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Jan 2023 03:51:43 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31541E3E8
        for <linux-doc@vger.kernel.org>; Wed,  4 Jan 2023 00:50:03 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id z3so7402974uao.9
        for <linux-doc@vger.kernel.org>; Wed, 04 Jan 2023 00:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3m8ypz1fFbj8mPUAsbdHRgs0+/C7FMCVRtO0ZGB+cgQ=;
        b=woUgC7uEewAlc/w1ReOd1/GGUmTkxzjZtRqYhfvs+L8cGq9aOhFh5PA7bfE43XrMBv
         5g1IzuwihIZ+6YaRX7EK4lgnBEyOuJau/F+NwLFUsQppqYvO8SJlBBOvBbI6GOClPIBb
         4xRBzPTtESloEuSOasT+BcITwyUfIvcX5SrH3vYs4leK33BRyz8eHQlqLiCw9ksBek5K
         W/RzQDu+9hkdXxBmXXUP71RSKwhHhs2RBvOBCmrWxM9YT5QADAZuPGAJ3NVufkc5/fl+
         HT8omymLmMBd9zXnn6j/uxVEewt8hvU9ZLHe1zwEAvzqQqVuSC1pgEU8LOt3DbbaJDVF
         oJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m8ypz1fFbj8mPUAsbdHRgs0+/C7FMCVRtO0ZGB+cgQ=;
        b=M7+B9Eb3cS2nm7Dav8CRHPYRjMds5WxLR+J5m8yz/jy2qTMA2twDgX8EGoAa0VmqEg
         njIQ64COQxV1AZPr+8CjfsFgvCUIPydrz5GU3W/NwE3DhukZcEo+kYk4VJ7OvoojKcq7
         EZNL1Q80NTb91Hr9CedUwi+neDDnArsFxVMmYLjLt/XPFej2L1eGJKqW08Jf8L4RvA0V
         NkUrqtLUV81ye6lGpFv8SKqG1oE278o+K9AFXQEncZRMwVtfMTxKo8MGEzbZJeDdINBQ
         yt7fQLHXvRT4yFnhK0m6d6RhsHKhKNHUdXxYH1H4dnE6w+pkN9GrZwx1z6NNj2oez185
         iOpw==
X-Gm-Message-State: AFqh2kqVESLIXarChfsoGdA/BYSgV0XnE2PwhRQy6+LdSzVdy2vD9hmY
        4o6k7N0XrVh8HEjk66HkGTQwE0F7NrqDyYFBM74JUw==
X-Google-Smtp-Source: AMrXdXvYMjy/psxcNCIdxU++pZnMtkdyluLcPesKj857WShO2HCqnJPxwQp9TmaDAXiPKU+vfFA2kYYnp05HHhgTlkw=
X-Received: by 2002:ab0:2bc5:0:b0:536:2116:fbeb with SMTP id
 s5-20020ab02bc5000000b005362116fbebmr1859982uar.56.1672822202769; Wed, 04 Jan
 2023 00:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20230102210850.25320-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230102210850.25320-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Jan 2023 09:49:51 +0100
Message-ID: <CAMRc=MevnkijyeAUEv0_aRm+Zf+PToTUeiXwVYGcs_ZhP4DWUg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused and obsoleted gpio_export_link()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arch@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 2, 2023 at 10:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> gpio_export_link() is legacy and unused API, remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
