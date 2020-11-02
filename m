Return-Path: <SRS0=BR+k=EI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EF7C55178
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 13:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78AA6223AB
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 13:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IGXlcw/F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgKBNs0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 08:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgKBNs0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Nov 2020 08:48:26 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B8BC061A48
        for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2020 05:48:25 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id e2so9566825wme.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2020 05:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UFRhiWlZ0PmDQf5vXKHCYQqY9H8uzxB92d/n5pWqdLA=;
        b=IGXlcw/FXocL1GYrDQgAAbLPC9DB70ce4/7VYcbIsVF0i9rXqooRJVzVPEMN2MNyTW
         vZ7+5JdpyDY/6L7D88JWUe4StIkmdHdVdiPqxUv9U8fkUeNVOK3mLZ5uO7Ulm1Ng43NF
         vnuQjvRGj3fe0TJviSqkXtQMd1/8c3fwyKIKWbZdPJ0PMJ3Tm4iJ2ut5UUwNNZevLsYI
         Nwvtf9l6Iz9+FHUgwWrtdj0mMhCP9foV67J1BQfvQFdSStWmt/EbDfHCAF+V68HgW11E
         KMIyO6xkaiZw2GvONSIukw9jzCA4nqzpC9ZjNX+5dUEt/GLf1IbR4AGcW0kqbXDBfe2J
         u6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UFRhiWlZ0PmDQf5vXKHCYQqY9H8uzxB92d/n5pWqdLA=;
        b=NG2nk933mCBhYWlkLDr2DBUredhJjdXqcwFHxJCsv4iTl6LDt0RhRxznpaQMtuoFWS
         kP9wEE8U4oUfGpWZeiSC6VTAPtL3GCGYSL6oifeDWSMusK/s1d2AsYOWTvkY4w3bnJqr
         uZ0+DI/nAv+mu3NW49YTzcs4FDJjTQOd/gJk+8Eeq6ivJpMtVfvEUacY5WxNKqA0IoCr
         zkUpxBqeRzBzQx0jSIwlDKtQFbcCGEg7rYX/pmcIMx6d1dE+8H0OsYBCHtO1fGAG68t4
         1yhdDzxGMIITc3MN8c+dUym0mNW5IywUNQ3qmHv5DBjkjvbzjcmaRGjCtYuab07o2mZ8
         reEQ==
X-Gm-Message-State: AOAM533lQz6x5uVqavz5j07TPB/6Ug93VJgbRGlH1Pi0yNk5clFcMJSs
        Fml3dPVPhja+JBP3M/bRlKhRUA==
X-Google-Smtp-Source: ABdhPJyUhiWVTvkM08d0dh3jqSehjke4YSRXKwFK5RUJyJHB/R9+titxNviK2sWz6ca1mjON+wvXwQ==
X-Received: by 2002:a1c:309:: with SMTP id 9mr9312082wmd.80.1604324904060;
        Mon, 02 Nov 2020 05:48:24 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:f693:9fff:fef4:a7ef])
        by smtp.gmail.com with ESMTPSA id h4sm22234799wrp.52.2020.11.02.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 05:48:23 -0800 (PST)
Date:   Mon, 2 Nov 2020 13:48:20 +0000
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
Subject: Re: [PATCH v3 3/4] PM / EM: update the comments related to power
 scale
Message-ID: <20201102134820.GC2221764@google.com>
References: <20201019140601.3047-1-lukasz.luba@arm.com>
 <20201019140601.3047-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019140601.3047-4-lukasz.luba@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday 19 Oct 2020 at 15:06:00 (+0100), Lukasz Luba wrote:
> The Energy Model supports power values expressed in milli-Watts or in an
> 'abstract scale'. Update the related comments is the code to reflect that
> state.

Reviewed-by: Quentin Perret <qperret@google.com>

> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Thanks,
Quentin
