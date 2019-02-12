Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4A6C7D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Feb 2019 20:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732129AbfBLUyw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Feb 2019 15:54:52 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:43466 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730672AbfBLUyu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Feb 2019 15:54:50 -0500
Received: by mail-vk1-f194.google.com with SMTP id e131so14805vkf.10
        for <linux-doc@vger.kernel.org>; Tue, 12 Feb 2019 12:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1nrYSRbB45H+369z6vZFSrjEaahox2ezp5NLLs2OLo=;
        b=TCDbjJmQ8hAwvc2HdCsNp1Sbucf0DGWb9lkWwY4lAE6HzcSID3GYhQ/UHIcMJGSQAy
         FJdIJTu/ZHbaagFYDwLf17rPnt973KCFAK6IBcSi8DEwviToTYK2kXkNu2B9dO/qhAcC
         GpeHUaUUdUyxXocmUKfKgN85vLfxkaqYLBJ7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1nrYSRbB45H+369z6vZFSrjEaahox2ezp5NLLs2OLo=;
        b=lyy3eLiVY5E7W/5kKs9y4YuaIA17SVRqcfh/NzLHtlxMYyPF1kzwZi7OyHvMlNtIgt
         h5XG8YjrPsQeA+dpnIdaOtb+7aIyGovSaqfeldTlJbLpHrriMS92ALPRrf64Da2ExbIf
         d4vSEsISNAikXaNzsPFq0tYqJFbdkFDjuzj1x8RsZGccKD9+6yTklx1u9YJImv+MGBLC
         r7UjTA/1DlPChS4BTRuesWcVQTBNr1mjKCyBbJ6MGmWc3J0Rmf5sUXVYAWwyMtnOmf5y
         n29+JqwWeztxhy1HddGy/DRLVJ3A8Lk9VOUMHfXrKQs/iWh6oNZeRG2QV4d/Xh3Bb1yr
         Y+tg==
X-Gm-Message-State: AHQUAuYxOLg1bESQcpfdIQmwGwXQwl+PpyHxW4nVclLfjNWC1wKxXKQv
        aqYTijv2JxyEzl/Wrdst4WUTvfWgYf8=
X-Google-Smtp-Source: AHgI3IZzCuSM5gV7j1Q1GCBl7RpLPyeQYhHnANVaf+dGv1g4+knuMKLpNCNG543j13mFU4BBdLJEpg==
X-Received: by 2002:ac5:c30b:: with SMTP id j11mr1153860vkk.46.1550004888944;
        Tue, 12 Feb 2019 12:54:48 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id l197sm15240606vke.18.2019.02.12.12.54.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Feb 2019 12:54:48 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id r201so32439vsc.11
        for <linux-doc@vger.kernel.org>; Tue, 12 Feb 2019 12:54:47 -0800 (PST)
X-Received: by 2002:a67:848a:: with SMTP id g132mr2350886vsd.222.1550004886900;
 Tue, 12 Feb 2019 12:54:46 -0800 (PST)
MIME-Version: 1.0
References: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
In-Reply-To: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 12 Feb 2019 12:54:35 -0800
X-Gmail-Original-Message-ID: <CAGXu5jLE8dr4+G6fFmwcbm8YAs=RB+OiupyPCX6COhVu6av__w@mail.gmail.com>
Message-ID: <CAGXu5jLE8dr4+G6fFmwcbm8YAs=RB+OiupyPCX6COhVu6av__w@mail.gmail.com>
Subject: Re: [RFC v7 0/5] pstore/block: new support logger for block devices
To:     liaoweixiong <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 23, 2019 at 4:06 AM liaoweixiong
<liaoweixiong@allwinnertech.com> wrote:
>
> Why should we need pstore_block?
> 1. Most embedded intelligent equipment have no persistent ram, which
> increases costs. We perfer to cheaper solutions, like block devices.
> In fast, there is already a sample for block device logger in driver
> MTD (drivers/mtd/mtdoops.c).
> 2. Do not any equipment have battery, which means that it lost all data
> on general ram if power failure. Pstore has little to do for these
> equipments.
>
> [PATCH v7]
> On patch 1:
> 1. Fix line over 80 characters.
> On patch 2:
> 1. Insert a separate patch for DT bindings.

This is looking good. Can you address the DT bindings review concerns,
and send a v8?

Thanks!

-- 
Kees Cook
