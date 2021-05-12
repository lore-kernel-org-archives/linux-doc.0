Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0514CC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9DF7613BD
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhELHis (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 03:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhELHir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 May 2021 03:38:47 -0400
Received: from smtp3.goneo.de (smtp3.goneo.de [IPv6:2001:1640:5::8:37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB1BC061574
        for <linux-doc@vger.kernel.org>; Wed, 12 May 2021 00:37:38 -0700 (PDT)
Received: from [192.168.1.127] (dyndsl-085-016-042-119.ewe-ip-backbone.de [85.16.42.119])
        by smtp3.goneo.de (Postfix) with ESMTPSA id D52D8203F120;
        Wed, 12 May 2021 09:37:34 +0200 (CEST)
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
From:   Markus Heiser <markus.heiser@darmarit.de>
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506174849.GH6564@kitsune.suse.cz> <20210512082238.682f6aea@coco.lan>
 <20210512070157.GQ12700@kitsune.suse.cz>
 <7d62123c-297b-fd80-06f7-23ff6ba51b5c@darmarit.de>
Message-ID: <cdc8309e-81c7-7d29-10db-92364bbfd3e9@darmarit.de>
Date:   Wed, 12 May 2021 09:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7d62123c-297b-fd80-06f7-23ff6ba51b5c@darmarit.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 12.05.21 um 09:18 schrieb Markus Heiser:
> It depends on what character set your en_US locale implements.
> 
> ~> cat test.py
> print("↑ᛏ个")

At least the last character is a not-printable character.

For the non 8bit characters I recommend to use python's
unicode representation (\u):

   >>> print('The currency in EU is \u20AC')
   The currency in EU is €

  -- Markus --
