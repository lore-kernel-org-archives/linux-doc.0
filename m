Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A77B7D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Nov 2019 09:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKMJh2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Nov 2019 04:37:28 -0500
Received: from smtp2.goneo.de ([85.220.129.33]:51720 "EHLO smtp2.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbfKMJh2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Nov 2019 04:37:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id F2E4923F2DD;
        Wed, 13 Nov 2019 10:37:23 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Eobk1FVLmfgy; Wed, 13 Nov 2019 10:37:22 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-091-096-167-046.ewe-ip-backbone.de [91.96.167.46])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 3BEBF23F3AD;
        Wed, 13 Nov 2019 10:37:22 +0100 (CET)
Subject: Re: On global citations, URLs and translations
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
 <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net>
 <871rud3x2e.fsf@intel.com>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <25c9ec73-64d3-a5dc-2f64-863c04dad22d@darmarit.de>
Date:   Wed, 13 Nov 2019 10:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <871rud3x2e.fsf@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

my 2cent ..

I have a doubt that translating has to be a part of the kernel development.

Minimal English is one of the prerequisites to be a part of the community.
Maintainers do not master foreign languages, they are forced to commit
blindly without quality assurance.  APIs will never be translated and
the translation of articles is at random.

   IMO a spin-off might focus on translations.

   -- Markus --

Am 12.11.19 um 16:59 schrieb Jani Nikula:
> On Tue, 12 Nov 2019, Jonathan Corbet <corbet@lwn.net> wrote:
>> On Tue, 12 Nov 2019 16:17:32 +0200
>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>>> Fix the references in both places to actually make them cross
>>> references. See below.
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
>>> index e5f5f065dc24..59efa6d7a053 100644
>>> --- a/Documentation/process/programming-language.rst
>>> +++ b/Documentation/process/programming-language.rst
>>> @@ -3,7 +3,7 @@
>>>   Programming Language
>>>   ====================
>>>   
>>> -The kernel is written in the C programming language [c-language]_.
>>> +The kernel is written in the C programming language `[c-language]`_.
>>>   More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
>>>   under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
>>>   (including some C99 features).
>>> @@ -34,7 +34,7 @@ in order to feature detect which ones can be used and/or to shorten the code.
>>>   
>>>   Please refer to ``include/linux/compiler_attributes.h`` for more information.
>>>   
>>> -.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>> +.. _[c-language]: http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>>   .. [gcc] https://gcc.gnu.org
>>>   .. [clang] https://clang.llvm.org
>>>   .. [icc] https://software.intel.com/en-us/c-compilers
>>
>> That fixes this particular instance, while leaving the adjacent ones
>> untouched :)
> 
> Yeah, that was just a quick hack to prove the point. Perhaps Miguel can
> provide the proper patch? ;)
> 
>> I think this is a good change, especially if applied to all instances.  I
>> also wonder, though, if we should adopt a rule that translations need
>> unique labels - prepend "IT-" or some such for the Italian translation,
>> for example?
> 
> I *think* the references like above (when done properly) are local to
> the file. It's the labels that perhaps need this.
> 
> Sphinx also has some i18n support which I believe we aren't using, and
> it would stand to reason this is covered there. But that probably needs
> some dedication from Someone(tm) to figure out.
> 
> BR,
> Jani.
> 
> 
