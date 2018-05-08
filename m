Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 924B77E6A4
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 18:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932400AbeEHS3J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 14:29:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51396 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754370AbeEHS3H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 14:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=d1vJoaJWk9t6pp0a8E+eY8GGC79szae7oOIqbb9AF88=; b=NS1YPEzgR0BOST64xatZQkgAl
        qaAFLGhXYiV1dh/ObuIS14zMB4r0hw60tM3xo4F/cwjztoGbMAWxk0jQQiwZiTQ2rXxpkREQXCG5m
        TBW7ClMDCF7SZ+rZx+agcI4UwH4kOyw+9DaB7L8N2q8oIYAgMGQfAhVDBkgLzNtTK3H3M+KtmuSUz
        iSXQFsrS2lwLKIApSUkTwEeAcJ8pEk7X3pcSRZG1plLphekoy3a49K9XtaE6DZ3peBi03NXRI2gEx
        D/vLxOI8wSeW4Xd+hnZRuPVwRuw4CszZiXTl1UIjzjqIGWmUTHJegu+Itc3cRKGBbqNpl1yU1tNDl
        LR30kowQA==;
Received: from 177.41.109.86.dynamic.adsl.gvt.net.br ([177.41.109.86] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fG7MA-0006Ge-PM; Tue, 08 May 2018 18:29:01 +0000
Date:   Tue, 8 May 2018 15:28:51 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will.deacon@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        Jeff Layton <jlayton@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Elena Reshetova <elena.reshetova@intel.com>,
        "Tobin C. Harding" <me@tobin.cc>
Subject: Re: [PATCH 05/18] docs: core-api: add cachetlb documentation
Message-ID: <20180508152851.11f39370@vento.lan>
In-Reply-To: <20180508150507.284ef477@vento.lan>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <07b59879d34502828467f0190f941e23e08fdc81.1525684985.git.mchehab+samsung@kernel.org>
        <20180507122937.GA5813@andrea>
        <87y3gu43d3.fsf@intel.com>
        <20180508150507.284ef477@vento.lan>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 8 May 2018 15:05:07 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Tue, 08 May 2018 17:40:56 +0300
> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> 
> > On Mon, 07 May 2018, Andrea Parri <andrea.parri@amarulasolutions.com> wrote:  
> > > On Mon, May 07, 2018 at 06:35:41AM -0300, Mauro Carvalho Chehab wrote:    
> > >> The cachetlb.txt is already in ReST format. So, move it to the
> > >> core-api guide, where it belongs.
> > >> 
> > >> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > >> ---
> > >>  Documentation/00-INDEX                                | 2 --
> > >>  Documentation/{cachetlb.txt => core-api/cachetlb.rst} | 0
> > >>  Documentation/core-api/index.rst                      | 1 +
> > >>  Documentation/memory-barriers.txt                     | 2 +-
> > >>  Documentation/translations/ko_KR/memory-barriers.txt  | 2 +-
> > >>  5 files changed, 3 insertions(+), 4 deletions(-)
> > >>  rename Documentation/{cachetlb.txt => core-api/cachetlb.rst} (100%)    
> > >
> > > I see a few "inline" references to the .txt file in -rc4 (see below):
> > > I am not sure if you managed to update them too.    
> > 
> > Side note, there's scripts/documentation-file-ref-check to grep the
> > kernel tree for things that look like file references to Documentation/*
> > and complain if they don't exist.
> > 
> > I get about 350+ hits with that, patches welcome! ;)  
> 
> This small script fixes a bunch of such errors:
> 
> 	scripts/documentation-file-ref-check 2>broken_refs
> 	for i in $(cat broken_refs|cut -d: -f 2|grep -v devicetree|sort|uniq|grep \\.txt); do
> 	        rst=$(basename $i)
> 	        rst=${rst/.txt/.rst}
> 	        f=$(find . -name $rst)
> 	        f=${f#./}
> 	        if [ "$f" != "" ]; then
> 	                echo "Replacing $i to $f"
> 	                for j in $(git grep -l $i); do
> 	                        sed "s@$i@$f@g" -i $j
> 	                done
> 	        fi
> 	done

It follows an improvement to the above script that shows also what
it didn't find as a ReST file, and the ones that have common names
with multiple matches.

I guess we could integrate something like that at 
scripts/documentation-file-ref-check, in order to allow auto-correcting
renamed .txt files.

Regards,
Mauro


#!/bin/bash

scripts/documentation-file-ref-check 2>broken_refs
for i in $(cat broken_refs|cut -d: -f 2|grep -v devicetree|sort|uniq|grep \\.txt); do
        rst=$(basename $i)
        rst=${rst/.txt/.rst}
        f=$(find . -name $rst)

        if [ "$f" == "" ]; then
                echo "ERROR: Didn't find a .rst replacement for $i"
        elif [ "$(echo $f | grep ' ')" != "" ]; then
                echo "ERROR: Found multiple possible replacements for $i:"
                for j in $f; do
                        echo "    $j"
                done
        else
                echo "Replacing $i to $f"
                f=${f#./}
                for j in $(git grep -l $i); do
                        sed "s@$i@$f@g" -i $j
                done
        fi
done


Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
