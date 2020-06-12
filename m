Return-Path: <SRS0=lmhO=7Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230E9C433DF
	for <linux-doc@archiver.kernel.org>; Fri, 12 Jun 2020 23:56:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3EE9206F5
	for <linux-doc@archiver.kernel.org>; Fri, 12 Jun 2020 23:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="iIV5M4TJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFLX4h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Jun 2020 19:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgFLX4f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Jun 2020 19:56:35 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5E0C08C5C1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2020 16:56:34 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p21so4845900pgm.13
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2020 16:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UTj5ttub5IuanqJwK0I3UQOz9/e75GCyP9mAZ6g5FLs=;
        b=iIV5M4TJ+hm1p8LSUgYD3Ct5YANXR21bo7WVabVYarAxz4YLt8cgczYfHY3q4KHiAe
         jvhw++B/13tLctvWoaLqQj6hOhY0wqdiVnbwSjksqRC2KKHE7oGdId50G2jJKITuNaDL
         bCgOScFHg5tQ3jbNZcyi4/Z298BrF8MA5IpaY7bRLetLUFmeB6ImDfygu9i9x6VeduVT
         mxgjaBE+mOmFv+N7+n5a/DKbFRoSDITkD1pK5cfK3VT67e4ouJxmOCVR7hhGjJvkoRRM
         a2601xXx5InQC3KqdEH6qkNr4JK4wkKe/h8s+x7DiPqjsLH7aKPK391McP2dN2Bb6g6Z
         6lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UTj5ttub5IuanqJwK0I3UQOz9/e75GCyP9mAZ6g5FLs=;
        b=V13OYIrOn/Wp0atY7MxOQDHI5ccWSho/hpelSX5tYFvyUGGsfEs3CGuFLh7QyfcZBW
         ym9QI0ZKxxSusBLtDydNVvvry94nhMIn56WOPxp3IPL28JS5HjwT5XjojNT4bM0E2Zd9
         wvPi3Jb0jPZphUMeLbThJI0xbiCxUSD4YLsLVjxQLp3ddEkBHDB5sesQ0djP2Qt87fX1
         P2H55gpHdYMROfZHcylSY6W+coSDWCuA1TYbZZOBmXiXSWLfEjaCLMV13mCgt3y7rSCK
         bn4NlFRy79Xjjyd5/KZH8AmjKxLC82zl7LXu/8uYZAzs1o1u49lsYPwESAfyYuyDWfZk
         eKIg==
X-Gm-Message-State: AOAM532ORso/epTwinK6/d5ZutZey9OPgUb0B9NFpX0dFpe7s87NOH0W
        3W0BcO8Gi1MecoIYQO3tsv4cug==
X-Google-Smtp-Source: ABdhPJzm9lYOU0JJR33QzS+IfpMfTHPWNnrJDkJrsN53U/PS/yuYCTlJcVtkQp/lWvhGuXRK7sdVTA==
X-Received: by 2002:a62:e81a:: with SMTP id c26mr13887109pfi.281.1592006193695;
        Fri, 12 Jun 2020 16:56:33 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id m12sm6348326pjf.44.2020.06.12.16.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 16:56:33 -0700 (PDT)
Subject: Re: [RFC 1/8] docs: networking: reorganize driver documentation again
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        klassert@kernel.org, akiyano@amazon.com, irusskikh@marvell.com,
        ioana.ciornei@nxp.com, kys@microsoft.com, saeedm@mellanox.com,
        jdmason@kudzu.us, GR-Linux-NIC-Dev@marvell.com, stuyoder@gmail.com,
        jeffrey.t.kirsher@intel.com, sgoutham@marvell.com,
        luobin9@huawei.com, csully@google.com, kou.ishizaki@toshiba.co.jp,
        peppe.cavallaro@st.com, chessman@tux.org
References: <20200611173010.474475-1-kuba@kernel.org>
 <20200611173010.474475-2-kuba@kernel.org>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <d9437e4e-f588-320e-2673-cd67795779cd@pensando.io>
Date:   Fri, 12 Jun 2020 16:56:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200611173010.474475-2-kuba@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/11/20 10:30 AM, Jakub Kicinski wrote:
> Organize driver documentation by device type. Most documents
> have fairly verbose yet uninformative names, so let users
> first select a well defined device type, and then search for
> a particular driver.
>
> While at it rename the section from Vendor drivers to
> Hardware drivers. This seems more accurate, besides people
> sometimes refer to out-of-tree drivers as vendor drivers.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> --
> CC: klassert@kernel.org
> CC: akiyano@amazon.com
> CC: irusskikh@marvell.com
> CC: ioana.ciornei@nxp.com
> CC: kys@microsoft.com
> CC: saeedm@mellanox.com
> CC: jdmason@kudzu.us
> CC: snelson@pensando.io
I'm fine with the Pensando ionic changes.
Thanks,
sln

Acked-by: Shannon Nelson <snelson@pensando.io>

> CC: GR-Linux-NIC-Dev@marvell.com
> CC: stuyoder@gmail.com
> CC: jeffrey.t.kirsher@intel.com
> CC: sgoutham@marvell.com
> CC: luobin9@huawei.com
> CC: csully@google.com
> CC: kou.ishizaki@toshiba.co.jp
> CC: peppe.cavallaro@st.com
> CC: chessman@tux.org
> ---

