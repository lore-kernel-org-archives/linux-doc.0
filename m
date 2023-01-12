Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED45C54EBD
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 14:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240280AbjALO7b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 09:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239922AbjALO6x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 09:58:53 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BD5633A2
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 06:45:15 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4d13cb4bbffso121933037b3.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 06:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7I24eH8vsj2xcwHHKlkQbmBbWacNQhsGFVP2J3hiY54=;
        b=gG493AOCoT3zyKgUQL2nIrQiZmY+vhm0EinYIwwATXB3zU31PYMSK0tbCnkmcaB+QN
         vVjuiFsG1oa/Nfn0otVD/xkjV4rLR4iW28CRtCe9i4Pj7/YaCItVoCplEGYyqpnlK0w1
         wKdyhkyAencr6CSGlTQDVsatwepCYR/uVEdWrUzVm0emQMzRKwwwlHhowKvT6rpuGWRT
         sMzpQQzO5ftpBTtn5wiXUE3eZn9ApzNTfZGoWuXxMZ4LwEc5fF6WW02w3Ky1zWj7THIA
         l2VmJC98H47dNGoLjtG0pJXzsCuKXr+dmFjuDfTa4AGXHWOfnXGhiJti0e9EoF1IdfjK
         V5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7I24eH8vsj2xcwHHKlkQbmBbWacNQhsGFVP2J3hiY54=;
        b=ML9iymGq/dXnFbw+gXwkg8AxZQokptdN1OFwSjLJRmPuunz2qamR+eCscKn76BaY2q
         UQnO4Nyqv6o13Xpqdshkqq9M2L4HhqAB1tHJzpjtNPKqDSzPOO8/wSvsNgobCd2QB2Vr
         f44AiLOvNGDdbFUu9GqvSZVggJgws80HTnG1HrSjxICjaoiHTGa63jRevoMeUNwDbSTF
         zEITB6lxFLHVgWc0zAo+LRfBHXk82OqqBeEaj/8I/p3R2R5uaAzuMHHTLmf+j6811zLL
         l1lyyhxHIR3BJDxzNkQuHDYUgdg+hqkyYQkpgU+1PMPbpyTHcIO4C6idJetLNrIJTrtI
         /sbQ==
X-Gm-Message-State: AFqh2kr0wTgIPc4c4aeA3e1X+5Zv+pEOkmcMRsPnmnf5BUD/t+RJjJGK
        cFY8Qok9u6dJFsbf30v4R8FF7PQVoA7ADFkfykFrmg==
X-Google-Smtp-Source: AMrXdXsTbENerthrI+MaklUFu9B1OvhBS3tccIyDUuKI9PlXYJavk6Ti9I2OucbWz7X0YBuvdSemoA7+UXEH2SfWUco=
X-Received: by 2002:a05:690c:81:b0:36c:aaa6:e571 with SMTP id
 be1-20020a05690c008100b0036caaa6e571mr1616785ywb.467.1673534714662; Thu, 12
 Jan 2023 06:45:14 -0800 (PST)
MIME-Version: 1.0
References: <f6b7050dcfb07714fb3abdb89829a3820e6a555c.1673458121.git.piergiorgio.beruto@gmail.com>
In-Reply-To: <f6b7050dcfb07714fb3abdb89829a3820e6a555c.1673458121.git.piergiorgio.beruto@gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 12 Jan 2023 15:45:03 +0100
Message-ID: <CANn89i+Y-j4RSX7UQO+P6sB9WGsA8ZDb+ruqEv-iJKtzEvGstQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/1] plca.c: fix obvious mistake in checking retval
To:     Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
        mailhol.vincent@wanadoo.fr, sudheer.mogilappagari@intel.com,
        sbhatta@marvell.com, linux-doc@vger.kernel.org,
        wangjie125@huawei.com, corbet@lwn.net, lkp@intel.com,
        gal@nvidia.com, gustavoars@kernel.org, bagasdotme@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 11, 2023 at 6:30 PM Piergiorgio Beruto
<piergiorgio.beruto@gmail.com> wrote:
>
> This patch addresses a wrong fix that was done during the review
> process. The intention was to substitute "if(ret < 0)" with
> "if(ret)". Unfortunately, in this specific file the intended fix did not
> meet the code.
>

Please add a Fixes: tag, even for a patch in net-next

Fixes: 8580e16c28f3 ("net/ethtool: add netlink interface for the PLCA RS")

> Signed-off-by: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
> ---
>  net/ethtool/plca.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/net/ethtool/plca.c b/net/ethtool/plca.c
> index d9bb13ffc654..9c7d29186b4e 100644
> --- a/net/ethtool/plca.c
> +++ b/net/ethtool/plca.c
> @@ -61,7 +61,7 @@ static int plca_get_cfg_prepare_data(const struct ethnl_req_info *req_base,
>         }
>
>         ret = ethnl_ops_begin(dev);
> -       if (!ret)
> +       if (ret)
>                 goto out;
>
>         memset(&data->plca_cfg, 0xff,
> @@ -151,7 +151,7 @@ int ethnl_set_plca_cfg(struct sk_buff *skb, struct genl_info *info)
>                                          tb[ETHTOOL_A_PLCA_HEADER],
>                                          genl_info_net(info), info->extack,
>                                          true);
> -       if (!ret)

Canonical way of testing an error from ethnl_parse_header_dev_get() is:

if (ret < 0)
    return ret;


Please double check for the rest of the patch (ethnl_ops_begin() ... )


> +       if (ret)
>                 return ret;
>
>         dev = req_info.dev;
> @@ -171,7 +171,7 @@ int ethnl_set_plca_cfg(struct sk_buff *skb, struct genl_info *info)
>         }
>
>         ret = ethnl_ops_begin(dev);
> -       if (!ret)
> +       if (ret)
>                 goto out_rtnl;
>
>         memset(&plca_cfg, 0xff, sizeof(plca_cfg));
> @@ -189,7 +189,7 @@ int ethnl_set_plca_cfg(struct sk_buff *skb, struct genl_info *info)
>                 goto out_ops;
>
>         ret = ops->set_plca_cfg(dev->phydev, &plca_cfg, info->extack);
> -       if (!ret)
> +       if (ret)
>                 goto out_ops;
>
>         ethtool_notify(dev, ETHTOOL_MSG_PLCA_NTF, NULL);
> @@ -233,7 +233,7 @@ static int plca_get_status_prepare_data(const struct ethnl_req_info *req_base,
>         }
>
>         ret = ethnl_ops_begin(dev);
> -       if (!ret)
> +       if (ret)
>                 goto out;
>
>         memset(&data->plca_st, 0xff,
> --
> 2.37.4
>
