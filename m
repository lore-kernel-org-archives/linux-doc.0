Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B0AE37D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Sep 2018 08:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbeICMeW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Sep 2018 08:34:22 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46095 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbeICMeV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Sep 2018 08:34:21 -0400
Received: by mail-qk1-f195.google.com with SMTP id j7-v6so5140802qkd.13
        for <linux-doc@vger.kernel.org>; Mon, 03 Sep 2018 01:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHpT9Y1EBeN8VEZdAgYh5ux3KRdWLwuNH0x4RuHBggo=;
        b=aYun6e/GSKrtEHNmMHrbKIS96gYx8IPk2xdmVxP9MbE6Losewwxmxd1Iv0BJ4k2UU5
         1irAjjopXO4bE9UKiXYAtShI9bHhjXeBLM0xw4wSjXGaQvvQ58HO2QRjy7ZCVxPBqe5e
         4t3AtQ4kj9R2vOj1ZOiDs2oebusZggCcsQQumLV3sI0WAAKnYnm0hlFnldoG6k1DmL03
         6LAo2K1VmnAchiNyZYRB3ZjsFVXC+iC8MiguoNdu1W7HpQo9fKc4Qg7YLvlA1rmGVY1x
         p0G11eK/t2YzH+zwz/20HdEKGkCpatlQIUWDwBUMUi5edil4jviB0I8JURNpBY1PiU79
         US3w==
X-Gm-Message-State: APzg51CzxEnnLiaqspGjBWa8mfzwJOQwWYZog+ATIJfyW7N2daTL4mlM
        1irz/6t//1tFqgIqzS3+K5WN97xuI1jynl1HQYBp7A==
X-Google-Smtp-Source: ANB0VdYmiV/Hg8wDJ+bMYNX2ocDludWxtjs4FxXLsFFJOQ6FW83ZU9hNLeqinb8/OHUVLZGb7oO07GXHPl48M0s8zlA=
X-Received: by 2002:ae9:c30b:: with SMTP id n11-v6mr9792496qkg.194.1535962519391;
 Mon, 03 Sep 2018 01:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180830215622.47550-1-hcutts@chromium.org>
In-Reply-To: <20180830215622.47550-1-hcutts@chromium.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Sep 2018 10:15:08 +0200
Message-ID: <CAO-hwJL6xz=b4wA5WnSeZw1PO+exVgs3isyPO6ZFWVemiJU9yA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add support for high-resolution scrolling on
 Logitech mice
To:     hcutts@chromium.org
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, jiri.kosina@suse.cz,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Harry,

On Thu, Aug 30, 2018 at 11:56 PM Harry Cutts <hcutts@chromium.org> wrote:
>
> Hi everyone,
>
> This is v2 of the patch set adding support for high-resolution scroll
> wheels on Logitech mice. See the linux-input "Reporting high-resolution
> scroll events" thread [0] for previous discussion of the evdev changes.
> I would love to hear your feedback.

Series looks good. I just tested it on a regular Logitech mouse and a
MX Master with high-res scrolling and everything works as expected.

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>
> Thanks,
>
> Harry Cutts
> Chrome OS Touch/Input team
>
> [0]: https://www.spinics.net/lists/linux-input/msg57380.html
>
>
> Changes in v2:
> * Changed the REL_WHEEL_HI_RES code to use micrometres (a.k.a. microns)
>   as its units, instead of 256ths of a millimetre.
> * Removed support for mice connecting over Bluetooth, due to a bug where
>   the mouse's high-res mode and the driver's settings get out of sync
>   when the mouse is power cycled.
> * Moved the creation of the HID++ 1.0 function and the refactor to use
>   the LDJ_DEVICE macro into separate patches.
> * Added a couple of explanatory comments to the Logitech driver.
>
> Harry Cutts (5):
>   Add the `REL_WHEEL_HI_RES` event code
>   Create a utility class for counting scroll events
>   Add function to enable HID++ 1.0 "scrolling acceleration"
>   Enable high-resolution scrolling on Logitech mice
>   Use LDJ_DEVICE macro for existing Logitech mice
>
>  Documentation/input/event-codes.rst    |  11 +-
>  drivers/hid/hid-input.c                |  45 ++++
>  drivers/hid/hid-logitech-hidpp.c       | 311 ++++++++++++++++++++++---
>  include/linux/hid.h                    |  28 +++
>  include/uapi/linux/input-event-codes.h |   1 +
>  5 files changed, 368 insertions(+), 28 deletions(-)
>
> --
> 2.19.0.rc0.228.g281dcd1b4d0-goog
>
