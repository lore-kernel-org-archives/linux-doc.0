Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A83C636CC
	for <linux-doc@archiver.kernel.org>; Wed,  8 Feb 2023 14:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjBHOkV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Feb 2023 09:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbjBHOkT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Feb 2023 09:40:19 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC6524C9D
        for <linux-doc@vger.kernel.org>; Wed,  8 Feb 2023 06:40:18 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id p9so5763026ejj.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Feb 2023 06:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s9SqKFTGfsUhK0VGlIsx60gznbUo1PU0OFbxtN+0yhY=;
        b=jlgyWpaKF22lnEWRYaSMF+UNOB3z0G1RMdUbmlRI+Sn+XY7EcL2OaAXMRtthMX0cGA
         VcfB5lzzmIVNPdBYBoMGkDDarSXgB05dS39oTh3whI2tVG2moG3YBcbyvzOANJc3YYWs
         ZYPzZH+qVHzYuZtHwjVRcGrBvHR8meM3Xk1HCy2l0ltsqqN9VjLm9fvdd6FR2bEDrR/K
         OiFg/G3RkI5an3wnecmurwZg3szYm8hS8lRv+N0R72MFFcz2qiyRW0Zcdv7g9fJva6LF
         NLwEQNCbzhoFWxd2UmK0JHzTH1gH0LCg4rQ1TCu262/HIY1FvTuAPT2ZmvqlmbwxqQEX
         Vmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9SqKFTGfsUhK0VGlIsx60gznbUo1PU0OFbxtN+0yhY=;
        b=s+7Rnf5YnPaSXX0qE37sVG7i/QVqcCTIHp0U7z+KA1RaKZQwEMTrpu6LcY36MwLK65
         JC8s46pLWyLP3HvqGtocJFxezvq93SXanmK1L6jVvqKLx2B/JRGWFHhKTL2pNqHwWlmD
         IojIgsTEidsF4k2d0bexEtV9/RYV6+K3xMHGcrd3ynziyuT11cvZW+pFtFRq4mefWXvr
         JquAM/oOiEPYyRssq8UvaEI3hlPT2o8OIHrHlFgJzYyp4CyNTI8yVEd2hodywTWtWQJ5
         1kqQQydYqWxrP4SLi8ulldlxl1rn1IeloNY0UW+tFXI6be6iOC5Ql674df58GngJfni5
         HSSQ==
X-Gm-Message-State: AO0yUKUX56CKEU7NcA1BQq+VTVJ4lwGzdufobWD/+iSH3rb31yl0VeWK
        jgaaG9pGU0e9NUpJKDUAPWuDmg==
X-Google-Smtp-Source: AK7set/0gSIA4pnaYhxPIic71u2qEnu5SyAeHnJiEtpWOHAq/G7JK0KqaH8e6Q582tOxHN4nPJPDsA==
X-Received: by 2002:a17:906:8d0e:b0:8ae:30bb:a12c with SMTP id rv14-20020a1709068d0e00b008ae30bba12cmr2281175ejc.28.1675867217938;
        Wed, 08 Feb 2023 06:40:17 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id fp3-20020a1709069e0300b008aea5e0938esm654244ejc.183.2023.02.08.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:40:17 -0800 (PST)
Date:   Wed, 8 Feb 2023 15:40:16 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     alejandro.lucero-palau@amd.com
Cc:     netdev@vger.kernel.org, linux-net-drivers@amd.com,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        edumazet@google.com, habetsm.xilinx@gmail.com,
        ecree.xilinx@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net,
        jiri@nvidia.com
Subject: Re: [PATCH v6 net-next 8/8] sfc: add support for devlink
 port_function_hw_addr_set in ef100
Message-ID: <Y+O0UE2Drm3iyZE/@nanopsycho>
References: <20230208142519.31192-1-alejandro.lucero-palau@amd.com>
 <20230208142519.31192-9-alejandro.lucero-palau@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208142519.31192-9-alejandro.lucero-palau@amd.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Feb 08, 2023 at 03:25:19PM CET, alejandro.lucero-palau@amd.com wrote:
>From: Alejandro Lucero <alejandro.lucero-palau@amd.com>
>
>Using the builtin client handle id infrastructure, add support for
>setting the mac address linked to mports in ef100. This implies to
>execute an MCDI command for giving the address to the firmware for
>the specific devlink port.
>
>Signed-off-by: Alejandro Lucero <alejandro.lucero-palau@amd.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
