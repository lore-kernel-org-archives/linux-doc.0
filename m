Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F44C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 15:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235768AbiI2PLz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 11:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235780AbiI2PLy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 11:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93554127C9E
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664464311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eQg2QfkQVZ0jprfAYqOiT7fU785X28/7syfVqOkQBBE=;
        b=N59qwyhPvVbmq82cYGAjD9BWM5VkQQsXz8TBXQ1ZtRxzt85n41RQ3vz8/EOimTsOJACdxb
        bqo4w0tYemQjFpRXlqqpRCC+Anb4+gPgHZQ5XOJvOpKrtO2rnnB8Ce5M4v/gyoTpc+M2Pa
        vxMNcYZ7RMnVzl1uHu34ZvZkJ7jjZdY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-R-jFn2InObeJKCzHh0o-MQ-1; Thu, 29 Sep 2022 11:11:50 -0400
X-MC-Unique: R-jFn2InObeJKCzHh0o-MQ-1
Received: by mail-wr1-f70.google.com with SMTP id u20-20020adfc654000000b0022cc05e9119so654515wrg.16
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 08:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=eQg2QfkQVZ0jprfAYqOiT7fU785X28/7syfVqOkQBBE=;
        b=zEK2Epu2vFm5VmxEK/Am/Ya5IqJhqch/G4Bww/bLm93J0V5lzyK8EDEtggO6sItO7i
         W0NnTeOCW54MDoUVzOQyw8l/EUQ+jx5PWXXFd3y0Jren8kxOmiXwNLPNBqcTMD/02LXo
         w1GU8cj7t/pqnUUlrbrCGjKw2PhTXp9srHHKwMFJBPp8FOX5bsPSr2XPuYv+M+NGbmRX
         vll7RB+hQBWPGk7/vYaayMkrKp3pcXBdRFS3hdBlrQB2Pxqz+OTdaEEJHKx10zO7f/m8
         Oiu4VtCF7CiUjoosv+pVgOjFCB1+QEVAxWKzgv2D/ZMdxwxQ+xH9CGncL/YXhEBZ0qhB
         e/qw==
X-Gm-Message-State: ACrzQf2/Qpzd+BC1JFgUxYLCUgq2XqU277p6KGXM1M0HKFg3tsg9/MED
        RiJ38X03emvcm+AlPsGoCLRgVRYi21KMh///7LGOSXCWBFV1fhN3YUF4i599AQr2Y2WDz3OW5FF
        iVNWXQLJIjdn1vx+EZlbi
X-Received: by 2002:adf:d1e1:0:b0:22a:cd3e:e98b with SMTP id g1-20020adfd1e1000000b0022acd3ee98bmr2854180wrd.510.1664464309310;
        Thu, 29 Sep 2022 08:11:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40SEhh/jXUYfsK06jNUKEyuaF4LmijkPg5kb0pZK+3AGDuUY4mw3WXtxrie697Z/+ZVxUv1Q==
X-Received: by 2002:adf:d1e1:0:b0:22a:cd3e:e98b with SMTP id g1-20020adfd1e1000000b0022acd3ee98bmr2854162wrd.510.1664464309144;
        Thu, 29 Sep 2022 08:11:49 -0700 (PDT)
Received: from localhost.localdomain ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id bq21-20020a5d5a15000000b0022afe4fb459sm7142572wrb.51.2022.09.29.08.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 08:11:48 -0700 (PDT)
Date:   Thu, 29 Sep 2022 17:11:45 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, robh@kernel.org, johannes@sipsolutions.net,
        ecree.xilinx@gmail.com, stephen@networkplumber.org, sdf@google.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next 1/6] docs: add more netlink docs (incl. spec
 docs)
Message-ID: <20220929151145.GC6761@localhost.localdomain>
References: <20220929011122.1139374-1-kuba@kernel.org>
 <20220929011122.1139374-2-kuba@kernel.org>
 <20220929133413.GA6761@localhost.localdomain>
 <20220929073224.2f3869ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929073224.2f3869ca@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 07:32:24AM -0700, Jakub Kicinski wrote:
> On Thu, 29 Sep 2022 15:34:13 +0200 Guillaume Nault wrote:
> > > +Make sure to pass the request info to genl_notify() to allow ``NLM_F_ECHO``
> > > +to take effect.  
> > 
> > Do you mean that netlink commands should properly handle NLM_F_ECHO,
> > although they should also design their API so that users don't need it?
> 
> Yes, ECHO should be supported but as an extra, not something that
> is crucial to write a basic script without assuming full ownership 
> of the system...
> 
> IOW support the logging use case you mentioned but don't do the NEWLINK
> thing.
> 
> Should I clarify or rephrase? The ECHO section needs to be read with
> the one above it to get the full answer.

Maybe we can make this more explicit.
Something like:

-Having to rely on ``NLM_F_ECHO`` is a hack, not a valid design.
+Users shouldn't have to use ``NLM_F_ECHO`` to get a handle on the created
+object.

(or keep both sentences, I feel they fit well together).

Then maybe explain in the next section why support for NLM_F_ECHO is
desirable anyway:

 Make sure to pass the request info to genl_notify() to allow ``NLM_F_ECHO``
-to take effect.
+to take effect. This is usefull for programs that need precise feedback from
+ the kernel (for example for logging purpose).

