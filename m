Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 762907D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 17:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfBGRdi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 12:33:38 -0500
Received: from smtp2-4.goneo.de ([85.220.129.36]:39333 "EHLO smtp2-4.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbfBGRdh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Feb 2019 12:33:37 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id 6BFD623F4EC;
        Thu,  7 Feb 2019 18:33:35 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EodSraGa33Fa; Thu,  7 Feb 2019 18:33:34 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-178-142-135-081.ewe-ip-backbone.de [178.142.135.81])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 6076723F484;
        Thu,  7 Feb 2019 18:33:34 +0100 (CET)
Subject: Re: Return: vs Returns:
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org
References: <20190207135924.GV21860@bombadil.infradead.org>
 <20190207153056.GB9120@rapoport-lnx>
 <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
 <20190207161852.GC8040@rapoport-lnx>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <e038da5e-bc39-59f4-5b7f-c97467563173@darmarit.de>
Date:   Thu, 7 Feb 2019 18:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190207161852.GC8040@rapoport-lnx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 07.02.19 um 17:18 schrieb Mike Rapoport:
>>> Does checkpatch checks the kernel-doc parts at all?
>> No.  I guess there are to many places to fail / to hard to put someone in
>> charge.  E.g. if you do include a single kernel-doc comment from a source all
>> kernel-docs in the source will be parsed and may produce (error/warning)
>> essages.  What we have, are some targets:
>>
>> -linkcheckdocs
>>   check for broken external links (will connect to external hosts)
>>
>> - refcheckdocs
>>    check for references to non-existing files under Documentation
> Right, but these should be checked explicitly and I doubt many people do it
> before submitting patches. OTOH, checkpatch is something that's widely used
> and if it had verified the kernel-doc parts, more comments would be
> following the convention.
>   

I'am with you, but I do not have any clue how to solve this Gordian Knot
faithful and without massive collateral damage / sorry :|

The only thing I know, we have the -none option:

$ ./scripts/kernel-doc -none ./include/media/cec.h
./include/media/cec.h:51: warning: Function parameter or member 'lock' not 
described in 'cec_devnode'

But this is nothing more than noise if the patch does not touch cec_devnode.
And there is another problem I see, if we want to check refs ...

 >> -linkcheckdocs
 >>   check for broken external links (will connect to external hosts)
 >>
 >> - refcheckdocs
 >>    check for references to non-existing files under Documentation

The refs are solved late in the sphinx build process when .rst files and
kernel-doc comments come together .. so we need sphinx for checkpatch,
I gues this is a no-go (?)

-- Markus --
