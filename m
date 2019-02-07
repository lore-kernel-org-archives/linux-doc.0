Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F1BF7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 17:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfBGR6u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 12:58:50 -0500
Received: from smtp3.goneo.de ([85.220.129.37]:40838 "EHLO smtp3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfBGR6u (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Feb 2019 12:58:50 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 8DF6723F664;
        Thu,  7 Feb 2019 18:58:47 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id B0yYqVITjnBG; Thu,  7 Feb 2019 18:58:46 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-178-142-135-081.ewe-ip-backbone.de [178.142.135.81])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 6F20A23F080;
        Thu,  7 Feb 2019 18:58:46 +0100 (CET)
Subject: Re: Return: vs Returns:
To:     Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org
References: <20190207135924.GV21860@bombadil.infradead.org>
 <20190207153056.GB9120@rapoport-lnx>
 <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
 <20190207161852.GC8040@rapoport-lnx>
 <596652fd8f0a3637649167b47805f1c6ac848f25.camel@perches.com>
 <20190207173448.GZ21860@bombadil.infradead.org>
 <77f029f635867f45e8c0192fc4db5928a00076ef.camel@perches.com>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <5ab01a70-edbc-71b4-8c38-8eee0859889d@darmarit.de>
Date:   Thu, 7 Feb 2019 18:58:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <77f029f635867f45e8c0192fc4db5928a00076ef.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 07.02.19 um 18:50 schrieb Joe Perches:
> On Thu, 2019-02-07 at 09:34 -0800, Matthew Wilcox wrote:
>> On Thu, Feb 07, 2019 at 09:31:20AM -0800, Joe Perches wrote:
>>> It's not clear to me what you are asking checkpatch to do here.
>>>
>>> It may be reasonable for checkpatch to invoke kernel-doc on some
>>> portion of a patch, but I'm not sure how valuable it will be.
>>
>> I was just hoping to match:
>>
>>   * Returns:
>>
>> Or to quote it properly for regexes ...
>>
>> ^ +\* *Returns:
>>
>> (I think ...)
>>
>> I can't see that matching C or assembler.
> 
> checkpatch doesn't attempt to enforce any formatting standard
> on kernel-doc comments.
> 
> There doesn't seem to be much standardization for kernel-doc
> in the first place.
> 
> Just for the * return: case:
> 
> $ git grep -P -i '^\s*\*\s*returns?\s*:' -- '*.[ch]' | \
>    grep -P -oh -i '\*\s*returns?\s*:' | \
>    sort | uniq -c | sort -rn
>     5153 * Return:
>     2534 * Returns:
>     1077 * RETURN:
>      358 * RETURNS:
>      173 *	RETURNS:
>      171 * returns:
>      153 * return:
>      148 * Return :
>       72 * Returns :
>       61 *	Returns:
>       37 *  Returns:
>       30 *  returns:
>       27 *  return:
>       22 *	Return:
>       20 * Returns  :
>       19 *  Return:
>       15 *  RETURNS:
>       11 *           return:
>        6 * return :
>        6 *	return:
>        5 * returns :
>        3 *Returns:
>        3 * Returns	:
>        3 * 	returns:
>        2 *RETURNS:
>        2 *     Returns:
>        2 *      Returns:
>        2 *	returns:
>        2 * RETURN :
>        2 *      Return:
>        2 * 	Return:
>        2 *	return :
>        2 *		return:
>        1 *   RETURNS:
>        1 * RETURNs:
>        1 *   Returns:
>        1 *    Returns:
>        1 * 	Returns:
>        1 *  RETURN:
>        1 *   Return:
>        1 *    Return:
>        1 * return   :
> 
> I think standarization is more something that scripts/kernel-doc
> could or should do.

BTW: kernel-doc parser accept 'return' and 'returns':

     } elsif ($newsection =~ m/^return?$/i) {
         $newsection = $section_return;

Is there really a need to be standardize this? From the list above I think
there are only a few where it fails.

-- Markus --
