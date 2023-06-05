Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7FFC7EE23
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 15:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjFEPyj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 11:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFEPyi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 11:54:38 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFCC99
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 08:54:36 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-98-9yYpkgM7No6H2Bh9opR73w-1; Mon, 05 Jun 2023 16:54:34 +0100
X-MC-Unique: 9yYpkgM7No6H2Bh9opR73w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 5 Jun
 2023 16:54:22 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 5 Jun 2023 16:54:22 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Thomas Gleixner' <tglx@linutronix.de>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC:     Steven Noonan <steven@uplinklabs.net>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: Direct rdtsc call side-effect
Thread-Topic: Direct rdtsc call side-effect
Thread-Index: AQHZlHOrHGvpd378GUKTvqmuipgWK698BnPAgAA4NYCAACHzkA==
Date:   Mon, 5 Jun 2023 15:54:22 +0000
Message-ID: <a39d90e45212461bb31738b7156b60a6@AcuMS.aculab.com>
References: <6719fb05-382c-8ec4-ccda-72798906a54b@collabora.com>
 <87mt1jeax1.ffs@tglx> <353732783fde46919fdcf698c326b7ed@AcuMS.aculab.com>
 <87jzwi55qo.ffs@tglx>
In-Reply-To: <87jzwi55qo.ffs@tglx>
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

From: Thomas Gleixner <tglx@linutronix.de>
> Sent: 05 June 2023 15:44
> 
> On Mon, Jun 05 2023 at 10:27, David Laight wrote:
> > It has to be said that using it as a time source was fundamentally
> > a bad idea.
> 
> Too bad you weren't around many moons ago and educated us on that. That
> would have saved us lots of trouble and work.

Indeed :-)
I do remember thinking the TSC was really a good time source when
I first saw it being done about 30 years ago.

> 
> > Sometimes (eg micro benchmarks) you really want a TSC.
> > You can extract one from the performance counters, but it is hard,
> > root only, and the library functions have high and variable overhead.
> 
> Interesting view that high end databases are considered micro benchmarks
> which need root access.

I'm thinking of benchmarking the IP checksum code where you are
trying to find out how many bytes/clock the loop is doing.
On recent x86-64 the theoretical limit (without fighting AVX) 1s 16
bytes/clock, I've measured 12, 8 is relatively easy.
(The current asm code runs at 4 on older cpu, doesn't get
much above 6 at all.)

What happens is that the cpu frequency speeds up as soon as the
test starts but the TSC frequency stays constants.
So you can only use the TSC to measure time, not execution speed.

Run enough copies of 'while :; do :; done &' to make all but one
cpu busy and the cpus all speed up giving completely different
TSC counts for short loops.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

