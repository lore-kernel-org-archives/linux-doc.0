Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E6FC2D0A3
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 05:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E2D42231B
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603691748;
	bh=NwqYhZ/xDwNlhSXG8TGaA11zmrf4vmrr4/1MfvVTn78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=qaZxiPModpRrmO86T0hVl6a8eEDadImwcNuiZFzDSN1/JobsBZsPG+FYyflr6BXVF
	 zjiEaUZktuaStHDiV0tEmgfWpHycqC9o6kfX9nfkfouwgd96Y4f2uEXFSjOyEi6G8C
	 O0ww4Ag+KC2QSh8x3yQy1pR0wWsC5mHHnpQWqEKY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769998AbgJZFzr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 01:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1769991AbgJZFzr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Oct 2020 01:55:47 -0400
Received: from coco.lan (ip5f5ad5a1.dynamic.kabel-deutschland.de [95.90.213.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 147FB20878;
        Mon, 26 Oct 2020 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603691746;
        bh=NwqYhZ/xDwNlhSXG8TGaA11zmrf4vmrr4/1MfvVTn78=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=husNgAH+wT70FQ1Oz7EZf1cZWztgnDzIjE4uPsF1sIQrAN4Vbcl4cZfpcORdQXuWn
         LwkmzsbGzoZmGsWfOC4ScJeeydwXO/EhD3Yvyay/evQc611z/vOPBhxU1BDNX5pJEc
         G3TQD4QvGUVNLOc6DytEwxrjUTRCvhWhRIo6U+wo=
Date:   Mon, 26 Oct 2020 06:55:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/56] scripts: kernel-doc: fix typedef parsing
Message-ID: <20201026065542.709457a2@coco.lan>
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

Yeah, this is one of the issues. There's another one, tough. While
the above regex recognizes the typedef identifier, it only gets
the last word of "unsigned long", in the case of something like:

	typedef unsigned long (*genpool_algo_t)(unsigned long *map);

Here, we have no option but to use a hidden group, e. g. using
this regex:

	typedef\s+((?:\w+\s*){1,})\(\*\s*(\w\S+)\s*\)\s*\((.*)\);

I'm enclosing a second version with the above. 

Yeah, reviewing it is even funnier, but regex101 can be used to
double-check what the regex is doing:

	https://regex101.com/r/bPTm18/2

Thanks,
Mauro

[PATCH] scripts: kernel-doc: fix typedef parsing

The include/linux/genalloc.h file defined this typedef:

	typedef unsigned long (*genpool_algo_t)(unsigned long *map,unsigned long size,unsigned long start,unsigned int nr,void *data, struct gen_pool *pool, unsigned long start_addr);

Because it has a type composite of two words (unsigned long),
the parser gets the typedef name wrong:

.. c:macro:: long

   **Typedef**: Allocation callback function type definition

Fix the regex in order to accept composite types when
defining a typedef for a function pointer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 99cd8418ff8a..b37f3cf8a331 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1438,13 +1438,14 @@ sub dump_typedef($$) {
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
     # Parse function prototypes
-    if ($x =~ /typedef\s+(\w+)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
+    if ($x =~ /typedef\s+((?:\w+\s*){1,})\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
 	$x =~ /typedef\s+(\w+)\s*(\w\S+)\s*\s*\((.*)\);/) {
 
 	# Function typedefs
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
+	$return_type =~ s/\s+$//;
 
 	create_parameterlist($args, ',', $file, $declaration_name);
 

