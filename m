Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08C6C05027
	for <linux-doc@archiver.kernel.org>; Sat,  4 Feb 2023 00:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjBDACY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Feb 2023 19:02:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjBDACX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Feb 2023 19:02:23 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21EC5528E
        for <linux-doc@vger.kernel.org>; Fri,  3 Feb 2023 16:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=0xXfW3gV0mkB2WFK7xCVBhaY7sb3gr3ChI1338rm/zA=; b=qc2jQse4DxEWZY+KZ623jq0RYA
        i56MbKXWh5k8CesLV8ba95B1zGzyVdJ2nrGlzDqU5PBL4FT58R5odGRte4ChqkrRrF/hG200CPItb
        77jaRbF9nDSPC8dtBNcACEWKOnq7YqRC9gpaQ3pzerxwoK3ul/FuZJgIDGLxBgUn8lK1FbJCWQ3mG
        gPURLq/SIzHwT/WlNavEAg9vJosPXg5NfjBU7JsVxW1TUp597U604v0ARDmmlxoS82RTn13O81fiY
        WMB5j75RUYpuldy/Mpj/OkiJFlYZPKZXqjwVbHsqrybT1r5L7A67TJa1ek5YVFhJz40vYYNqthRkE
        F57veRbg==;
Received: from [2601:1c2:d00:6a60::9526]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pO60a-0044ib-IE; Sat, 04 Feb 2023 00:02:20 +0000
Message-ID: <c75c8304-88ce-cb7a-3800-fa3ce83a3421@infradead.org>
Date:   Fri, 3 Feb 2023 16:02:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
References: <87bkmas5vc.fsf@meer.lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87bkmas5vc.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

On 2/3/23 15:09, Jonathan Corbet wrote:
> Add a new sidebar template that creates a more RTD-like "fisheye" view of
> the current place in the document hierarchy.  It is far from ideal, but
> some readers may find it better for navigating through the documentation as
> a whole.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> Sorry it took so long to get back to this...$EXCUSES plus trying to get
> ready for the merge window.
> 
> This version includes the suggestions Akira sent around a couple of
> weeks ago.  I've also the sidebar TOC go one level deeper when
> appropriate.
> 
> There's a bit of JavaScript that attempts to scroll the sidebar
> appropriately.  It's far from perfect but, hopefully an improvement.  It
> could be made better, but I've managed to remain blissfully ignorant of
> JavaScript over the years, so it's slow going.  It would sure be nice if
> somebody who is better at that stuff could jump in.
> 
> I think the contents of the sidebar could be improved too, but that's
> probably a bigger job.
> 
> As before, the results can be seen at:
> 
>   https://static.lwn.net/kerneldoc/

I haven't been following this saga closely but this is looking good to me.
Thanks.

Nit: it says that it's for kernel 6.2.0-rc2-6.2.0-rc2+.
Is that expected?

Another question: if I'm deep into the menu tree, is there a way (link) to get
back to the top level?  Other than editing the URL, that is.


> This probably isn't going to get a lot further before the merge window.
> So I ask: is this sufficiently better that it should go into 6.3?  

I'll let the others answer that one.

>  Documentation/conf.py                         |  5 +++--
>  Documentation/sphinx-static/custom.css        | 20 ++++++++++++++++++-
>  .../sphinx/templates/kernel-toc.html          | 11 ++++++++++
>  3 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/sphinx/templates/kernel-toc.html

-- 
~Randy
