Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 839767D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  2 Feb 2019 07:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfBBHjw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 2 Feb 2019 02:39:52 -0500
Received: from smtp1.goneo.de ([85.220.129.30]:43900 "EHLO smtp1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbfBBHjv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 2 Feb 2019 02:39:51 -0500
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 Feb 2019 02:39:51 EST
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 91EFC23F504;
        Sat,  2 Feb 2019 08:34:35 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id N5zwgftFrcMw; Sat,  2 Feb 2019 08:34:34 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-037-138-234-027.ewe-ip-backbone.de [37.138.234.27])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 2476023F101;
        Sat,  2 Feb 2019 08:34:34 +0100 (CET)
Subject: Re: docs tree
To:     "Tobin C. Harding" <me@tobin.cc>, Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <20190131012553.GA30122@eros.localdomain>
 <84dc9207-a6c3-f40d-c0be-815a4563fc83@infradead.org>
 <c81c580c-71c4-4058-9e04-dd06e8c231c2@www.fastmail.com>
 <20190131204045.28aef19c@lwn.net>
 <772c4bb4-f390-4b3c-9e85-ec0b13239544@www.fastmail.com>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <07317254-5011-647d-f020-1c323f57440e@darmarit.de>
Date:   Sat, 2 Feb 2019 08:34:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <772c4bb4-f390-4b3c-9e85-ec0b13239544@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 02.02.19 um 02:49 schrieb Tobin C. Harding:
> On Fri, Feb 1, 2019, at 14:41, Jonathan Corbet wrote:
>> On Wed, 30 Jan 2019 21:16:21 -0500
>> "Tobin C. Harding" <me@tobin.cc> wrote:
>>
>>> Ouch, failing in public is fun.  Thanks Randy
>>
>> That's how kernel development is done in the end...:)
> 
> It is actually one of the things I like about it.  Keeps one honest and humble.
> 

Can't beleve how the sum of all these fails pruduce such a elegance.  It must be
a kind of darwinism, the one I really like to follow.  Even if I'am not a
kernel developer, here I learn so much.  You can't beleve what I say, then take
a look e.g. to the 'in-kernel headers' discussion [1], which lets me thirsts
every day for new messages.

[1] https://lkml.org/lkml/2019/1/18/975

With best regards and thanks for 'failing' ;)

   -- Markus --

