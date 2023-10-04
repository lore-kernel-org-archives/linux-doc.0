Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA6FE7B5EA
	for <linux-doc@archiver.kernel.org>; Wed,  4 Oct 2023 10:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbjJDKlr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Oct 2023 06:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbjJDKlq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Oct 2023 06:41:46 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B1EAC
        for <linux-doc@vger.kernel.org>; Wed,  4 Oct 2023 03:41:41 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53636f98538so3451873a12.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Oct 2023 03:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696416100; x=1697020900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UzXarj/dIrLAH4tPhBh7BzTA1z+2WH5X+IxGm0B65kk=;
        b=T/zXgeT6z6FNVR/DpzhL5vkl53Fs6zDhInbzmklFqSVzlqvJtMfbpJRf2yuvOL41/h
         aV13GoWIPIB/flXQLSBF+2tY6WFfi37t5CBzs4x18OZzR3p19KcKNWaMlvP/6EMeQgwt
         batpT45rM0YprrV3jvhkBEy3yqsxaKQskMnMnxJtQcEjFxFXdYV761S/7HqioUW9GAC+
         5oB+Ip46bLQ0Sq8bLVhiwwhRNNtsX+9C28cV5/XsmIc2GRiCARf7mGkEIkLSbxVHTiag
         FRS+UTYedZGfR1/o4np00II2ah/9LWJqP7cToOxz9Y9mByJ2mFBXpA6i2GJ9l8hJ1Cvq
         +MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696416100; x=1697020900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzXarj/dIrLAH4tPhBh7BzTA1z+2WH5X+IxGm0B65kk=;
        b=TUjOK0waqm3i4sjeRQ4BeURpiS4ogwDJMEa8c4TQS8HYZ7RU1iReh4EVTUtOt46du1
         ds7H0jdvI4DofOaWVrJoCuwmLtNL7G4lBoW8VBLUXn4VxM3JzgjnbpCuKlbhkfWGkkeV
         Vi7/S+sy9z2oqvROs+k2B2bwq8PsarZepYTWZrB4oKCGpHlvzowSCTRir8kQAyw8d4E8
         MFgoPRLLRGpJdJ9NWtBHrTn1QNfzLc0vlKQ2tVfphPVbHxJyaT6/8DEk90bxSZSEzMh4
         7TkPKFwBj/pfcFJWJ0pRoED2zTkXWFzcGq3cj2fIFyw+ESjYCY0Xip46Kxp11CDqyUxE
         aM/g==
X-Gm-Message-State: AOJu0YzQibiqqk2tTv4TOa2eTQMwuztzvaLC6jy/N5wFGbH4oGynd6ku
        8puN1NcHmd52mlcN6WLOOc/a2Q==
X-Google-Smtp-Source: AGHT+IHLpWQ5S4hZp+7IuOHxp4blL7eubhAEfZYoixgG+l4TPda7KJJaiRndD6JAp2v+zJQCW100Kg==
X-Received: by 2002:a05:6402:1257:b0:530:c363:449c with SMTP id l23-20020a056402125700b00530c363449cmr1453487edw.40.1696416100316;
        Wed, 04 Oct 2023 03:41:40 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id g13-20020a50ee0d000000b0051e1660a34esm2227535eds.51.2023.10.04.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 03:41:39 -0700 (PDT)
Date:   Wed, 4 Oct 2023 12:41:37 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v2 2/5] dpll: spec: add support for pin-dpll
 signal phase offset/adjust
Message-ID: <ZR1BYQuSfdMdDimH@nanopsycho>
References: <20231004090547.1597844-1-arkadiusz.kubalewski@intel.com>
 <20231004090547.1597844-3-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004090547.1597844-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Oct 04, 2023 at 11:05:44AM CEST, arkadiusz.kubalewski@intel.com wrote:
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

Could you reply to my comment about this in V1 please?
