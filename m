Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CD8C41513
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 21:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjG0VRC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 17:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjG0VRB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 17:17:01 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D9230E3
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 14:16:56 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d09ba80fbcaso1380528276.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 14:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690492616; x=1691097416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uGRhmfCXLxN6YU1cWESg55BRtPox1xD8u6NHDhwMzU=;
        b=wswgZlkJ4NBe7/FtnWso7C3R/rqxZSJUmuWg9QHSi9JMGr8w9D2uQzTwgYsequJulq
         is/1hwyg+1vqmZ9shtq1fLohk50d+i8QBH94zB9Ej1yzYbUEOx8Q8l3bt0oVwirfr+xh
         AcGAad0J9UQ+W6bzboUyHjcJsZi+WSrDF+7OkvzGWimEu22FXf1MLJ5EWwQk8FgWWRli
         5nuxAenh9aEGSFI3R+2Wy25KS6nV9YXFHtJMJgUjRnHRAdpCMvCEBYpGfAgwwEMdv3tk
         6JayWaqklc5v3KEH7PSXfzGTJ/CMqnzNShHlNUjbz1y94StJOZzcLCOnavQ4iCJKf8+F
         iyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690492616; x=1691097416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uGRhmfCXLxN6YU1cWESg55BRtPox1xD8u6NHDhwMzU=;
        b=iHbnitScDDN+tTDW8fFBUHmwLIU2qWOZn2NEfeHnFmiMfp/nfRBk9LT5Ky0TVLD5xb
         rbOap0HX8LdLzbnlNtGfS2y6k2D4PZ4Wucl+8By2SD3uTGBkEBPoItvsuuJz5LbcvaDJ
         sBv+21yLN4KbLeV78k1jedc1DxvYc1GeD49yI+IlnMSYB4FLbfpF7BLsP8TwsT5JAuiW
         xRZKRZqzZQYlIN5WYsUt9NaIkLAjeYWjcw1CT+VRzmF9yb7bZkh3MMo2Jq4Lirc7KAsK
         NStxGygSz8qN6L19/xqrAnf1n3jR4VUmJH9+q6et0tYr0mIE6Qkxvg0bRLuIKiWMwhwL
         PveA==
X-Gm-Message-State: ABy/qLa1Zfi0i7N9TX5aPJv0s97pmwmwvVnRyi0ijoEWGb80MOzoIDiI
        3NzdVG4HxjuSbtZLJrD65rbNOjejzUD7ekm+SMox6A==
X-Google-Smtp-Source: APBJJlF/WP9UF5vhbN5Eh27rtP31+QJ0KngVSCOWM/D/823cWc4t3dHqdkGuZ+k5czJWqkSh0GU74FyljZsGrCSOQus=
X-Received: by 2002:a25:fe0f:0:b0:cfa:f7cb:be16 with SMTP id
 k15-20020a25fe0f000000b00cfaf7cbbe16mr513279ybe.49.1690492615774; Thu, 27 Jul
 2023 14:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230623123820.42850-1-arkadiusz.kubalewski@intel.com> <20230623123820.42850-8-arkadiusz.kubalewski@intel.com>
In-Reply-To: <20230623123820.42850-8-arkadiusz.kubalewski@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jul 2023 23:16:42 +0200
Message-ID: <CACRpkdar39x8nd5cWEDiFDHwLqHghUQZqkR0rEcv2-sZOZZ0KQ@mail.gmail.com>
Subject: Re: [RFC PATCH v9 07/10] ice: add admin commands to access cgu configuration
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     kuba@kernel.org, jiri@resnulli.us, vadfed@meta.com,
        jonathan.lemon@gmail.com, pabeni@redhat.com, corbet@lwn.net,
        davem@davemloft.net, edumazet@google.com, vadfed@fb.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        saeedm@nvidia.com, leon@kernel.org, richardcochran@gmail.com,
        sj@kernel.org, javierm@redhat.com, ricardo.canuelo@collabora.com,
        mst@redhat.com, tzimmermann@suse.de, michal.michalik@intel.com,
        gregkh@linuxfoundation.org, jacek.lawrynowicz@linux.intel.com,
        airlied@redhat.com, ogabbay@kernel.org, arnd@arndb.de,
        nipun.gupta@amd.com, axboe@kernel.dk, linux@zary.sk,
        masahiroy@kernel.org, benjamin.tissoires@redhat.com,
        geert+renesas@glider.be, milena.olech@intel.com, kuniyu@amazon.com,
        liuhangbin@gmail.com, hkallweit1@gmail.com, andy.ren@getcruise.com,
        razor@blackwall.org, idosch@nvidia.com, lucien.xin@gmail.com,
        nicolas.dichtel@6wind.com, phil@nwl.cc, claudiajkang@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-rdma@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        poros@redhat.com, mschmidt@redhat.com, linux-clk@vger.kernel.org,
        vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Arkadiusz,

On Fri, Jun 23, 2023 at 2:45=E2=80=AFPM Arkadiusz Kubalewski
<arkadiusz.kubalewski@intel.com> wrote:

> +/**
> + * convert_s48_to_s64 - convert 48 bit value to 64 bit value
> + * @signed_48: signed 64 bit variable storing signed 48 bit value
> + *
> + * Convert signed 48 bit value to its 64 bit representation.
> + *
> + * Return: signed 64 bit representation of signed 48 bit value.
> + */
> +static s64 convert_s48_to_s64(s64 signed_48)
> +{
> +       return signed_48 & BIT_ULL(47) ?
> +               GENMASK_ULL(63, 48) | signed_48 : signed_48;
> +}

Can't you just use sign_extend64() from <linux/bitops.h>
passing bit 48 as sign bit istead of inventing this?

Yours,
Linus Walleij
