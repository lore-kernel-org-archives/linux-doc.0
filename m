Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44E5C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 08:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbiG1IxX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 04:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234973AbiG1IxO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 04:53:14 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E43565572
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 01:53:13 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id tk8so1995757ejc.7
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gaVPhbgEcxlsnqy93D4Iqlgm1JoP80V03xVr6Y088CI=;
        b=XP8Ooee/+br+mq6qm1WNXd+xDVeZsfA/vbGdsjcNDfavOrVVaLAxRZee8vsTCFD6LA
         XKaSHJPEhZPWBCBRykmPUONEhuxHgZNuZXsWl7vUNGh5NNGlGKJ9GvNmQcgMpd41rTo/
         A26sc1LUfOkcXMpTlh3euxjoHwC3Kj4oHhHDQoSOQMmk+ytcK4cbtSWEGKsgpT+iRqQZ
         iRMrxfwOWQqu8mS51Nm2b3sald9sbDmD/FbH7/NG9QaGDxDpMQEwsBH8Ty9Skxam/U74
         9ap1Y4ufx7ROSEma+ViN2rlQ2bqiraedr7Z2RwL5mgRsZZY0tbYP9aJCpkS0tkb+Jk0y
         DTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gaVPhbgEcxlsnqy93D4Iqlgm1JoP80V03xVr6Y088CI=;
        b=K2wIusadiW+RW1/PIbEIyTiKZ445x8wxj9P8K/yPLnSQGo99rLY4q3uZPJy+tu84h/
         y2l0yS/sjetB4T+39jSdTzpmQac5kWy1JoQXNjtmK8LnroB4Y6o/z0SiT8YqElHmbIOl
         ojyT7r1mdgJOHHnjAcx1kmTly2xORu6Hs2iIZwULrWQO9/cmJT2ieMv3u/+TP7Ru/onj
         R2MNI9U3Kj2lDzX8VRJu8NwhXtWNMNNZv8eteIabsgO+KpKMwdv9bNpswOlu3PPzt9m5
         QehHvglcfGshbFQWMyJz8MrixNomxNP+v3HQ7cWe5ZYih2rzVoJvPdRz186sqqZvcm2J
         wmEg==
X-Gm-Message-State: AJIora8f0KCPussbGu1jfnXgFvyAC+d6oGKdfpuTxznbhj/RjqsMFeIh
        jmF9UBoqFBH+kJjAt1gK0q6L4A==
X-Google-Smtp-Source: AGRyM1tMvLweNH+Ko8tTPb/utW+S+fqRSVtWDBfjWyuKttil9/fE6lm+qvuTEf5Xm8vEmG6KaSJf0Q==
X-Received: by 2002:a17:907:6096:b0:72f:1d74:b71b with SMTP id ht22-20020a170907609600b0072f1d74b71bmr20821611ejc.272.1658998391795;
        Thu, 28 Jul 2022 01:53:11 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id a26-20020a05640213da00b0043a554818afsm295576edx.42.2022.07.28.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 01:53:11 -0700 (PDT)
Date:   Thu, 28 Jul 2022 10:53:10 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     jiri@nvidia.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        dsahern@kernel.org, stephen@networkplumber.org,
        edumazet@google.com, pabeni@redhat.com, ast@kernel.org,
        leon@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        michael.chan@broadcom.com, andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next v9 2/2] bnxt_en: implement callbacks for devlink
 selftests
Message-ID: <YuJOdsgzqlzPAZZn@nanopsycho>
References: <20220727165721.37959-1-vikas.gupta@broadcom.com>
 <20220727165721.37959-3-vikas.gupta@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727165721.37959-3-vikas.gupta@broadcom.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Jul 27, 2022 at 06:57:21PM CEST, vikas.gupta@broadcom.com wrote:
>From: vikas <vikas.gupta@broadcom.com>
>
>Add callbacks
>=============
>.selftest_check: returns true for flash selftest.
>.selftest_run: runs a flash selftest.
>
>Also, refactor NVM APIs so that they can be
>used with devlink and ethtool both.
>
>Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
