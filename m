Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B46E784B7
	for <linux-doc@archiver.kernel.org>; Mon,  2 Oct 2023 14:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237876AbjJBOxd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Oct 2023 10:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237894AbjJBOxc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Oct 2023 10:53:32 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC6AB7
        for <linux-doc@vger.kernel.org>; Mon,  2 Oct 2023 07:53:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53808d5b774so3860529a12.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Oct 2023 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696258406; x=1696863206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Io8DiXqjSfTqepUgkoeQXJPEkLkiVe5602Ih+UtiRhc=;
        b=f/xLVPeBV+9eJvKYvh3WfL6mje4+7R8/p3/3FvEzCSDYjwHHn23aOgqS7x19LfyFit
         JE4IyT3At1UpFCfbAT8eZv6z5WSotF+BWLC40ZGKTFj3t9xl1CTCjXajRoP2pMyJ41tV
         iwy2MbC8AiwlhIjV1FARvA5R+/4vN1Vb5dbfgN4ickVpIvR/0tZ7SS+P2pxe7tFjARE5
         Lua/pNojMpyH5zKqSBogqa+lSC2E9qmyjR6IJvYR4yjJhZKdV5xngyu+cbH4pBsxtvMw
         A1EIqMMab/H/8W8GPxmULVybQgD2aLQ+PYwNOGQaD5tIMcuSeMsMhHsbu6VjKgo3I2Nc
         00eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696258406; x=1696863206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io8DiXqjSfTqepUgkoeQXJPEkLkiVe5602Ih+UtiRhc=;
        b=FFT5i3yCtDQtRBqAqgHzdCAedFVKMfKy3Tz4b4hErODSbPysOIbrx9T6FZ3T5dFOmO
         fxTok1QKoHVgwDBhHbW1P517uctWdqEBINJL43RoyfIxUtO99Cy9RWFh1bU+xiOoQvqC
         pLvA7i6JHIkG9fd3musR4h3l9qxhyxZMkYHe5iN+NXHsmSRQPqHc6c6egi/6xefg+ncU
         ouvEk+5twtKURoOz5KEOxuaTpz16NUYAujkNsC9cSn+FE07YfcIUSvQTg4tNargjLq9q
         cgWlrx2srn+svkF79pZ0L6Ed0+59xJQvSZ6Dd9pc7wrfg5GosnuHUStBnuh4kVlrJuGJ
         eEjw==
X-Gm-Message-State: AOJu0YwxJDhwmHS4CB8S1r5YqBMpmsoTtkNtRCbgjfgrddLuKyQpgHVF
        PQYLWc2o/quHrvpdE50KzQ8pSA==
X-Google-Smtp-Source: AGHT+IGLdofiABYnVTHaKEqx4FAGXdzNwFEC1xhDWk5ks3eDjq8Ai96j3n5CHrYeigrr56gl72n0Wg==
X-Received: by 2002:a05:6402:1481:b0:530:5465:ad6d with SMTP id e1-20020a056402148100b005305465ad6dmr9956304edv.2.1696258406261;
        Mon, 02 Oct 2023 07:53:26 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id cy23-20020a0564021c9700b005362c9905b2sm6638316edb.35.2023.10.02.07.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:53:25 -0700 (PDT)
Date:   Mon, 2 Oct 2023 16:53:24 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next 2/4] dpll: spec: add support for pin-dpll signal
 phase offset/adjust
Message-ID: <ZRrZZDDvuifWhDeL@nanopsycho>
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
 <20230927092435.1565336-3-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927092435.1565336-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Sep 27, 2023 at 11:24:33AM CEST, arkadiusz.kubalewski@intel.com wrote:
>Add new pin's attributes to dpll netlink spec:
>- phase-offset - measured difference between phase of signals on pin
>  and dpll
>- phase-adjust - adjustable value of pin's signal phase
>- phase-adjust-min / phase-adjust-max - values for determining limits
>  for phase-adjust
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

How is this supposed to work. You bump the version with every uapi
extension? First time I see this.

[...]


>diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
>index 20ef0718f8dc..050f51b48ef8 100644
>--- a/include/uapi/linux/dpll.h
>+++ b/include/uapi/linux/dpll.h
>@@ -7,7 +7,7 @@
> #define _UAPI_LINUX_DPLL_H
> 
> #define DPLL_FAMILY_NAME	"dpll"
>-#define DPLL_FAMILY_VERSION	1
>+#define DPLL_FAMILY_VERSION	2
