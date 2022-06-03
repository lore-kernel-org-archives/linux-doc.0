Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E6AC43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 16:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244303AbiFCQ0U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 12:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238628AbiFCQ0T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 12:26:19 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9245E51337
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 09:26:18 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id j3so5949986qvn.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zjad5mX+9kfhC7M4FWW24A5chduKJI2y9Yeg+ZkkcS8=;
        b=dKbfM0uHt3eUmF4IT6S6BcWKP0e5/0us+/IX5KEO0bo67rQWXL5ZTlPMbq2dQhV2sV
         M7g5orgjdmD8mPVOBorcP7vZnFSHRh57hrG/9w6Ymmp+3swoQsppZy6Q6Q6rtSJDk7IR
         DwnIxJPe8bMczlxTaTqfpqdv3ZF5/ZsuvXPfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zjad5mX+9kfhC7M4FWW24A5chduKJI2y9Yeg+ZkkcS8=;
        b=Yd5+NrX3TI22MwDzY0XqDSDTBN46Zctl/p37Z6vhYR0WAHPx338W1P6A3vkfIQnMYY
         XNz/0zZPhe+SEqK2Djtf2kOReytwER0iydnQDHaEKu85KZBa4INx9Zb/1yo5XgBUt8vn
         l5AwidgYS8n2Rqy6E4dHvWuoxLvLCoWZNrmh364EgpNSpDISxfAwwiRdaUscKGsi2Aej
         P7LFolQrJiMhtx3lH1i8vidBcEawpa9pa1Gdxk2QdUVEWAQxzixp6H++MGnrVuPCiVH5
         6PKf4D0XKUHQRQw3n/4BpfWgmnmce8ODgDCJwsvXD6PCtxhuGC/VHG9b9qJquyrxHq0T
         qIFg==
X-Gm-Message-State: AOAM530VHptdK9y4l2mC/46ueAWcap8dxksGUhLJWvzvOk88N36XYYVD
        iTjriEY9TqmG/YRUNr72MYW1cKaIQmSx2A==
X-Google-Smtp-Source: ABdhPJxiU+CwTY2/tjr2igbdG3pD4tftQGchVWWtHlK+18DaKe+vSZUfndwi170LJwFunk2P/YJfaA==
X-Received: by 2002:ad4:5674:0:b0:466:1ac8:4f93 with SMTP id bm20-20020ad45674000000b004661ac84f93mr9281824qvb.107.1654273577629;
        Fri, 03 Jun 2022 09:26:17 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id o7-20020a05622a008700b00304c270f3f4sm5014437qtw.76.2022.06.03.09.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 09:26:17 -0700 (PDT)
Date:   Fri, 3 Jun 2022 12:26:15 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <20220603162615.wto3fywuvs2wlb5r@meerkat.local>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
 <YponOKPBgE8pgBYD@casper.infradead.org>
 <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
 <87tu91vis5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tu91vis5.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 03, 2022 at 10:00:42AM -0600, Jonathan Corbet wrote:
> > I'm happy to upgrade that to a newer version if that condition no longer
> > applies.
> 
> Upstream is "happy" in that it renders the documentation just fine and
> we've dealt with the incompatibilities for our modules.  My only
> complaint is the speed, but presumably your automated system has no
> trouble being patient :)

Indeed. So, should I go to 3.x, 4.x, or go all new and shiny with 5.x?

-K
