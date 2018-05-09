Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B8117DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 14:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934775AbeEIOlE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 10:41:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58444 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933988AbeEIOlD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 10:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bPLNuUVEijZjzQmL55rVt2XIqbg2E9UElGlhyZ+EMoA=; b=ZkhPQZgTmAdtxlJ9iWhXwhKno
        PJb0NK+Bo7/lReSKkvLCibVXv9S8O4g6t1fRiJiJ/Q6O9OlRD4ZrzqMxKlw//yxXS96MKPpKS4IKF
        n8YfSRIRJcYmnbAEc0FYdj1eWWMVB9S+th0SgBQuGK1gh+HMU1C9CxYiE7BCkl8s8EdN15HHs3+mv
        CMS5lT8A0RJM4gVeD2zTlr+vd5X1r/7AjkscsBQnJPb3vavd85m7s7ysdIVZd6m/UKlOPMexL9QDh
        EMl1FuSi0kIB3OUon1dPkrI4UEK011Ke3jB3+mA0kyRFhA3j+pDBL+uO1C8Y198WPNooj/VLaIAME
        7tT4WqcgQ==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGQH4-0003Sk-An; Wed, 09 May 2018 14:40:58 +0000
Date:   Wed, 9 May 2018 11:40:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Andrea Parri <andrea.parri@amarulasolutions.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 08/11] docs: refcount-vs-atomic.rst: prefix url with
 https
Message-ID: <20180509114054.3ff70c98@vento.lan>
In-Reply-To: <20180509134319.GA14921@andrea>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
        <d5683242124d6070c9a2d665c59e274d94c8b3ba.1525870886.git.mchehab+samsung@kernel.org>
        <20180509134319.GA14921@andrea>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 9 May 2018 15:43:19 +0200
Andrea Parri <andrea.parri@amarulasolutions.com> escreveu:

> Hi Mauro,
> 
> On Wed, May 09, 2018 at 10:18:51AM -0300, Mauro Carvalho Chehab wrote:
> > There's a github URL there, but it is not prefixed by https.
> > Add a prefix, to avoid false-positives with:
> > 	./scripts/documentation-file-ref-check
> > 
> > As a side effect, Sphinx should also generate a cross-ref.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> There seems to be a "conflicting" patch ("applied" according to Jon):
> 
>     http://lkml.kernel.org/r/1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com
> 
> Let me stress here that the github repo. is out-of-date (and we have
> no plans to keep that in sync with mainline).

Good! One less patch pending :-)

Yeah, it seems that Jon pushed it from his repository today. I did a new
git remote update and I'm now seeing this one too.

> 
>   Andrea
> 
> 
> > ---
> >  Documentation/core-api/refcount-vs-atomic.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/core-api/refcount-vs-atomic.rst b/Documentation/core-api/refcount-vs-atomic.rst
> > index 83351c258cdb..185d659e350a 100644
> > --- a/Documentation/core-api/refcount-vs-atomic.rst
> > +++ b/Documentation/core-api/refcount-vs-atomic.rst
> > @@ -17,7 +17,7 @@ in order to help maintainers validate their code against the change in
> >  these memory ordering guarantees.
> >  
> >  The terms used through this document try to follow the formal LKMM defined in
> > -github.com/aparri/memory-model/blob/master/Documentation/explanation.txt
> > +https://github.com/aparri/memory-model/blob/master/Documentation/explanation.txt
> >  
> >  memory-barriers.txt and atomic_t.txt provide more background to the
> >  memory ordering in general and for atomic operations specifically.
> > -- 
> > 2.17.0
> >   



Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
