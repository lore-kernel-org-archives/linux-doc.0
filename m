Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0EEC433B4
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 15:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCB2C61261
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 15:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhEHP4V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 11:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhEHP4V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 May 2021 11:56:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61123C061574
        for <linux-doc@vger.kernel.org>; Sat,  8 May 2021 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=QKPAWlId70tl1To7T1s4kmN1atFjaIJssdGSeq5kJqA=; b=36QOicAmd9KfqN2zfEjA7DHbHJ
        2REdrBNm1kwyMRTmoD2cgrA4c2KuCHp0oxKL2qLmfCEkiZ4XsCwG2a7ptbQYlz+O5FUA33rrY3n38
        dOr9K6kXCbie3iRvsM123V07fbY0KwVQ7IHRpHhfH51YP/iJA0P3fmqY0rD4oEb/JLlacXLZO/UTo
        hRejriIwd0JBDlD+Kao5t6mTPhEyfXAfGOwOhsQZExSPO4bYmhxrxkPrwD17RQcK4VCjm33qhvjSY
        85v/XojNgLmQm+eC5V3Qq2cmMlLUC+lsc9WOUKXhMfXac97HDtrs0zVSZDTyoKaCLWlM612KcmBa/
        /gy9yoSw==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lfPIP-007cgi-2S; Sat, 08 May 2021 15:55:13 +0000
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
 <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
 <20210506180842.GD388843@casper.infradead.org>
 <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
 <20210507083924.7b8ec1fe@coco.lan> <20210508112205.41946ac7@coco.lan>
 <20210508104157.GC12700@kitsune.suse.cz> <20210508164145.26f7b1e0@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <347657c8-f5ae-517c-0b43-fb60d50f1dd8@infradead.org>
Date:   Sat, 8 May 2021 08:55:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210508164145.26f7b1e0@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

