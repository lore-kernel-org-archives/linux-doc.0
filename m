Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F8547DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 20:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753277AbeDJUbL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 16:31:11 -0400
Received: from mail-ot0-f194.google.com ([74.125.82.194]:42996 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751629AbeDJUbK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 16:31:10 -0400
Received: by mail-ot0-f194.google.com with SMTP id h55-v6so14293781ote.9
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=8Zt1nlOX79arC+cV/qMGNn8UaZlPJjEqPSNKPJUaiMA=;
        b=M3AHrAulrXpc+ha9Jy7MhWQ5ylphOBM8VXv9K9htzUivfPvidQtPAolaXp6eaO2ldP
         uk6cwXvIzF4NJkMh08ooO/rUxREiX48mkyN+BDY6rIl6+DVfJBtHBDmZysnNxDmRHo9b
         Yn0sLg0XSLzO+NDc5MLLjqzytBYYFbIBbbwdz0EeBErQ1tKPRTRIMk3AmHYYUSNyauRt
         7ib+QBF1sAC+jT/+AyPvroCljU62uUwGtmqaJjPF5p3yGDoApviDGKPbVsWQS/S8/Owj
         DYdLESbjCwLrLuSQ/KyswC6E96yaeanBRqgiD1IsPzhZZwZFJfxC0TcBq/lOVPf46jvH
         za1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=8Zt1nlOX79arC+cV/qMGNn8UaZlPJjEqPSNKPJUaiMA=;
        b=nib8UT5RF4j6xDXTfZcj7Z70De1gHiU57DiHSpKsRZnERGEO/tzfJvYBFheMYGHfD5
         b2RbXfEFAKSLsgLTa63X+9hKHfH85IOqJ9uocA8q5NhN7fqbgm7pqRV/fcPxTogiO9PO
         WgDEsr97TKibvoQHD9yDv+u66Tj/qjcwK3Q6wR8iehQamf1koTaInnKYsj/BgaTWUNzK
         JRQppZU05RQQX1z027dMrwNCgTYm9aTE0FX2TPwPLrhJwJ5A859loNgBke0KowVMRlmj
         tkyY1IemORiuWDnx7uJSNJnv5/qjJLUIqV7akLqzrtWw/IbWa4xjy3sN9eFx+j0Jc/LR
         Runw==
X-Gm-Message-State: ALQs6tAiZZJTBXEJB5C4LLm5KEudD12ak6Czac0K3IlD9f4iOEAvaMin
        Q05C5GGxai0nVe5RQiNb7JtJYV2R7eeEUjRJaECMzQ==
X-Google-Smtp-Source: AIpwx49Pmp/Wpbs82nU2zELzqMd7zbyhsjL7RHog856mMt8ttZA7Ns8t2squHddI28pm4dF0rX7Lxf4aHJnO8o/r74g=
X-Received: by 2002:a9d:4312:: with SMTP id s18-v6mr1345344ote.187.1523392269932;
 Tue, 10 Apr 2018 13:31:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:38e4:0:0:0:0:0 with HTTP; Tue, 10 Apr 2018 13:31:09
 -0700 (PDT)
In-Reply-To: <201804110047.jKfmWBhd%fengguang.wu@intel.com>
References: <20180410124029.2915-1-brgl@bgdev.pl> <201804110047.jKfmWBhd%fengguang.wu@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Apr 2018 22:31:09 +0200
Message-ID: <CAMRc=Md+GEKbWV3gOkOMkLe0Rn0kbcvohQecCXE8u74uqgRoGQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add hogs support for machine code
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-10 19:05 GMT+02:00 kbuild test robot <lkp@intel.com>:
> Hi Bartosz,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on gpio/for-next]
> [also build test ERROR on v4.16 next-20180410]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/gpiolib-add-hogs-support-for-machine-code/20180410-232047
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
> config: i386-randconfig-a0-201814 (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers//mfd/sm501.c:23:0:
>>> include/linux/gpio/machine.h:56:19: error: field 'dflags' has incomplete type
>      enum gpiod_flags dflags;
>                       ^
>
> vim +/dflags +56 include/linux/gpio/machine.h
>
>     41
>     42  /**
>     43   * struct gpiod_hog - GPIO line hog table
>     44   * @chip_label: name of the chip the GPIO belongs to
>     45   * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
>     46   * @line_name: consumer name for the hogged line
>     47   * @lflags: mask of GPIO lookup flags
>     48   * @dflags: GPIO flags used to specify the direction and value
>     49   */
>     50  struct gpiod_hog {
>     51          struct list_head list;
>     52          const char *chip_label;
>     53          u16 chip_hwnum;
>     54          const char *line_name;
>     55          enum gpio_lookup_flags lflags;
>   > 56          enum gpiod_flags dflags;
>     57  };
>     58
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

Superseded by v2.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
