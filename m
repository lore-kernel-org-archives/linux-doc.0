Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8F8C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 18 Apr 2022 23:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbiDRXDS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Apr 2022 19:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbiDRXDR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Apr 2022 19:03:17 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F32BC2A
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=WnsMBQwcC83neLDEr/BDjRAeLkwsaE08w+xyjpxxqGg=; b=IPoSig3Crnz2WlZqVxFCU65pcM
        qVPZdmKqEOH7eTYRrhZSin5VXW3c58GElftvT0YH7z1pdDuOKN0vtMzGkKzcC8sznvonlpBC5WUkg
        hj2tURGfDepyizW0YOa2Q62hRtTZGlgeOeQnzV8+5OJtoKDRUlY5AbeijHMrgcDePM28gPUFFzIwR
        /G2sTlBn/jDOVj0oottELOujsCOFaahPvKss6+fGirysv8zlQgGgkuHJ8kzyYX4c8AvpLYb0o5t5O
        2STETqBpyMCt3tzeS2iClqgiqfpxn/eY8WNwgeCZV+SjrsAWBSrlajD0Eu5kq71o9qS9cWhskgCjh
        aUBYIbpQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ngaM6-006ePT-Gg; Mon, 18 Apr 2022 23:00:27 +0000
Message-ID: <0475480d-2670-1e83-9b3b-a5ec75b7d0ee@infradead.org>
Date:   Mon, 18 Apr 2022 16:00:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: docs: IDE removal?
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <16ed554f-0f25-e914-5cb9-dce53d027f1e@infradead.org>
 <27af39d6-8982-6c87-c488-d5052b9fd03a@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <27af39d6-8982-6c87-c488-d5052b9fd03a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 4/18/22 06:05, Bagas Sanjaya wrote:
> On 4/18/22 07:06, Randy Dunlap wrote:
>> Hi,
>>
>> Would someone suggest how much of
>> Documentation/ide/ can be removed, given:
>>
>> commit b7fb14d3ac63
>> Author: Christoph Hellwig <hch@lst.de>
>> Date:   Wed Jun 16 15:46:58 2021 +0200
>>
>>     ide: remove the legacy ide driver
>>
>>
>>
>> ChangeLog.ide-cd.1994-2004
>> ChangeLog.ide-floppy.1996-2002
>> ChangeLog.ide-tape.1995-2002
>> changelogs.rst
>> ide.rst
>> ide-tape.rst
>> index.rst
> 
> I'm not the subject-matter expert for this case, but I agree to
> remove/nuke Documentation/ide/ at its entirety.

Yeah, I agree, but I would like to see one of the subject matter
experts agree also.

thanks.

-- 
~Randy
