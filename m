Return-Path: <SRS0=SFNS=4G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3652DC34026
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 10:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BCA5207FD
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 10:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgBRKzr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Feb 2020 05:55:47 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:45718 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726327AbgBRKzr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Feb 2020 05:55:47 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04396;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0TqHf9et_1582023340;
Received: from JosephdeMacBook-Pro.local(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0TqHf9et_1582023340)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 18 Feb 2020 18:55:40 +0800
Subject: Re: [PATCH 12/44] docs: filesystems: convert dlmfs.txt to ReST
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, Mark Fasheh <mark@fasheh.com>,
        Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
 <efc9e59925723e17d1a4741b11049616c221463e.1581955849.git.mchehab+huawei@kernel.org>
 <3b40d7d4-3798-08db-220d-b45704ada48a@linux.alibaba.com>
 <20200218110731.2890658d@kernel.org>
From:   Joseph Qi <joseph.qi@linux.alibaba.com>
Message-ID: <ce80d0cd-a94f-caa8-b8bd-9788afd3927f@linux.alibaba.com>
Date:   Tue, 18 Feb 2020 18:55:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218110731.2890658d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 20/2/18 18:07, Mauro Carvalho Chehab wrote:
> Em Tue, 18 Feb 2020 09:21:51 +0800
> Joseph Qi <joseph.qi@linux.alibaba.com> escreveu:
> 
>> On 20/2/18 00:11, Mauro Carvalho Chehab wrote:
> 
>>> @@ -96,14 +101,19 @@ operation. If the lock succeeds, you'll get an fd.
>>>  open(2) with O_CREAT to ensure the resource inode is created - dlmfs does
>>>  not automatically create inodes for existing lock resources.
>>>  
>>> +============  ===========================
>>>  Open Flag     Lock Request Type
>>> ----------     -----------------  
>>
>> Better to remove the above line.
>>
>>> +============  ===========================
>>>  O_RDONLY      Shared Read
>>>  O_RDWR        Exclusive
>>> +============  ===========================
>>>  
>>> +
>>> +============  ===========================
>>>  Open Flag     Resulting Locking Behavior
>>> ----------     --------------------------  
>>
>> Ditto.
> 
> Ok. So, I guess we can just merge the two tables into one, like:
> 
> 	============  =================
> 	O_RDONLY      Shared Read
> 	O_RDWR        Exclusive
> 	O_NONBLOCK    Trylock operation
> 	============  =================
> 
> Right?
> 
I think they should be in different section.
The first two are lock level, while the last is lock behavior.

Thanks,
Joseph
