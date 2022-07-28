Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6796CC19F21
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 08:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbiG1Iwu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 04:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235162AbiG1Iwo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 04:52:44 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443A365571
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 01:52:40 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l23so2005417ejr.5
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FqzBIpco+9REM7U8y6zxhn5MuMhFRGjp1tpsdxTGmUY=;
        b=mzGclTVD9lpKjBkPUykLcQ+rSqkbUkytAJ+sD2aaFOi7GO+aDgVHOAlQRqL964v6vh
         uF16IraKaOrLEWpUx54sDlwZuLEqVCxeljxJOJGcieVDfNKmns4I0slukPBZMb+QGGHE
         6RMqaaF6kVit3AOYq9Iqrbf+Xo2VZXjUxp33KaOq6eHlDSkeI/cwLAHiLrjDGtS2F54T
         Icc7qR/puV1KslGo+AsKKHBwUNeFJ4v7qBFHQxvVgUVUgYRtPdFHQSRsBcslSnJje1PL
         E+nlTuHPvSBuBHoYK9hOlx7m8BbmqTSqhZg+G9w/sdf5fBOSufYDagCYs4ymtbxuGxyo
         QC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FqzBIpco+9REM7U8y6zxhn5MuMhFRGjp1tpsdxTGmUY=;
        b=hWlsURGkl0orPyBohQ2OB1cyKX8VC344LBgn4tXkZvaH4H7vNvLxh4xKrgY5EEtvnw
         YFIRqyFUO9MljeIGYZKLh7xCFknuXFB9n1B208x/wroeCafiabijQolSbsNeRq87rXc4
         w2UCcfzd1czjaKGqGA6qi97QFkDf4AseSuUzxd8rvIEq3VEwHFWwNRoTI3qhe6lm6Cz0
         VEnRe+UeijbRGM/AoZ+QUgGZvRNtmzeov8E1yUqd3kvo6zcgSH90HBMG0taYQsXXfX+V
         /DhZOyXZirjGvZCquYwOyKgEtbVXGAWp5ugU/eNQ82dzLAzjHn+7SEnUfBsOyDl+dPja
         9DSg==
X-Gm-Message-State: AJIora9lgqo/+ce4Q5nLttDgwDju3Rvk7auTMuLodnu8Ip3zKlt75bjh
        Ytm6VrFZFdbzINch+MtnenVMIg==
X-Google-Smtp-Source: AGRyM1sT7c6royvlZEvWdPGOb4u+ZmgK75s4K99kon+7UeMAqkDFTZ3CaoPjZ8h68taMGjTu+cTKnw==
X-Received: by 2002:a17:907:a428:b0:72b:6932:2ec7 with SMTP id sg40-20020a170907a42800b0072b69322ec7mr21005469ejc.540.1658998358568;
        Thu, 28 Jul 2022 01:52:38 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061d5500b007300d771a98sm165637ejh.175.2022.07.28.01.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 01:52:37 -0700 (PDT)
Date:   Thu, 28 Jul 2022 10:52:36 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     jiri@nvidia.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        dsahern@kernel.org, stephen@networkplumber.org,
        edumazet@google.com, pabeni@redhat.com, ast@kernel.org,
        leon@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        michael.chan@broadcom.com, andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next v9 0/2] add framework for selftests in devlink
Message-ID: <YuJOVOrAkb6c7ZGG@nanopsycho>
References: <20220727165721.37959-1-vikas.gupta@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727165721.37959-1-vikas.gupta@broadcom.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Jul 27, 2022 at 06:57:19PM CEST, vikas.gupta@broadcom.com wrote:
>Hi,
>  This patchset adds support for selftests in the devlink framework.
>  It adds a callback .selftests_check and .selftests_run in devlink_ops.
>  User can add test(s) suite which is subsequently passed to the driver 
>  and driver can opt for running particular tests based on its capabilities.
>
>  Patchset adds a flash based test for the bnxt_en driver.
>
>  Suggested commands at user level would be as below:
>
>changes from:
>v8->v9:
>    Only SOB line fixed in 2/2.

If nothing changes in the patches, you should retain the RVB tags from
previous version.
