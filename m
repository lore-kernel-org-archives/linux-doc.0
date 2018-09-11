Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3200F7D584
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 15:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbeIKUfJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 16:35:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60780 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbeIKUfJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Sep 2018 16:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Bhcs5BKMUEVIC+QxeY8nSVKlW6nNdcN9eIePSMmvVDQ=; b=qdvPPJ2LyPT3kG3bRToTx+VaN
        2qroJawLIh2Rh1J3mHmXsYQ1jhcF+sKOwtHXIZqlAj9Fy474ZmYXfYoEltIUqw/7LvYBXnKMBid89
        s4sdsjnaq99bdSNNnRZmZJN/sABDNAt0CjOyviCDNkDEnhnjC6dbeuWuvTX8s/iESdPWUNcYfYWrF
        qpTM8cfnL9dpXtcbGKqkYi4V9WfBuTuH2BLh/0jiMPJGF96LRATF/QG/KMXLDA+E5SxPPB7HXOHtq
        uEaNQFWdi3MnhuIfzI1Ymk2/N5BFq79EhADqhXyWk0zL6FDXUL+xCpXEUP9ZxwKAqNUkoZLpp/oKy
        SyvQeTaPQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fzkhD-0008DY-5q; Tue, 11 Sep 2018 15:35:19 +0000
Subject: Re: nodocs in 4.19-rcX
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
References: <ace3eeb9-0a15-a4ff-cf2d-af9335fd9810@infradead.org>
 <20180911092522.7a335ce8@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e1ae3f3f-5cd0-6542-9f95-69ea7e5ecafa@infradead.org>
Date:   Tue, 11 Sep 2018 08:35:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180911092522.7a335ce8@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/11/18 8:25 AM, Jonathan Corbet wrote:
> On Mon, 10 Sep 2018 15:51:20 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> 4.19-rc contains some users of :nodocs: but that is not recognized yet,
>> so we get:
>>
>> lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:78: ERROR: Error in "kernel-doc" directive:
>> unknown option: "nodocs".
>>
>> .. kernel-doc:: mm/bootmem.c
>>    :nodocs:
>>
>> lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:91: ERROR: Error in "kernel-doc" directive:
>> unknown option: "nodocs".
>>
>> .. kernel-doc:: mm/memblock.c
>>    :nodocs:
>>
>>
>> Do you plan to merge the patch(es) for :nodocs: ?
> 
> :nodocs" was v1 of the patch set:
> 
>   https://lwn.net/ml/linux-doc/1529328996-16247-1-git-send-email-rppt%40linux.vnet.ibm.com/
> 
> In the end, I merged v3, which changed things (and did not contain
> the :nodocs: directive:
> 
>   https://lwn.net/ml/linux-doc/1530306311-10510-1-git-send-email-rppt%40linux.vnet.ibm.com/

Yes, I found that later.

which uses (for the record)
   :functions:
with an empty functions list -- to exclude "DOC:" sections.

> So I'm guessing that anything that snuck in with :nodocs: didn't get
> updated.  Somehow I missed that.  Adding CC: Mike, since his
> fingerprints are on all aspects of this...:)

thanks.

-- 
~Randy
