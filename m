Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71295C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jul 2022 10:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbiGAKeT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Jul 2022 06:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbiGAKeS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jul 2022 06:34:18 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB5E6F350
        for <linux-doc@vger.kernel.org>; Fri,  1 Jul 2022 03:34:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id e2so2411297edv.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Jul 2022 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LTohJWI+b8uDyJSppZCdNGCHlPoufieuCJSkNbR6M3g=;
        b=m0tqTjW6xsrQk71fMcGeQH/PgiU+w9Vg5HbK6Y4kE53PkoPW/4W/2A3gER/xE0AX8L
         0WZWn5x3vxKLYy/GsbIkp/5mKIM5LZm6H8YhcpQBBatO8+MCgkFWnbhniqnE+C+OLNl0
         tsGyb0dO5JT0qcoxQsnz47ZIEkJO1dHXArG1HStFTKW0XShMBREE2qC+wL/jXgoZkDl5
         269dhwIf8ZIRzaKVOwnKGUpdKDWUtoVB8DFkxShg2q5pN777ILO5vAkEqSEpW0u3CKhf
         9yLlxnhr3iP/g1l4LIvckbzvxU8B3kxKrAUiKIumCcp2/XRovfcTyotmeY68dFqfvz08
         oQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LTohJWI+b8uDyJSppZCdNGCHlPoufieuCJSkNbR6M3g=;
        b=6rus1QZC+ZMuVMM8u6k5EfCvpzvGObolusrggvYZvacQgXXrrKpPcuNY25cRsLYf30
         zv6ib1xbTJiEED9IXfJuELs83eh/4c7KxIFyEj/mpkqOtZtZa2NCv/3nY/vxJseOPhkH
         o83og3qLumnAi9UEfHTDnU52ubD77korKhUx5STPFHve2tA9ed35qdr2PFAPIBjnFeM9
         W2NzlvcGJMDSPWk2oTmQ8MGQdmbacL1BiCZcvl7EJkO0MPC6ybXn9JGVs4DeVblLQE3T
         gdo5fNUACXqfOrRLeR96Fp6tMm+T1FNbddavjDiDUCaR0vTDo8YsvCR9Ne1ZIoPxB1K9
         4NzA==
X-Gm-Message-State: AJIora/dWcph9PZNwWuNpHhbONVgRkecshwEsJdDbDW2K1B4xTwSnlRq
        4i2mABLncw6+v4VFhGwz51o/Ww==
X-Google-Smtp-Source: AGRyM1t/5VvDyJJnN5HFs+lSVyqDnFeZMTZZv0M8lYnxTn/Ixsw4Eszejdm6f9bzNPs3VHctCmB5sA==
X-Received: by 2002:a05:6402:e9f:b0:435:644e:4a7d with SMTP id h31-20020a0564020e9f00b00435644e4a7dmr17926951eda.114.1656671654787;
        Fri, 01 Jul 2022 03:34:14 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id cb25-20020a0564020b7900b004359dafe822sm14754408edb.29.2022.07.01.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:34:14 -0700 (PDT)
Date:   Fri, 1 Jul 2022 12:34:13 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, jdmason@kudzu.us,
        vburru@marvell.com, jiawenwu@trustnetic.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove neterion/vxge
Message-ID: <Yr7NpQz6/esZAiZv@nanopsycho>
References: <20220701044234.706229-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701044234.706229-1-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Jul 01, 2022 at 06:42:34AM CEST, kuba@kernel.org wrote:
>The last meaningful change to this driver was made by Jon in 2011.
>As much as we'd like to believe that this is because the code is
>perfect the chances are nobody is using this hardware.

Hmm, I can understand what for driver for HW that is no longer
developed, the driver changes might be very minimal. The fact that the
code does not change for years does not mean that there are users of
this NIC which this patch would break :/

Isn't there some obsoletion scheme globally applied to kernel device
support? I would expect something like that.
