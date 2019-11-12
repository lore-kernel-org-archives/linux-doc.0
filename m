Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 863F17D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Nov 2019 15:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfKLP71 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Nov 2019 10:59:27 -0500
Received: from mga14.intel.com ([192.55.52.115]:28118 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725954AbfKLP71 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Nov 2019 10:59:27 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 07:59:26 -0800
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; 
   d="scan'208";a="198120110"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 07:59:24 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
In-Reply-To: <20191112084257.4cca2d4c@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com> <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net>
Date:   Tue, 12 Nov 2019 17:59:21 +0200
Message-ID: <871rud3x2e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Nov 2019, Jonathan Corbet <corbet@lwn.net> wrote:
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
>> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
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
>>  under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
>>  (including some C99 features).
>> @@ -34,7 +34,7 @@ in order to feature detect which ones can be used and/or to shorten the code.
>>  
>>  Please refer to ``include/linux/compiler_attributes.h`` for more information.
>>  
>> -.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
>> +.. _[c-language]: http://www.open-std.org/jtc1/sc22/wg14/www/standards
>>  .. [gcc] https://gcc.gnu.org
>>  .. [clang] https://clang.llvm.org
>>  .. [icc] https://software.intel.com/en-us/c-compilers
>
> That fixes this particular instance, while leaving the adjacent ones
> untouched :)

Yeah, that was just a quick hack to prove the point. Perhaps Miguel can
provide the proper patch? ;)

> I think this is a good change, especially if applied to all instances.  I
> also wonder, though, if we should adopt a rule that translations need
> unique labels - prepend "IT-" or some such for the Italian translation,
> for example?

I *think* the references like above (when done properly) are local to
the file. It's the labels that perhaps need this.

Sphinx also has some i18n support which I believe we aren't using, and
it would stand to reason this is covered there. But that probably needs
some dedication from Someone(tm) to figure out.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
