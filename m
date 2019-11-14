Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ABF837D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 09:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfKNJZS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 04:25:18 -0500
Received: from mga12.intel.com ([192.55.52.136]:7132 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfKNJZS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Nov 2019 04:25:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Nov 2019 01:25:17 -0800
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; 
   d="scan'208";a="198756057"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Nov 2019 01:25:15 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
In-Reply-To: <1a1c57ed248b6cc4622278b079726587@vaga.pv.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com> <87a79141s3.fsf@intel.com> <20191112084257.4cca2d4c@lwn.net> <871rud3x2e.fsf@intel.com> <CANiq72kKDiuYcyY+djHPsUJ3AFG6LqT1O=4FT8E+-ifnbKv9Gg@mail.gmail.com> <1a1c57ed248b6cc4622278b079726587@vaga.pv.it>
Date:   Thu, 14 Nov 2019 11:25:13 +0200
Message-ID: <87a78y3j46.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 14 Nov 2019, Federico Vaga <federico.vaga@vaga.pv.it> wrote:
> On 2019-11-14 01:54, Miguel Ojeda wrote:
>> On Tue, Nov 12, 2019 at 4:59 PM Jani Nikula 
>> <jani.nikula@linux.intel.com> wrote:
>>> 
>>> Sphinx also has some i18n support which I believe we aren't using, and
>>> it would stand to reason this is covered there. But that probably 
>>> needs
>>> some dedication from Someone(tm) to figure out.
>> 
>> The docs say not to go overboard with the reStructuredText markup, so
>> I am not sure if we should avoid going overboard with Sphinx features
>> too :)

We avoid excessive markup to keep the files as readable as possible in
plain text. Adding or using infrastructure does not conflict with this.

> In addition, I do not know if it worth the effort of doing i18n in
> Sphinx.  Which problem is going to solve?

Perhaps making it possible to have the whole English documentation
structure, with certain pages translated to other
languages. Additionally you could have language specific tables of
contents for each language, perhaps automatically generated.

I.e. make the translations more accessible.

> If we are talking about this mistake, it is a more general mistake,
> unrelated with translations: a label has been used twice in the
> documentation. These labels need to become local in the document or
> replaced with inline links (I prefer this as I already wrote in
> another mail).  A global label "gcc" is likely to give some trouble at
> some point because too generic.

They turned into global duplicate labels due to an error in the
hyperlink markup. There is no problem with proper markup.

And tying this back to the beginning, IMHO the named hyperlinks are
*less* of an eyesore than inline markup. Contrast:

	See Foo_.

.. _Foo: http://example.org/what-if-you-have-a-really-long-url

With:

	See `Foo <http://example.org/what-if-you-have-a-really-long-url>`_.

Of course, in this case we also need the backticks in the named targets
because they contain brackets and hyphens; that could be changed
too. Also, you don't have to collect the named targets at the bottom of
the file, you can place them between paragraphs, and it'll be neat in
plain text too.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
