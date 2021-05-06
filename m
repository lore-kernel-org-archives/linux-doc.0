Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E7CC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 16:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5C1E611AE
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 16:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbhEFQEa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 12:04:30 -0400
Received: from smtp3.goneo.de ([85.220.129.37]:50814 "EHLO smtp3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235156AbhEFQE3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 12:04:29 -0400
X-Greylist: delayed 374 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 12:04:29 EDT
Received: from [192.168.1.127] (dyndsl-091-096-024-137.ewe-ip-backbone.de [91.96.24.137])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 6E478203F130;
        Thu,  6 May 2021 17:57:15 +0200 (CEST)
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210506103913.GE6564@kitsune.suse.cz>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
Date:   Thu, 6 May 2021 17:57:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210506103913.GE6564@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 06.05.21 um 12:39 schrieb Michal Suchánek:
> When building HTML documentation I get this output:
...
> [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters in position 18-20: ordinal not in range(256)
...
> 
> It does not say which input file contains the offending character so I can't tell which file is broken.
> 
> Any idea how to debug?

I guess the build host is a very simple container, what does

   echo $LC_ALL
   echo $LANG

prompt?  If it is latin, change it to something using utf-8 (I recommend 
'en_US.utf8').

A UnicodeEncodeError can occour everywhere where characters are
encoded from (internal) unicode to the encoding of the stream.

By example:

A print or log statement which streams to stdout needs to encode
from unicode to stdout's encoding.  If there is one unicode symbol
which can not encoded to stream's encoding a UnicodeEncodeError
is raised.

   -- Markus --
