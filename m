Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECFDC76196
	for <linux-doc@archiver.kernel.org>; Mon,  3 Apr 2023 17:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233097AbjDCR1w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 13:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjDCR1v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 13:27:51 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E098E
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=lLsWRYwl1d8MCFjmvJbxMKguDTaPzXe7z3/bIDbNdgY=; b=AfaKyFMDx9dThcnTfOGaGtdXY6
        Wzl+Z67RpOu8nQfzFFjrYa8RQF81yBl3dhIET3ZPwk4tyGLN7RVMBQ6BcsQfU700zgfb+sSFnMWzN
        TMiCwA/WIvO1zsA0akHBPag8UHcJy7urc5ir61o2FmhGMlt5VfsVDBfx8JmPAD5D3rCH+leiciORh
        SVVmBwCIcPIgEo/kQ6KWnJMn64min82YFNgKyrL8AtngLx/CDFEXxiEOzmnW+43g7EViZgV+mWf9L
        tAhjMN6c90TB+5W6pqLPA42F6n/sDPkU/6upRYYqGZ08eoHEYn/arsBWlpwt/pqschiM80f0Al2rf
        KA9/0XBA==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pjNyA-00G4cS-1M;
        Mon, 03 Apr 2023 17:27:50 +0000
Message-ID: <0d88212c-d119-1854-4f05-7e9dc0549580@infradead.org>
Date:   Mon, 3 Apr 2023 10:27:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: sphinx - proper method for linking
Content-Language: en-US
To:     Ken Goldman <kgold@linux.ibm.com>, linux-doc@vger.kernel.org
References: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
 <87v8ipzswd.fsf@meer.lwn.net> <ZB5gPAGzTwqArQY4@debian.me>
 <bf615760-918c-f0d1-e70d-87071f847a04@linux.ibm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <bf615760-918c-f0d1-e70d-87071f847a04@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 4/3/23 08:37, Ken Goldman wrote:
> The answers below explain __how__, which I already know.
> 
> My question is whether this is a good or bad idea.  What happens if I change labels?  Do I break people's links?  Must my labels be stable forever?

For in-kernel-tree links, they will be fixed up.

> On 3/24/2023 10:45 PM, Bagas Sanjaya wrote:
>> On Fri, Mar 24, 2023 at 04:28:02PM -0600, Jonathan Corbet wrote:
>>>> Are links to other documents stable?
>>>>
>>>> How about sections within the page?
>>> I don't understand those questions.
>> You need to first add the label before desired section heading, like:
>>
>> ```
>> ...
>> .. _foo:
>>
>> Foo
>> ===
>>
>> ...
>> ```
>>
>> Then elsewhere use :ref: role and specify the target label, ideally also
>> specifying anchor text:
>>
>> ```
>> ...
>> This assumes that you have knowledge on :ref:`foo <foo>`.
>> ...
>> ```
> 
> I know I can do that.
> 
> However, what happens if someone links to my :ref:, and then I change the label?

Is this "someone" a document in the kernel tree? If so, it will be fixed up.
If it's some document on the internet, we have no control over that.
It's up to "them" to keep it current. We don't guarantee stable links.


>>>> I found that this .rst works.
>>>>
>>>> See
>>>> https://www.kernel.org/doc/html/latest/security/keys/trusted-encrypted.html
>>>>
>>>> Is that OK, or is there a better way?
>>> You wouldn't link to the rendered kernel docs normally, you'd just say
>>> "See Documentation/security/keys/trusted-encrypted.rst".
>>>
>>> Look at the Sphinx cheatsheets on the net for the various other ways of
>>> making links if you need to link outside of the kernel docs.
>> As with internal linking, you can simply write out the link:
>>
>> ```
>> ...
>> Check out the documentation at https://foo.bar/baz for complete
>> treatment on this topic.
>> ...
>>
>> ```
>>
>> Or if you need anchor text:
>>
>> ```
>> ...
>> Check out `baz documentation <https://foo.bar/baz>`_ for complete
>> treatment on this topic`.
>> ...
>> ```
>>
>> There is also :doc: directive if you need internal linking with anchor
>> text. The target can be either relative to the doc or absolute in respect
>> to documentation root (`Documentation/`). Do not specify filename
>> suffix. For example:
>>
>> ```
>> ...
>> The general guide on :doc:`submitting patches
>> </process/submitting-patches>` also applies to this subsystem.


-- 
~Randy
