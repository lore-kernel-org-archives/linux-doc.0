Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A116E7D08C
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 04:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750727AbeFDEEt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 00:04:49 -0400
Received: from mail-oi0-f68.google.com ([209.85.218.68]:39308 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750723AbeFDEEs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jun 2018 00:04:48 -0400
Received: by mail-oi0-f68.google.com with SMTP id t22-v6so23782697oih.6;
        Sun, 03 Jun 2018 21:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=p7XfYdqMPa5G3o47AX+sSZBeHvSXKVVoW2x7ulixaRU=;
        b=N/b1QcCk5D7bP89usZCfHA9MqZVmwS3Fjll0BOJPiH4fZyQv7i3fxOFmeqtto5X7p9
         g/vyWtwBOUrpOL5cV7odTFTGeZk8dQpPWZ7RWfuJJsYgt/FVh9bfb3aqBrKDhVgHczaF
         +czS7XX8Luk2ELJCS1kUbK1oIzrzLwwRgIwH152/iYuiMnjHC9ZaU9tOOA66+zo24ubg
         fb9EYAB5RF8ftaJwky5xru2n30FqQotL7NEF4DR0upgP4NPIpWqe073ml/zx2aQ+bUNr
         n6UW/su+YygBe0TaNDrqqFH5q+lo6fE96UYLcTw4Sk5ZFbvaE9JxwP0PjGJZ54a4lcu/
         uphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=p7XfYdqMPa5G3o47AX+sSZBeHvSXKVVoW2x7ulixaRU=;
        b=OgujAH2c09aUoJpwiSmf4+QUG7ISai92c2WMeY+Zn2CeiMQZeasjD73rW54toBjO5e
         X6qz6d/7lvsjkWaoqEg7ySiqEg49jMmHBuqEi9cfAnemTY52mMPp47f7WTQpxMk1G3nv
         tp0l0lLbL77vU5YV8iYEX63bOs956X32oED4IRIi2UVKXuc91U0lWhWUmc52D91DdUH1
         CWYEeJjYd1/mb2DiPflwZnKgWfonhKoUMVqwRYdd0uGCBpznbBBQXhAZeQhkH8p8cRRE
         zL9fC4hKTdS5ATGN0PYGkwwpQqvOthq4qkmQSpf1OW5q1L3wfwQL2Dsd/JhGouwtsFyL
         BFgw==
X-Gm-Message-State: APt69E3x1wrAy6RwLokFXdKpuaCUcDzs9Xf7EAI1FosoOOOIC5W+jpwn
        tOyVGb2rPCE3LcSIKEllHg70/U5cE8qXNk6hbos=
X-Google-Smtp-Source: ADUXVKI4DbB4z+8Sl645eLjTpqg367ZjVFTOflWqb0Cbt+r3JWycdqxwAuBU0QjCy5gHIo5hZHIdpnN/xocX7iE0BFo=
X-Received: by 2002:aca:f594:: with SMTP id t142-v6mr6159077oih.56.1528085087688;
 Sun, 03 Jun 2018 21:04:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7a83:0:0:0:0:0 with HTTP; Sun, 3 Jun 2018 21:04:47 -0700 (PDT)
In-Reply-To: <20180516045518.6876-1-ganapatrao.kulkarni@cavium.com>
References: <20180516045518.6876-1-ganapatrao.kulkarni@cavium.com>
From:   Ganapatrao Kulkarni <gklkml16@gmail.com>
Date:   Mon, 4 Jun 2018 09:34:47 +0530
Message-ID: <CAKTKpr4NycrojxFFZ+SvP0YYHrhTMyDfLi9qHG9i8ekkbUjZoA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add ThunderX2 SoC Performance Monitoring Unit driver
To:     Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <Will.Deacon@arm.com>, jnair@caviumnetworks.com,
        Robert Richter <Robert.Richter@cavium.com>,
        Vadim.Lomovtsev@cavium.com, Jan.Glauber@cavium.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mark,

can you please share your review comments?

On Wed, May 16, 2018 at 10:25 AM, Ganapatrao Kulkarni
<ganapatrao.kulkarni@cavium.com> wrote:
> This patchset adds PMU driver for Cavium's ThunderX2 SoC UNCORE devices.
> The SoC has PMU support in L3 cache controller (L3C) and in the
> DDR4 Memory Controller (DMC).
>
> v5:
>      -Incroporated review comments from Mark Rutland[2]
> v4:
>      -Incroporated review comments from Mark Rutland[1]
>
> [1] https://www.spinics.net/lists/arm-kernel/msg588563.html
> [2] https://lkml.org/lkml/2018/4/26/376
>
> v3:
>      - fixed warning reported by kbuild robot
>
> v2:
>      - rebased to 4.12-rc1
>      - Removed Arch VULCAN dependency.
>      - update SMC call parameters as per latest firmware.
>
> v1:
>      -Initial patch
>
> Ganapatrao Kulkarni (2):
>   perf: uncore: Adding documentation for ThunderX2 pmu uncore driver
>   ThunderX2: Add Cavium ThunderX2 SoC UNCORE PMU driver
>
>  Documentation/perf/thunderx2-pmu.txt |  66 +++
>  drivers/perf/Kconfig                 |   8 +
>  drivers/perf/Makefile                |   1 +
>  drivers/perf/thunderx2_pmu.c         | 965 +++++++++++++++++++++++++++++++++++
>  include/linux/cpuhotplug.h           |   1 +
>  5 files changed, 1041 insertions(+)
>  create mode 100644 Documentation/perf/thunderx2-pmu.txt
>  create mode 100644 drivers/perf/thunderx2_pmu.c
>
> --
> 2.9.4
>

thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
