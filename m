Return-Path: <SRS0=zh9o=6G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B103FC55189
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 09:28:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 950B920735
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 09:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDVJ2E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Apr 2020 05:28:04 -0400
Received: from smtp2.goneo.de ([85.220.129.33]:51348 "EHLO smtp2.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgDVJ2E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Apr 2020 05:28:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id A7F52241B6A;
        Wed, 22 Apr 2020 11:28:01 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RNr10iGeiL57; Wed, 22 Apr 2020 11:27:51 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-085-016-042-144.ewe-ip-backbone.de [85.16.42.144])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 43C0F23F5FA;
        Wed, 22 Apr 2020 11:27:51 +0200 (CEST)
Subject: Re: Path troubles when using SPHINXDIRS option
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <20200421103814.4e0fa4c3@coco.lan>
 <dbc22720-79fe-e7a8-b88c-46108ba5ccf9@darmarit.de>
 <20200422105750.4fed3717@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <428db3a0-4762-5ff4-1d31-2d64d81e2f65@darmarit.de>
Date:   Wed, 22 Apr 2020 11:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422105750.4fed3717@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

about wording: I will use the term "book" for a SPHINXDIR and "bookshelf"
for the whole kernel documentation .. 

Am 22.04.20 um 10:57 schrieb Mauro Carvalho Chehab:
> Em Tue, 21 Apr 2020 12:52:42 +0200
> Markus Heiser <markus.heiser@darmarit.de> escreveu:
> 
>> Hi Mauro,
>>
>> Am 21.04.20 um 10:38 schrieb Mauro Carvalho Chehab:
>>>
>>> Hi,
>>>
>>> While building from v5.7-rc2 + media, I noticed that SPHINXDIRS option
>>> stopped working.
>>>
>>> What happens is that, if we don't pass this option, Sphinx assumes that
>>> the "absolute" path is "Documentation/". So, include options like this:
>>>
>>> 	.. include:: /ABI/stable/firewire-cdev
>>> 	    :literal:
>>>
>>>
>>> would be evaluated as Documentation/ABI/stable/firewire-cdev if built
>>> without SPHINXDIRS. However, if we do SPHINXDIRS=driver-api, then
>>> the "absolute" patch would be "Documentation/driver-api", causing this
>>> error:
>>>
>>> 	Sphinx parallel build error:
>>> 	docutils.utils.SystemMessage: /devel/v4l/patchwork/Documentation/driver-api/firewire.rst:22: (SEVERE/4) Problems with "include" directive path:
>>>
>>> This is specially bad for build jobs (like one we have on jenkins that
>>> is meant to test media patches), as, due to some Sphinx bug, prevents
>>> sphinx-build to stop, making the toolset to run forever.
>>>
>>> I suspect that some change at conf.py could address the path issue.
>>>
>>> I'll try to investigate further.
>>>
>>> Just to be 100% sure that this is not some version-specific bad
>>> behavior, I tested (using the latest patch version) Sphinx from
>>> version 1.7.9 up to 2.4.4. The same two errors happen on all
>>> versions.
>>>
>>> Markus,
>>>
>>> Maybe you may have some idea about how to fix those issues.
>>>
>>> The parallel build error would likely require fixing something
>>> inside Sphinx code, making it abort if it gets a "SEVERE" error.
>>>
>>> Regards,
>>> Mauro
>>>    
>>
>> I fixed it with the patch shown below.  Some words about: The use
>> of the :doc: rule should be replaced by a :ref:.  The path names
>> of include directives should always relative to the .rst file.
> 
> There are lots of place already using :doc: directive, on both
> relative and absolute ways:
> 
> 	$ git grep ':doc:'|wc -l
> 	382

Your grep is wrong (it also matches the :doc: from kernel-include), use:

    $ git grep ':doc:`'|wc -l
    83

> 
> Replacing all of them to :ref: will be painful. Also, IMHO, :doc: fits
> better on most needs, as it makes easier for people working with
> just plain texts to find to what file a ref points.

The opposite of pointing to a file is, that we can only point the
file not a content in the file and we lost the flexibility of
dynamical referencing by target's name: If the target is moved,
the refs has to be changed also.  Not used right now, but we also
lost the ability to link from one "book" to another "book" in
the "bookshelf" or even into other books available in the WEB
(this is what intersphinx can do).

  Its a decission what counts more.

> Btw, not sure why, but, when doing some conversions I got broken
> references when using :ref:. So, I ended using :doc: instead.

Can't believe, there must have been other reasons.

>>
>> To go further ... with patch below:
>>
>>      $ make SPHINXDIRS="driver-api" htmldocs
>>
>> shows some " WARNING: undefined label: ..." messages.  To close
>> such links (addressing objects outside of the SPHINXDIR) we need
>> to activate intersphinx [1].
>>
>> If we activate intersphinx we have to wait one release cycle to
>> get a objects.inv file at:
>>
>>      https://www.kernel.org/doc/html/latest/
>>
>> When the objects.inv file is available, the warnings are
>> disappear.
> 
> Yeah, interphinx would help a lot to solve broken references.
> 
> Not sure, however, if it is worth using it (at least for html).

Why should a http link does not work in a PDF file? .. I mean, its
just inserting HTTP links.

> I mean, IMHO, the big reason why someone would use SPHINXDIRS is to
> speedup the process of testing if a documentation patch did the right
> thing.

I can't speak for other, but I often prefer a book with links in over
a complete bookshelf holding in my hands ;)

> Anyway, it is up to Jon to decide about enabling intersphinx or not.


-- Markus --

