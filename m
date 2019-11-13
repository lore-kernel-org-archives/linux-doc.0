Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6CA087D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Nov 2019 21:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfKMVti (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Nov 2019 16:49:38 -0500
Received: from mx.kolabnow.com ([95.128.36.41]:60970 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfKMVth (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Nov 2019 16:49:37 -0500
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 9D7A4126C;
        Wed, 13 Nov 2019 22:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1573681771; x=1575496172; bh=KjmAipo7S7phxrTZcs9K44KSt+4JCGlcqV1
        fWuQheJM=; b=BX73kTi6UcH3tycmRODT8rEZBlglO5YYYcCLlDH3XllPs3WLa3s
        5ragWVMSIyd9Mpj92ipUJ54NtlOhMM03NakEnzmiXROb9x7ttgHZUa4lN+Oxr5zZ
        j/eQ6ruvn/SHKy3wwdEV34VQNxFIQtgraXyN3wDsia4qc5QqlA6TfaHC0dn9E2BC
        OBYF2E33cPbmr4IRRsO+49/LgxGCYfey+4Xj0Fnn0a5e5Us0RHG9Uxq5+T7slu/P
        BcpwZBEHwuNHzEcP15WCJlNzFnDLEpRsxuNE8s1Apa+Vpg3U14pDAVJD98E8ffAH
        hnybJpa1jkEvxM9i4BodnFYmbHvTMriDzBAw4bWadEOyc1ZsuMrKFXoKvRKZ5D8O
        LSQZWPswWlAgR7KfZJf9CeGg5FHSXVmzAqY2tgNPvxy2kacHsOaYV4fPQwGBXjy/
        tUBr9LbnDyLxlITNknnoznbhcQfnLekIGX3eEMrkeFQ5Gr4iGkaDf9eQ1/M7jPQ0
        Z1t7rapVqY9/B+KkGaBV4HctIvMDrlOKIzYylzG3alMxnQH3wOF1y+Z+7Y0apXOi
        EZYjP2DAF3faiorvEgotBq+7rkyYrlxPJqdfHTRBdk6ngvYP5bxRMN1RzEB9FvP3
        dJFVK46u7H0Vi2yL3vr4RjcCM9bKOSxwKSUoEDpRwBpSmgeNemdt/Oa4=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HupaO_OHlxl2; Wed, 13 Nov 2019 22:49:31 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id CCAC7520;
        Wed, 13 Nov 2019 22:49:31 +0100 (CET)
Received: from int-subm001.mykolab.com (unknown [10.9.37.1])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id 722473546;
        Wed, 13 Nov 2019 22:49:31 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Nov 2019 22:49:30 +0100
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
In-Reply-To: <25c9ec73-64d3-a5dc-2f64-863c04dad22d@darmarit.de>
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
 <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net>
 <871rud3x2e.fsf@intel.com>
 <25c9ec73-64d3-a5dc-2f64-863c04dad22d@darmarit.de>
Message-ID: <2057b7e3221cd31678a81060768dfce6@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2019-11-13 10:37, Markus Heiser wrote:
> my 2cent ..
> 
> I have a doubt that translating has to be a part of the kernel 
> development.

I have a conflict of interests of course, and because of it I disagree.

> Minimal English is one of the prerequisites to be a part of the 
> community.

In a community there are active members and passive ones. It is true 
that
active members need to know English (it is written in the 
documentation).
But passive members are following the development, they are learning 
from it,
they profit from its openness. For these users English could be a 
problem, or
an imposition; nowadays students future is shaped based on the language 
they
study at school (studying German/French/Italian/Spanish does not open 
the
same doors).

I believe that the Linux kernel and many other open source projects 
should
not just help the industry to cut their costs, but they should also play 
a
social role: education, sharing knowledge. Documentation in general, and
translations as well, are part of this second world.

> Maintainers do not master foreign languages
> they are forced to commit blindly without quality assurance.

In some cases maintainers have been forced to accept code blindly 
without
quality assurance because they do not own the hardware for which they 
are
accepting patches.


> APIs will never be translated and
> the translation of articles is at random.

>   IMO a spin-off might focus on translations.

I may agree on this, only if there is an official place where to put 
them,
like:

https://www.kernel.org/doc/html/zh_CN/latest/

Otherwise, a translation on a random git<whatever> service is useless 
because it does
not have visibility/authority.

>   -- Markus --
> 
> Am 12.11.19 um 16:59 schrieb Jani Nikula:
>> On Tue, 12 Nov 2019, Jonathan Corbet <corbet@lwn.net> wrote:
>>> On Tue, 12 Nov 2019 16:17:32 +0200
>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>> 
>>>> Fix the references in both places to actually make them cross
>>>> references. See below.
>>>> 
>>>> BR,
>>>> Jani.
>>>> 
>>>> 
>>>> diff --git a/Documentation/process/programming-language.rst 
>>>> b/Documentation/process/programming-language.rst
>>>> index e5f5f065dc24..59efa6d7a053 100644
>>>> --- a/Documentation/process/programming-language.rst
>>>> +++ b/Documentation/process/programming-language.rst
>>>> @@ -3,7 +3,7 @@
>>>>   Programming Language
>>>>   ====================
>>>>   -The kernel is written in the C programming language 
>>>> [c-language]_.
>>>> +The kernel is written in the C programming language 
>>>> `[c-language]`_.
>>>>   More precisely, the kernel is typically compiled with ``gcc`` 
>>>> [gcc]_
>>>>   under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of 
>>>> ISO C90
>>>>   (including some C99 features).
>>>> @@ -34,7 +34,7 @@ in order to feature detect which ones can be used 
>>>> and/or to shorten the code.
>>>>     Please refer to ``include/linux/compiler_attributes.h`` for more 
>>>> information.
>>>>   -.. [c-language] 
>>>> http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>>> +.. _[c-language]: 
>>>> http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>>>   .. [gcc] https://gcc.gnu.org
>>>>   .. [clang] https://clang.llvm.org
>>>>   .. [icc] https://software.intel.com/en-us/c-compilers
>>> 
>>> That fixes this particular instance, while leaving the adjacent ones
>>> untouched :)
>> 
>> Yeah, that was just a quick hack to prove the point. Perhaps Miguel 
>> can
>> provide the proper patch? ;)
>> 
>>> I think this is a good change, especially if applied to all 
>>> instances.  I
>>> also wonder, though, if we should adopt a rule that translations need
>>> unique labels - prepend "IT-" or some such for the Italian 
>>> translation,
>>> for example?
>> 
>> I *think* the references like above (when done properly) are local to
>> the file. It's the labels that perhaps need this.
>> 
>> Sphinx also has some i18n support which I believe we aren't using, and
>> it would stand to reason this is covered there. But that probably 
>> needs
>> some dedication from Someone(tm) to figure out.
>> 
>> BR,
>> Jani.
>> 
>> 

-- 
Federico Vaga
http://www.federicovaga.it/
