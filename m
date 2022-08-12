Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69112C25B06
	for <linux-doc@archiver.kernel.org>; Fri, 12 Aug 2022 01:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbiHLBE6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 21:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235738AbiHLBE5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 21:04:57 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E62B85A88
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 18:04:56 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id k14so15873427pfh.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 18:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=13c4cDf7Rg8kM7TM5Ec2p51x9MFvfEzElyjMeLmbLRk=;
        b=OfwjUrmFSb3TQ8oa7tx3tqDRMunGTMJ7T2WvIlESznBI31h0Xpct9T0K5V8CMDEwiz
         RyIro+6vNMkbnkcntM1rdAy15qJPwNy764JCHEZU1nuNpxPHqIcofPyRJit8EuaplwJG
         4zbhmNixmceL0aCXtVNkWypzR/LXmYT2Rfg4gds93cDrAhr4T8EwUeDGXGWwPwM8PDDi
         8eLo1EMMpmXg4nWvt1zu14558V14rH8mnduQr41sGrJhU6TwKj0kKGKgEyHs5NJsy8ke
         ce0gJ80CmP1KVC6GOArEdncAcyHSqua6hEqFz7LxHHf6ol1QUDupz7lILn/2i8cBNiCp
         uDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=13c4cDf7Rg8kM7TM5Ec2p51x9MFvfEzElyjMeLmbLRk=;
        b=JapG0Xa/1L6RI6O0PnrGajtRKeaCcd9dd23/fo+GvIMPBAWKkKsilHSq1Pulmm7xgc
         R/QVAvjfth4DMJ5QdGE8jgAtqhpunL1bPnkiNSDWEAQwJDPew6vMSWVZISbCPf+PxUS4
         PE1bwShMZMlNUA9nEoU55IfxVN37LHqwLPaK7Uwnm9Iz/tZ4FeOHwfuAru7PhW7bv06x
         DGtYI1yfgkFOINt1J0w9ptb2rEHpO8tM85SfbdE1TJzlI5PwVH3o0dfowEd57AKV+fMy
         zIM2pF9yAfiIUeR0yptlOgwkaph00Uzno0LzccubphFWIlk6r3yQceoeddPC9N6o0Uqz
         9w2w==
X-Gm-Message-State: ACgBeo2E+s/jkXOfeBBSsYV6BlJrOBqNeQ46NP2PSkKaZ3EmxukD30K0
        LsE4dvHa/wlrtEbyzON0sRc8kg==
X-Google-Smtp-Source: AA6agR48u7sDkJFmTcHZV4pgR6oYPyOtV6HhezsRNckdXU+kC7cHvJAcUuUbKPmyNgEnqXm6X2M64Q==
X-Received: by 2002:a65:6cc8:0:b0:3fe:2b89:cc00 with SMTP id g8-20020a656cc8000000b003fe2b89cc00mr1268011pgw.599.1660266295837;
        Thu, 11 Aug 2022 18:04:55 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id c14-20020a170903234e00b0016d1b70872asm300397plh.134.2022.08.11.18.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 18:04:55 -0700 (PDT)
Date:   Thu, 11 Aug 2022 18:04:52 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, sdf@google.com, jacob.e.keller@intel.com,
        vadfed@fb.com, johannes@sipsolutions.net, jiri@resnulli.us,
        dsahern@kernel.org, fw@strlen.de, linux-doc@vger.kernel.org
Subject: Re: [RFC net-next 3/4] ynl: add a sample python library
Message-ID: <20220811180452.13f06623@hermes.local>
In-Reply-To: <20220811022304.583300-4-kuba@kernel.org>
References: <20220811022304.583300-1-kuba@kernel.org>
        <20220811022304.583300-4-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 10 Aug 2022 19:23:03 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> A very short and very incomplete generic python library.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

It would be great if python had standard module for netlink.
Then your code could just (re)use that.
Something like mnl but for python.

