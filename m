Return-Path: <SRS0=BR+k=EI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BB5C00A89
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 13:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AB2D22268
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 13:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E7L00VSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgKBNpl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 08:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgKBNpl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Nov 2020 08:45:41 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C454C0617A6
        for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2020 05:45:41 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p22so9448308wmg.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2020 05:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hkDT3omg5tmZs3okZ4oY2bkRmN1w5gBeDmyiEtbctKE=;
        b=E7L00VSgigu/+a5VpNjH+GrGshtDXQps/8MzZ7qWW5e2Pnn7kip31ZDYxAiam9Y6Rn
         EWqamLJIA2RaSOGDJSX9DXW1R5Fb1ubHV5tQsUKIRx9tkRO65dxMdf0PBU+Rgz6nZPGD
         GmNJXbyU9cQ7rzLI8OApAKl7pRj8Vw3shpbLHvj+21AwwB3n5rouq1jcte73UYqAux/N
         bhwL2wPe0oCpJgOkUHXgN3bOz2o+MdIq48pbzDOx8jPrWluQOQ6gDDzWgt78QojIl2HS
         tRpEYHKeShwItqLD6j3UBZKphJk39cOX0/ybdjk91Dr/C2/yijgXOLglVTGX3ZJseXRE
         OcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hkDT3omg5tmZs3okZ4oY2bkRmN1w5gBeDmyiEtbctKE=;
        b=i927EkyQIxaXYq8i4XNLcn1VWPMedhWBTIO9HJtAG7JhiyhOuurROjOVRibdIG2oQd
         zfdjtbgozMR2qchrG9svm8w1xwq9dARtOY4ACfeIjw9vL5Ouvm2ygi120tcWbvCa5RGE
         5Q2k27E8hUQsBYCoOnJQ/zvjTkmo4ykUhVIeAN7GbWLPQd9GG6Rgr+RDaVcsFFG71qxr
         c+xKPQVvMN1lMumDKgbQVoQDE1QTTL0eZHN0Im4sxi5BvFGDxWl0g++5j2QC6VfjJj47
         djITF2G39tJJ9Wu5DrYr6/oI8M452oTQ3dvEEh5w+np7IBs5+zyvrPD7V36Au7nBq2pP
         0PeQ==
X-Gm-Message-State: AOAM531BKs0AEDTk5ixrbsYL0mJEjnFfoXinxMjmcnAjWuQxZvjh0+0w
        dJoeiQ6zxk3AefnOy5ucbUFByQ==
X-Google-Smtp-Source: ABdhPJzsgYxwuc1GuB8Cd9pOIf65B7t49ybbphTz02+Iv8A7ZnJd/koxX67cb6MaxVJ66K6zl3T1Dg==
X-Received: by 2002:a1c:46c6:: with SMTP id t189mr3384171wma.79.1604324739744;
        Mon, 02 Nov 2020 05:45:39 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:f693:9fff:fef4:a7ef])
        by smtp.gmail.com with ESMTPSA id t5sm25026509wrb.21.2020.11.02.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 05:45:39 -0800 (PST)
Date:   Mon, 2 Nov 2020 13:45:36 +0000
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        amitk@kernel.org, corbet@lwn.net, daniel.lezcano@linaro.org,
        Dietmar.Eggemann@arm.com, morten.rasmussen@arm.com,
        dianders@chromium.org, mka@chromium.org, rnayak@codeaurora.org,
        rafael@kernel.org, sudeep.holla@arm.com, viresh.kumar@linaro.org,
        sboyd@kernel.org, nm@ti.com
Subject: Re: [PATCH v3 2/4] docs: Clarify abstract scale usage for power
 values in Energy Model
Message-ID: <20201102134536.GB2221764@google.com>
References: <20201019140601.3047-1-lukasz.luba@arm.com>
 <20201019140601.3047-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019140601.3047-3-lukasz.luba@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday 19 Oct 2020 at 15:05:59 (+0100), Lukasz Luba wrote:
> diff --git a/Documentation/driver-api/thermal/power_allocator.rst b/Documentation/driver-api/thermal/power_allocator.rst
> index 67b6a3297238..b7992ae84fef 100644
> --- a/Documentation/driver-api/thermal/power_allocator.rst
> +++ b/Documentation/driver-api/thermal/power_allocator.rst
> @@ -71,7 +71,10 @@ to the speed-grade of the silicon.  `sustainable_power` is therefore
>  simply an estimate, and may be tuned to affect the aggressiveness of
>  the thermal ramp. For reference, the sustainable power of a 4" phone
>  is typically 2000mW, while on a 10" tablet is around 4500mW (may vary
> -depending on screen size).
> +depending on screen size). It is possible to have the power value
> +expressed in an abstract scale. This is the case when the Energy Model
> +provides the power values in an abstract scale.

Maybe remove one of the 2 sentences?

Thanks,
Quentin
