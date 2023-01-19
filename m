Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B214CC00A5A
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 17:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjASRHR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 12:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjASRHQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 12:07:16 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542FE4DCE8
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 09:07:15 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id c6so2910241pls.4
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIoubQobWT9SDlmXZyeV3lrFJY1R7YbmUbZNiWLFOTQ=;
        b=X0wU10cjz3ZqXt/Y1aXc1OYjePkPpGfQWQ4oRFQFeMXUmS5Nc+dfCy9z/+ZkX5uASr
         pkL+FTY7g/+tRbPiNRAs8pKLCRceqVKp7y6jGGA+fHk5tL5meJRHxwWt2qT9foTNXcnE
         nirv5NtZDubVkOS2zdxb+QdxFknk3nTC3a4lQ/PAF8/efH4syEei4p5h4X7c0gEwmhGm
         Bqo3ctvmlH3tqaNixfuv16cLptAXG3RZmKCmQRmFP+9wNB8fTLg1cBQxSDz2rHAE5dAK
         aHMleUSfC37l+qZ5TZDg3ap2X9lBtsHmGOUKc4amt5Xcz7MGAcB6F/QhBEUZJ2Qq2fxi
         8aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIoubQobWT9SDlmXZyeV3lrFJY1R7YbmUbZNiWLFOTQ=;
        b=enVTegP/6navZubd7nbsw20Wx9IaQafiTyneV5TEtMN10JOXNEyuTZkLv6apJxOZWE
         nOTddtavJyaZXeg1XejrsHbqjUCgJVTHFCoP1zCEn5ADQdfG9po0qCuSSCe49/nWbU1V
         iojZZ9owYmdVxVCvd0fxZn1P0jiayFmRcZaZkKO8fpVyPFa1AZYUmjVAwQaNx0zCIXxd
         0bznXd+DWs7iOgbYyxs0z30Q1gd4yGyP2xHkfowc2dph812Cw/ZbnbiB5rBIXCLpL6E4
         EVK+YPaFulK1qhIvEA+1AQPzqrXeT6q9Mbx5t44a32cCX+y1x5pRvS6enpvBn6S3MykR
         aTdg==
X-Gm-Message-State: AFqh2kqW7/MINkcC5n7+G1MpLQjMone1iQkLviqsdxfLPvO2jFXJkUSk
        JLCP7/ehqIj4CmgdEPU+4D5UKmSBZDRsNcmRZE442w==
X-Google-Smtp-Source: AMrXdXtRGFYjf3aV7knFnkqTHtIiGBdKPRuR0BembW5r2TA4ZhObda2gGwS6Iet7MyRtG4BetlXkIin1X2H79sUStd4=
X-Received: by 2002:a17:90a:2c4d:b0:229:2410:ef30 with SMTP id
 p13-20020a17090a2c4d00b002292410ef30mr1118117pjm.66.1674148034468; Thu, 19
 Jan 2023 09:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20230119003613.111778-1-kuba@kernel.org>
In-Reply-To: <20230119003613.111778-1-kuba@kernel.org>
From:   Stanislav Fomichev <sdf@google.com>
Date:   Thu, 19 Jan 2023 09:07:03 -0800
Message-ID: <CAKH8qBs_51bpUQK_xP6m6z-_i9vWexF3zCCnH2VEiPe2h3dzzA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/8] Netlink protocol specs
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, robh@kernel.org, johannes@sipsolutions.net,
        stephen@networkplumber.org, ecree.xilinx@gmail.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 18, 2023 at 4:36 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> I think the Netlink proto specs are far along enough to merge.
> Filling in all attribute types and quirks will be an ongoing
> effort but we have enough to cover FOU so it's somewhat complete.
>
> I fully intend to continue polishing the code but at the same
> time I'd like to start helping others base their work on the
> specs (e.g. DPLL) and need to start working on some new families
> myself.
>
> That's the progress / motivation for merging. The RFC [1] has more
> of a high level blurb, plus I created a lot of documentation, I'm
> not going to repeat it here. There was also the talk at LPC [2].
>
> [1] https://lore.kernel.org/all/20220811022304.583300-1-kuba@kernel.org/
> [2] https://youtu.be/9QkXIQXkaQk?t=2562
> v2: https://lore.kernel.org/all/20220930023418.1346263-1-kuba@kernel.org/

I think this is awesome and is definitely a step in the right
direction. I did a light review, nothing pops up, thanks for the spec
fields renamings.

If that helps feel free to attach:

Acked-by: Stanislav Fomichev <sdf@google.com>


> Jakub Kicinski (8):
>   docs: add more netlink docs (incl. spec docs)
>   netlink: add schemas for YAML specs
>   net: add basic C code generators for Netlink
>   netlink: add a proto specification for FOU
>   net: fou: regenerate the uAPI from the spec
>   net: fou: rename the source for linking
>   net: fou: use policy and operation tables generated from the spec
>   tools: ynl: add a completely generic client
>
>  Documentation/core-api/index.rst              |    1 +
>  Documentation/core-api/netlink.rst            |   99 +
>  Documentation/netlink/genetlink-c.yaml        |  318 +++
>  Documentation/netlink/genetlink-legacy.yaml   |  346 +++
>  Documentation/netlink/genetlink.yaml          |  284 ++
>  Documentation/netlink/specs/fou.yaml          |  128 +
>  .../userspace-api/netlink/c-code-gen.rst      |  107 +
>  .../netlink/genetlink-legacy.rst              |   96 +
>  Documentation/userspace-api/netlink/index.rst |    5 +
>  Documentation/userspace-api/netlink/specs.rst |  422 +++
>  MAINTAINERS                                   |    3 +
>  include/uapi/linux/fou.h                      |   54 +-
>  net/ipv4/Makefile                             |    1 +
>  net/ipv4/fou-nl.c                             |   48 +
>  net/ipv4/fou-nl.h                             |   25 +
>  net/ipv4/{fou.c => fou_core.c}                |   47 +-
>  tools/net/ynl/samples/cli.py                  |   47 +
>  tools/net/ynl/samples/ynl.py                  |  534 ++++
>  tools/net/ynl/ynl-gen-c.py                    | 2376 +++++++++++++++++
>  tools/net/ynl/ynl-regen.sh                    |   30 +
>  20 files changed, 4903 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/core-api/netlink.rst
>  create mode 100644 Documentation/netlink/genetlink-c.yaml
>  create mode 100644 Documentation/netlink/genetlink-legacy.yaml
>  create mode 100644 Documentation/netlink/genetlink.yaml
>  create mode 100644 Documentation/netlink/specs/fou.yaml
>  create mode 100644 Documentation/userspace-api/netlink/c-code-gen.rst
>  create mode 100644 Documentation/userspace-api/netlink/genetlink-legacy.rst
>  create mode 100644 Documentation/userspace-api/netlink/specs.rst
>  create mode 100644 net/ipv4/fou-nl.c
>  create mode 100644 net/ipv4/fou-nl.h
>  rename net/ipv4/{fou.c => fou_core.c} (94%)
>  create mode 100755 tools/net/ynl/samples/cli.py
>  create mode 100644 tools/net/ynl/samples/ynl.py
>  create mode 100755 tools/net/ynl/ynl-gen-c.py
>  create mode 100755 tools/net/ynl/ynl-regen.sh
>
> --
> 2.39.0
>
