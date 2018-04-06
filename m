Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BA01C7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 10:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752102AbeDFKKU convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 06:10:20 -0400
Received: from smtp3-1.goneo.de ([85.220.129.38]:59836 "EHLO smtp3-1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751802AbeDFKKS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Apr 2018 06:10:18 -0400
X-Greylist: delayed 378 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Apr 2018 06:10:17 EDT
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 1A36423FA10;
        Fri,  6 Apr 2018 12:03:58 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3IUgRl9lhhAW; Fri,  6 Apr 2018 12:03:56 +0200 (CEST)
Received: from [192.168.1.112] (dyndsl-091-248-139-043.ewe-ip-backbone.de [91.248.139.43])
        by smtp3.goneo.de (Postfix) with ESMTPSA id D419823FA6C;
        Fri,  6 Apr 2018 12:03:55 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: make xmldocs failed with error after 4.17 merge period
From:   Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <20180406091126.GC21589@kuha.fi.intel.com>
Date:   Fri, 6 Apr 2018 12:03:55 +0200
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <2A917B38-AFF6-44DC-A4A9-796B2BE560E2@darmarit.de>
References: <CALLJCT0MFg6b+dG50cqe_hv6hxmQDj-ZM066BOtQt_wOiC8ENA@mail.gmail.com>
 <20180406075109.GA21589@kuha.fi.intel.com> <20180406075734.GA16728@kroah.com>
 <20180406081555.GB21589@kuha.fi.intel.com> <20180406083010.GA20174@kroah.com>
 <20180406091126.GC21589@kuha.fi.intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 06.04.2018 um 11:11 schrieb Heikki Krogerus <heikki.krogerus@linux.intel.com>:
[...]

>>>>>> An ascii graphic in typec.rst cause the error.
>>>>> 
>>>>> Thanks for the report. I'm going to propose that we fix this by
>>>>> marking the ascii art as comment:
>>>>> 
>>>>> diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
>>>>> index feb31946490b..972c11bf4141 100644
>>>>> --- a/Documentation/driver-api/usb/typec.rst
>>>>> +++ b/Documentation/driver-api/usb/typec.rst
>>>>> @@ -212,7 +212,7 @@ port drivers can use USB Role Class API with those.
>>>>> 
>>>>> Illustration of the muxes behind a connector that supports an alternate mode:
>>>>> 
>>>>> -                     ------------------------
>>>>> +..                   ------------------------
>>>>>                     |       Connector      |
>>>>>                     ------------------------
>>>>>                            |         |
>>>>> 
>>>>> I hope that works.
>>>> 
>>>> Try it and see!  :)
>>> 
>>> It will fix this issue. I was just wondering if use of ascii art is
>>> acceptable in general with the .rst files? But then again, why
>>> wouldn't it be.

[...]

> I was propsed to use something called "Literal Block" with ascii art.
> http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#literal-blocks

about *ASCII-art*: see fix from Jani ...

 https://www.mail-archive.com/linux-doc@vger.kernel.org/msg19302.html

where the '::' is a short-markup for a literal-block.


>> There are ways to do this, look at how the v4l2 and I think the drm
>> subsystems handle ascii art such that "real" drawings end up being
>> produced.
> 
> Thanks. I did not actually find anything else except use of tables and
> code-blocks in v4l documentation. Is that what you were referring?

If it is about *figures*: we have a directive named 'kernel-figure',
which is a full replacement of the 'figure' directive from Sphinx-Doc.
In addition it supports *inline* SVG and DOT markups. Read:

 https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#figures-images

-- Markus --

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
