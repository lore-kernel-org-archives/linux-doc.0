Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE7BC47080
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 15:51:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64FEB61396
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 15:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhFAPxk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 11:53:40 -0400
Received: from mga09.intel.com ([134.134.136.24]:62220 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232490AbhFAPxj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Jun 2021 11:53:39 -0400
IronPort-SDR: sg9zWDTQQM6lxd1YcI3nU6iS355pP8idBu/fuq+c+il6cstv3+gq2bllzYXz6IB9Qgsfm3jRhl
 Mh8L/dKLZD2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203568474"
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; 
   d="scan'208";a="203568474"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 08:51:56 -0700
IronPort-SDR: 3fb8u4c4VNdUJCjasEHky0cH4/Bc6HkW3q7rpVygkD2egcxAzdYz6dVCJ2Y5coMCDvZ1qNi7Rl
 e/us0Tf4dvUg==
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; 
   d="scan'208";a="445378406"
Received: from ycohenha-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.54.130])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 08:51:52 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Igor Torrente <igormtorrente@gmail.com>, corbet@lwn.net,
        gregkh@linuxfoundation.org, samuel.thibault@ens-lyon.org,
        grandmaster@al2klimov.de, rdunlap@infradead.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: Convert the Speakup guide to rst
In-Reply-To: <1b1e0e07-d438-0902-a28a-e346cba53518@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210531215737.8431-1-igormtorrente@gmail.com> <87r1hlrfhk.fsf@intel.com> <1b1e0e07-d438-0902-a28a-e346cba53518@gmail.com>
Date:   Tue, 01 Jun 2021 18:51:49 +0300
Message-ID: <878s3tr3ai.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 01 Jun 2021, Igor Torrente <igormtorrente@gmail.com> wrote:
> Hi Jani Nikula,
>
> On 6/1/21 8:28 AM, Jani Nikula wrote:
>> On Mon, 31 May 2021, Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
>>> -acntsa -- Accent SA
>>> -acntpc -- Accent PC
>>> -apollo -- Apollo
>>> -audptr -- Audapter
>>> -bns -- Braille 'n Speak
>>> -dectlk -- DecTalk Express (old and new, db9 serial only)
>>> -decext -- DecTalk (old) External
>>> -dtlk -- DoubleTalk PC
>>> -keypc -- Keynote Gold PC
>>> -ltlk -- DoubleTalk LT, LiteTalk, or external Tripletalk (db9 serial only)
>>> -spkout -- Speak Out
>>> -txprt -- Transport
>>> -dummy -- Plain text terminal
>>> -
>>> -Note: Speakup does * NOT * support usb connections!  Speakup also does *
>>> -NOT * support the internal Tripletalk!
>>> +| acntsa -- Accent SA
>>> +| acntpc -- Accent PC
>>> +| apollo -- Apollo
>>> +| audptr -- Audapter
>>> +| bns -- Braille 'n Speak
>>> +| dectlk -- DecTalk Express (old and new, db9 serial only)
>>> +| decext -- DecTalk (old) External
>>> +| dtlk -- DoubleTalk PC
>>> +| keypc -- Keynote Gold PC
>>> +| ltlk -- DoubleTalk LT, LiteTalk, or external Tripletalk (db9 serial only)
>>> +| spkout -- Speak Out
>>> +| txprt -- Transport
>>> +| dummy -- Plain text terminal
>> 
>> Looks like a definition list?
>> 
>> https://docutils.sourceforge.io/docs/user/rst/quickref.html#definition-lists
>
> If the '|' is replaced by definition-list, I'll have to skip a line to 
> each item so the sphinx doesn't concatenate them into a single line. 
> Like this:
>
> keywords
>    acntsa -- Accent SA
>
>    acntpc -- Accent PC
>
>    apollo -- Apollo
>    [...]
>
>
> There's a way to do that without these blank lines?
>
> For me, it doesn't look very good, but I think the tradeoff worth it 
> improves readability to speakup users. If it is the case.

I was thinking:

acntsa
  Accent SA

acntpc
  Accent PC

apollo
  Apollo

[...]

Simply by looking at what the data appears to be, and trying to match
that with the semantically appropriate rst construct. Maybe you think
that's too verbose or takes too much vertical space or isn't grep
friendly - and it's fine. I'm just making suggestions.

Another, more condensed alternative is to use tables, but that can
become annoying to maintain if you don't get the column widths right
from the start.

https://docutils.sourceforge.io/docs/user/rst/quickref.html#tables

>>> +
>>> +.. note::
>>> +
>>> +   | Speakup does **NOT** support usb connections!
>>> +   | Speakup also does **NOT** support the internal Tripletalk!
>> 
>> Why the pipes "|"?
>
> This is the way I found to separate these sentences into two different 
> lines. I'm gladly accepting a better solution for this :)

Maybe just like this?

.. note::

   Speakup does **NOT** support usb connections!

   Speakup also does **NOT** support the internal Tripletalk!


Again, I'm not insisting on any of these changes, I'm just suggesting
things you might find helpful!


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
