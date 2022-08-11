Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5E1C19F2A
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 15:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbiHKPB6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 11:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235400AbiHKPB5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 11:01:57 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AC12496B
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 08:01:55 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id w11-20020a17090a380b00b001f73f75a1feso5662467pjb.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=b+I9NMlIRung0ufXGv5JJYJHMEd2asoQjtUh3VvCjOo=;
        b=RsXRGLyz3v67s4s/1e5ATDfo68S4Xk2SHhr+boOlz0EVUz3dvqm2+eR8LsCBwDEIYq
         Ye03Xq23h47OacFO07cDrnOoDp5KTFsXRiKah1kp61l5ZbF89KFcUq1gi2bQLCXNu2NV
         3J/SoGeLJYo8/JLXLaRAeNOin/PFr2ft+RMz9qH9a9tb7UZ9d+mtHj/dRJhTW4RYxsD0
         K9sGe902y0wKU06SYRDZASP6mUQpGvr7tOmYLosL0ket9E4CfOWoYRUoiqgHkvqBTgue
         40Ad8dfW2rbHvBhGvVDfs7ju2/4FRWJvJkIL6zF0EOrLBgevb+YNDq7vef5TDOi+aKTz
         UTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=b+I9NMlIRung0ufXGv5JJYJHMEd2asoQjtUh3VvCjOo=;
        b=SHNwPibO5Ahp8rcaWekJ+DHmxyKi1ocmcfVMTdN5+utd/Bq36UAwNf5uxTEIt02S95
         Dzo+wlgYFXJ472TdD1+TRBJk4qbl/rV4FLcAhzw3xhLMsXH1D7+F3Jrlgoz+DZuqnVJ7
         P/cr+ZQOkIbPPjXgwl9K87HobAPuwdKnbJmvt6xYOobQV7jpEkIhqwRX+dcbsJo9Y7oQ
         zycFw/9IM9BI8wdmgdKTzrEByrrs1tTvAPDFNGoccOJS4JsR2MvNc4jvSwn8hS4kFaWR
         3sWamBXNOVqm/57JFLFIvbBA/GueMU7SgTSLiT76ppsjqvxAvQUDaGfTStgtNOWVc3S5
         x/3A==
X-Gm-Message-State: ACgBeo0hG+8KVYZGOEICPtEg/FbGUsZ9pU5ZTrPvJNQCv9nG2okIK5g8
        t1ngKU1bEJ0d5lsZjlIgIximcA==
X-Google-Smtp-Source: AA6agR64EfyJdGX5MHuLzxCea37dFu9L83/U4i7RWaogx7X22t58SWaQilMkRBxdvbHOFHBPNxpExQ==
X-Received: by 2002:a17:902:e885:b0:16f:8f52:c93a with SMTP id w5-20020a170902e88500b0016f8f52c93amr29076787plg.140.1660230115342;
        Thu, 11 Aug 2022 08:01:55 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id v3-20020a654603000000b0041a6c2436c7sm11739042pgq.82.2022.08.11.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:01:55 -0700 (PDT)
Date:   Thu, 11 Aug 2022 08:01:52 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, sdf@google.com, jacob.e.keller@intel.com,
        vadfed@fb.com, johannes@sipsolutions.net, jiri@resnulli.us,
        dsahern@kernel.org, fw@strlen.de, linux-doc@vger.kernel.org
Subject: Re: [RFC net-next 0/4] ynl: YAML netlink protocol descriptions
Message-ID: <20220811080152.2dbd82c2@hermes.local>
In-Reply-To: <20220810214701.46565016@kernel.org>
References: <20220811022304.583300-1-kuba@kernel.org>
        <20220810211534.0e529a06@hermes.local>
        <20220810214701.46565016@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 10 Aug 2022 21:47:01 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 10 Aug 2022 21:15:34 -0700 Stephen Hemminger wrote:
> > Would rather this be part of iproute2 rather than requiring it
> > to be maintained separately and part of the kernel tree.  
> 
> I don't understand what you're trying to say. What is "this", 
> what is "separate" from what?

I am saying that ynl could live as a standalone project or as
part of the iproute2 tools collection.

> 
> Did I fall victim of the "if the cover letter is too long nobody
> actually reads it" problem? Or am I simply too tired to parse?
> 
> iproute2 is welcome to use the protocol descriptions like any other
> user space, but I'm intending to codegen kernel code based on the YAML:

Ok, that makes sense then. I was hoping that user configuration
of network devices could be done with YAML. But probably that is
best left networkd, netplan, and others.


> >> On the kernel side the YAML spec can be used to generate:
> >>  - the C uAPI header
> >>  - documentation of the protocol as a ReST file
> >>  - policy tables for input attribute validation
> >>  - operation tables  
> 
> So how can it not be in the kernel tree?

As code generator then sure.
