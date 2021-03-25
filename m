Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6ABC433E2
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 09:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7A41619FB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 09:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhCYJ2b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhCYJ2V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 05:28:21 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD87C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 02:28:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m12so1476264lfq.10
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gYI+PuLtimhXH77xMKx0d9cmeN1WTmp9BxMwwXCReuc=;
        b=vkzZ2N2UrRZK5RBwQrQvsfRbVolmmcIiwHGBhARupxqNSDLeSev5dOC8UG/dIL2rf4
         yMuWSVyBRtrQdgtoazo9ipzP1CYUQvSfFuMRAHBCb5L5wngj9mwiuSxdSwcBO/tyqxgy
         MenwoiIXh96QhrN/0K7wklslZj0ue96gv/4dyDUrUl9ze2rsSqdGCuAQ/mQkETIMfWDc
         tJaVq9+8YyARo4Y7YBqdzP5XKqLqs7PnHgG+D6nt/WClVwbGDCJ7OtYGpCsV+uG85gTn
         T/tsQ6lxBa02bW/g29IbIKCgrIr0gLI7QFlTAQ5zL+kZuZKIQrSnDpnPn2XjkYacbRxX
         Luyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYI+PuLtimhXH77xMKx0d9cmeN1WTmp9BxMwwXCReuc=;
        b=N01XGmMn8QtY/K9cFyACJmsji08V0y1VVigIhf+gJyEOHnnNBKOXt0D0+V76jQukH4
         5HVd3M9WdtxmOHjdpvgxlKNZa2m8wKsTLIm2REHtoacLJQ8f8bGy7x273JRGMxjxRU/a
         i6yltdmWpyjBurWYryXq88ZcXim7+90Eb7Ruqn1feoU0h+OwtRmnNhsn9rwnefEioVdr
         Patqb3iZDGodaz7/PaIsJ8WpQf1JT5f+GD+WgqVYsx+pazvexpz9XK9zwyx+UVXSBo7v
         5b50fUTX5SYxuDCcjR2TaUwxLX428v//f6/rf7oH45oAG4jkVwFxmjG0+e1xrRMGCCgA
         BuAg==
X-Gm-Message-State: AOAM531H7ZZG23IdIBjx9rnAJaR2LXuMLHOGnACDQxk9frWUPjlmuV4x
        3ZD2/YbPQssyfQumRTLqlidGMIW0PMs0XdmZLkH8Xw==
X-Google-Smtp-Source: ABdhPJy2Z4Gos2vxj/iljbGSCtdK0ftBcKclmf8nmtikeFu0/ui1OQLJdrfnXCEhSNQC1St0TY+IoxAm8bt9VLy7J7M=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr4757768lfe.29.1616664499245;
 Thu, 25 Mar 2021 02:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210323145509.139393-1-hello@bryanbrattlof.com>
In-Reply-To: <20210323145509.139393-1-hello@bryanbrattlof.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:28:08 +0100
Message-ID: <CACRpkdYYV8HLf+HCXbkiRPZFZww+1L_mq3VcqJ5Jse4hY9TkDQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: chip should be plural
To:     Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 23, 2021 at 3:56 PM Bryan Brattlof <hello@bryanbrattlof.com> wrote:

> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
