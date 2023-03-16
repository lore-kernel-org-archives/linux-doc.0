Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC76C6FD1D
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 01:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjCPBg4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 21:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCPBgz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 21:36:55 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EC1193C1
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 18:36:52 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id iw3so166116plb.6
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 18:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112; t=1678930611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+1mkwqCPR3Q82+dWcQmlIn4W8/s1X0EYzQFgWa9j8U=;
        b=syDM9CXv6fPa2NmyGh7pfOaXdvcpRw7E1YjFA3yvZoU+4VSaM2tTCnFXDnxMAab+UA
         zCxpRpyModXdqd1FkYh3OsJAqLy5ZpjDeBLh9KlCRWTwy2qmHs7c9/uHnIm26X0LK/dT
         NWlan0/kRN6b10t1yg1sFTtl4StVxy1qfvBDL/bpouOskvGzB9BC8wV+Tf3Y6h9Ug7MA
         wKW+3KW0bDcOIo2NhmdmryVvlXgHESzqvCgGJ1tSChKL6gYodGsgotVcQG1QuKWRKtCJ
         E3c/sAscH9TaRIKmwL5OaUxPKtwgariZdishLloAL8sZ6YgvLHGbN0zGoO/IqBOr3Kgk
         W3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678930611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+1mkwqCPR3Q82+dWcQmlIn4W8/s1X0EYzQFgWa9j8U=;
        b=krJbMqevBnU9fbSwN8qhdrYOjFoWfZTN4IkKyiHWq0ugx5V/BE00iHo9ikz70dXp4b
         XWJQyXPSPPRirgT/f0xLz7bo3RNNA9kbA9F8CPpCNlK6ApDnXmhWwoGXP0TpQLxV4fcE
         ERxSqLHSzfwU3Fh3KeFzzCrRW3P6JuDJYpDSchNcLrmOE1+QD+yuHOQCUjud7Z74fOki
         bYeO6CQ+5blskzdVsv2YXPv6+KSjXewRUhtJiOYVLaGXa19jZmLSWPtRkn41Tvyp7jze
         KG1bYobDHdFv4IfT65fiApaIgrc1/qLiy/j77/OsDhgP3Vc0i7QFr2ArP84tH8OcN3Qc
         sc+A==
X-Gm-Message-State: AO0yUKUbtWqaGB4V+mHDAmowA9TBhwABmxeWv6U7HIZHN/3ZijVFdLj+
        VcR2kznurpzwNnpde3ms7qdXvg==
X-Google-Smtp-Source: AK7set8RYhRM2w+zIADodMW6Htt8G7DemfZJT5RsmEpKoTTWEjNiQYml0jDfFNcPGt05QNINUra6sg==
X-Received: by 2002:a05:6a20:bfd6:b0:cb:c2a8:2c48 with SMTP id gs22-20020a056a20bfd600b000cbc2a82c48mr1945165pzb.17.1678930611649;
        Wed, 15 Mar 2023 18:36:51 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id y16-20020a631810000000b004b1fef0bf16sm3967321pgl.73.2023.03.15.18.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:36:51 -0700 (PDT)
Date:   Wed, 15 Mar 2023 18:36:49 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: document NAPI
Message-ID: <20230315183649.7f42b1f0@hermes.local>
In-Reply-To: <20230315161142.48de9d98@kernel.org>
References: <20230315223044.471002-1-kuba@kernel.org>
        <20230315155202.2bba7e20@hermes.local>
        <20230315161142.48de9d98@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 15 Mar 2023 16:11:42 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> > 
> > The one thing missing, is how to handle level vs edge triggered interrupts.
> > For level triggered interrupts, the re-enable is inherently not racy.
> > I.e re-enabling interrupt when packet is present will cause an interrupt.
> > But for devices with edge triggered interrupts, it is often necessary to
> > poll and manually schedule again. Older documentation referred to this
> > as the "rotten packet" problem.
> > 
> > Maybe this is no longer a problem for drivers?
> > Or maybe all new hardware uses PCI MSI and is level triggered?  
> 
> It's still a problem depending on the exact design of the interrupt
> controller in the chip / tradeoffs the SW wants to make.
> I haven't actually read the LF doc, because I wasn't sure about the
> licenses (sigh)

I wrote the old NAPI from some older info that was available back then.
