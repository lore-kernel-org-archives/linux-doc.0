Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0DBC761A6
	for <linux-doc@archiver.kernel.org>; Mon,  3 Apr 2023 17:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbjDCRY0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 13:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjDCRYZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 13:24:25 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F040E122
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=W3NikmeQj8wSMW3HpmNBofqdKkIrmuadz7UFg6lLp3M=; b=eLBT19t+e1Sv7wsb28RAzQ5BP6
        0rqbTbwpRs+PgZ9aHKe/rcVKJGDpd8kQ2jDOmg6ovMvLMHpUUAhPrznnqhqmOCmT4pB9NZ/4qtH0a
        rwYO9XyHFTvnutBZ3DFXF2beLIALLVO5YuLCUkva7QzlrRtnWmdjqbhAEu+ZvMEtWKOFKZadWTvkQ
        kSEjkPM8yvQ9P2L7syR2wq6XR/hjAZWBjzNXFpBSYHE6oSMJol3aTvCj0vWDH2P/asCCtTXloidhx
        LyDtC7HkT4jK01u8SmDUtAcHcbDe1zTRClcV3ecq88n9HAPVnCHGGqfmisKXmV2PU6nSquCKP/s+X
        PzkT6zaw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pjNum-00G4At-27;
        Mon, 03 Apr 2023 17:24:20 +0000
Message-ID: <b45cf8aa-f019-538e-e5ca-bd8fea525391@infradead.org>
Date:   Mon, 3 Apr 2023 10:24:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: sphinx - proper method for linking
To:     Ken Goldman <kgold@linux.ibm.com>, linux-doc@vger.kernel.org
References: <e747b0ba-7992-36c7-f931-08aac46385f1@linux.ibm.com>
 <87v8ipzswd.fsf@meer.lwn.net>
 <0f9137dd-eca0-5187-6464-067974ed2f0c@linux.ibm.com>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0f9137dd-eca0-5187-6464-067974ed2f0c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ken,

Please use Reply-to-All instead of just replying to the mailing list.
This is common Linux development etiquette.


On 4/3/23 08:33, Ken Goldman wrote:
> Besides the below questions, here's another:
> 
> My current module has 6 .rst files.  Is that usual, or is it
> recommended that the entire module be in one big file?
> 
> I know either works, but I want to follow the customary
> pattern.

IMO it's hard to say without knowing how they are split up or how
inter-related they are.

> On 3/24/2023 6:28 PM, Jonathan Corbet wrote:
>> Ken Goldman <kgold@linux.ibm.com> writes:
>>
>>> 1. What is the recommended way to link to documents outside my tree.
>>>
>>> Should I be doing that, or is it fragile / not recommended?
>> If you need to link to something elsewhere, you can certainly do so;
>> there are countless examples in the kernel documentation.
> I know I can do it, but is it recommended or discouraged?
>>> Are links to other documents stable?

Not necessarily.

>>> How about sections within the page?
>> I don't understand those questions.
> 
> I can add a link to a .rst file.  If someone links to my doc, it implies that my filename cannot change.  Similarly, if I link to another doc, I depend on that filename not changing.

We don't restrict filenames from changing. If one of more change, they will just generate
document build warnings or errors. Someone should see that during the kernel development process
and fix it up. It happens. It's not a big deal.
(This is for in-the-kernel-tree linking. For links from outside the kernel tree,
that's their business...)

>>> I found that this .rst works.
>>>
>>> See
>>> https://www.kernel.org/doc/html/latest/security/keys/trusted-encrypted.html
>>>
>>> Is that OK, or is there a better way?
>> You wouldn't link to the rendered kernel docs normally, you'd just say
>> "See Documentation/security/keys/trusted-encrypted.rst".
>>
>> Look at the Sphinx cheatsheets on the net for the various other ways of
>> making links if you need to link outside of the kernel docs.
> 
> That's an example.  If I link like that, and then the name changes to trusted-encryptedxxx.rst, I break.
> 
>>
>>> Is that link (doc/html/latest) correct.
>>>
>>> 2. Are my pages and headings to be treated as stable, like an API? I.e.,
>>> once I release documentation, are all the pages and headings frozen so
>>> they will not break links?
>> No, there is no such requirement.
> Then don't links break?

We don't have such a requirement, but you can impose one on the files that you are
writing if you want to.

-- 
~Randy
