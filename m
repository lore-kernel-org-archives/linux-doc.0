Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AC5C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 06:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 621F561075
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 06:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhEGGui (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 02:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhEGGuh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 May 2021 02:50:37 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9164FC061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 23:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=KkpTLxTbz2mw8ZHU0VqyadjBKU2oGcSzsfaTSYFt0pU=; b=kKgpuh553S8qAqXIsRyhg+C/hx
        4WAhsA6eBU4aHkHaFFIE4LEi4EnKaIJ0lhy9cp/kVa5IfYjbtj977isWDK61y+F7/1b4QsAjeGPzS
        SPlL28oqXcWDNcZCo/ow0PIZesB6P3tSfY/R1RqR4lynp7PYSVq55Y3O4hLTCalzwisQy66BDdyTa
        JxTXS6ur/puv0Au90PEKbPHwm45ZD+6sl5aSqubvbv+e9QTs+hYiUMt3XcakWOYGOeFrjdKEOz3Cc
        pDuPVTPWaWRDC+MWFlF8GdI3TYf//zkjioHjS9Boqz0ir1pj6ELighOgzHxD9k7Rlv9TVoaUwkTS9
        dek+e+fQ==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1leuIn-006dCP-4w; Fri, 07 May 2021 06:49:33 +0000
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
 <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
 <20210506180842.GD388843@casper.infradead.org>
 <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
 <20210507083924.7b8ec1fe@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b8491859-1126-aa05-691b-514c23db212d@infradead.org>
Date:   Thu, 6 May 2021 23:49:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210507083924.7b8ec1fe@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/6/21 11:39 PM, Mauro Carvalho Chehab wrote:
> Em Thu, 6 May 2021 14:21:01 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 

>>
>> Just another question: ("inquiring minds want to know")
>>
>> Why is/are some docs using U+2217 '*' instead of ASCII '*'?
>> E.g., Documentation/block/cdrom-standard.rst.
> 
> The cdrom doc is a very special case: it was originally written in LaTeX.

Yes, I recall that. I even edited it at least once.

> I don't remember any other document in LaTeX inside the Kernel docs during
> the conversions I made. See:
> 	e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
> 
> In order to convert it to .rst, I used some tool to first turn it
> into plain text (probably LaTeX, but I don't remember anymore), and then
> I manually reviewed the entire file, adding ReST tags where needed.
> 
> I didn't realize that utf-8 chars were used instead of normal ASCII chars,
> as both appear the same when editing it[1].
> 
> [1] I use Fedora here. Fedora changed the default charset to utf-8 a long
>     time ago.
> 
> Anyway, we should be able of get rid of weird UTF-8 chars from it with:
> 
> 	$ iconv -f utf-8 -t ascii//TRANSLIT Documentation/cdrom/cdrom-standard.rst
> 
> I'll prepare a patch fixing it. Some care should be taken, however, as
> it has two places where UTF-8 chars should be used[2].

Thanks!

> [2] There are two German person names that use UTF-8 chars:
>     - 'o' + umlat;
>     - a LATIN SMALL LETTER SHARP S (Eszett)

My patch preparation notes say that the cdrom .rst file contains
"fancy '*'" (not ASCII) instead of ASCII '*' in several places.

Also there are several files that contain U+00A0 non-breaking space
where it is not needed AFAICT.


-- 
~Randy

