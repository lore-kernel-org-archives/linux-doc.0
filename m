Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F9B27D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Mar 2019 08:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfCLITH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Mar 2019 04:19:07 -0400
Received: from smtp3.goneo.de ([85.220.129.37]:46132 "EHLO smtp3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726218AbfCLITG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Mar 2019 04:19:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 7606C23F854;
        Tue, 12 Mar 2019 09:19:03 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id f7b1tsfXyXpw; Tue, 12 Mar 2019 09:19:02 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-178-142-131-113.ewe-ip-backbone.de [178.142.131.113])
        by smtp3.goneo.de (Postfix) with ESMTPSA id B657523F1CF;
        Tue, 12 Mar 2019 09:19:01 +0100 (CET)
Subject: Re: undefined label
To:     Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     "Tobin C. Harding" <me@tobin.cc>, linux-doc@vger.kernel.org
References: <20190307091734.GB9152@eros.localdomain>
 <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de>
 <20190307203041.GC21937@eros.localdomain>
 <f0891518-ae90-904b-1001-477c122f1abb@darmarit.de> <878sxp7e6s.fsf@intel.com>
 <20190311113015.166262c9@lwn.net>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <9ed8cf1e-627b-bf04-02ba-26684198c55b@darmarit.de>
Date:   Tue, 12 Mar 2019 09:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190311113015.166262c9@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 11.03.19 um 18:30 schrieb Jonathan Corbet:
> On Fri, 08 Mar 2019 14:17:47 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
>>>   >> To close such cross-books links we can use intersphinx [1] and map to e.g.
>>>   >>
>>>   >>    intersphinx_mapping = {
>>>   >>        'kernel': ('https://www.kernel.org/doc/html/latest/', None)}
>>>
>>> This requires online access while building the output.  Anyway, as soon as
>>> I have some time to spare I will send a RFC with more explanation about
>>> (you will receive it in CC).
>>
>> Please remember to call out the online access in the patch series. Such
>> a requirement is going to draw a lot of opposition.
> 
> Indeed, I think that would a difficult requirement to add.  It may well be
> better, in the end, to simply document this "feature" and live with it.
> 
> jon
> 

I know about this, thats why I mentioned this as a drawback.
May I find a soulution which uses intersphinx only when needed
(when using SPHINXDIRS).  Anyway it will be only a **RFC**.
But right now I don't have time anyway.  ;)

-- Markus --
