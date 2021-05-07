Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FC5C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 861A361078
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhEGI5l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 04:57:41 -0400
Received: from smtp1.goneo.de ([85.220.129.30]:54204 "EHLO smtp1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235782AbhEGI5k (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 04:57:40 -0400
Received: from [192.168.1.127] (dyndsl-091-096-161-150.ewe-ip-backbone.de [91.96.161.150])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 29613203E694;
        Fri,  7 May 2021 10:56:40 +0200 (CEST)
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
 <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
 <20210506180842.GD388843@casper.infradead.org>
 <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
 <20210507083924.7b8ec1fe@coco.lan> <20210507100435.3095f924@coco.lan>
 <20210507083527.GL6564@kitsune.suse.cz>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <85bebda3-df0b-8554-5f90-45aa097ce405@darmarit.de>
Date:   Fri, 7 May 2021 10:56:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507083527.GL6564@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 07.05.21 um 10:35 schrieb Michal Suchánek:
> So the bottom line is that UTF-8 in the files will stay, and Sphinx
> cannot handle UTF-8 when the locale is not UTF-8.
> 
> In the long run it might be nice to fix Sphinx to properly set the
> encoding of the files it reads and writes. Or maybe there is some
> parameter that specifies it?

Let's not mix things up. The Unicode-Error is not related or limited
to log nor to sphinx, it is related to the fact that we (you) try to
run a utf-8 application in an environment which is not full utf-8
functional.

> For the short term I think it is reasonable to run a python test script
> that prints fancy unicode characters before running Sphinx and bail if
> the test script fails.

To be assure, I recommend to set UTF-8 locale environment in the
Makefile.

My experience shows that this is the default with almost all
containers (images), there are only a few where this is not the
case (may be suse?).

   -- Markus --
