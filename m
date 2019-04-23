Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F3C57D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Apr 2019 12:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbfDWMgT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Apr 2019 08:36:19 -0400
Received: from casper.infradead.org ([85.118.1.10]:46742 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfDWMgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Apr 2019 08:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hFkON702bUd/WwTPJ6kyCwfsNPeaZfVttAo8WVlv5FQ=; b=YPcAkK6Go5opICdqhZWHfmrWOl
        ZHdS/UNIw5A/i3W5jpc10DLLoboupAJ2c0H0QfKSlkzNnASsOnrpUr+jdHJ9p9wdnEhbfekCvbIQP
        ig/cH9oKDmrX6LCIT/b+oTQC2TusMbzUJjjwBCQir0A2x/TT5U2wX8kHPWIFjaZfdYeeWkQj9qMbS
        2ffaDf98/zSep9BrdRhll6+Yy+aN4a5+6CLdHGQke1FR4uI15NvVWc4V2bQEuhvaij4gWbFfDHUqD
        V2e81rhNIj6UAwgge9RYjbSTChoKeQdXM0MwbSbm1kawb2Ck2E4dP36ssoBPXuDAqU6TKYNmq2Wuw
        c95rQGGQ==;
Received: from 177.17.136.231.dynamic.adsl.gvt.net.br ([177.17.136.231] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIuek-0001D7-27; Tue, 23 Apr 2019 12:36:14 +0000
Date:   Tue, 23 Apr 2019 09:36:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 15/79] docs: gpio: convert docs to ReST and rename to
 *.rst
Message-ID: <20190423093608.1af5e0fb@coco.lan>
In-Reply-To: <CACRpkdY=YurusedRbMDWstJUP4CLUosW0rLetvE=Hkov1Y9HGQ@mail.gmail.com>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
        <03cdacc3db76c5ff984c1507ea6434650d36d822.1555938376.git.mchehab+samsung@kernel.org>
        <CACRpkdY=YurusedRbMDWstJUP4CLUosW0rLetvE=Hkov1Y9HGQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 23 Apr 2019 13:23:50 +0200
Linus Walleij <linus.walleij@linaro.org> escreveu:

> On Mon, Apr 22, 2019 at 3:28 PM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> 
> > The API described at sysfs.txt is deprecated.
> >
> > Still, as it is still part of the Kernel (and will likely be
> > there for some time, as we don't simply remove APIs). So,
> > it makes sense to keep it there.
> >
> > The conversion of this file is trivial:
> >   - add blank lines and identation in order to identify paragraphs;
> >   - mark a literal block as such.
> >
> > At its new index.rst, let's add a :orphan: while this is not linked to
> > the main index.rst file, in order to avoid build warnings.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Same question as the v1: should I apply it or will you :)

I suspect that it would be better if it gets applied via
the GPIO tree, in order to reduce potential merge conflicts.

Regards,
Mauro
