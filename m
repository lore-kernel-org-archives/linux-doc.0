Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 457E37D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Nov 2019 21:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfKMVQo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Nov 2019 16:16:44 -0500
Received: from mx.kolabnow.com ([95.128.36.42]:32738 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfKMVQo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Nov 2019 16:16:44 -0500
X-Greylist: delayed 568 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Nov 2019 16:16:42 EST
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 507DA13D7;
        Wed, 13 Nov 2019 22:07:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1573679230; x=1575493631; bh=PFWa4U5z5H7mYXN1zZ/+05TcgLchaaJOZIu
        Vw36HIdQ=; b=dVtHX8NzdaDJ85mh98NHVE2Y42uNmIU1xrKdY8CsNRV61iGOfqo
        +VxgXXRRzu+hFE9WWjgLUa4HOBTlsMj4INHI7kyURe0fp5i38BiJcnqpM2N+olFO
        3baa0kDXoRAaaC0w766hnU1LEZDln5H0lJh4DvWV5NN15kPOlne1AyTDOzECHrZX
        cP4oztiZa2iRNbCaS2xqFeCYqZIdIj0NT0rS/t4p7IGJ1nQmUFGSyEE3YGPi3d4c
        nJ0wnLqpCIu9l/qDVVra6fIhv2nN7r+nTac5VChi6FVpqBA72I5wm1T3QmAsTj6X
        l/yGLWVBXhQ6uyq5ETZsWEU/q7IYollCISWABAlTOpA1fQc7/weD3ao5Y9n1vxSq
        aVFlClSh+ZCx8xQl7gsePsPBatYd9Hxw/UdH1ZfJfvxkN9MrHTFncMrvnOlaEeO5
        CxwdOinMsKOfMaodYiYmDT4cPQh56Rf3gGmS02K69C9R2XHbUNRXTu4T08w/oOBc
        Tq4UIRj3YRZJsvJrHMJuYS0A98gNyzY4hrgXrcS0528neST8IhZdZA9iFpj8el6z
        zV5esif/iP8fM+TmzzPDnig8x1Gbi08EZe38ufPihyf5tAJPfT5Fo0yveImrDvEn
        VV6ZpMQPyZ3W9IhwO10bdnU38Y8/qhPw2uzH83++9lj0Jsac9fuObBWQ=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dQMpPlKrggiW; Wed, 13 Nov 2019 22:07:10 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 9181413D6;
        Wed, 13 Nov 2019 22:07:10 +0100 (CET)
Received: from int-subm001.mykolab.com (unknown [10.9.37.1])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 36D303252;
        Wed, 13 Nov 2019 22:07:10 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Nov 2019 22:07:09 +0100
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
In-Reply-To: <20191112084257.4cca2d4c@lwn.net>
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
 <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net>
Message-ID: <72b563af475bb41277e5be48fb43cc18@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2019-11-12 16:42, Jonathan Corbet wrote:
> On Tue, 12 Nov 2019 16:17:32 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
>> Fix the references in both places to actually make them cross
>> references. See below.
>> 
>> BR,
>> Jani.
>> 
>> 
>> diff --git a/Documentation/process/programming-language.rst 
>> b/Documentation/process/programming-language.rst
>> index e5f5f065dc24..59efa6d7a053 100644
>> --- a/Documentation/process/programming-language.rst
>> +++ b/Documentation/process/programming-language.rst
>> @@ -3,7 +3,7 @@
>>  Programming Language
>>  ====================
>> 
>> -The kernel is written in the C programming language [c-language]_.
>> +The kernel is written in the C programming language `[c-language]`_.
>>  More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
>>  under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO 
>> C90
>>  (including some C99 features).
>> @@ -34,7 +34,7 @@ in order to feature detect which ones can be used 
>> and/or to shorten the code.
>> 
>>  Please refer to ``include/linux/compiler_attributes.h`` for more 
>> information.
>> 
>> -.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
>> +.. _[c-language]: 
>> http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>  .. [gcc] https://gcc.gnu.org
>>  .. [clang] https://clang.llvm.org
>>  .. [icc] https://software.intel.com/en-us/c-compilers
> 
> That fixes this particular instance, while leaving the adjacent ones
> untouched :)
> 
> I think this is a good change, especially if applied to all instances.  
> I
> also wonder, though, if we should adopt a rule that translations need
> unique labels - prepend "IT-" or some such for the Italian translation,
> for example?
> 
> Thanks,
> 
> jon

I personally prefer a full inline reference to external links.

Blah blah blah `BLAH <https://www.blah.blah/>`_

When rendered, we do not care where it is. When we read it from sources 
(IMHO)
it does not look cool but it is nice to have the reference right where 
we talk
about it and not somewhere else in the document: it is there where you 
need it;
it avoids these mistakes, it avoids the need for special labels on 
external links.
For all translated documents I am already using the prefix "it-" on all 
internal
labels.

-- 
Federico Vaga
