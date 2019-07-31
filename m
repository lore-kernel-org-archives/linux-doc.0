Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C2BD7D910
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 20:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfGaUeS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 16:34:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35249 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfGaUeR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Jul 2019 16:34:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id j19so33135688otq.2
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2019 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lhyyuWidO2twh71QoQ3IyDneg0h8HkC4FDMzjkF1Knc=;
        b=oTcevW9uWVkAu1HV6ScFP/3BL3h8q7oqrox2GAXadT4n5q0fxkeVFbK61hBM1/FX72
         amIN8l7y8mL4tsZTcwiOivgqwH2T8WKYhShkXthvqnDicbFspi0XhjDECDABx9LCrMuG
         JZNA3dGkqlFWZMZt5XCzikl64GgO3fBtlV9EjDQFaMgVcW9Nk0in+KkuER5S8EVeGz4d
         HQ6iUlv+QZ0oNb4ux5lopRditexf/QmMVvP2nC4i469dNzzRP4pbUlYzu7yHsA8dpv7b
         XQ16lnHfRO/36EiCH/gjJDx9n986zIAHcLvzTIw7rL9X6ndZyk/KdYABIhkC90KHoqjR
         cuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lhyyuWidO2twh71QoQ3IyDneg0h8HkC4FDMzjkF1Knc=;
        b=tte5ngi6VaKhTJWazhibhacQOIoeZkB+wYQV5Xw3ATYVfyN7iIcNA708peSWbU8dqr
         +AssiZJ7RodoDd5Us1kKlNjKesJ1+iA0/eY1qypxirUrtvoehju2mVyO/Nb9NnCgQIIR
         XCTfIHgLz3TsX2DSvW/H5Qa/qYi3B95XngwHVqoR4PPw53gTqSFmpO3bZCO5k2DRcZET
         OtSR35ZcjM/VqZnsJU1Hxzpvp8IUuljZQVXEO4F8eGKwRAWk9xz0aNlfUPQllWPG9ikw
         rNBNXQ8Yh6CDayikQc41FMko6685N7r5eYGF2BTmoEZ7xJub+jeU9J+4JTQyprZgu6CL
         tC6A==
X-Gm-Message-State: APjAAAXJqg5dcSJiU0jcK2pK3k88XGong8ArY7GkMTYZvrx/dgQ3wiZg
        gkOheqDX15Txrd+kYembabaNfbowdbGhqdsSDFeEcw==
X-Google-Smtp-Source: APXvYqwXtu9HEqzwg6BxGW5PDsoBHhz2CdJ/FLp995gTLUpgkjXsVaauGGNSjFMwkoUiNFLz7F+W3M46Tx08cZEpBvY=
X-Received: by 2002:a05:6830:160c:: with SMTP id g12mr37738641otr.231.1564605256524;
 Wed, 31 Jul 2019 13:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190729221101.228240-4-saravanak@google.com> <20190731181733.60422-1-natechancellor@gmail.com>
In-Reply-To: <20190731181733.60422-1-natechancellor@gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 31 Jul 2019 13:33:40 -0700
Message-ID: <CAGETcx9LXP9b_W_1XQFmjODPJVrbnU+vH1RKer2i=jU7Q7EADg@mail.gmail.com>
Subject: Re: [PATCH] of/platform: Add missing const qualifier in of_link_property
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     David Collins <collinsd@codeaurora.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 31, 2019 at 11:19 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang errors:
>
> drivers/of/platform.c:632:28: error: initializing 'struct
> supplier_bindings *' with an expression of type 'const struct
> supplier_bindings [4]' discards qualifiers
> [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>         struct supplier_bindings *s = bindings;
>                                   ^   ~~~~~~~~
> 1 error generated.
>
> Fixes: 05f812549f53 ("of/platform: Add functional dependency link from DT bindings")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Given this is still in the driver-core-testing branch, I am fine with
> this being squashed in if desired.
>
>  drivers/of/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index e2da90e53edb..21838226d68a 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -629,7 +629,7 @@ static bool of_link_property(struct device *dev, struct device_node *con_np,
>                              const char *prop)
>  {
>         struct device_node *phandle;
> -       struct supplier_bindings *s = bindings;
> +       const struct supplier_bindings *s = bindings;
>         unsigned int i = 0;
>         bool done = true, matched = false;

Odd. I never got that email. Thanks for fixing this. I'll squash it
into my patch series since I have a bunch of other kbuild errors about
documentation.

-Saravana
