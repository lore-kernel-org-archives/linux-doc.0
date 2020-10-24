Return-Path: <SRS0=S9Hd=D7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEB4C2D0A3
	for <linux-doc@archiver.kernel.org>; Sat, 24 Oct 2020 06:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBC1A2226B
	for <linux-doc@archiver.kernel.org>; Sat, 24 Oct 2020 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603521789;
	bh=BytbB9Q9MxG+lU7eS7nGt1ufBxrxn9VH2aHMc7wA6Ik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=dbWsMeJ6i+0j9E3uvIGR+n05sD1Y7SRLgVXhU+lBYkAEBipE3FxC1qQyt72JfCoWV
	 a4nwncU7INiPuvwoivQAp+rw1XhggT9UFf+ckbjhhuz54muRmfetsK//8FTyGrmSGM
	 pjMlnulLLadN5d5i+FiM2VVdyRncX32AGFeI/3EU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759793AbgJXGnJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Oct 2020 02:43:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:33086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759788AbgJXGnJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Oct 2020 02:43:09 -0400
Received: from coco.lan (ip5f5ad5d6.dynamic.kabel-deutschland.de [95.90.213.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34E772226B;
        Sat, 24 Oct 2020 06:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603521789;
        bh=BytbB9Q9MxG+lU7eS7nGt1ufBxrxn9VH2aHMc7wA6Ik=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HmJ/zc5GXE4ifXODxeCpP4h8LsZv/5RbgZJmd6Cg/AUPnYayCe6AgoEBeVz4iqyXt
         eMUUdtzB1euZI1a4jruTWLwenOKxERWv1elvncUxC4xNzyjn+MMzCnRB5dPsF+4zU2
         6U8ziQGzu5kQ4WnAk9/esC6onRUpJtHvZFmKbHME=
Date:   Sat, 24 Oct 2020 08:43:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/56] scripts: kernel-doc: fix typedef parsing
Message-ID: <20201024084305.655fcada@coco.lan>
In-Reply-To: <20201023112226.4035e3f7@lwn.net>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
        <d0b2146c4ced3121342583bb3d962628fc96759b.1603469755.git.mchehab+huawei@kernel.org>
        <20201023112226.4035e3f7@lwn.net>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 23 Oct 2020 11:22:26 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Fri, 23 Oct 2020 18:32:48 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The include/linux/genalloc.h file defined this typedef:
> > 
> > 	typedef unsigned long (*genpool_algo_t)(unsigned long *map,unsigned long size,unsigned long start,unsigned int nr,void *data, struct gen_pool *pool, unsigned long start_addr);
> > 
> > Because it has a type composite of two words (unsigned long),
> > the parser gets the typedef name wrong:
> > 
> > .. c:macro:: long
> > 
> >    **Typedef**: Allocation callback function type definition
> > 
> > Fix the regex in order to accept composite types when
> > defining a typedef for a function pointer.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/kernel-doc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> > index 99cd8418ff8a..311d213ee74d 100755
> > --- a/scripts/kernel-doc
> > +++ b/scripts/kernel-doc
> > @@ -1438,7 +1438,7 @@ sub dump_typedef($$) {
> >      $x =~ s@/\*.*?\*/@@gos;	# strip comments.
> >  
> >      # Parse function prototypes
> > -    if ($x =~ /typedef\s+(\w+)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
> > +    if ($x =~ /typedef\s+(\w+\s*){1,}\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||  
> 
> I sure wish we could find a way to make all these regexes more
> understandable and maintainable.  Reviewing a change like this is ... fun.

Yeah. Regexes can be take a while to check. Btw, there's a site that
is really cool to check things:

	https://regex101.com/

Unfortunately, it doesn't support Perl flavor. So, you may still
need to double-check if Perl will handle the regex the same way[1].

[1] One of the differences I found is with regards to match repetitions
    https://perldoc.perl.org/perlrequick#Matching-repetitions
    This works on both Python and Perl:
	(foo){0,2}
    But this only works on Python:
	(foo){,2}

> 
> Anyway, it seems to work, but it does now include trailing whitespace in
> the type portion.  So, for example, from include/linux/xarray.h:
> 
>   typedef void (*xa_update_node_t)(struct xa_node *node);
> 
> The type is parsed as "void " where it was "void" before.  The only ill
> effect I can see is that some non-breaking spaces get inserted into the
> HTML output, but perhaps it's worth stripping off that trailing space
> anyway?

Ok, I'll work on a second version addressing it.

Thanks,
Mauro
