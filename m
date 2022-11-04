Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5C1C43219
	for <linux-doc@archiver.kernel.org>; Fri,  4 Nov 2022 19:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiKDTvE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Nov 2022 15:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiKDTvD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Nov 2022 15:51:03 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F0F2CDC0
        for <linux-doc@vger.kernel.org>; Fri,  4 Nov 2022 12:51:01 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id h10so3890367qvq.7
        for <linux-doc@vger.kernel.org>; Fri, 04 Nov 2022 12:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x16jINQR4q6R4H/0ehn+NSarZW0ZiXtTfCfHHiaRLp4=;
        b=bIdKEWgR5UZIy0TJaruQujMahMwynr4PVMnDcU4kBitHBNo7q073JbrYzG65FbHP7Y
         mbM9hFjlLlwQAouSAl9oSuR5cXI0K/JQyyZwmKs1co0JGtwjHN72PIS9n6MKeTRWxT7Z
         cCPuFkDzNQGR2KqOHNVW0/FBQA0CMharaPptg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x16jINQR4q6R4H/0ehn+NSarZW0ZiXtTfCfHHiaRLp4=;
        b=HudOYuZO3fu4djI5gruxahIhEkNtNwuo89O9XqCppEvcMrYQ7/K+DBAoglbikrgzxa
         jVF7H23rubrbTVKtlc2WK2heJMhdHoJLMUlYbFKSmBlFvewdZnNNu10IFaVyH8G2DEqE
         kWjIKbo2g7PbvwU0TLllg6wRfSpfNFzsNQ2qGJnr3+g0vfrTlxUeXTOwjUZHZMIi+D2m
         qd7dEW+0Fv2nNnft9btIH2SGKfw7tYdvUMesrnRl39N5Xst6E6JQ12Vb3LX9IoPxBVQM
         BMPXsdXIT+p4LfjX/ABkV/GUNx2cPvO1SbXZ6hZjquHtDg/BFrFmDv4tDXV2Ktl+dCKN
         DGrw==
X-Gm-Message-State: ACrzQf14aB9CmmvKPk3gxmWS3WfBqrTkuJIEjeuvC0nOomTOF3oPQSiU
        HtoAxDAme4Gwk/hGZU4hIBm6mAAODGZrmQ==
X-Google-Smtp-Source: AMsMyM5/LDp5GfqnyBHdkyOfEWHcrAd5WqpX5P9lKAXxGJYvfuMXrUaVJ9ly0kdMQvduQXL/HSVdFQ==
X-Received: by 2002:a0c:ea86:0:b0:4bb:6a31:3f0 with SMTP id d6-20020a0cea86000000b004bb6a3103f0mr349730qvp.110.1667591460296;
        Fri, 04 Nov 2022 12:51:00 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a290d00b006fa43e139b5sm55634qkp.59.2022.11.04.12.50.59
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 12:50:59 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3701a0681daso53121317b3.4
        for <linux-doc@vger.kernel.org>; Fri, 04 Nov 2022 12:50:59 -0700 (PDT)
X-Received: by 2002:a0d:ef07:0:b0:373:5257:f897 with SMTP id
 y7-20020a0def07000000b003735257f897mr16823922ywe.401.1667591459021; Fri, 04
 Nov 2022 12:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221104054053.431922658@goodmis.org> <20221104192232.GA2520396@roeck-us.net>
 <20221104154209.21b26782@rorschach.local.home>
In-Reply-To: <20221104154209.21b26782@rorschach.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 4 Nov 2022 12:50:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wge9uWV2i9PR6x7va4ZbPdX5+rg7Ep1UNH_nYdd9rD-uw@mail.gmail.com>
Message-ID: <CAHk-=wge9uWV2i9PR6x7va4ZbPdX5+rg7Ep1UNH_nYdd9rD-uw@mail.gmail.com>
Subject: Re: [RFC][PATCH v3 00/33] timers: Use timer_shutdown*() before
 freeing timers
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Anna-Maria Gleixner <anna-maria@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-edac@vger.kernel.org,
        cgroups@vger.kernel.org, linux-block@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-pm@vger.kernel.org, drbd-dev@lists.linbit.com,
        linux-bluetooth@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
        linux-input@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-leds@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
        bridge@lists.linux-foundation.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, lvs-devel@vger.kernel.org,
        linux-afs@lists.infradead.org, linux-nfs@vger.kernel.org,
        tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 4, 2022 at 12:42 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Linus, should I also add any patches that has already been acked by the
> respective maintainer?

No, I'd prefer to keep only the ones that are 100% unambiguously not
changing any semantics.

              Linus
