Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48085C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 06:13:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CAE2613DE
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 06:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235555AbhDUGOT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Apr 2021 02:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhDUGOT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Apr 2021 02:14:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BDCC06174A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 23:13:46 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id g16so4177805plq.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 23:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nevSqjB25WWzzcqHGFweFF6UbgX9/nmSW+k0ejZthf8=;
        b=sG67lRRbsHmSns4ktZmK8bX8woxMdV04AmG+e5KUz19Ru5BTAoZ/foiVDSFPK1+UlE
         w6dDCSW4rlJdko/xwuHcrsx0geEpDIpLi4/GsPd5qJM5UwxXaGOtzcu06uTCQncL4Oii
         6HABcmJTEWqnKktkOf9QDh3Kd6jlEziy5LDF2A9i52z1LvR7b8hwr/k/5h+0DJZtLZr+
         Jtmot54QvBdxxKfYGjMwvweAdO0GZMW/d+L5Gp9jm8szgKhZxM++D+6UkwkN47hxdwrj
         smyRN1PLz0QTsIVlf0sESbVVc9ePjiQz+ek9BWExRhx6Ytz/v7iYVN7UE+iCgfePMFIb
         PDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nevSqjB25WWzzcqHGFweFF6UbgX9/nmSW+k0ejZthf8=;
        b=NRpQX9VG9nAwafG6zHqiQ3iCpIN5d2B/Hm1U3F7wdeLMBg4iHn+Yljp70j9/UPlD4N
         CdlP4M10Ubc461YAwSxZygdWcaohBugMKBpR76JQ1gRn4b7qCj3dAM7eXtdzCk+Za9Pq
         vUwnLb27hD6bmjQvQmhGtg6likOWp/m4Wu8S2M5Zt3Nc1p9TaFr4ysH4KE2Wb2vXBz6q
         g8g1GDzREef0BG3p9uJYJZBLMXC9O9kYGt7RpVywEoCXukULNmgRTv4U2GRjLO+z5OS9
         1aYlU09wL50ycT3QC37TL5BLwrF3XX5H3q2Vi92S2iE+UMKnbLOXfNcENCRtSc3DQ66G
         kB0Q==
X-Gm-Message-State: AOAM532Nd69Ixs4dPIXx8rYmuKs0nwGyi2xAyPUO4kunHlT4SzmrKqrL
        lPdjOZgAKTGIPPS2ylQ4h3ZW
X-Google-Smtp-Source: ABdhPJwJnGTAiKHdEFITonTjRDgbLjhHPCdCfrgwIawrFWzaOaMV3bdh4y5p6nS8QH4umOGqZKXk+Q==
X-Received: by 2002:a17:903:244:b029:ec:9666:9fc6 with SMTP id j4-20020a1709030244b02900ec96669fc6mr19214218plh.63.1618985626386;
        Tue, 20 Apr 2021 23:13:46 -0700 (PDT)
Received: from thinkpad ([2409:4072:6e08:82d:35d7:2e33:457a:84d9])
        by smtp.gmail.com with ESMTPSA id u6sm747918pfi.44.2021.04.20.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 23:13:45 -0700 (PDT)
Date:   Wed, 21 Apr 2021 11:43:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] docs: driver-model: Update the documentation for
 device class
Message-ID: <20210421061340.GA6522@thinkpad>
References: <20210407061053.81940-1-manivannan.sadhasivam@linaro.org>
 <87czuoio8r.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czuoio8r.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 20, 2021 at 04:29:24PM -0600, Jonathan Corbet wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > The current documentation about the device class is out of date such
> > that it refers to non-existent APIs and structures. This commit updates
> > them to the current device class APIs and structures, removes wordings
> > that no longer valid while trying to keep the original content intact.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >
> > Changes in v2:
> >
> > * Fixed CLASS_ATTR_RW as spotted by Greg
> >
> >  .../driver-api/driver-model/class.rst         | 144 ++++++++----------
> >  1 file changed, 66 insertions(+), 78 deletions(-)
> 
> Note that this file was removed in commit 1364c6787525 back in
> February by Geert (added to CC).  If you want to update this document,
> you'll first want to bring it back.
> 

Oh thanks for the info! Perhaps I could just revert 1364c6787525 and add this
commit on top?

Thanks,
Mani

> Thanks,
> 
> jon
