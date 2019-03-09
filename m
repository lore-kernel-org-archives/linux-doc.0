Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2D9C37D099
	for <lwn-linux-doc@archive.lwn.net>; Sat,  9 Mar 2019 09:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbfCIJU7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 9 Mar 2019 04:20:59 -0500
Received: from smtp3.goneo.de ([85.220.129.37]:38282 "EHLO smtp3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbfCIJU7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 9 Mar 2019 04:20:59 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 3D77423F951;
        Sat,  9 Mar 2019 10:20:56 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZUU9OYypqxr9; Sat,  9 Mar 2019 10:20:55 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-091-096-117-035.ewe-ip-backbone.de [91.96.117.35])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 781B823F006;
        Sat,  9 Mar 2019 10:20:54 +0100 (CET)
Subject: Re: [PATCH 0/9] docs: Fix various build warnings/errors
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190307211153.28400-1-tobin@kernel.org>
 <2b5f55e5-79d6-2538-5054-b34e4b93e721@darmarit.de>
 <20190308201606.GE25102@eros.localdomain>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <32131841-4da9-c1ba-60fc-5f16adecc9c9@darmarit.de>
Date:   Sat, 9 Mar 2019 10:20:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190308201606.GE25102@eros.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 08.03.19 um 21:16 schrieb Tobin C. Harding:
>> Hi Tobin,
>>
>> the problem was a missing empty line (see my comment on this patch).
>>
>> The reST primer from sphinx-doc is always a good reference for the daily work
>>
>>    http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#directives
> Thanks Marcus, that's actually how I came to the conclusion that they
> should by asterisks.
> 
> 	http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#lists-and-quote-like-blocks
> 
> Anyways, as usual LKML sorted me out :)

Its only a 'primer', a reduced introduction.  But it gives also some "(ref)"s
to the docutils origin where the refernce of reST is located.

E.g. the first "(ref)" of the chapter "Lists and Quote-like blocks" (you linked
above) points to the bullet list reference at:

   http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#bullet-lists

"""A text block which begins with a "*", "+", "-", "•", "‣", or "⁃", followed by 
whitespace, is a bullet list item"""


-- Markus --


