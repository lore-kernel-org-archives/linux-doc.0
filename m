Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 94C937D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Sep 2019 10:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfIKKPD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Sep 2019 06:15:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42457 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfIKKPD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Sep 2019 06:15:03 -0400
Received: by mail-lj1-f195.google.com with SMTP id y23so19405531lje.9
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2019 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9kt1CQafIKHj/rHsG6mTJs/CDrUdJxcoRtxru9KNIIc=;
        b=iktAugW3hJD0fx1Mw3vh0knWXjv2kzp5AZw4KSCK3AsaOuN+ieamhuN7lmY7l001vc
         E+Bw1UUWNfzJKEpjHhyrYQuHoO6fhOY2Gv1siIiYX5gHyxZzgek3vX9Q8jMH/w2NMPaD
         u1UbUJr4qgpKkVG13fXg9aZm8fQYOfFr6rvvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9kt1CQafIKHj/rHsG6mTJs/CDrUdJxcoRtxru9KNIIc=;
        b=NPZ6IIIN9CIMHK58WiJbbT2LStDRwTHWWFESA6W9NNCk8ZrJ4TzzJvO38w+bzCkaaR
         Ky2zrLIxHDtJAxSSmnj1Vq/3s2qI9r0zL5rJYEvOJezX/lVVp2iIt3BKhQ89MDS7mQuX
         uY88au8BJQp1M5614prVMM0RGcD1QWCvEsevshnbyxHds/QL/rTsbz6uyIlcfdXaCkoA
         Po9RuvZN5kDEvLqzw4nMmyhQf84+yfJOlDcqhwDuKb+hKSiOVEwwde9uzbx7yX4isD6F
         h6UJ76hvUGc12bycVHbbI4ycTu6kACta16tapH8qCwksk+b+jhpsg8ZJTBfLemeAmCCz
         5xwg==
X-Gm-Message-State: APjAAAWrMn2T6JjsSwBS0polvBi17FXo+nPEtAKhd/KyqjsDAShSl//+
        GAmX5CCFqDosdfjD1dc+jVH2w499F1r1gx+S
X-Google-Smtp-Source: APXvYqzYDJlOd0oaFf/DIvrn5sCLtqtD+U9OlgwAoanyEXdZ4W5myJ1ffax3gZYquRafZEtsbH8GxA==
X-Received: by 2002:a2e:9c86:: with SMTP id x6mr22795025lji.141.1568196900869;
        Wed, 11 Sep 2019 03:15:00 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 18sm4074325ljd.86.2019.09.11.03.14.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 03:15:00 -0700 (PDT)
Subject: Re: [PATCH v2] printf: add support for printing symbolic error codes
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Joe Perches <joe@perches.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>
References: <20190830214655.6625-1-linux@rasmusvillemoes.dk>
 <20190909203826.22263-1-linux@rasmusvillemoes.dk>
 <CAHp75Vdpd5uMCM-n+4vAZLwUpN=-cHnHs1uxoV2MDd5fk+CQig@mail.gmail.com>
 <95a9f6fbc8fc2cf81e9eadc6f7fef8dd3592e60b.camel@perches.com>
 <354dc1f5-45b8-9e51-1ba0-b1fd368be45a@rasmusvillemoes.dk>
 <8f21cddf-0e39-8379-6eab-60e8238a020d@kleine-koenig.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <7e02e25e-a67a-e7a2-3d85-fd2166a882e5@rasmusvillemoes.dk>
Date:   Wed, 11 Sep 2019 12:14:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8f21cddf-0e39-8379-6eab-60e8238a020d@kleine-koenig.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/09/2019 11.37, Uwe Kleine-König wrote:
> On 9/11/19 8:43 AM, Rasmus Villemoes wrote:
>> On 11/09/2019 02.15, Joe Perches wrote:
>>> On Tue, 2019-09-10 at 18:26 +0300, Andy Shevchenko wrote:
>>>> On Mon, Sep 9, 2019 at 11:39 PM Rasmus Villemoes
>>>> <linux@rasmusvillemoes.dk> wrote:
>>>>> +{
>>>>> +       /* Might as well accept both -EIO and EIO. */
>>>>> +       if (err < 0)
>>>>> +               err = -err;
>>>>> +       if (err <= 0) /* INT_MIN or 0 */
>>>>> +               return NULL;
>>>>> +       if (err < ARRAY_SIZE(codes_0))
>>>>> +               return codes_0[err];
>>>>
>>>> It won't work if one of the #ifdef:s in the array fails.
>>>> Would it?
>>
>> I don't understand what you mean. How can an ifdef fail(?), and what
>> exactly won't work?
> 
> I think Joe means: What happens if codes_0[57] is "" because there is no
> ESOMETHING with value 57.

[That was Andy, not Joe, I was lazy and replied to both in one email
since Joe quoted all of Andy's questions].

So first, for good measure, codes_0[57] may be NULL but not "". Second,
if we're passed 57 but no Exxx on this architecture has the value 57,
then yes, we return NULL, just as if we're passed -18 or 0 or 1234. But
57 (or -57, or ERR_PTR(-57)) would realistically never find its way into
an err variable (be it pointer or integer) in the first place when no
ESOMETHING has the value 57.

Except for the case where somebody in the future adds #define ESOMETHING
57 to their asm/errno.h and starts using ESOMETHING, without updating
the table in errcode.c. But if that's the case, letting the caller
handle the "sorry, I can't translate 57 to some string" is still the
right thing to do.

Rasmus