On 5/8/21 7:41 AM, Mauro Carvalho Chehab wrote:
> Em Sat, 8 May 2021 12:41:57 +0200
> Michal Suchánek <msuchanek@suse.de> escreveu:
> 
>> On Sat, May 08, 2021 at 11:22:05AM +0200, Mauro Carvalho Chehab wrote:
>>> Em Fri, 7 May 2021 08:39:24 +0200
>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>   
>>>> Em Thu, 6 May 2021 14:21:01 -0700
>>>> Randy Dunlap <rdunlap@infradead.org> escreveu:
>>>>   
>>>   
>>>> I'll prepare a patch fixing it. Some care should be taken, however, as
>>>> it has two places where UTF-8 chars should be used[2].  
>>>
>>> Ok, I did a small script in order to check what special chars we
>>> currently have (next-20210507) at Documentation/ excluding the
>>> translations.
>>>
>>> Based on my script results, we have those groups:
>>>
>>> 1. Latin accented characters:
>>> 	- U+00c7 (LATIN CAPITAL LETTER C WITH CEDILLA) (Ç)
>>> 	- U+00df (LATIN SMALL LETTER SHARP S) (ß)
>>> 	- U+00e1 (LATIN SMALL LETTER A WITH ACUTE) (á)
>>> 	- U+00e4 (LATIN SMALL LETTER A WITH DIAERESIS) (ä)
>>> 	- U+00e6 (LATIN SMALL LETTER AE) (æ)
>>> 	- U+00e7 (LATIN SMALL LETTER C WITH CEDILLA) (ç)
>>> 	- U+00e9 (LATIN SMALL LETTER E WITH ACUTE) (é)
>>> 	- U+00ea (LATIN SMALL LETTER E WITH CIRCUMFLEX) (ê)
>>> 	- U+00eb (LATIN SMALL LETTER E WITH DIAERESIS) (ë)
>>> 	- U+00f3 (LATIN SMALL LETTER O WITH ACUTE) (ó)
>>> 	- U+00f4 (LATIN SMALL LETTER O WITH CIRCUMFLEX) (ô)
>>> 	- U+00f6 (LATIN SMALL LETTER O WITH DIAERESIS) (ö)
>>> 	- U+00f8 (LATIN SMALL LETTER O WITH STROKE) (ø)
>>> 	- U+00fc (LATIN SMALL LETTER U WITH DIAERESIS) (ü)
>>> 	- U+011f (LATIN SMALL LETTER G WITH BREVE) (ğ)
>>> 	- U+0142 (LATIN SMALL LETTER L WITH STROKE) (ł)
>>>
>>> 2. symbols:
>>> 	- U+00a9 (COPYRIGHT SIGN) (©)
>>> 	- U+2122 (TRADE MARK SIGN) (™)
>>> 	- U+00ae (REGISTERED SIGN) (®)
>>> 	- U+00b0 (DEGREE SIGN) (°)
>>> 	- U+00b1 (PLUS-MINUS SIGN) (±)
>>> 	- U+00b2 (SUPERSCRIPT TWO) (²)
>>> 	- U+00b5 (MICRO SIGN) (µ)
>>> 	- U+00bd (VULGAR FRACTION ONE HALF) (½)
>>> 	- U+2026 (HORIZONTAL ELLIPSIS) (…)
>>>
>>> 3. arrows:
>>> 	- U+2191 (UPWARDS ARROW) (↑)
>>> 	- U+2192 (RIGHTWARDS ARROW) (→)
>>> 	- U+2193 (DOWNWARDS ARROW) (↓)
>>> 	- U+2b0d (UP DOWN BLACK ARROW) (⬍)
>>>
>>> 4. box drawings:
>>> 	- U+2500 (BOX DRAWINGS LIGHT HORIZONTAL) (─)
>>> 	- U+2502 (BOX DRAWINGS LIGHT VERTICAL) (│)
>>> 	- U+2514 (BOX DRAWINGS LIGHT UP AND RIGHT) (└)
>>> 	- U+251c (BOX DRAWINGS LIGHT VERTICAL AND RIGHT) (├)
>>>
>>> 5. math symbols:
>>> 	- U+00b7 (MIDDLE DOT) (·)
>>> 	- U+00d7 (MULTIPLICATION SIGN) (×)
>>> 	- U+2212 (MINUS SIGN) (−)
>>> 	- U+2217 (ASTERISK OPERATOR) (∗)
>>> 	- U+223c (TILDE OPERATOR) (∼)
>>> 	- U+2264 (LESS-THAN OR EQUAL TO) (≤)
>>> 	- U+2265 (GREATER-THAN OR EQUAL TO) (≥)
>>> 	- U+27e8 (MATHEMATICAL LEFT ANGLE BRACKET) (⟨)
>>> 	- U+27e9 (MATHEMATICAL RIGHT ANGLE BRACKET) (⟩)
>>> 	- U+00ac (NOT SIGN) (¬)  
>>
> 
>>
>> Use of ¬ is also very dubious in documentation (in fonts it is understandable):
>> Documentation/ABI/obsolete/sysfs-kernel-fadump_registered:This ABI is renamed and moved to a new location /sys/kernel/fadump/registered.¬
>> Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem:This ABI is renamed and moved to a new location /sys/kernel/fadump/release_mem.¬
> 
> 
>> Documentation/powerpc/transactional_memory.rst:  if (MSR 29:31 ¬ = 0b010 | SRR1 29:31 ¬ = 0b000) then
> 
> Yeah, this should probably be better written as:
> 
>   if (MSR 29:31 == 0b010 | SRR1 29:31 == 0b000) then

If the original with the 'NOT SIGN' was correct, then this
version can't be correct. Or do you suspect that the "original"
was corrupted somehow?


> In the mean time, I'm already preparing a patch series addressing
> the issues inside documentation, using some scripting to avoid
> manual mistakes:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=fix_utf8
> 
> (patch series is not 100% yet... some adjustments are still
> needed on some places).


Thanks for digging into this and providing fixes.

-- 
~Randy

