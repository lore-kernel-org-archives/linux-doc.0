Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BAFC37D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 09:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfKNJ2c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 04:28:32 -0500
Received: from mga03.intel.com ([134.134.136.65]:62190 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfKNJ2c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Nov 2019 04:28:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Nov 2019 01:28:31 -0800
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; 
   d="scan'208";a="198756771"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Nov 2019 01:28:29 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
In-Reply-To: <72b563af475bb41277e5be48fb43cc18@vaga.pv.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com> <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net> <72b563af475bb41277e5be48fb43cc18@vaga.pv.it>
Date:   Thu, 14 Nov 2019 11:28:27 +0200
Message-ID: <877e423iys.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Nov 2019, Federico Vaga <federico.vaga@vaga.pv.it> wrote:
> On 2019-11-12 16:42, Jonathan Corbet wrote:
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
>>> diff --git a/Documentation/process/programming-language.rst 
>>> b/Documentation/process/programming-language.rst
>>> index e5f5f065dc24..59efa6d7a053 100644
>>> --- a/Documentation/process/programming-language.rst
>>> +++ b/Documentation/process/programming-language.rst
>>> @@ -3,7 +3,7 @@
>>>  Programming Language
>>>  ====================
>>> 
>>> -The kernel is written in the C programming language [c-language]_.
>>> +The kernel is written in the C programming language `[c-language]`_.
>>>  More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
>>>  under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO 
>>> C90
>>>  (including some C99 features).
>>> @@ -34,7 +34,7 @@ in order to feature detect which ones can be used 
>>> and/or to shorten the code.
>>> 
>>>  Please refer to ``include/linux/compiler_attributes.h`` for more 
>>> information.
>>> 
>>> -.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>> +.. _[c-language]: 
>>> http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>>  .. [gcc] https://gcc.gnu.org
>>>  .. [clang] https://clang.llvm.org
>>>  .. [icc] https://software.intel.com/en-us/c-compilers
>> 
>> That fixes this particular instance, while leaving the adjacent ones
>> untouched :)
>> 
>> I think this is a good change, especially if applied to all instances.  
>> I
>> also wonder, though, if we should adopt a rule that translations need
>> unique labels - prepend "IT-" or some such for the Italian translation,
>> for example?
>> 
>> Thanks,
>> 
>> jon
>
> I personally prefer a full inline reference to external links.
>
> Blah blah blah `BLAH <https://www.blah.blah/>`_
>
> When rendered, we do not care where it is. When we read it from
> sources (IMHO) it does not look cool but it is nice to have the
> reference right where we talk about it and not somewhere else in the
> document: it is there where you need it; it avoids these mistakes, it
> avoids the need for special labels on external links.  For all
> translated documents I am already using the prefix "it-" on all
> internal labels.

As I wrote elsewhere, IMO the inline markup is uglier in plain text than
the named targets, which is what we want to avoid. You can place the
named targets right after the paragraph where you use it. And if you
reference the same target more than once, you can reuse the URL and not
have to duplicate.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
