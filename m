Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A363DC04A68
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 12:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbiG0McU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jul 2022 08:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiG0McE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 08:32:04 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A865D4E626
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 05:31:15 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id q18so13527147wrx.8
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=erHrsw6rx2cxfDpAMMFXOYwGx+RlIoQlrWv6VPVmqBU=;
        b=X4H2JEkXIQu3OQs6tWn6bmgy4abRbCGKqwr0by640V4rrKsqjeBGPm+9LapHJh++la
         caZ/PlWKaU03cxkIL8jgtKTTVgtHtVEksTzmDATeIK5LQFzF47B+tUsn4V7lfqNcfzZ5
         hXqpe9A6T7++B0E90IOQ2b/iIWf0HQYYDznWZXpr66t4opRQiOZTzfX9ycveVY79yBuy
         /TNrXpYzJikxH7Xi5sgOnl51E8VAkSNCKVunHMpPuODAcul5c44prgRD/v4xhyUwVD+H
         MzvEChIVgGT7LCJdfbX8hBA9W9dHCAhdx2fNhGGIJ0mMMsqWWPmBXjSe1DdO+wrl7btX
         9e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=erHrsw6rx2cxfDpAMMFXOYwGx+RlIoQlrWv6VPVmqBU=;
        b=rjxKPVqZxWOoLbZqQW3cn66ExsVLk7Byp/V2F+OATPUXnM3hOyAv3fQQQr/SD+4S2d
         KRIyI4ao4wvAQrozgnQv/25Q7269rNVXRdQ6Fjgk2yD5Nikt/JCp/nS2OBqOyPP38r6r
         7HToQvvSG/lqs84r0wgm0gIJMBdZ2EaE431yGGxvGV0jATtpvnbbLVcP9XjHmgpqsa3Z
         V87xql8ywDOgtKR0NwKqIyN1+dRn3kE3M9LtlHNdNQ7ImacLX9EYw6fBweWGituCOtps
         NygsV1QHNoZ6n3VKuizWmaPHMBv5gu5CNatyO90jRBor0E4prmUrvw+Wlq6+RIGWjqTQ
         pMnA==
X-Gm-Message-State: AJIora/T57f5K5Ie/cW1dprbBb8RBAEHbA59Ucq00Q5yrzfFFzf4kVNx
        W+Ed3h8kKqUzrgQZWqGK8I0RQg==
X-Google-Smtp-Source: AGRyM1uinvlsoh897/QB1bvZSH8+ZWjX1NMSYI1/GyMvRcbtmknUzQnJsv8nyud3rCEMUQX+9GWJ1w==
X-Received: by 2002:a05:6000:2aa:b0:21d:ac4b:95af with SMTP id l10-20020a05600002aa00b0021dac4b95afmr13898546wry.479.1658925070708;
        Wed, 27 Jul 2022 05:31:10 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d6a82000000b0021eb70e5edbsm3184388wru.97.2022.07.27.05.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 05:31:09 -0700 (PDT)
Date:   Wed, 27 Jul 2022 14:31:08 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     jiri@nvidia.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        dsahern@kernel.org, stephen@networkplumber.org,
        edumazet@google.com, pabeni@redhat.com, ast@kernel.org,
        leon@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        michael.chan@broadcom.com, andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next v8 1/2] devlink: introduce framework for
 selftests
Message-ID: <YuEwDO799IHKNoUa@nanopsycho>
References: <20220727092035.35938-1-vikas.gupta@broadcom.com>
 <20220727092035.35938-2-vikas.gupta@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727092035.35938-2-vikas.gupta@broadcom.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Jul 27, 2022 at 11:20:34AM CEST, vikas.gupta@broadcom.com wrote:
>Add a framework for running selftests.
>Framework exposes devlink commands and test suite(s) to the user
>to execute and query the supported tests by the driver.
>
>Below are new entries in devlink_nl_ops
>devlink_nl_cmd_selftests_show_doit/dumpit: To query the supported
>selftests by the drivers.
>devlink_nl_cmd_selftests_run: To execute selftests. Users can
>provide a test mask for executing group tests or standalone tests.
>
>Documentation/networking/devlink/ path is already part of MAINTAINERS &
>the new files come under this path. Hence no update needed to the
>MAINTAINERS
>
>Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
