Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4475C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 11:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiJJLsp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 07:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbiJJLsL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 07:48:11 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0C16F54A
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 04:48:07 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-104-_xiXV8pPO3q2P3nNSl8MOQ-1; Mon, 10 Oct 2022 12:48:04 +0100
X-MC-Unique: _xiXV8pPO3q2P3nNSl8MOQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Mon, 10 Oct
 2022 12:48:02 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Mon, 10 Oct 2022 12:48:02 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Joe Perches' <joe@perches.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
CC:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: RE: kernel style preference trivia: '* const' vs '*const' ?
Thread-Topic: kernel style preference trivia: '* const' vs '*const' ?
Thread-Index: AQHY2/s8FXznyZAmrEihOrCH1Mc++a4HgnJg
Date:   Mon, 10 Oct 2022 11:48:01 +0000
Message-ID: <58121da1f2ec4d04b939a368bba47f02@AcuMS.aculab.com>
References: <9ff662d738612f0ed2cea39266768a2eff21edc3.camel@perches.com>
In-Reply-To: <9ff662d738612f0ed2cea39266768a2eff21edc3.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Joe Perches
> Sent: 09 October 2022 17:22
> 
> The kernel uses '* const' about 10:1 over '*const'
> 
> coding_style and checkpatch don't care one way or another.
> 
> Does anyone care if there should be some kernel style preference?

I see a wave of patches to 'correct' all the uses...

> $ git grep -P -oh '\b(?:char|u8)\s*\*\s*const\b' -- '*.[ch]' | \
>   sort | uniq -c | sort -rn
>   12450 char * const
>    1357 char *const
>      41 u8 * const
>      17 char* const

That one should be an error.
Consider:
	char* const foo, bar;

Fortunately the compiler will find those.

I'd guess 'char* foo' is already an error?

Which makes me think the * ought to be as close as possible
to the variable/field name.
So perhaps 'char *const foo' should be ok.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

