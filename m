Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 484EA7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 15:53:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751295AbeFDPxc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 11:53:32 -0400
Received: from merlin.infradead.org ([205.233.59.134]:45464 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751282AbeFDPxb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jun 2018 11:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9MsJtXVBI8wucMLHK2lsmpAxDg+DkdyD2yMk3lP44/Y=; b=L+w0FWKxzkG0sBgl8V8ZKwI1rY
        zL5dQ8IJYwxQhBZ6TMsKJ3ISBy/8IeJKzhpSd/K8VcSe1smR6mvNodmIf/XAGtAMRULyA7n/JwCG/
        yahuoRRF5Xs83F9qnzI+TqhbPpqvuaHS5QRhvBzWewVGr3JvtMMQhbIrTnjYK2WsVoQ4Hf9OPELJ1
        ofleigZxflzxggclC1K5FNzTtMxwMUP4mV2eY2800pIUxFb68HZuKrSed5bmVwWZTaR+G5NjemQML
        PpeYivel+/EKoVTAD7z+Hk71VPWWq2E2172rchgFV1IiOnpC4kpAAdIih7q8tBQqyXa8XEJT6zzvb
        XsKeD3JQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fPrnU-0006wt-Lp; Mon, 04 Jun 2018 15:53:28 +0000
Subject: Re: [PATCH] docs/admin-guide/mm: add high level concepts overview
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20180529113725.GB13092@rapoport-lnx>
 <285dd950-0b25-dba3-60b6-ceac6075fb48@infradead.org>
 <20180604122235.GB15196@rapoport-lnx>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <30155b1b-cc7f-9203-49dc-c1235e204012@infradead.org>
Date:   Mon, 4 Jun 2018 08:53:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180604122235.GB15196@rapoport-lnx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/04/2018 05:22 AM, Mike Rapoport wrote:
> Hi Randy,
> 
> Thanks for the review! I always have trouble with articles :)
> The patch below addresses most of your comments.
> 
> On Fri, Jun 01, 2018 at 05:09:38PM -0700, Randy Dunlap wrote:
>> On 05/29/2018 04:37 AM, Mike Rapoport wrote:
>>> Hi,
>>>
>>> From 2d3ec7ea101a66b1535d5bec4acfc1e0f737fd53 Mon Sep 17 00:00:00 2001
>>> From: Mike Rapoport <rppt@linux.vnet.ibm.com>
>>> Date: Tue, 29 May 2018 14:12:39 +0300
>>> Subject: [PATCH] docs/admin-guide/mm: add high level concepts overview
>>>
>>> The are terms that seem obvious to the mm developers, but may be somewhat
> 
> Huh, I afraid it's to late to change the commit message :(

Sure.

>>   There are [or: These are]
>>
>>> obscure for, say, less involved readers.
>>>
>>> The concepts overview can be seen as an "extended glossary" that introduces
>>> such terms to the readers of the kernel documentation.
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
>>> ---
>>>  Documentation/admin-guide/mm/concepts.rst | 222 ++++++++++++++++++++++++++++++
>>>  Documentation/admin-guide/mm/index.rst    |   5 +
>>>  2 files changed, 227 insertions(+)
>>>  create mode 100644 Documentation/admin-guide/mm/concepts.rst
>>>
>>> diff --git a/Documentation/admin-guide/mm/concepts.rst b/Documentation/admin-guide/mm/concepts.rst
>>> new file mode 100644
>>> index 0000000..291699c
>>> --- /dev/null
>>> +++ b/Documentation/admin-guide/mm/concepts.rst
> 
> [...]
> 
>>> +All this makes dealing directly with physical memory quite complex and
>>> +to avoid this complexity a concept of virtual memory was developed.
>>> +
>>> +The virtual memory abstracts the details of physical memory from the
>>
>>        virtual memory {system, implementation} abstracts
>>
>>> +application software, allows to keep only needed information in the
>>
>>                software, allowing the VM to keep only needed information in the
>>
>>> +physical memory (demand paging) and provides a mechanism for the
>>> +protection and controlled sharing of data between processes.
>>> +
> 
> My intention was "virtual memory concept allows ... and provides ..."
> I didn't want to repeat "concept", to I've just omitted it.
> 
> Somehow, I don't feel that "system" or "implementation" fit here...

OK.  Thanks for the update.

> Subject: [PATCH] docs/admin-guide/mm/concepts.rst: grammar fixups

> The patch is mostly about adding 'a' and 'the' and updating indentation.

I would say that it's mostly about improving readability.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
