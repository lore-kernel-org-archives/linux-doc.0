Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 493067D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Oct 2019 23:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfJJX6p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 19:58:45 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37220 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfJJX6p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Oct 2019 19:58:45 -0400
Received: by mail-qt1-f193.google.com with SMTP id l51so11086279qtc.4
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2019 16:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=rqji17iCubgRMeC+Vycqe1vc47by57DEVQpEIqey9RM=;
        b=ky1ofrGgN+DSJKoqdlmG18Xi4TDC3Da0U/gfb1+titc8znZccW8jchnFYwhD6lhWSP
         mf0bQH4n1VumIhq8yZrF+DbjWfSCSfRXdWbuxl12qzykX2JGG8oRaNvdEKdDM8FfKX3u
         /EcvTmkmCAmGZmbe9N1KbAUDk0lDflp9ZMCkh99KlWLi5NRt0UnUEbF0Zs+2nikpmKmK
         WPMPHjZGhmwmHePZJzr043z1UN6FZwcjvcyssZqqFnYMvE2KtSsqrKNXtYegWy6hIy4j
         Eicnk+PeUT/5aINzRVP/yHFEUxklg/8IkI03k1uuJrjUAv6/ce93oS8pk8/Xr/NJ266o
         25FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=rqji17iCubgRMeC+Vycqe1vc47by57DEVQpEIqey9RM=;
        b=ErOeuWK2nx5sZwkBw3OsoLu/jCWjP3aVOn/KWgX5QL0AVqYiXspf2JUmD+JAyUXasU
         ZhA8sdVzYaPojHOS1WhWForhL8CusFHKJAdXmfkgTq3dm8x9uD5nEv4+zChqHlbpPse7
         nzAT+6b7PBhVt5b23CzkqGdxhU+ZKQMlyjSz/FFOR85Y0tW3RNryEy2Fl4jiTGdW0YWH
         XZTRtQE4f+E+fAMQdFbeh/UAq9LQtXsGD4SavcVseTuN3Je9X+ZlL2/ls7VCmhsAJNom
         UAwb7qA5epUbq6NSidm1RmparSZK9hoL4d23ZX1fX1RNjssSpWUu/Ic+T4MdyqX6/SPO
         iVeA==
X-Gm-Message-State: APjAAAUMhhFfVgMAudmXoSxWnX8nEOZd5jMvEvxgMXWTK8DNO7n9IRi5
        TJytTrP+gGl/zEv0T1vFKvW7DA==
X-Google-Smtp-Source: APXvYqzHvgIC6xGVEEyj6TbgfifR7ulMfirMgFM3I8dhnb12DZXvfJUuf6KBN0BSRVhb7GO4/tN1qg==
X-Received: by 2002:a0c:f709:: with SMTP id w9mr13179974qvn.237.1570751924697;
        Thu, 10 Oct 2019 16:58:44 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id z8sm2957668qkf.37.2019.10.10.16.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 16:58:44 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:58:28 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        Tal Gilboa <talgi@mellanox.com>,
        David Miller <davem@davemloft.net>, linux-doc@vger.kernel.org,
        Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH] Documentation: networking: add a chapter for the DIM
 library
Message-ID: <20191010165828.0540d18d@cakuba.netronome.com>
In-Reply-To: <4c7f5563-2ca1-d37b-7639-f3df99a0219b@infradead.org>
References: <e9345b39-352e-cfc6-7359-9b681cb760e8@infradead.org>
        <20191010162003.4f36a820@cakuba.netronome.com>
        <4c7f5563-2ca1-d37b-7639-f3df99a0219b@infradead.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Oct 2019 16:34:59 -0700, Randy Dunlap wrote:
> On 10/10/19 4:20 PM, Jakub Kicinski wrote:
> > On Thu, 10 Oct 2019 15:55:15 -0700, Randy Dunlap wrote:  
> >> From: Randy Dunlap <rdunlap@infradead.org>
> >>
> >> Add a Documentation networking chapter for the DIM library.
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Tal Gilboa <talgi@mellanox.com>
> >> Cc: "David S. Miller" <davem@davemloft.net>
> >> Cc: Jakub Kicinski <jakub.kicinski@netronome.com>
> >> Cc: netdev@vger.kernel.org
> >> Cc: linux-rdma@vger.kernel.org
> >> ---
> >>  Documentation/networking/index.rst   |    1 +
> >>  Documentation/networking/lib-dim.rst |    6 ++++++
> >>  2 files changed, 7 insertions(+)
> >>
> >> --- linux-next-20191010.orig/Documentation/networking/index.rst
> >> +++ linux-next-20191010/Documentation/networking/index.rst
> >> @@ -33,6 +33,7 @@ Contents:
> >>     scaling
> >>     tls
> >>     tls-offload
> >> +   lib-dim
> >>  
> >>  .. only::  subproject and html
> >>  
> >> --- /dev/null
> >> +++ linux-next-20191010/Documentation/networking/lib-dim.rst
> >> @@ -0,0 +1,6 @@
> >> +=====================================================
> >> +Dynamic Interrupt Moderation (DIM) library interfaces
> >> +=====================================================
> >> +
> >> +.. kernel-doc:: include/linux/dim.h
> >> +    :internal:
> >>
> >>  
> > 
> > CC: linux-doc, Jake
> > 
> > How does this relate to Documentation/networking/net_dim.txt ?
> > (note in case you want to edit that one there is a patch with 
> > updates for that file from Jake I'll be applying shortly)

Applied now.

> There is also a small patch from Jesse:
> https://lore.kernel.org/netdev/20191010193112.15215-1-jesse.brandeburg@intel.com/

Ack, as Jake said this duplicates part of what his patch covered, tho.

Will you try to convert and integrate the existing file instead, or do
you think the kdoc file should be separate?
