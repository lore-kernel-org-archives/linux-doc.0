Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 65E2B7D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 12:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbeIKRCx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 13:02:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59434 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726678AbeIKRCx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Sep 2018 13:02:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7C435400738B;
        Tue, 11 Sep 2018 12:03:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com [10.36.116.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C16D4111AF29;
        Tue, 11 Sep 2018 12:03:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 16EBF16E28; Tue, 11 Sep 2018 14:03:50 +0200 (CEST)
Date:   Tue, 11 Sep 2018 14:03:50 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, linux-api@vger.kernel.org
Subject: Re: [PATCH v7] Add udmabuf misc device
Message-ID: <20180911120350.qtacdf2otwzuywv2@sirius.home.kraxel.org>
References: <20180827093444.23623-1-kraxel@redhat.com>
 <21053714.0Xa7F2u2PE@avalon>
 <20180911065014.vo6qp6hkb7cjftdc@sirius.home.kraxel.org>
 <18750721.r4B5nx0M26@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18750721.r4B5nx0M26@avalon>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Tue, 11 Sep 2018 12:03:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Tue, 11 Sep 2018 12:03:51 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > >> +	if (WARN_ON(vmf->pgoff >= ubuf->pagecount))
> > >> +		return VM_FAULT_SIGBUS;
> > > 
> > > Just curious, when do you expect this to happen ?
> > 
> > It should not.  If it actually happens it would be a bug somewhere,
> > thats why the WARN_ON.
> 
> But you seem to consider that this condition that should never happen still 
> has a high enough chance of happening that it's worth a WARN_ON(). I was 
> wondering why this one in particular, and not other conditions that also can't 
> happen and are not checked through the code. 

Added it while writing the code, to get any coding mistake I make
flagged right away instead of things exploding later on.

I can drop it.

> > >> +	ubuf = kzalloc(sizeof(struct udmabuf), GFP_KERNEL);
> > > 
> > > sizeof(*ubuf)
> > 
> > Why?  Should not make a difference ...
> 
> Because the day we replace
> 
> 	struct udmabuf *ubuf;
> 
> with
> 
> 	struct udmabuf_ext *ubuf;
> 
> and forget to change the next line, we'll introduce a bug. That's why 
> sizeof(variable) is preferred over sizeof(type). Another reason is that I can 
> easily see that
> 
> 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
> 
> is correct, while using sizeof(type) requires me to go and look up the 
> declaration of the variable.

So it simplifies review, ok, will change it.

BTW: Maybe the kernel should pick up a neat trick from glib:

g_new0() is a macro which takes the type instead of the size as first
argument, and it casts the return value to that type.  So the compiler
will throw warnings in case of a mismatch.  That'll work better than
depending purely on the coder being careful and review catching the
remaining issues.

cheers,
  Gerd

