Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 372CD7DD31
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 21:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751325AbeDTVvU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 17:51:20 -0400
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35345 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751228AbeDTVvT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 17:51:19 -0400
Received: by mail-qt0-f196.google.com with SMTP id s2-v6so11454146qti.2;
        Fri, 20 Apr 2018 14:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=XKdro5muKpP3VpniYJLlGIKGnj5bv1eLPIx9nX7EYuU=;
        b=u8mxZCC28hEB9yUSJ8J2xjoHmSheo4ZoGQq1wd/wEKCNc3WDM0sLCeY4FKbEBLZ1IL
         SAIgLG9uX9A26C88Zk+92CsJBflw6qCoxlOVX3IW2mXFX7d6LsKs3Joi4BFzVTR0dWZV
         o6OP5sa3oB/iPX6PaQYF54MIqsQf1U+y5GSIyXO8ezWqoFUZIamxKoHSuaig/3CshwO9
         dJQ0IvVPyu5dlpyvkgoHXWHchnDKmCxrBBya8oGxN14qnVIdE6gkri2l3Hm/alAiPrIp
         hwbtmy2z6Tcisvd4fEX47BwvY5W4M0ay1O0noU150PSMWAbD43H0vir44yjgz+K26VQ4
         C7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=XKdro5muKpP3VpniYJLlGIKGnj5bv1eLPIx9nX7EYuU=;
        b=UP/MHCoW/fV/+rdKY3/4E1hSswUOOkhHtiQNHRZFl1Iz8q8kHsr2DCkJpRU+0h6DEH
         4sc/tR1yBJl2sxVKObypZaS1ojHwdY9d2SZPrvfsuyOomZbIR517p22ic9ipqG/L2EXO
         0ciqDGszca96UKTStmVucCX4ieb2cHFH8GA4+/WDIJTyEKyzPJrEeewRTI7WW6h6SCwM
         UnfEFpye8IQs4NdBqSmLR00hu2BuxO1/58UNkXMd/r/QWOKMAaYv2svF7heKBPc5ucVb
         7oRHRsz/nU9tWHD5W91wQqdbAdof0dsqyHoAshY4k8cUf/RjsXbKIoy3NPtrQBkXHp7C
         QM/Q==
X-Gm-Message-State: ALQs6tDfFHNCBUq09A+4EwBeBU40qhfSPJPsWQNBM5OfgWWUFAsZcsaj
        tvxg6Phq9HTieu17L2XqSBfO1rySImwYwLt/g6w=
X-Google-Smtp-Source: AIpwx48SejwKlq5tfb7mGBKpbUEP6MZhC+hyTIa6rcnpqu7MuQnrTlN+LiIGGoLKlNhaK8eJD7waN/PPEO+aLNYO2Qo=
X-Received: by 2002:ac8:d44:: with SMTP id r4-v6mr13263117qti.187.1524261078667;
 Fri, 20 Apr 2018 14:51:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.185.25 with HTTP; Fri, 20 Apr 2018 14:51:18 -0700 (PDT)
In-Reply-To: <20180420154933.3235131-4-arnd@arndb.de>
References: <20180420154933.3235131-1-arnd@arndb.de> <20180420154933.3235131-4-arnd@arndb.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 20 Apr 2018 23:51:18 +0200
X-Google-Sender-Auth: ovDKP8fYwUz9vEAUhC5cRzS80AI
Message-ID: <CAK8P3a2vh+BH_GJSPkc8D61+J2NK_e_HWJkuz6DVmb_Ln6ND0Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] sh: remove board_time_init() callback
To:     Rich Felker <dalias@libc.org>
Cc:     Baolin Wang <baolin.wang@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 20, 2018 at 5:48 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> @@ -41,8 +39,7 @@ static void __init sh_late_time_init(void)
>
>  void __init time_init(void)
>  {
> -       if (board_time_init)
> -               board_time_init();
> +       timer_init();

Testing revealed this to be broken, the fix is:

diff --git a/arch/sh/kernel/time.c b/arch/sh/kernel/time.c
index a29eb989d81b..8a1c6c8ab4ec 100644
--- a/arch/sh/kernel/time.c
+++ b/arch/sh/kernel/time.c
@@ -39,7 +39,7 @@ static void __init sh_late_time_init(void)

 void __init time_init(void)
 {
- timer_init();
+ timer_probe();

  clk_init();

Let me know if you'd like me to resend the series with that typo fixed.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
