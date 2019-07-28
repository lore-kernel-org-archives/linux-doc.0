Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7218A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun, 28 Jul 2019 22:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfG1WCt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 28 Jul 2019 18:02:49 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46699 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfG1WCt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Jul 2019 18:02:49 -0400
Received: by mail-lf1-f66.google.com with SMTP id z15so36376122lfh.13
        for <linux-doc@vger.kernel.org>; Sun, 28 Jul 2019 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D97GiV2zjliG05FCmmKHimhjxGqrt+6hvc46zTJ3N/g=;
        b=M++hQSZT088Q+I7VrthayIDJusWd0Q9cTsyvmgd05II5PpwvsIXEWEtkKsb7zUR4jk
         BxuOxyeSgHoEOvZkzRhXl/n1KklgMksJGGMsDIdBbJ01ssxWpq58eBN39X9GlISHS1zp
         YrpH22J8Aj4mfDD4SP8tz7KzVDea2F9+w6NvcqhS/jpaKWg/C0RiD5+8FTA9ItWSHnM+
         +zGYm62H+CZMdfxdt2s6ZyO1GjYbNUVXX1b7x4QXnKFn7CBX6kv2GYBUrH/C5+Pt0WTu
         nOYkhpuy2llh054WbHAFjJ3OysnnQkK2nR6CSanRbPYdGDBx4/7piyLCkOz/+uWHP9ji
         VH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D97GiV2zjliG05FCmmKHimhjxGqrt+6hvc46zTJ3N/g=;
        b=nMbVqzQEQ7ji2pYWsQoeyRMBRmxxa7m9WfY9g1ytFpWAeRUCzlPwvHe9IM5V5ArTM9
         FgvCc4M2ivWqHCyJMJWAUK5cqU4vLQ4fdnkaVXO8lLIzAKOwe4Zg2o/ckx1m5bmqDdxV
         HDsZjYtLAplAaY+aSAfNyZ+g5/hr+HAc4QkLym7C9c4/b7gKaOONCUD0/QOxL9BoxW3I
         e2mA2fwc0k6D59tIbiSxzbn+bmGtutFavokT55aTD7jYGpBVRoi6pLSaoax+j1ItTl6v
         Rw3sQ5Zj8yVQu5nTIaAlq6Er9AAogQ5w275MAouk8r347B6qF+BRxxRSSi1ggh3iOSBU
         Ld7g==
X-Gm-Message-State: APjAAAXpi8zen+itLiHD2+5hzmnnMbACDcPtcuiPW7pjPk71siTmf1BI
        naD/UIfJUO/6FNUQKCkOGmBysrJIdK1Z8kYD1eBrAw==
X-Google-Smtp-Source: APXvYqx++MDRFL3YR0qvlj/ZonTl8VxH9hzquyKvc86+3nJZNfQ68/uCC51c02cFBjWHL9vmbLKxf5BYkKaaSiGbLCk=
X-Received: by 2002:a19:e006:: with SMTP id x6mr48839895lfg.165.1564351367853;
 Sun, 28 Jul 2019 15:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563360659.git.mchehab+samsung@kernel.org> <07b6de638cb80767dd3ea2fdec8b19ee3ceb60a7.1563360659.git.mchehab+samsung@kernel.org>
In-Reply-To: <07b6de638cb80767dd3ea2fdec8b19ee3ceb60a7.1563360659.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:02:36 +0200
Message-ID: <CACRpkdbSssyXo-2tzjPGDhfhVt6rEuD0NBV2t3XwM54g-xR82A@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] docs: ABI: don't escape ReST-incompatible chars
 from obsolete and removed
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 17, 2019 at 1:05 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> With just a single fix, the contents there can be parsed properly
> without the need to escape any ReST incompatible stuff.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

This seems to depend on other stuff so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
