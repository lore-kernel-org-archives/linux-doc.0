Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C23C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 01:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244111AbiCQB3C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 21:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358379AbiCQB25 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 21:28:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DB61F600
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:27:20 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w25so4787527edi.11
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VOxKsTGlBiXPbLWsRjfTqw/sHWeUi1uspD6WChZvBGc=;
        b=LNQndeOSXW/bAWh7JNokNGhZ5eqGvlPxbUsfct7uX8e652+AZTZFl6ZnbKhzWsZnR1
         F98RG8Wz1O2VsVCedS3lzBDewtqbBDLRgtzBBR4D0o7EZvQZNJjxyuAKcQhdfpXgs2kj
         KIIyEkSMSMqcOZyYfIPhbZTyng29T83GGHYU2CJJoH9IK8oJWnuaI8G4WSTUQr7ENP5L
         TNY2t+1Q1U69nlq1sH6hKoMoKg1JCpnaIZSqb3up1G95PvRLagrF6NifKl20EyuOChZ9
         J7dAHfJVKkdxD77XohB1NZlmtuNEsAZkWX2IGX4KCaGAcTbIRASL5NQ6BYDQFt4YerPo
         B6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VOxKsTGlBiXPbLWsRjfTqw/sHWeUi1uspD6WChZvBGc=;
        b=Tz+rhwLcJmGBgugFbQEG5ISjWWqr9EHRpTsUUnXl1xI0gVshD4umF1WaZQGdzQZZjk
         2CZZ13xwie0ysw52ePQPfpmAKAVYK6WrWHv4Dwv/+IzMSKblfcsOLn6yEnXJcQ01VfI5
         K64UDCpZpRRkthrB0ayb8erV24BsEcRev6KLt4Tj9DXkTkwj6QrZ8Lx4bV+QYt9TEW19
         xUGk8xPgrlDeMZ/Dxkj05XrlX3aEFvwq9BgrbLlqSeal1NXyjB9WN8CCVd9jAw5npAka
         Gb8du0lHnXpM6mAcFVYv5sZYhL9hESptnq7fUS6FK/L9r4gDmggRK2lAmOSgzHgBnrHZ
         F+SA==
X-Gm-Message-State: AOAM530ndgy4N7LfByxwWB4w/G5V3a24SFwk3O9jJNwKPwABGqy1noVr
        ONvxypvymjv3lWVuAag2UtPt3UqYvKfmR8cooA0s
X-Google-Smtp-Source: ABdhPJzKzxlZ+0pm3CY5Kl7j8CFXMcoRrP56pFWJh+04iR0sxvt0PPoz+ZQBE4MeZ3T3Tg/mmXPL96Pxy2osfTaCu6E=
X-Received: by 2002:a05:6402:1746:b0:418:d816:14e0 with SMTP id
 v6-20020a056402174600b00418d81614e0mr2016945edx.340.1647480439041; Wed, 16
 Mar 2022 18:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220221212522.320243-1-mic@digikod.net> <20220221212522.320243-11-mic@digikod.net>
In-Reply-To: <20220221212522.320243-11-mic@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 16 Mar 2022 21:27:07 -0400
Message-ID: <CAHC9VhTSTkOLx_CfB9DsG1GqZm87o2Ds0urZv+gS+sA4gMjfFA@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] landlock: Document good practices about
 filesystem policies
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 21, 2022 at 4:15 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20220221212522.320243-11-mic@digikod.net
> ---
>  Documentation/userspace-api/landlock.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Paul Moore <paul@paul-moore.com>


--
paul-moore.com
