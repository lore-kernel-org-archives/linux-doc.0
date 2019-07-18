Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 91D4E7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Jul 2019 17:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732457AbfGRR5D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Jul 2019 13:57:03 -0400
Received: from smtp1-2.goneo.de ([85.220.129.31]:60404 "EHLO smtp1-2.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726715AbfGRR5D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Jul 2019 13:57:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 5465723FA11;
        Thu, 18 Jul 2019 19:57:00 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CGh6ZSx_u-fI; Thu, 18 Jul 2019 19:56:59 +0200 (CEST)
Received: from [192.168.10.231] (ip-109-91-78-216.hsi12.unitymediagroup.de [109.91.78.216])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 1742923F32C;
        Thu, 18 Jul 2019 19:56:59 +0200 (CEST)
Subject: Re: Using rst2pdf for PDF output - Was: Re: [PATCH 0/5] PDF output
 fixes
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
 <20190712141921.7f8a1d02@lwn.net> <20190712192705.71b97717@coco.lan>
 <20190713004125.6009b661@coco.lan> <20190718144655.5aa7deb4@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <04a1a65f-c96c-1f4a-d987-d8b9e605d7c1@darmarit.de>
Date:   Thu, 18 Jul 2019 19:56:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718144655.5aa7deb4@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 18.07.19 um 19:46 schrieb Mauro Carvalho Chehab:
> Em Sat, 13 Jul 2019 00:41:25 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> 
>> Em Fri, 12 Jul 2019 19:27:05 -0300
>> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
>>
>>> Em Fri, 12 Jul 2019 14:19:21 -0600
>>> Jonathan Corbet <corbet@lwn.net> escreveu:
>>>    
>>>> Can't you just make rst2pdf work instead? :)
>>>
>>> Well, we can try.

Thanks a lot for your investigation on this.  I also checked the rst2pdf sources 
a while ago, for me it was crap with crap requirements [1] .. my tip: don't 
waste to much time on it.

[1] https://github.com/mchehab/rst2pdf/blob/master/requirements.txt#L31

-- Markus --
