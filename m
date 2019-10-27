Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 350917D90D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 27 Oct 2019 19:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfJ0TFN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 Oct 2019 15:05:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48142 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbfJ0TFN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Oct 2019 15:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ujxRN9RzpLW2a9tdGq1p21HVcGRNOUs6cDoy+zpxMQI=; b=pCNzVkbDWvHEJrhcIDoxdUQ3v
        HQ0dpCZWFI0it793i2hbURu0cp215KCAUIunyF8smg42FIrIF8Je+jw0PEb5fOdjyadKYH7M0bjmJ
        hzheAB48if0HqM7hdnR8IyUMFWYFy3qNklfdhhFjRxZqsuPauMcjnuu3u9My3exAaX6z7C3K19sUE
        lFlkIdXjVIcmqkdWuqhaXEuYapKaq1X9CX4X5IBcphT0v/+VAYPsd0rtCLXf/WE365WcT/WMad0f9
        WaqI9qlG1WInEIxIn1sxG77RB8ae74uX/fPZLQ+dJbzGS8xJiv244f6lTLpSaZ6sKDSugVBTkrZZ+
        ojFUdOP/g==;
Received: from 177.97.63.72.dynamic.adsl.gvt.net.br ([177.97.63.72] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iOnqi-00081D-3F; Sun, 27 Oct 2019 19:05:13 +0000
Date:   Sun, 27 Oct 2019 16:05:07 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <20191027160507.6d7be266@coco.lan>
In-Reply-To: <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
        <201910091929.0C058BB@keescook>
        <20191010124832.23bc4362@lwn.net>
        <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
        <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
        <20191027121729.59c1d539@lwn.net>
        <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Sun, 27 Oct 2019 11:30:22 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 10/27/19 11:17 AM, Jonathan Corbet wrote:
> > On Sun, 27 Oct 2019 11:11:57 -0700
> > Randy Dunlap <rdunlap@infradead.org> wrote:
> >   
> >>> Yes, I see oom-kills when building docs for 5.4-rc2.
> >>> But only after I ran 'gimp *.jpg' for 22 photos.
> >>>
> >>> I can see anywhere from 1 to 4 sphinx-build processes running.    
> >>
> >> I continue to have oom-kills when building docs.

My 2 cents here.

I would keep the default to use more CPUs, as nowadays I suspect that
most devs have a way more than 8GB installed. The worse machine I use
here to build Kernel is a Gen-3 i5 that has has 16GB (and it is a 
personal laptop I bought 5 years ago).

Yet, I agree that doc build should be saner on low-cap machines.

Ideally, the fix should be, IMHO, at sphinx-build: -jauto should
detect OOM possible conditions and reduce the number of used CPUs
it the max available memory is too low.

As there's now a script at Kernel, maybe the script could be modified 
to detect if the max available memory is too low, passing -j1 if,
let's say, the machine has less than (let's say) 16 GB RAM.

> >> At least 2 times I also had system freezes where I had to power
> >> cycle to reboot.

That sounds weird. I can't imagine why you would experience system
freeze with doc build. Are you sure this is not your CPU overheating?

> >>
> >> I suppose I can only hope that other people start running into this
> >> issue.  :(  
> > 
> > Are you still running gimp at the same time?  
> 
> no.
> 
> > Also, are you doing a straight "make htmldocs" or something else?  
> 
> straight "make htmldocs".


Thanks,
Mauro
