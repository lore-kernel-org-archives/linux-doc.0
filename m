Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1AF047D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Nov 2019 15:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfKDPFr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Nov 2019 10:05:47 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34321 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfKDPFr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Nov 2019 10:05:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id 139so18036029ljf.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2019 07:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2UzsxUZvtQAv5yTZNCgAIyZvTbfcvOElCqD9Y1x8Cds=;
        b=vCzyNRN4s73hE44j//vz084Ojhi0V3RfoCm+wWuyesMKCgYTVcNIMm1zmzl/AVoMUG
         1u4+4Qeca5bRWcLRT+8xYc17wEHqVKkKignoqGjWL4d9getfO+0L9gDGrZLvUzAfT0jb
         F+f6wFtgwmTMhtJ8w8/GBF0zx8p/xVdyqpnhCAQTrUImUPKQujUPEWGx0HTMuMo55qQJ
         oFSzRjeeDhuf+lE65xn2fJ3KmEC0dDd9o7dghkqhoPzFfVLrRSJ44hPyacflpqsXTVxe
         Axu6mW+HA6ADnjQgtxSoN4lDE5ieQf3qhL/ZGNu+8kmqQPKA1K5WWRuOonjsEzoHMUhm
         E7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2UzsxUZvtQAv5yTZNCgAIyZvTbfcvOElCqD9Y1x8Cds=;
        b=q+BdiJbEn4DXeduEByIO4PPENdl98Xl3Ep/3RIuWtdzCKoQujv1w8AmQ9PpatJQ6jf
         jQB8oMDXYzCNuE7vGo1UWM7FMdE880MM9RLG0UWn37TgMsxRXZ1ZhsNK6jSfMwuumrza
         p2tlvJJTv1UrnySf87Ez6GWr7qn6dX/jK2airaIQHfBSLx4tfyz96NfP6hUTSxv2Vxa1
         cMTKXddcIf92q8v6bQ5aGRX22oLud5Jp3IJw6PqU8zLW+paQOO+PU9xtMuboEB7jaDDN
         3oB3io71J6i/IJqfYvHb24JavhsAJxwgTLaNkMXhnFXxeWaf2AMN5hEGiH0yEi/WvYPm
         nKJg==
X-Gm-Message-State: APjAAAXgQn7H6APq+T/0z+Kk7UadRf/KxsxF87dp7esLigi+hdxgEqHK
        fQ4vBTzYiLUOjUrKC+SBSdHr04An7zQIy5vS7jr+RQ==
X-Google-Smtp-Source: APXvYqws3TDQMt4oTHuaGCbLTVZBn1NqJZhtfLhI39uuuxwoVtmfNQM+7OO7GNGby5LOgL7nOpmlHxorL0t5iDxclEc=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr5737529ljj.251.1572879945553;
 Mon, 04 Nov 2019 07:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20191022084318.22256-1-brgl@bgdev.pl> <20191022084318.22256-8-brgl@bgdev.pl>
In-Reply-To: <20191022084318.22256-8-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:05:34 +0100
Message-ID: <CACRpkdbGP6H=5R03Fi2LQzvYazke9Fye8bWNqoKs-4bEQroctQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 7/8] gpio: mvebu: use devm_platform_ioremap_resource_byname()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 22, 2019 at 10:43 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Use devm_platform_ioremap_resource_byname() instead of calling
> platform_get_resource_byname() and devm_ioremap_resource() separately.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
