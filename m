Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3679E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Jul 2019 02:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfGSCoW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Jul 2019 22:44:22 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44018 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfGSCoW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jul 2019 22:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3LkIbrLGfP6lnU2flTbf1fGpCxww7P2b8XCbsVSdFOM=; b=lEgc7FbHuv0vX9hEMksiBHPr1
        RfMGAHJLAe0MBz4w8UsxAzGr+CdPQzKToey+VOmYH/lrYyWKG04Gowv5mR5fyNodxMBVt1ZMWb8hO
        NeiVVUXwCLbBR4D+XLvkyK3ia8UcpNBGbxELo1YPY4V2u6PNqQ1jp9X/kkTmeGxJpFjZewPqM28H8
        Q7l70CtNLf80ULrNI5lVJnLOtGnFdLaMqlw/oC5nL9NEw0Irw9vRFDqC5rZLsnK+TjZCCO9Nqo4nZ
        EOJk3d2vH7jlsREPIJki0oFwTwV5WXVgozpyaU4wXdl+y7DNeD5RvvszUr4u16+Wm/0Im/ZIdeQyd
        +xLp5OcQQ==;
Received: from [191.33.154.161] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hoIsd-00026B-V3; Fri, 19 Jul 2019 02:44:20 +0000
Date:   Thu, 18 Jul 2019 23:44:16 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: Using rst2pdf for PDF output - Was: Re: [PATCH 0/5] PDF output
 fixes
Message-ID: <20190718234416.59c9cf7a@coco.lan>
In-Reply-To: <04a1a65f-c96c-1f4a-d987-d8b9e605d7c1@darmarit.de>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
        <20190712141921.7f8a1d02@lwn.net>
        <20190712192705.71b97717@coco.lan>
        <20190713004125.6009b661@coco.lan>
        <20190718144655.5aa7deb4@coco.lan>
        <04a1a65f-c96c-1f4a-d987-d8b9e605d7c1@darmarit.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 18 Jul 2019 19:56:57 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Am 18.07.19 um 19:46 schrieb Mauro Carvalho Chehab:
> > Em Sat, 13 Jul 2019 00:41:25 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> > 
> >> Em Fri, 12 Jul 2019 19:27:05 -0300
> >> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> >>
> >>> Em Fri, 12 Jul 2019 14:19:21 -0600
> >>> Jonathan Corbet <corbet@lwn.net> escreveu:
> >>>    
> >>>> Can't you just make rst2pdf work instead? :)
> >>>
> >>> Well, we can try.
> 
> Thanks a lot for your investigation on this.  I also checked the rst2pdf sources 
> a while ago, for me it was crap with crap requirements [1] .. my tip: don't 
> waste to much time on it.
> 
> [1] https://github.com/mchehab/rst2pdf/blob/master/requirements.txt#L31
> 

Yeah, a simple test shows that this upstream rst2pdf + latest reportlab has
some issues.

Running this:

	$ rst2pdf  Documentation/process/license-rules.rst 

causes an error with reportlab-3.5.23. It has to be downgraded to version
3.4 in order to avoid this error:

	  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/reportlab/platypus/doctemplate.py", line 651, in handle_pageEnd
    raise LayoutError(ident)
reportlab.platypus.doctemplate.LayoutError: More than 10 pages generated without content - halting layout.  Likely that a flowable is too large for any frame.

Another solution would be to do this:

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 2ef44ada3f11..19a480ebd69a 100644
--- a/Documentation/process/license-rules.rst
+++ b/Documentation/process/license-rules.rst
@@ -452,7 +452,10 @@ _`MODULE_LICENSE`
 				  module source is dual licensed under a
 				  GPL v2 variant and MIT license. Please do
 				  not use in new code.
+    ============================= =============================================
+
 
+    ============================= =============================================
     "Dual MIT/GPL"		  The correct way of expressing that the
 				  module is dual licensed under a GPL v2
 				  variant or MIT license choice.

But it sucks needing to break long tables because reportlab's handling
for big tables is broken.


Thanks,
Mauro
