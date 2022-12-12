Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4653AC00145
	for <linux-doc@archiver.kernel.org>; Mon, 12 Dec 2022 21:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbiLLVoT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Dec 2022 16:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbiLLVoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Dec 2022 16:44:17 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A8D18B22
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 13:44:16 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id s7so13494741plk.5
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 13:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A+ag/PhyV4lazzaYSTLTzsH3BZMXMT1SW00v66ePL4c=;
        b=hoXlROpzKSmvO37lOPrXW/ff8+sY5+Zu9u0y8qRxtFyMRPcHMtiujUoJEMNmxQMtyx
         5uTPAaNn1u5Hrl56fcYAaiIL9DdecnkOfi9VtUV+9ZWD071hR2fOqfGCRBl8vuvPqagR
         dZ6j0Jl1l4vfokpJAv9vBTaGZVHQQJU3Wp/2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+ag/PhyV4lazzaYSTLTzsH3BZMXMT1SW00v66ePL4c=;
        b=A0ei+SP/BbOXuuS2GPz0QnvE+iME/TReJJThRTblpZDaFjt9ikLKThz85jPvtLe99r
         cc4egA73aFqZ4Nq5V88wrPpRFSsZEkweGIOgkWrwpdXvAVIAtJIBVnsFG0oadv2Ht1j4
         eDCk2ssGorF9aD3v7+1s76RekgYhepMVCWRkXeKWk8yb7dRyL5rE10EFGsFWIrrz1S9b
         mVHjYaeU1klDpwm2I+85Uto5Eo0PaGxWWc86+nUJseVEYpnZ9GvcLqnoiz1jNJVFKV8I
         CB423IxydlmABH/SDU7JtRqqvDkAMNpHaQlU+8hXl7T5Zpcr5+bO6Xm37497cZfq70O5
         +zFw==
X-Gm-Message-State: ANoB5plCFb9ff0w/M4riaMhY9YYH9XP00L2SftiYJETpDzwUhll9jbp1
        mmwiMMejnF0xfDbrTJSkFqc/dFdhoMIB+iJJ5/g=
X-Google-Smtp-Source: AA0mqf53ctD+tz3vRoqMVekPXKZI1Dx3ITqwHZywiMafUQuQzEzFVGt9d2MF1QVgWdPDLMVK+Ys80Q==
X-Received: by 2002:a17:903:328c:b0:189:85e9:f6d0 with SMTP id jh12-20020a170903328c00b0018985e9f6d0mr17335400plb.47.1670881455413;
        Mon, 12 Dec 2022 13:44:15 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902f7c200b00187022627d7sm6875475plw.36.2022.12.12.13.44.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 13:44:12 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id fy4so1289128pjb.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 13:44:11 -0800 (PST)
X-Received: by 2002:a17:90a:644f:b0:219:8132:70db with SMTP id
 y15-20020a17090a644f00b00219813270dbmr61283pjm.183.1670881450434; Mon, 12 Dec
 2022 13:44:10 -0800 (PST)
MIME-Version: 1.0
References: <20221114-disable-kexec-reset-v1-0-fb51d20cf871@chromium.org>
 <20221114-disable-kexec-reset-v1-2-fb51d20cf871@chromium.org>
 <20221117160650.16e06b37@rotkaeppchen> <CANiDSCvyQ66mXbhEgj_qnE_zR4frsxtu1bXaukDrEG0FjrE4yw@mail.gmail.com>
 <20221121150948.6f7c1f1f@rotkaeppchen> <CANiDSCtqYykAjRinx9r4O+DxdTBA=OQSjF8URmM6X54nN7pDUA@mail.gmail.com>
 <20221124124000.5af23cad@rotkaeppchen> <CANiDSCvO+6TrM900Z_Jr4QL=c1uHS21deto7cU9W4mr7KimhJQ@mail.gmail.com>
 <20221124160115.23ae7928@rotkaeppchen> <20221128114200.72b3e2fe@gandalf.local.home>
 <20221129144450.75a7181e@rotkaeppchen> <20221129093245.599903e7@gandalf.local.home>
In-Reply-To: <20221129093245.599903e7@gandalf.local.home>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 12 Dec 2022 22:43:59 +0100
X-Gmail-Original-Message-ID: <CANiDSCs6jyNBiO+wO-MHB3qv5am0mmGbv7y4eHv1PSLQh5EPTA@mail.gmail.com>
Message-ID: <CANiDSCs6jyNBiO+wO-MHB3qv5am0mmGbv7y4eHv1PSLQh5EPTA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] kexec: Introduce kexec_reboot_disabled
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Philipp Rudo <prudo@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        Ross Zwisler <zwisler@kernel.org>, linux-doc@vger.kernel.org,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Philipp

On Tue, 29 Nov 2022 at 15:32, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 29 Nov 2022 14:44:50 +0100
> Philipp Rudo <prudo@redhat.com> wrote:
>
> > An alternative approach and sort of compromise I see is to convert
> > kexec_load_disabled from a simple on/off switch to a counter on how
> > often a kexec load can be made (in practice a tristate on/off/one-shot
> > should be sufficient). Ideally the reboot and panic path will
> > have separate counters. With that you could for example use
> > kexec_load_limit.reboot=0 and kexec_load_limit.panic=1 to disable the
> > load of images for reboot while still allow to load a crash kernel
> > once. With this you have the flexibility you need while also preventing
> > a race where an attacker overwrites your crash kernel before you can
> > toggle the switch. What do you think?
>
> I actually like this idea :-)

In case you missed it.  I sent an initial implementation of this at
https://lore.kernel.org/lkml/20221114-disable-kexec-reset-v2-0-c498313c1bb5@chromium.org/

Regards!

>
> -- Steve



-- 
Ricardo Ribalda
