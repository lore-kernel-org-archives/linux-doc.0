Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1959CEE7FF4
	for <linux-doc@archiver.kernel.org>; Sun, 10 Sep 2023 04:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343564AbjIJETH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 Sep 2023 00:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239833AbjIJETH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Sep 2023 00:19:07 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6F812C;
        Sat,  9 Sep 2023 21:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=V/BzzRnx08kcKDhgPWB1jV4Zqn/q6RfLFanHuS+1wCc=; b=Aj/ujZTVRTrvMwakgrb6/UYHSZ
        WEsm6jgosX0GSOy7PNd6Mhxxzfpv5Lm2thoz37HVcIuP0+DoxSBl/aRJ3VuU0OkcjtbZCEXEXD78y
        2OAr67ITppTIbS0fkyQKhxnSzrkKAufDS2qFmmjFHqnCxxvSkIUdfI+gABEQYibUD8lVnu8FXbVOj
        tsP44/SIcI3sOB4JS+hxp6AeiFLATm5O9asbUyWT6ytm0bZaO1bbDHU610LRDk6T5htukFmm99JJM
        bbc+LPTHO8ZFRPqKwTKUaui1LbmuvzIerb86HbXGX/lq0tZMO8Lim9h8SIBavm47bu/GccK7UX5ao
        Ndyis9yQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qfBuT-00AI9z-Jl; Sun, 10 Sep 2023 04:18:57 +0000
Date:   Sun, 10 Sep 2023 05:18:57 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Oliver Faso <erer1243@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/sphinx: Explicitly convert Sphinx paths to str
Message-ID: <ZP1DsYlG+R/Y9fjr@casper.infradead.org>
References: <20230910040811.53046-1-erer1243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230910040811.53046-1-erer1243@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 10, 2023 at 12:08:06AM -0400, Oliver Faso wrote:
>                  else:
> -                    doc = env.srcdir + "/" + env.docname + ":" + str(self.lineno)
> +                    doc = str(env.srcdir) + "/" + env.docname + ":" + str(self.lineno)

Would we be better off doing the path manipulation in Path, then converting
to string?  ie:

			doc = str(env.srcdir / env.docname) + ":" + str(self.lineno)

