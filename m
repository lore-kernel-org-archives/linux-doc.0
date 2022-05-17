Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0AAC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 17 May 2022 20:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351882AbiEQUpP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 May 2022 16:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbiEQUpO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 16:45:14 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E433C52B29
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 13:45:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id dk23so36949578ejb.8
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cSbaj6m8IruioDruqyoSFgzsLFTHdPcEb55nsCK4TWE=;
        b=gIJl50Eulc8Vsdg9AlkQITMqbdDAC+WLftF0jWbwTU2Ox6ZAesuN7rpCB0FMaRU0ku
         lJ4nDGxYlUcGBrMF0OBIcV7BVZ/6dQhxV8Y0AN9udmHCOs/hbsS8QNfTOzm42DOyD04B
         INwkuTN7sK2mchrwYyIFLcP6G7cfMdvJzdCsNO6DHF0vKZ31XkNnoK+uC/5SjLn6IjFW
         LYxNgm+TAwk3YHjlV0dMNF83/wQ0tz2C2XtfpIqEIso03Z3DCFpUgCW94yJNGTqJgJ1H
         adGsX1arLF1hk3vyAaddUCxOoag3FN3FPGl5vEZnxDkCBBx+fmhj7tk5jbSySPZDtWuo
         qm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cSbaj6m8IruioDruqyoSFgzsLFTHdPcEb55nsCK4TWE=;
        b=j9/AQHRJM3O5VT6h8zUIhcF+J7jb2w/tHtZjv9EWAcvPDodNFmW5hMNTPCUpLwctqU
         nw6j2SghSqbn7UWm+cwvU2Xsn/a7xeZlx9SyueJPIcLbYxaRYvq4Zhvpazg4FODswxc7
         CxpnwImRod1WDvJreJuJ67JKSGEoDLTqQkb+0uYsq96nYyV+gZHGG8xyosCzmwdlIZVK
         p+CmYYhE2shQTYou2zmZGoKMrFHLAICVE+uKzF1TSt09WDgLEyAQ3lDyAB9/Gy3jhsz1
         2ZVhC5n5pAZ/IgjnYG3Vs7XIQIMZJOsYhwj5RWc3Cka6mK2sU+LmPyehcLiuteNikSKk
         ggUA==
X-Gm-Message-State: AOAM530kFeX9QyqyaaW0pEjOfquJM4b3yeTTCE3+sNfVeal8+uWyx+At
        2ieZkox4Qn41ZrfWU1SIEqWvr07A8JfaMC/sDEwBdQ==
X-Google-Smtp-Source: ABdhPJyUT7v/+bRMzp2NCjUfzxBgDqk4IrNgbSICl9zfGmBkyXaJdmW22wa6lYaF7OVZbcBIcBpg8Xk/VoVYzb5Je8E=
X-Received: by 2002:a17:907:1c89:b0:6f4:4089:8256 with SMTP id
 nb9-20020a1709071c8900b006f440898256mr20602107ejc.60.1652820311327; Tue, 17
 May 2022 13:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220429043913.626647-1-davidgow@google.com> <20220513083212.3537869-1-davidgow@google.com>
In-Reply-To: <20220513083212.3537869-1-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 17 May 2022 16:45:00 -0400
Message-ID: <CAFd5g46dQ=q5UuXaoXwh32kjGoFi0m59L-frm6T5Xcwo81m0Hg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] panic: Taint kernel if tests are run
To:     David Gow <davidgow@google.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Sebastian Reichel <sre@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Joe Fradley <joefradley@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 13, 2022 at 4:32 AM David Gow <davidgow@google.com> wrote:
>
> Most in-kernel tests (such as KUnit tests) are not supposed to run on
> production systems: they may do deliberately illegal things to trigger
> errors, and have security implications (for example, KUnit assertions
> will often deliberately leak kernel addresses).
>
> Add a new taint type, TAINT_TEST to signal that a test has been run.
> This will be printed as 'N' (originally for kuNit, as every other
> sensible letter was taken.)
>
> This should discourage people from running these tests on production
> systems, and to make it easier to tell if tests have been run
> accidentally (by loading the wrong configuration, etc.)
>
> Signed-off-by: David Gow <davidgow@google.com>

Aside from Luis' comment (which I agree with), this looks good. I am
not an expert on the taint mechanism, but this seems pretty
straightforward.

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
