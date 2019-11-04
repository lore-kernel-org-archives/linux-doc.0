Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 372197D919
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Nov 2019 15:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbfKDPGR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Nov 2019 10:06:17 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45999 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729061AbfKDPGR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Nov 2019 10:06:17 -0500
Received: by mail-lf1-f65.google.com with SMTP id v8so12463142lfa.12
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2019 07:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNloHCnEtBbwd/RLhQCPuff9G3+A7zTymGTqgW0cFJs=;
        b=wj/ZMbi4O0qnIyehYcaBvYcnUc8q6yX0RA44xm+nXzL9BvAABB1c2AhmRkYBw1Qg7I
         mN5UCUUddY9HGRWlzT/6p2B200iREj8F/dF1hqApp7eUvhZx6Dd3ghEhcQ0VFLaL7Kl5
         Pgpy54adYlSA5tTEDRwDoFSXkUK4urF1D4wKL2deeefCfdS89LoQ6pCuo0xbgn/xopvR
         ul4n33zi6AgKbYGxO0TfRJkj6etOCS9z83C0N9mEFEKxcpb9bchw5ReBmmDS6V8AsoZH
         CxHhMEOqRM3aPdqCYKgl5ZIUF9bK5ZNtCsc70kKYSxQGZBBZJThi8FckONgrisLeQMIa
         5JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNloHCnEtBbwd/RLhQCPuff9G3+A7zTymGTqgW0cFJs=;
        b=lAfQATG4nXI+yhZu6+eCsilhDBEB1uL6gIk4XC2PESywia8VNJLpX+QxJDCo9jSRzA
         YRpiTU5iYlN0kO3v2y1v5JIrP9nF0zQugkRdim83Vp82DXTOoq1tkenUuVGcPIpXhJh9
         Yj3iSxeGqbbO5qUuswpaIYTA7BC8aNsCP0Ir/gN6+H/Bf+MOAo8znIqNDCDM9z17/ACX
         JD25WMSedNpluxBQQP6BZGkTdDvQjf/j+2xyUjfrqnruizQzW9Ymo3RlPGNKKP6tUQes
         vIQ82aixhlIUJCs1kz1VL+X5YgHwbLPHSApvFfOSBdxiC3O+2+mpEkdBQK2x4LLfZahy
         9ABg==
X-Gm-Message-State: APjAAAWV82GBHZu4h5rOtZYcQeaD8//Ds1/EJPUN11LGANL3VhNxW+wP
        Ht0G6kmbHVD5mWeIh0GxJrF6z9Ht5knmR/4kvXW79g==
X-Google-Smtp-Source: APXvYqxi25NXW+aVZ57onKX4CL5r0tUcHO+MYQcB/SWeVCchxkGa9OP810BuCSYMvWujYm7jnic6OJLm6w/D7qjiHVU=
X-Received: by 2002:a19:6a0d:: with SMTP id u13mr8410452lfu.86.1572879975573;
 Mon, 04 Nov 2019 07:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20191022084318.22256-1-brgl@bgdev.pl> <20191022084318.22256-9-brgl@bgdev.pl>
In-Reply-To: <20191022084318.22256-9-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:06:04 +0100
Message-ID: <CACRpkdZXDwN_z9pFzbHfn78u+51tWUa0OZdrBSSrtmZPoco3EQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 8/8] gpio: tegra186: use devm_platform_ioremap_resource_byname()
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
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
