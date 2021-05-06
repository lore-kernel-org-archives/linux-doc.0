Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4C8C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 21:21:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0612C60698
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 21:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhEFVWg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 17:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhEFVWf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 17:22:35 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFB3C061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=pviLyuo0Npk5QGmvj41c+086Qx8lxZEs3YaL6YZPluE=; b=DodbdE7q1SUzab2I8kNen85NC0
        ZfkSf8LzeaSaL3CD3Iq22ay1x3kl0EhiPtf/DgMHwsK+Oitvv813L/qTQp5IlHQd+3Gs8kC06QoRM
        hOMduWqYHOlgJrQ+mTDLto60VS7EA/TaSwefxVlfOW65b/MkI/I0pmT5t6Z2jQNJYRjrSAnedMu7a
        6cJyEzczACVEl7JcUiGHNGZt8Hbb0uAN/3P6JePyBXeB6QcBidTJH01YpRr2ChmexS5jnRn+uEqwf
        CEGiEKskhcCBiW1FSwOkQY1nqugvARjQMLimho9D/VlPekuj03av4h6HX9tfFeTIPUzUMNLwJxeVJ
        6K42vFyw==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lelR5-006OoF-HO; Thu, 06 May 2021 21:21:31 +0000
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
Date:   Thu, 6 May 2021 14:21:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210506180842.GD388843@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/6/21 11:08 AM, Matthew Wilcox wrote:
> On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:
>> I have been going thru some of the Documentation/ files...
>>
>> Why do several of the files begin with
>> (hex) ef bb bf    followed by "=================="
>> for a heading, instead of just "===================".
>> See e.g. Documentation/timers/no_hz.rst.
> 
> 00000000  ef bb bf 3d 3d 3d 3d 3d  3d 3d 3d 3d 3d 3d 3d 3d  |...=============|
> 
> ef bb bf is utf8 for 0b1111'111011'111111 = 0xFEFF which is the
> https://en.wikipedia.org/wiki/Byte_order_mark
> 
> We should delete it.
> 

OK, thanks, I have started on that.


Just another question: ("inquiring minds want to know")

Why is/are some docs using U+2217 '*' instead of ASCII '*'?
E.g., Documentation/block/cdrom-standard.rst.

Maybe some $EDITOR is doing this?

thanks.
-- 
~Randy

