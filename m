Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B34A87D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 08:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfBKIKQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 03:10:16 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41848 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbfBKIKQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Feb 2019 03:10:16 -0500
Received: by mail-lj1-f195.google.com with SMTP id e17-v6so1019791lja.8
        for <linux-doc@vger.kernel.org>; Mon, 11 Feb 2019 00:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HTufqxdwVyd5xvnixmRcXTj5wWcKWgsmg6B4AXxL778=;
        b=saW8/hGeXOlXC4KQdSwD/ePjV+PWNSwUhaQU/ZZt0zElqGSuzdyV2JQ4OzQGUNxlrZ
         puxkNe1wC9LfRIzqJHT/YIh6oHJTOQ+ipH4cCcapEB+ARt68rnP/bifs9Qr6MNpNny8k
         mB7UIEtz8/8udtzfKshYqHiPqSA/74wEiS7nNoFIcClqRgxjlUwsXYGeOJU1U34J3+gN
         U+MVXgdwe/xHWXXBESQWGWN5csIkt4eg7MK5EguKxMaYNV9GFvDFwfPxR5Ym6iqr8LcK
         A8zIRGmvKt4CU1+bqpyg2xZHTwaRD6aSqhT8T0aLHFkcYzf641kywbP/p5jpvA2PEutK
         9ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HTufqxdwVyd5xvnixmRcXTj5wWcKWgsmg6B4AXxL778=;
        b=hyXoyzSZdScdW5QKyNbSGwofLyMjHarIHWIe92gvu9pfWjO3OTNJ59c8IaV6R16yn0
         riYeysyLUr9H+F7IsEOn7hJANQYip0MTq0GmXcEP8uoe70zds5BX1sH9SnU/7+I1GlWJ
         nK7twKgY2K8zIL8b5pGIzpc0h9ZMNdpVvuLv9b8Ljn4cjtijImfC0GAgO2kzY8wuBMBP
         K8kdROOrgz9vMkhGmrkGAPP0thkAzQR1q6WXcFv70bYi9jyQE2yKx0C36gG1eJJCL2tG
         xS+hH9wT/+KlTqYX7qYVdpNzd1jona9a7m3RdWHFtkHm8ZldkHMef3pw+a/ospxa2vrP
         bi8A==
X-Gm-Message-State: AHQUAuaBle1CCEE6T6tFTv5JPrzz5gVUh8GvciqQIol6BudtXuLuVK2C
        idNi/2dGd5AOqn8OCpqXiD8GBQJy83U4a+w7WjbiNQ==
X-Google-Smtp-Source: AHgI3IYtAGtrQysea3hu7s2wg7C8AGK93eOXhuR30JYV0qZQ1Bl8JmGH6irtUBqh9d1hB6s+UJv+Xks3vAV140PumUQ=
X-Received: by 2002:a2e:874b:: with SMTP id q11-v6mr941391ljj.97.1549872614339;
 Mon, 11 Feb 2019 00:10:14 -0800 (PST)
MIME-Version: 1.0
References: <13290065-5568-c0d0-9e7b-7a02ad71dbb0@infradead.org>
In-Reply-To: <13290065-5568-c0d0-9e7b-7a02ad71dbb0@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Feb 2019 09:10:03 +0100
Message-ID: <CACRpkdb+YefEc4nWifPm1pjOuDLg=DiAPOM9gaftJAc4xmDODA@mail.gmail.com>
Subject: Re: [PATCH] Documenation: driver-api: fix gpio/board.rst warning
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 11, 2019 at 7:28 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix markup warning: insert a blank line before the list.
>
> Documentation/driver-api/gpio/board.rst:209: WARNING: Unexpected indentation.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
