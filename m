Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646C2C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 04:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22E3561966
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 04:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhCVEDC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 00:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhCVEDB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 00:03:01 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6120EC061574;
        Sun, 21 Mar 2021 21:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4a8nm0y32xGcaD9mUxGj3UqgnqgFCog9eP1Pm0kruoE=; b=D1yb5vAfC65DA6Scf6UDfXp3Hg
        bJwJEzQQlnkqpppVA9nXFzhVJgywKbMbgvXmpolHqR8Cnve3nYh3KeR+15Q0LI2UeVjCd+67HukE9
        u92apkX5aeCUjXhwWGv9RbyvUeJHBDbb6j+A8mIL6G1e5SzULhk9iE0QV6Y0vjK09vrFDQCQV8ASl
        g+meAeSyPDQesa5xkv7MVTE5RzbziOn4DXYJP2jZ6Pe7Zu8GPAHXpyIIKbvTuZNehDI0caG1FqqXC
        p20DGWH+zWN90q/wzNrOF+HK4t+aZe+EsWA/LV0wBhXr4afuTu+ToAnkJfpvX2JDOKzHaZIxYgFoD
        5KkqfQ3A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lOBle-007xoQ-SW; Mon, 22 Mar 2021 04:02:19 +0000
Date:   Mon, 22 Mar 2021 04:02:14 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, corbet@lwn.net,
        sir@cmpwn.com, gregkh@linuxfoundation.org, lee.jones@linaro.org,
        bp@alien8.de, huawei@kernel.org, krzk@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH] docs: submitting-patches Fix a typo
Message-ID: <20210322040214.GG1719932@casper.infradead.org>
References: <20210322033000.2523887-1-unixbhaskar@gmail.com>
 <20210322034459.GE1719932@casper.infradead.org>
 <YFgTkhA+IOvNVxEn@ArchLinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFgTkhA+IOvNVxEn@ArchLinux>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 22, 2021 at 09:18:34AM +0530, Bhaskar Chowdhury wrote:
> On 03:44 Mon 22 Mar 2021, Matthew Wilcox wrote:
> > On Mon, Mar 22, 2021 at 09:00:00AM +0530, Bhaskar Chowdhury wrote:
> > > 
> > > s/mesages/messages/
> > 
> > did you test the build afterwards?  you forgot to do something.
> > 
> What are you talking about??? It is going over my head...why the build
> reqired?? A spello needs a rebuild???? Wondering....

don't argue with me.  just type 'make htmldocs' and find out.

