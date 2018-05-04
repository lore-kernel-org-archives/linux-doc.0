Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A111F7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 11:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750880AbeEDLeO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 May 2018 07:34:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54238 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750820AbeEDLeN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 May 2018 07:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=M/qldvMILTN9Ti0RGBoiQQ39atKs5WvmnOqFzAdbvrw=; b=I65uelzOdKf5Gs+eMZdFWwJJj
        qpScUwNkGQ5BVgRz3u5rGxp7DxpQHSJ7LLjlKnbqiIDIwbEZd+ItAVQOzX2qo4nlXhYToDrcj/O8n
        VrzU7K73RJHclyLm5aA/x8jm459in573Tpi0X4nYp+YqlpPig62TUMXNsxZrY9yS9Lnf9yzpVCeuF
        Vw/7vBGBja18H+VcUhVTchEzFRJR+r2eojzmHkEf8f1319iW/C9yaJZsjUFw3fgnnCuDf94/hwXjz
        IWAf09XITPZM+Ble8cfqC+92y5eahyPmojMMyWiz0V92UmHBgkcnNz03BzxTFXMLsIWIyTTQHzD7G
        SoPkicS8Q==;
Received: from 177.17.129.114.dynamic.adsl.gvt.net.br ([177.17.129.114] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fEYyU-00014P-5y; Fri, 04 May 2018 11:34:06 +0000
Date:   Fri, 4 May 2018 08:33:55 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Brian Warner <brian.warner@samsung.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Gustavo A. R. Silva" <garsilva@embeddedor.com>,
        Benoit Parrot <bparrot@ti.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arvind Yadav <arvind.yadav.cs@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Bhumika Goyal <bhumirks@gmail.com>, Sean Young <sean@mess.org>,
        Brad Love <brad@nextdimension.cc>,
        Devin Heitmueller <dheitmueller@kernellabs.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Markus Elfring <elfring@users.sourceforge.net>,
        Alexey Klimov <klimov.linux@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Yong Zhi <yong.zhi@intel.com>, Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kamil Rytarowski <n54@gmx.com>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        linux-doc@vger.kernel.org, linux-kernel@zh-kernel.org,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH] MAINTAINERS & files: Canonize the e-mails I use at
 files
Message-ID: <20180504083355.0c891ab3@vento.lan>
In-Reply-To: <87in837km8.fsf@intel.com>
References: <85bfc919e068ea7bb1e9b533ac6f60798844a5c0.1525428104.git.mchehab+samsung@kernel.org>
        <87in837km8.fsf@intel.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 04 May 2018 13:58:39 +0300
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Fri, 04 May 2018, Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> > From now on, I'll start using my @kernel.org as my development e-mail.
> >
> > As such, let's remove the entries that point to the old
> > mchehab@s-opensource.com at MAINTAINERS file.
> >
> > For the files written with a copyright with mchehab@s-opensource,
> > let's keep Samsung on their names, using mchehab+samsung@kernel.org,
> > in order to keep pointing to my employer, with sponsors the work.
> >
> > For the files written before I join Samsung (on July, 4 2013),
> > let's just use mchehab@kernel.org.
> >
> > For bug reports, we can simply point to just kernel.org, as
> > this will reach my mchehab+samsung inbox anyway.  
> 
> I suppose this begs the question, why do we insist on adding our email
> addresses all over the place? On a quick grep, there are at least 40k+
> email addresses in the sources. Do we expect them all to be up-to-date
> too?

That's a good question.

The usual use case is that the e-mail allows people to contact developers
if needed. Such contact could simply due to something like handling SPDX
or other license-related issues or for troubleshooting.

There's also another reason (with IMHO, is more relevant): just the name
may not be enough to uniquely identify the author of some code. While
that might happen on occidental Countries, this is a way more relevant
for Asian Countries. For example, there are very few surnames on
some Countries there[1], and common names are usually... common. So, it
is not hard to find several people with exactly the same name working at
the same company. I've seen e-mails from those people that are things like
john.doe51@some.company, john.doe69@some.company, ...

[1] For example: https://en.wikipedia.org/wiki/List_of_Korean_surnames.

The e-mail is a way to uniquely identify a person. If we remove it,
then we may need to add another thing instead (like parents names,
security number or whatever), with would be weird, IMO. 

As we all use e-mails to uniquely identify contributors submissions,
IMHO, the best is to keep using e-mails. The side effect is that
we should keep those emails updated.

-

In the specific case of this patch, as I'm now just using @kernel.org
everywhere within the Kernel tree, I don't expect needing to change
it in long term.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
