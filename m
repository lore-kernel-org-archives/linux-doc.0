Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57132C77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 12:45:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjE3Mpv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 08:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjE3Mpu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 08:45:50 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC1DFE
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 05:45:19 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bad102ce9eeso5969821276.0
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685450716; x=1688042716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79R19rYlxuprBJRyr5z/YlA7zoEUwbCIoncrtvpWbd0=;
        b=GR7hEh2u3m9oNv36D5Dzgayz9bGii0ew1XKwMOjvdDBDXdPtfey1hM/jCCCHd4yZ03
         0fBnYKe1tqtjRBQeVT9YOB6MRADJIvVfeyCu+M62uvB3oqy3H8Y6Lt47MDNK+FXsAZ+o
         4Fp6Vpl2iCoPuScZG++LVYhn4+E9R29d74IKtUdnh4bE3Rz4vXTXo3ahdX8BKdDu2EcT
         IDc2oQZmI/ZzCmI4XZQHC/ukxIMC8cQ1EKnFwllVkhw7ns3z5YhlEY5h8MPTxUmZQxat
         v+EQwOBQrfbUX3L/fifWsZg4j4BfZAbf/QZN+Pn4LABJokHJSmyEb/VcCr1AK/fptCQF
         bSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685450716; x=1688042716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79R19rYlxuprBJRyr5z/YlA7zoEUwbCIoncrtvpWbd0=;
        b=eqdRJf8afbgyrH7OZYVSzol69E7/B135nKb8UfLprYj5GtcBfP2YLEaRLipZihqtgv
         IOJczzDxAXNpgQAVLTGkVWlODHg9oLGKUSzLMp7b/dTWfIzbvHtEs+H8t+RGMnv7lXxE
         6+HCctxnGqihzbOVbDKAqGWXEA0gzQGrXbTzCWpY7pjPFBeZEYFZw4UjW/soQ1HolGr4
         IvBSOFEK7R4tchVxhJasl8BquvnzZX38pZ1d89TfIqkysHu/U1FIdDGqm4onzgcE7XhI
         nMq67bERWWzSgoi38xCdbY5X1UARW04PNzqi3pXzKXHOkeVZNvfLHQA8KGJyf2N2wB96
         GG0w==
X-Gm-Message-State: AC+VfDwDqvVTsVZN/hA6ORPpcfP3ENZovLXIOdkqOcmCyPMC7qTJ2N0s
        5zqHWfKQq0/zJ0nN9YWVEyLkktseVLjygvpCIUcnHA==
X-Google-Smtp-Source: ACHHUZ5IF0zxpXfP+MK5/l8CKCW0KkcoXfJuyMyMb6GIoIrCyCjPNNuMb7I1dbl6KbQkfIeKFWhqVkrt/krStXPZs2U=
X-Received: by 2002:a25:ad4f:0:b0:bac:f602:52c3 with SMTP id
 l15-20020a25ad4f000000b00bacf60252c3mr2638406ybe.28.1685450716419; Tue, 30
 May 2023 05:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230529221446.87785-1-andriy.shevchenko@linux.intel.com> <20230529221446.87785-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230529221446.87785-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 14:45:05 +0200
Message-ID: <CACRpkda0Dak-jLLQhWZVx+5rCUbM8TtiBd==uJYXbTG9C4mcdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: Kill unused GPIOF_OPEN_*
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 30, 2023 at 12:14=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no use of the GPIOF_OPEN_* in the kernel. Kill it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
