Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A17C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 08:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbiG1IxG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 04:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbiG1Iw7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 04:52:59 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56913655A3
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 01:52:55 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id f15so1318633edc.4
        for <linux-doc@vger.kernel.org>; Thu, 28 Jul 2022 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YD6NPTofpdb/OrV3lCoLvgZH39SrPlv9LDKkq27yBCM=;
        b=oIGxfaWcIK+hri1iHnKvFAesDsOuKPk0Myl06X68CL93PRk2wQPtuG9zPOvIUx15Eh
         hqu0jwxKwXrrTZS9bj2jbk68OjG29FixhiqoJx88mykK9fDbu3xYoPY15znFaa17EzGw
         mhZZZ2JOUHpjPI8Ci5PMSCOru8HFIRHlQj73+WBTSjw4nCVILqj2LvdGJeEdepbEM87d
         bCw8KtxG0w38dYbyPSYU5CoNmzhFk32JW2zZBqDACm5cUTAdeoVMImQy7pzxY1lQGi3n
         nidIbtD3QCo6ikc4AoKyctg0cavpUoaLUBM77gBXItaoWeBzUrlQSDYzvyhpiY+Vyddy
         euVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YD6NPTofpdb/OrV3lCoLvgZH39SrPlv9LDKkq27yBCM=;
        b=aZZGb6lincn9GQbT/QdaC2JN7/aeD7bSlwJWv1KEGDB4Epe5RyswfpZ8dcXem4FqEM
         N9U4yS+embJvv+cd47mbGXguaN3ryKPww9oi2GnYzXILHwN4o7PI/crUEaz3UI4VUqnV
         SDSYR+DCABZshQ0HY4XXm9uN12iuNMdKVsqIj15d/hstE5SX+DQvBi+7CgVRPKMesGxo
         rHuG34508XAORKKjzuF/9zF5nzfApWWppw7VAvKltPQBRw089uIrYTlRdj3lcHDT1W25
         8/ez12dOkkRDAw2/hpkyM70L+t+dYFpfIuEA95eC8eqk57s7l65ZCM49B6XHfpjVKb1y
         NrRw==
X-Gm-Message-State: AJIora9ax6oPbf3GX2F7PTz+/h2YJnd2xnWZ6EjgPXQbOwbrwq2xHrAU
        XXAgOS61XgSLBGdsLPX+lXAxjQ==
X-Google-Smtp-Source: AGRyM1vy2El5ArOcpspPqyD6vzOa5X7VJhcpu8WOInv6X1q+4q5Veo+8cXQ8oYn1ClPZ/K6NkC2w4w==
X-Received: by 2002:a05:6402:5201:b0:43b:f621:3ce0 with SMTP id s1-20020a056402520100b0043bf6213ce0mr19966419edd.22.1658998373818;
        Thu, 28 Jul 2022 01:52:53 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709067cc500b0072aadbd48c7sm171996ejp.84.2022.07.28.01.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 01:52:53 -0700 (PDT)
Date:   Thu, 28 Jul 2022 10:52:52 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     jiri@nvidia.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        dsahern@kernel.org, stephen@networkplumber.org,
        edumazet@google.com, pabeni@redhat.com, ast@kernel.org,
        leon@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        michael.chan@broadcom.com, andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next v9 1/2] devlink: introduce framework for
 selftests
Message-ID: <YuJOZC5KjH1sfNov@nanopsycho>
References: <20220727165721.37959-1-vikas.gupta@broadcom.com>
 <20220727165721.37959-2-vikas.gupta@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727165721.37959-2-vikas.gupta@broadcom.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Jul 27, 2022 at 06:57:20PM CEST, vikas.gupta@broadcom.com wrote:
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
