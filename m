Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA9DC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jul 2022 06:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiGEGRe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jul 2022 02:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiGEGRb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jul 2022 02:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B6C463BD
        for <linux-doc@vger.kernel.org>; Mon,  4 Jul 2022 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657001849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MbYxVaIyDUhA5oPU13aBpn943FX8jDmN8TJKAwAcUCo=;
        b=WsFeteUu2nFX4Jd0BbTelQ43zZqlFNkzLpD55wPvP4OUhe5OxcWoM2tt+EIu9QcWjLR8D3
        0MJjnAzUfluuNPubnYWH4QBmPqDDIHMPXKGMrpliHYRMy9E+6q1ibEsFNjADmR4d50dX1r
        6AU5Vo+4c5OMwFg28R1pTRNUWXrueIE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-J__zn9DZPv-GXRIGdA2Cdg-1; Tue, 05 Jul 2022 02:17:27 -0400
X-MC-Unique: J__zn9DZPv-GXRIGdA2Cdg-1
Received: by mail-wm1-f71.google.com with SMTP id be8-20020a05600c1e8800b003a069fe18ffso8421654wmb.9
        for <linux-doc@vger.kernel.org>; Mon, 04 Jul 2022 23:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MbYxVaIyDUhA5oPU13aBpn943FX8jDmN8TJKAwAcUCo=;
        b=SGu52CF2ghK2ZFw0W9qiCYAJapsEmLwwOhexc5w/dJJQo9X1w1mg7O6+NvnklaWflr
         bsgcXZGtuGa4u5QvYmC8YyO6CSAM7o02e0Chy1vSlwGcgACm7SL8SbZuTvtWGM1z9pch
         WoES7UT/z8DBVOkZoHkOSvixZWOurXNfTZDx2UrDtKz63C22i2pbpTOKAWnNRo/NXyW9
         M/iewLFRF4lBPi2d5CQQkDRlrVEyN6Levtxx6HpJKEuYWMPwGUusV1DMkDrQyweVxOnr
         b5yml2AmyN1D7G0pAS4eCIHeRQ2m1BO9LkwMVqhBviLPov9Cp8aLIggMMtl7i1GfrigR
         wQVw==
X-Gm-Message-State: AJIora+TgBCKpC3sHmfUq/KM7Z95ashMGg6fw/1PLvF2hcFuap9lestO
        TiSujOGMrA7m6wlD4R7WEcBcfMuq/UHAG4p2MhXauvZL+4+IdxaFY+py8Ae3BwYsWxHBKtBQOOP
        CMaN10ToDJda/sbV3B8Jo
X-Received: by 2002:a05:600c:1412:b0:3a1:6e8f:f18f with SMTP id g18-20020a05600c141200b003a16e8ff18fmr34488318wmi.9.1657001846645;
        Mon, 04 Jul 2022 23:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ul1fyFE62hxf1n1f4Ud2jXJAhFm/mPgf3uSTeNAYbENWRggVwIrsOB1i6VugYyuIwroW7d9A==
X-Received: by 2002:a05:600c:1412:b0:3a1:6e8f:f18f with SMTP id g18-20020a05600c141200b003a16e8ff18fmr34488300wmi.9.1657001846446;
        Mon, 04 Jul 2022 23:17:26 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-106-148.dyn.eolo.it. [146.241.106.148])
        by smtp.gmail.com with ESMTPSA id b15-20020adff90f000000b0021b90cc66a1sm32048000wrr.2.2022.07.04.23.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 23:17:26 -0700 (PDT)
Message-ID: <cbd7e14b3496229497ae49edbb68c04d4c1d7449.camel@redhat.com>
Subject: Re: [PATCH net-next] eth: remove neterion/vxge
From:   Paolo Abeni <pabeni@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>,
        Francois Romieu <romieu@fr.zoreil.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        corbet@lwn.net, jdmason@kudzu.us, vburru@marvell.com,
        jiawenwu@trustnetic.com, linux-doc@vger.kernel.org
Date:   Tue, 05 Jul 2022 08:17:24 +0200
In-Reply-To: <20220701144010.5ae54364@kernel.org>
References: <20220701044234.706229-1-kuba@kernel.org>
         <Yr8rC9jXtoFbUIQ+@electric-eye.fr.zoreil.com>
         <20220701144010.5ae54364@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2022-07-01 at 14:40 -0700, Jakub Kicinski wrote:
> 100%, I really wish something like that existed. I have a vague memory
> of Fedora or some other distro collecting HW data. Maybe it died because
> of privacy issues?

AFAICS that database still exists and is active:

https://linux-hardware.org/?view=search&vendor=neterion&d=All

It shows no usage at all for the relevant vendor.

On the flip side, it looks like the data points come mostly/exclusively
from desktop systems, not very relevant in this specific case.


/P

