Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0626E7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 13:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935810AbeF2Nnz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 09:43:55 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:44090 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936613AbeF2Nny (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 09:43:54 -0400
Received: by mail-wr0-f195.google.com with SMTP id p12-v6so8899430wrn.11
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=isXUTOp4Dp8wrBR+xsp0+7aDeXX2IFBQizVPdMOlkPo=;
        b=epGQR9XFLv51y+NnMwYGi8ARS2ManZDVrzIXW3GnbbInJ2cuHLfWjuexLJ68Hs8IMi
         m1fY6qwEt0BN6KDmzFaGihwEAlTuf+dQaSj2INqK/07R6Dm6MqwCO0YdocL4/fGI86WR
         5VKwcDKpwubjIFHgTWffRgp2H1WH3WfaVkNac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=isXUTOp4Dp8wrBR+xsp0+7aDeXX2IFBQizVPdMOlkPo=;
        b=MYXl3ih/kXkFaRAE/SM3yCTRjfqNdgR45KCcE2MS+0o4+Q68IwtoVm2OejsZh1x3UX
         cV2CmI4EsxZG9IQ/tu/i+69x8zmKDMzI7ohNwTG3515RphkVLKGGvK01GFDPAR+cbb9u
         JDG2vOVXAb7YovJxQXlnNSvVixewI14s/5ip3IV/vT3oa2uT4vxbFXju8hGc5aTwbbb5
         Z3I27PPiI7yvKKtqrwiQBbhz3G+lc0KmfI7KaGF94CKWm/5YXEZ+judwYVUSo2xn3aBi
         OqO7APITH7FMsd+28itLxOJ6RcVO139TDkAhoEgYntN6Nvz23NSS/bp5p3l8Gxattbb8
         XITQ==
X-Gm-Message-State: APt69E1R/6o1w+AXhJSm1+L66hwX/KHi08RmfFbvred/bjGVyTml0u2m
        Qyz9L445N3tlUsoCvN9LGbns3w==
X-Google-Smtp-Source: AAOMgpdG7xXayzy36mZEM+DkaoRcDrNvBqoDwH8CPSR5yqyZ5/9Ymf5v7nM18u4dVRSe+NiugeBP9A==
X-Received: by 2002:a5d:438d:: with SMTP id i13-v6mr1269634wrq.156.1530279833138;
        Fri, 29 Jun 2018 06:43:53 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id 16-v6sm2691060wmi.36.2018.06.29.06.43.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jun 2018 06:43:52 -0700 (PDT)
Date:   Fri, 29 Jun 2018 15:43:45 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: atomic_ops: atomic_set is a write (not read)
 operation
Message-ID: <20180629134345.GA10981@andrea>
References: <20180605194326.23596-1-j.neuschaefer@gmx.net>
 <20180606080756.GU3593@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180606080756.GU3593@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 06, 2018 at 01:07:56AM -0700, Paul E. McKenney wrote:
> On Tue, Jun 05, 2018 at 09:43:23PM +0200, Jonathan Neuschäfer wrote:
> > Describe it as such.
> > 
> > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> I have queued this, but if someone else would prefer to take it:
> 
> Reviewed-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

In the commit message of bb7d47b697116c ("docs: atomic_ops: Describe
atomic_set as a write operation") from your dev branch,

from "reads" to "writes"

  Andrea


> 
> > ---
> >  Documentation/core-api/atomic_ops.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/core-api/atomic_ops.rst b/Documentation/core-api/atomic_ops.rst
> > index 2e7165f86f55..724583453e1f 100644
> > --- a/Documentation/core-api/atomic_ops.rst
> > +++ b/Documentation/core-api/atomic_ops.rst
> > @@ -29,7 +29,7 @@ updated by one CPU, local_t is probably more appropriate. Please see
> >  local_t.
> > 
> >  The first operations to implement for atomic_t's are the initializers and
> > -plain reads. ::
> > +plain writes. ::
> > 
> >  	#define ATOMIC_INIT(i)		{ (i) }
> >  	#define atomic_set(v, i)	((v)->counter = (i))
> > -- 
> > 2.17.1
> > 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
