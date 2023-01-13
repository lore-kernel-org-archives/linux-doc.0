Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB7EC54EBD
	for <linux-doc@archiver.kernel.org>; Fri, 13 Jan 2023 13:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241663AbjAMNi2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Jan 2023 08:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241687AbjAMNiG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Jan 2023 08:38:06 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F20C3DBF5
        for <linux-doc@vger.kernel.org>; Fri, 13 Jan 2023 05:32:13 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4d19b2686a9so156896117b3.6
        for <linux-doc@vger.kernel.org>; Fri, 13 Jan 2023 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=No+5RPSlt/2AA9DS36alYfiIviplsrD4U7z1/DjK3kw=;
        b=VJodeieRVB3/PNGRPY0aEuQS+oK4CIr7AMdUy5heO7OE7pVFTK1A164V81193yuMKY
         o0oUSJN0YXwRO9v+Ezx7Gqn/ryTWa//kwbqXH3tngvFiYZGyvgx8YIiykr/aNB1DW48e
         N0GbzuKPFr92tZyDVjjUmcOMVYyyySKxOlloYTGTinRJW/jHY6W1Ks5OY2dsvq2+RNlC
         zByCYr+/SoxFMEY29qhMwONLMsOUIXHsGRC0yYIZO6xlP9PwBZYL/QzSCItRcijl/ECw
         d67/fCqKvUg15ic9ZBUdQDMG1O2qlcwbgzC0LiRIPvIv+3nnIOosPA/oyQqI12S6iRlD
         98PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=No+5RPSlt/2AA9DS36alYfiIviplsrD4U7z1/DjK3kw=;
        b=TJ5CWfRn/pCRkqQ1zpMPcbJX+8Crri/Zj9UW6uOKSQTJTUNZsIDvzJJHPHOCQ3cqXk
         e6u/dcPyDmGBIkEmfye5DGlorvYhpc26A9M1Ljse4ssvqwMj04FzmicHpL7Uy+1BQ9lA
         LiPFMNG1Rb1gAT0loyaYe+3a0+xRYwanwxtVKoVQDRvgVeZFNuN3+4kY3B0VF7itZzbb
         GnGdm93cNq16oeKcwdPWb9cBVyMDRuoGqmLT++A6K/cwCEQKPQEhm5Y0ns4BH1O4YOV5
         OGuVYsT+HcBHSUDlJ3VoVOHfrHXnXSEp93wN8+/3EwJO9/MzUyZL0nCAT6siBzCXz7+D
         or4w==
X-Gm-Message-State: AFqh2kobNPuQiWRvt/ty+BZizyJ/1BmXa9kWb9j2JEbRKZbLuKwKwwiy
        vmNisB3xcc6Ifx2BokJd5g5cf/mzsV3GwnNvYkZnVQ==
X-Google-Smtp-Source: AMrXdXuSKQsOMei1jTS5XnCajfRHRM/lBu1DeqBAVORpif81/tgq+9lb2f2D2pRAJV8vNH24eG1wgdez+fAcuOgg8ic=
X-Received: by 2002:a81:6d85:0:b0:3f2:e8b7:a6ec with SMTP id
 i127-20020a816d85000000b003f2e8b7a6ecmr2828684ywc.332.1673616732259; Fri, 13
 Jan 2023 05:32:12 -0800 (PST)
MIME-Version: 1.0
References: <f2277af8951a51cfee2fb905af8d7a812b7beaf4.1673616357.git.piergiorgio.beruto@gmail.com>
In-Reply-To: <f2277af8951a51cfee2fb905af8d7a812b7beaf4.1673616357.git.piergiorgio.beruto@gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Fri, 13 Jan 2023 14:32:01 +0100
Message-ID: <CANn89iJajiWoi4qv6=VvcrgBFhRHFbc7Dy7Mbic+j=gBsWgt3g@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 1/1] plca.c: fix obvious mistake in checking retval
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

On Fri, Jan 13, 2023 at 2:26 PM Piergiorgio Beruto
<piergiorgio.beruto@gmail.com> wrote:
>
> Revert a wrong fix that was done during the review process. The
> intention was to substitute "if(ret < 0)" with "if(ret)".
> Unfortunately, the intended fix did not meet the code.
> Besides, after additional review, it was decided that "if(ret < 0)"
> was actually the right thing to do.
>
> Fixes: 8580e16c28f3 ("net/ethtool: add netlink interface for the PLCA RS")
> Signed-off-by: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Eric Dumazet <edumazet@google.com>
