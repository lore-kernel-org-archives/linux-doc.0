Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 512547D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Feb 2019 08:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfBEIau (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Feb 2019 03:30:50 -0500
Received: from smtp2-4.goneo.de ([85.220.129.36]:43036 "EHLO smtp2-4.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbfBEIau (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Feb 2019 03:30:50 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id 23AB923FF79;
        Tue,  5 Feb 2019 09:30:48 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dePYk0SWcKsn; Tue,  5 Feb 2019 09:30:47 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-091-096-214-122.ewe-ip-backbone.de [91.96.214.122])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 8259723F031;
        Tue,  5 Feb 2019 09:30:46 +0100 (CET)
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
To:     Jonathan Corbet <corbet@lwn.net>, "Tobin C. Harding" <me@tobin.cc>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc> <20190131092757.GF28876@rapoport-lnx>
 <20190131205608.GB1329@eros.localdomain> <20190201160310.5b98eb69@lwn.net>
 <20190202143209.GA8620@rapoport-lnx> <20190204211220.GA8601@eros.localdomain>
 <20190204160336.12fe82f6@lwn.net>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <c19a1a84-72cd-407a-f4f1-180c5b0d4bf0@darmarit.de>
Date:   Tue, 5 Feb 2019 09:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204160336.12fe82f6@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 05.02.19 um 00:03 schrieb Jonathan Corbet:
> On Tue, 5 Feb 2019 08:12:20 +1100
> "Tobin C. Harding" <me@tobin.cc> wrote:
> 
>> I tried to investigate this further and I am unable to reproduce the
>> original warning.  I'm using python virtual environment as directed by
>> the output of `make htmldocs` so the environment should not have
>> changed.  The only other plausible explanation seems to be that I've
>> gone mad and can't remember what I was doing three days ago.
> 
> You are not the first to have reported such issues, though; I've seen a
> couple of things go by in the past.  Until we understand what is going on,
> it's probably best to avoid hyphens in labels.

Many errors are not reported again in rebuilds.

To reproduce this error run 'make cleandocs htmldocs' first.  Then you will see
this error message (I'am on current docs-next from Jon using Sphinx v1.8.3 ):

   Documentation/core-api/mm-api.rst:22: WARNING: undefined label: \
     memory-allocation (if the link has no caption ...)

In mm-api.rst you find this include:

.. kernel-doc:: include/linux/slab.h
    :internal:


And in slab.h you see a kmalloc DOC with a :ref:`..<memory-allocation>`


/**
  * kmalloc - allocate memory
  * @size: how many bytes of memory are required.
  * @flags: the type of memory to allocate.
  *
  * kmalloc is the normal method of allocating memory
  * for objects smaller than page size in the kernel.
  *
  * The @flags argument may be one of the GFP flags defined at
  * include/linux/gfp.h and described at
  * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
  *
  * The recommended usage of the @flags is described at
  * :ref:`Documentation/core-api/memory-allocation.rst <memory-allocation>`


With Tobin's patch applied to Jon's docs-next (cd7198fc959), this error comes up
the first time (for me).

   Can we please revert cd7198fc959 / Thanks

@Tobin can you pleases test to revert cd7198fc959 and make a full build with
'cleandocs' first .. may this error comes up again for you and we can
investigate any further .. if this depends to sphinx-Version or what ever.


-- Markus --
