Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 911DE7D00B
	for <lwn-linux-doc@archive.lwn.net>; Thu,  9 Aug 2018 11:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbeHIN5x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 9 Aug 2018 09:57:53 -0400
Received: from mail-io0-f194.google.com ([209.85.223.194]:39996 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbeHIN5x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Aug 2018 09:57:53 -0400
Received: by mail-io0-f194.google.com with SMTP id l14-v6so4469993iob.7
        for <linux-doc@vger.kernel.org>; Thu, 09 Aug 2018 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=J8JHFq+UU6UIieRkiFDI8mMAO4Ofyp8ATsnZqc7QZRQ=;
        b=se2AlTRH0TXo+SNQzfXyBXIKUupdoGVe//2nIBwk4ozOi+U6Fm7smFj07cCq7SPk2r
         /RaScafSqyNMVUI+G/tU60wu/HZx71WO8rriutdgmE094gQYNUjXXc5xlo22ubAc8nJn
         4TnZhnFp1msdUo+vc/f/c5DNYHBoDIlCmFjVbG10IU/OkS8ahmgjirGwREq/CPP0WoQ4
         p7/c9B+5QoTIbnww1WiP7aD5pR6oiZnFw2MeX2fwJP6VvafjWQ5yGCRH2ODYb7C13vmv
         OAXBXW7aehOSN8JwP3nX8LR4F3qwVzKc2LfEhCE8UOJV76sWCgrdNCsUiDIML8xAmOBc
         yByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=J8JHFq+UU6UIieRkiFDI8mMAO4Ofyp8ATsnZqc7QZRQ=;
        b=YqRXS55gWKPvfGSV1yHtwoyiQkhpqAKP8gXowHLby9eKXYNtMmegnJQ1DBjUAOCjaE
         TqEEu5UnQN1OG+wNyRQa18NBoXAbaB3n/XsXJ6qggK6No9/PuNI0fB5Cr4Hwaen0o4uF
         c2YHJoboprH+xblCvZCUbZxna1HKZmZYOQ2IPeM5uaqq8vzm7FVE0zKtVEXE6pB+qdJl
         XmwLjhobHnAHE84bFnlNO2sqb+kqKGCvWm3arPpyHPRQ4DuFuQGUvbBs3OlMpdi0UAcq
         JMo3eyQKn/QuMnvtjSL90weE15rYEMBQA9znCWz8GfSm0RxDlvYDqkiL7lnLkLM0jIa2
         of+Q==
X-Gm-Message-State: AOUpUlG7Lk5W7GZ6PB4CzUiCS15eKYV5pzPIHSn2tMlwqthcrMFJEPl+
        Zx3feg0w1XLzEo6tHbdrkd3+K3gesj9pfJx5Oq6gVA==
X-Google-Smtp-Source: AA+uWPzZqP16fm0hkmmu2Xtx38bSLKkq6Ys5W8MR8GD6/y5naNbhodoFxxZBBNndRDSRX00YOLc9/0xDLVl7MyCgULI=
X-Received: by 2002:a6b:c844:: with SMTP id y65-v6mr1327163iof.187.1533814405900;
 Thu, 09 Aug 2018 04:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:9403:0:0:0:0:0 with HTTP; Thu, 9 Aug 2018 04:33:25 -0700 (PDT)
In-Reply-To: <CAHp75Veiop-0xAbs7MtdhOrX_vzDz7v=xAUSDnEhTYVfMovFQA@mail.gmail.com>
References: <20180808153150.23444-1-brgl@bgdev.pl> <20180808153150.23444-29-brgl@bgdev.pl>
 <CAHp75Veiop-0xAbs7MtdhOrX_vzDz7v=xAUSDnEhTYVfMovFQA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 9 Aug 2018 13:33:25 +0200
Message-ID: <CAMRc=MdTgr-CTia55cRS-Ob8eOVBQom-nXB670nxjf89U_ZEvg@mail.gmail.com>
Subject: Re: [PATCH 28/28] eeprom: at24: kill at24_platform_data
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-08-08 20:03 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Wed, Aug 8, 2018 at 6:31 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> There are no more users of at24_platform_data. Remove the relevant
>> header and modify the driver code to not use it anymore.
>>
>
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> If you want me to test this on Intel Galileo Gen 2 board, give me a
> public tree from where I can pull.
> Thanks.
>

Yes, you can pull from git@github.com:brgl/linux.git
davinci-remove-at24-platform-data

Bart
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
