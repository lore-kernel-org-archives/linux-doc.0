Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F3137D161
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 15:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfBGP6X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 10:58:23 -0500
Received: from smtp1.goneo.de ([85.220.129.30]:33334 "EHLO smtp1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbfBGP6W (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Feb 2019 10:58:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 9D5EE23F410;
        Thu,  7 Feb 2019 16:58:19 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dz9v3Db9cIzA; Thu,  7 Feb 2019 16:58:18 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-178-142-135-081.ewe-ip-backbone.de [178.142.135.81])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 285AD24003C;
        Thu,  7 Feb 2019 16:58:18 +0100 (CET)
Subject: Re: Return: vs Returns:
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org
References: <20190207135924.GV21860@bombadil.infradead.org>
 <20190207153056.GB9120@rapoport-lnx>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
Date:   Thu, 7 Feb 2019 16:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190207153056.GB9120@rapoport-lnx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 07.02.19 um 16:30 schrieb Mike Rapoport:
> On Thu, Feb 07, 2019 at 05:59:24AM -0800, Matthew Wilcox wrote:
>>
>> This seems to be an extremely common mistake to make (indeed, almost
>> 3000 occurrences of 'Returns:' vs 5300 occurrences of 'Return:').
>   
> Add to that ~1000 '@return:'.
> 
> But scripts/kernel-doc does not really care:
> 
> 	} elsif ($newsection =~ m/^return?$/i) {
> 	    $newsection = $section_return;
> 	} elsif ($newsection =~ m/^\@return$/) {
> 	    # special: @return is a section, not a param description
> 	    $newsection = $section_return;
> 	}


Hi Mike, I only got this fragment of the thread, for me it is not absolutly
clear what the problem is .. I guess it is about the "Return" section in
kernel-doc comments, right?

The snippet from you above is the right point, it should work like it is
described here:

   https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values

doesn't it? Or did you just want a checkpatch ...

>> Could we have a checkpatch warning for it?
> 
> Does checkpatch checks the kernel-doc parts at all?

No.  I guess there are to many places to fail / to hard to put someone in
charge.  E.g. if you do include a single kernel-doc comment from a source all
kernel-docs in the source will be parsed and may produce (error/warning)
essages.  What we have, are some targets:

-linkcheckdocs
  check for broken external links (will connect to external hosts)

- refcheckdocs
   check for references to non-existing files under Documentation

-- Markus --

> 
>> ----- Forwarded message from Matthew Wilcox <willy@infradead.org> -----
>>
>> On Wed, Jan 16, 2019 at 04:59:27PM +0000, Christophe Leroy wrote:
>>>   v3: Moved 'Returns:" comment after description.
>>>       Explained in the commit log why the function is defined static inline
>>>
>>>   v2: Added "Returns:" comment and removed probe_user_address()
>>
>> The correct spelling is 'Return:', not 'Returns:':
>>
>> Return values
>> ~~~~~~~~~~~~
>>
>> The return value, if any, should be described in a dedicated section
>> named ``Return``.
>>
>> ----- End forwarded message -----
>>
> 
