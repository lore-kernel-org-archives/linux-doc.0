Return-Path: <SRS0=BR+k=EI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E451C55178
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 13:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F80D223BD
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 13:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j4jcRG9G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgKBNvg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 08:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgKBNvf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Nov 2020 08:51:35 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC2FC061A48
        for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2020 05:51:34 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id y12so14690355wrp.6
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2020 05:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RRGtZ+ldHh215Tg4pikME8cERQKkPWSxRhHrWuaGqTM=;
        b=j4jcRG9GIsPic5QtNLfiguS60+zJTyfEFr+iiKo8yHMrJBgguaatXO3I913opTRfce
         9YRmMYfQ8jKRXmyz/Q9otp80BG++sA6sl5m8QVGjcqWUy/097KN48z7bSIItlCvcW38w
         jd/WnLJG8LVKDBFvN91IVitrEij7qzS+sUhVLWA938/10lu9t34EjoiklA93Wh6/2dj0
         xgvtZQrB6o8lzcv/bfSLrEXJXh3MFmaJ62kxek0Tu70k8OW0CQnZck6tN85TCA5ljZym
         aJBwlrwGWB4tizGNjl5+v61ywkvy8XPTtdloZAV5N3uqlTm3BxXAPkjt9uLAfn3Ggf9L
         nP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RRGtZ+ldHh215Tg4pikME8cERQKkPWSxRhHrWuaGqTM=;
        b=iCdKAkWIcSOizGhUYsHv+eeqrTl+46X42cX+1Mswq2oBAduCbPOoPh63zXH/i/UWFe
         j2OvaEjGX385FtN+iunmZzX5ZGhnz/kEsMM09vTxy2x815GUh5jjsA0fzMntjhK2tvsp
         m50nJ5fSdEWnv4Eu+2zVLgizSPaqepL76/D21DNVjCpwzdmv1aXFVZUo2lOU73OxECM5
         cL0uqvrXrcFj2sOmL8aUOyHEeJGYmFPEd+E9XkHUSlyLPB/VjPDoR8qjy5ToLMd8T/pj
         FwUaY8b6nmACDIVxQJmI4A2tbpddJhqiuAH9dIQTLfS3OlcUWgGswV3cnQJkM5D0yWnG
         j17Q==
X-Gm-Message-State: AOAM532oKLRDTNJrCN70zzEucwqTH79WYcC73a8YutOBcwLYtSS67XKO
        giEuZIyn3KN+0TQZwYPuDulwVA==
X-Google-Smtp-Source: ABdhPJybi5bHjDdIxQjPD1+62vLcJE+5DYmEix/kJMd5ZE6D7rqwTgjS1pA0lsKK+itNnlXT3/cVEg==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr19869994wrw.194.1604325093403;
        Mon, 02 Nov 2020 05:51:33 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:f693:9fff:fef4:a7ef])
        by smtp.gmail.com with ESMTPSA id y187sm3744456wmg.33.2020.11.02.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 05:51:32 -0800 (PST)
Date:   Mon, 2 Nov 2020 13:51:29 +0000
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
Subject: Re: [PATCH v3 4/4] docs: power: Update Energy Model with new flag
 indicating power scale
Message-ID: <20201102135129.GD2221764@google.com>
References: <20201019140601.3047-1-lukasz.luba@arm.com>
 <20201019140601.3047-5-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019140601.3047-5-lukasz.luba@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday 19 Oct 2020 at 15:06:01 (+0100), Lukasz Luba wrote:
> Update description and meaning of a new flag, which indicates the type of
> power scale used for a registered Energy Model (EM) device.

Reviewed-by: Quentin Perret <qperret@google.com>

> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Thanks,
Quentin
