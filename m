Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E7FE81DE9
	for <linux-doc@archiver.kernel.org>; Fri,  6 Oct 2023 12:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjJFMaO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 08:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbjJFMaN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 08:30:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63746121
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 05:30:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso376598866b.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Oct 2023 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696595403; x=1697200203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7B9CLKlUxsIh39zlkJAcrlPeYuSRY+4E8JtipU09tMs=;
        b=JMtW2IJI4zciA6Gos6E68QktuUC6h20tyT44OAFG30LH7QZB+XK1ayXz+GhAMB7sKu
         Drvp7HUDma+QrRxgcacXMVdKrdzQMx+vw5pr+mTYKL8yFNuRJ5bkG1cs4ttuVoCRXJwS
         QAfPnxsxXIofCQIpBDsS7v11BoTcmJf+iZUOnev2HJRESgxLajCuHpLIeXdT2qSR7WjZ
         G7dgfBqDxKuACMQRWFpFFvPi8+VpmOf6/W7zoktclfA3AV5XxEvrAnxv/REc+jez6nQB
         jkBuruFUFuUsUD4i+vKBTs+x/28CIoTiTTbgPTEsq+lYPmEU4UWEr+ChQweSs57i+lsY
         JOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696595403; x=1697200203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B9CLKlUxsIh39zlkJAcrlPeYuSRY+4E8JtipU09tMs=;
        b=RHMl5ZnlmKt9dXURkeCGEpNqyzEcsCsyIQEhArfjJnNt9TIppyXD2ATeKzACS/nXzc
         re3o/74iex2KJ/Wk00iH+bImZAQqpDDmyuwpc4tuEooLyFWOhZeE2qrUlATRBihI1Svp
         0JVWSGLj9PnJgs2VGxQqMeh3UnzASbIt21GHIdYvvNn4mCOo8U4ncpIydRHVF3WZNxEK
         v5hN4CdtRGAXBUgpTGXQmmFrDLF/TkRVd5gYWFfAmpqWhHxAENQsseUhAyHmlhlp/DNt
         Xt2ObxIQr5E27x1Tg40tV6pDvZecHGxlD4J4QyIgmV4x3CbAtTlmKIHFnr3cssuQAZUu
         AwpQ==
X-Gm-Message-State: AOJu0YzmZ/IzVCKr0XRHJBMFSkddS6tD0yuAqfg13C1rsMCjCYrkzlXL
        8w2t0fVQqB2Wrb67of7+kHwsGw==
X-Google-Smtp-Source: AGHT+IHe9lJ23bjLqmLRIXxnGNwvqvPXBegsmUly8qbAY3I43hhzINf4vHLPwy+eSvh/yaIjoc5ZFw==
X-Received: by 2002:a17:906:3012:b0:99d:e617:abeb with SMTP id 18-20020a170906301200b0099de617abebmr7096298ejz.23.1696595403416;
        Fri, 06 Oct 2023 05:30:03 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id rn4-20020a170906d92400b0099bc038eb2bsm2767264ejb.58.2023.10.06.05.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:30:02 -0700 (PDT)
Date:   Fri, 6 Oct 2023 14:30:00 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v3 2/5] dpll: spec: add support for pin-dpll
 signal phase offset/adjust
Message-ID: <ZR/9yCVakCrDbBww@nanopsycho>
References: <20231006114101.1608796-1-arkadiusz.kubalewski@intel.com>
 <20231006114101.1608796-3-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006114101.1608796-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Oct 06, 2023 at 01:40:58PM CEST, arkadiusz.kubalewski@intel.com wrote:
>Add attributes for providing the user with:
>- measurement of signals phase offset between pin and dpll
>- ability to adjust the phase of pin signal
>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>---
> Documentation/netlink/specs/dpll.yaml | 33 ++++++++++++++++++++++++++-
> drivers/dpll/dpll_nl.c                |  8 ++++---
> drivers/dpll/dpll_nl.h                |  2 +-
> include/uapi/linux/dpll.h             |  8 ++++++-
> 4 files changed, 45 insertions(+), 6 deletions(-)
>
>diff --git a/Documentation/netlink/specs/dpll.yaml b/Documentation/netlink/specs/dpll.yaml
>index 8b86b28b47a6..dc057494101f 100644
>--- a/Documentation/netlink/specs/dpll.yaml
>+++ b/Documentation/netlink/specs/dpll.yaml
>@@ -1,7 +1,7 @@
> # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> 
> name: dpll
>-
>+version: 2

I'm confused. Didn't you say you'll remove this? If not, my question
from v1 still stands.

