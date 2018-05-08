Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE7A57E27B
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 19:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755204AbeEHTFX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 15:05:23 -0400
Received: from mail-wr0-f170.google.com ([209.85.128.170]:42127 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752146AbeEHTFW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 15:05:22 -0400
Received: by mail-wr0-f170.google.com with SMTP id v5-v6so33374443wrf.9
        for <linux-doc@vger.kernel.org>; Tue, 08 May 2018 12:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KLqYYsqNtPzOIH/RJ0MA3T/kP7EOaM1RHnxWlIRU6rk=;
        b=F4kBGgl9NF0Qg1ZQnMJ26ZTzls/s6zMa9RDMNjLcKsj1QmDOMbOxtf7JqLwSy9wj6r
         O7gC0sK6ppOJ4LjbeqKbg9mw1o/1fWLT8n3qJ9RYms1geb9Gc/HxbhMrcNR5ZRnnAJG9
         VdR0apoVDlNu7zo6AEPnrvM85eFxATwTs8CiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KLqYYsqNtPzOIH/RJ0MA3T/kP7EOaM1RHnxWlIRU6rk=;
        b=CLGniS/SgyQb3rWA+U41w4XNPZFA1pfRcZcsIyN40vhTeDlrT/NAcYqFDU+Zq07J3/
         PpEMoWFnO9McrQbs5pmAd31C/R4jffJE8UKyXKuSOFm++cbaUbEinx/0B+x8E+tnyhcU
         iCXSamBZLVD9UfYhkUn20jZrDPUkc34bqQG9CFxecEZWDunD9t9ig0x9Py9EXDHB7QCN
         9bJYDtEmylzNcoTv7rYGcTbFFYlOa0eKsKGMGRBZvsag+Td2aQJ2vtKdYxD5b3nYTGRC
         S/n6ZxkxbAAwKn4EdV1ivIybzrXPIGd6i/G+UYd5TMJm6EO3mEVL44Y2v+ehK/JaEbPx
         x7+Q==
X-Gm-Message-State: ALQs6tAnYoB20slLYcKo2J/J2MG6sTZXdNqVlSJbRux27FblfZkZvCjD
        7+hJzCZQhsLYLuiYA3Q5ko6kJg==
X-Google-Smtp-Source: AB8JxZrBNbVin+nbe/UukNbUUFXsi2wsJvsZPHSJ2pY/dG3ZXmAAwTClvUyni0nSM+GTkQSIaOTCrQ==
X-Received: by 2002:adf:9cc2:: with SMTP id h2-v6mr23816909wre.11.1525806320279;
        Tue, 08 May 2018 12:05:20 -0700 (PDT)
Received: from andrea ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id 2-v6sm39943794wrb.22.2018.05.08.12.05.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 May 2018 12:05:19 -0700 (PDT)
Date:   Tue, 8 May 2018 21:05:05 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
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
Message-ID: <20180508190505.GA12213@andrea>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <07b59879d34502828467f0190f941e23e08fdc81.1525684985.git.mchehab+samsung@kernel.org>
 <20180507122937.GA5813@andrea>
 <87y3gu43d3.fsf@intel.com>
 <20180508150507.284ef477@vento.lan>
 <20180508152851.11f39370@vento.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180508152851.11f39370@vento.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 08, 2018 at 03:28:51PM -0300, Mauro Carvalho Chehab wrote:
> Em Tue, 8 May 2018 15:05:07 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> 
> > Em Tue, 08 May 2018 17:40:56 +0300
> > Jani Nikula <jani.nikula@linux.intel.com> escreveu:

[...]

> > > Side note, there's scripts/documentation-file-ref-check to grep the
> > > kernel tree for things that look like file references to Documentation/*
> > > and complain if they don't exist.
> > > 
> > > I get about 350+ hits with that, patches welcome! ;)  
> > 
> > This small script fixes a bunch of such errors:
> > 
> > 	scripts/documentation-file-ref-check 2>broken_refs
> > 	for i in $(cat broken_refs|cut -d: -f 2|grep -v devicetree|sort|uniq|grep \\.txt); do
> > 	        rst=$(basename $i)
> > 	        rst=${rst/.txt/.rst}
> > 	        f=$(find . -name $rst)
> > 	        f=${f#./}
> > 	        if [ "$f" != "" ]; then
> > 	                echo "Replacing $i to $f"
> > 	                for j in $(git grep -l $i); do
> > 	                        sed "s@$i@$f@g" -i $j
> > 	                done
> > 	        fi
> > 	done
> 
> It follows an improvement to the above script that shows also what
> it didn't find as a ReST file, and the ones that have common names
> with multiple matches.
> 
> I guess we could integrate something like that at 
> scripts/documentation-file-ref-check, in order to allow auto-correcting
> renamed .txt files.

FWIW, this would be more than welcome with me; thank you,

  Andrea


> 
> Regards,
> Mauro
> 
> 
> #!/bin/bash
> 
> scripts/documentation-file-ref-check 2>broken_refs
> for i in $(cat broken_refs|cut -d: -f 2|grep -v devicetree|sort|uniq|grep \\.txt); do
>         rst=$(basename $i)
>         rst=${rst/.txt/.rst}
>         f=$(find . -name $rst)
> 
>         if [ "$f" == "" ]; then
>                 echo "ERROR: Didn't find a .rst replacement for $i"
>         elif [ "$(echo $f | grep ' ')" != "" ]; then
>                 echo "ERROR: Found multiple possible replacements for $i:"
>                 for j in $f; do
>                         echo "    $j"
>                 done
>         else
>                 echo "Replacing $i to $f"
>                 f=${f#./}
>                 for j in $(git grep -l $i); do
>                         sed "s@$i@$f@g" -i $j
>                 done
>         fi
> done
> 
> 
> Thanks,
> Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
