Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 44E0A7D912
	for <lwn-linux-doc@archive.lwn.net>; Sun, 28 Jul 2019 22:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfG1WVB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 28 Jul 2019 18:21:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33170 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfG1WVB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Jul 2019 18:21:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so40761734lfc.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Jul 2019 15:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FLmMIDcIizWuPvrBmc4gpk3vuXYj+LUn4VJhWeYY47A=;
        b=SpW8mh5JmaUwmCYAUiN6Zc6xExwWIrOtwzT3K6hskMbzzxct7PtclBGvCvTicitGLf
         LIzVOV0uPD66YFu/1HFK3iDlSyDK23Jgtip/94zAhM2rxdAo1tepVdNhCYUZDIGh/Zzo
         AMwOoJSB6mqBJ2OBODr6Dy1qT1t9ROJGLge8btIfLcKdTqXA6ztYBiIMsZoBozdQvRzb
         03+n5uoHji2Mfc7XW7d0s5d65Nrbin1rZOdh4CTw/hisxod3/t/KDSj62K1vDV/2hkyi
         DeDRQYCwlhNSblnZMWJAOuEl7ChJr7jVyVmhC0BV64NRbICQFM08LxvXrkocTi15E/Xa
         3svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FLmMIDcIizWuPvrBmc4gpk3vuXYj+LUn4VJhWeYY47A=;
        b=Utbx5vOcE1cJu8pLcDLg/fWihXFmwrmvwxSoKXhWkFJ0sao4cyeqKGkB00yQH45wsL
         aTVqHMrw6xa4a/S4Jcqjcisd0klkDKleOlyGW44bqDUYljv6oem3fopnMDnrecyzbLGi
         j6xQtY1H0D7FYvuFceZ6Wkvjo1Rlx+JdffQW6wxr6pJ/5j/J1Qn7XnbqR6EZ1HECYiy0
         SuXBbJdb1linFWYLqjejWjssf9koDQix/RMp83Eh+A4lupV+tQW+KZxe/srwwOUWC4Ze
         gEzzA8edOpKDDaINaYYvFtOXZGO1YOQ1ytcIPn94oakX/rbVOE2XQ+Anz71LYidYKM3d
         BMBw==
X-Gm-Message-State: APjAAAV2HvmHzJ80/cx1m8isnYeokY2LYmVwjkbG0OmBw2pcYBQZVvL1
        n/9cObGNXeakymyLQFfNDBfzsUQcd2ira3vUuIUMTg==
X-Google-Smtp-Source: APXvYqy9tXaK3FvDKV/nxxLTpRbvelziBiCAwnZac43l2iiP91Bvr49N28LMVps7+NvxEUQsozJwed2O5clCXGQ2s/Q=
X-Received: by 2002:a19:e006:: with SMTP id x6mr48865881lfg.165.1564352459718;
 Sun, 28 Jul 2019 15:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190705143043.1929-1-luca@lucaceresoli.net>
In-Reply-To: <20190705143043.1929-1-luca@lucaceresoli.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:20:48 +0200
Message-ID: <CACRpkdbJHPz78YfwRtbnmw_8Rk-Te4GHFvrL4MLCy1xTvjKGAg@mail.gmail.com>
Subject: Re: [PATCH] docs/pinctrl: fix compile errors in example code
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 5, 2019 at 4:30 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:

> The code in the example does not build for a few trivial errors: type
> mismatch in callback, missing semicolon. Fix them to help newcomers using
> the example as a starting point.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Patch applied.

Yours,
Linus Walleij
