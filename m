Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 818647D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Oct 2018 22:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbeJRGfI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Oct 2018 02:35:08 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:41012 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbeJRGfI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Oct 2018 02:35:08 -0400
Received: by mail-yb1-f196.google.com with SMTP id e16-v6so11065060ybk.8
        for <linux-doc@vger.kernel.org>; Wed, 17 Oct 2018 15:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Lg0GOna/bu3SR+krD9Mg3SxVQkU2T4SP5z5fCIw1bvI=;
        b=TnIjRT3wrnVh/VxzazJ+d5anZmywAl6XpjKbbqJ0Avo72T7/U0QrCFejeYmJv/icq/
         RTyKZ25P+EDrsWBhqCgbf2l/tyXvyXr7e376T4IXDilYh2gu81FQ3BEKDTboNg3nNb65
         UN13omd6L/QgFeAYskXg1JGjnvnTv7kT4gMB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Lg0GOna/bu3SR+krD9Mg3SxVQkU2T4SP5z5fCIw1bvI=;
        b=FcQHQdE1dElt4+gPY2n8Lz0gfqADfq/dTsfUOhAbTwNORP5/XOzj3DpN16FNKRRCkR
         xW9irMIEl8ljSmF/v+FVzoB6vcMdewuuzbR6jj1M6XCWZRwLwjV5fEOYcEMI2VwLbqP2
         5T3Ao/zkaIRgEJNcD/v5yX0aYlX5/Ly248WLL5C2sS7FnOnpJrixg8s/YlWLgJDokeTr
         raMT3it+3qr+PVjD92u+CGl2ys6jL+tGFqh9wYrM587SjlosjvDnKNCbe6wB2IAZfGpK
         jOul8+Te67rg4eJ+uu/SgfngBC/eovtWfreGMHu5dSXRZliDkpOO2Bvznn5LkmgKDgOH
         OJ5g==
X-Gm-Message-State: ABuFfohnR/J9AGaW9cg+WibNaecEj9TKThQbfZqfApWOh9kTqiXS1XSX
        Mnb+91I5FiKP7R907RyimED6hmlZBpQ=
X-Google-Smtp-Source: ACcGV61ywQRnBqnxxqhUh2p3rmwg5rbOJs5E1xDzeQvCYOsvQ+7IJkFDyhNOwxOSjwtUgjHG41oh9w==
X-Received: by 2002:a25:103:: with SMTP id 3-v6mr3895621ybb.114.1539815838559;
        Wed, 17 Oct 2018 15:37:18 -0700 (PDT)
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id y1-v6sm4464290ywf.34.2018.10.17.15.37.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Oct 2018 15:37:17 -0700 (PDT)
Received: by mail-yw1-f47.google.com with SMTP id v1-v6so11045279ywv.6
        for <linux-doc@vger.kernel.org>; Wed, 17 Oct 2018 15:37:16 -0700 (PDT)
X-Received: by 2002:a81:2cc3:: with SMTP id s186-v6mr17142882yws.168.1539815836119;
 Wed, 17 Oct 2018 15:37:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Wed, 17 Oct 2018 15:37:15
 -0700 (PDT)
In-Reply-To: <70d6b61f-25af-f903-0693-46e649c08aff@infradead.org>
References: <20181017021708.GA22211@beast> <aed0041d-7c28-4dfb-91b5-fc83174d8744@infradead.org>
 <875zy0ki3r.fsf@intel.com> <70d6b61f-25af-f903-0693-46e649c08aff@infradead.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 17 Oct 2018 15:37:15 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJDZjaSLE9uPZVWCqrtSMh1-x8H=X+3ptSYrL5QZdo8xA@mail.gmail.com>
Message-ID: <CAGXu5jJDZjaSLE9uPZVWCqrtSMh1-x8H=X+3ptSYrL5QZdo8xA@mail.gmail.com>
Subject: Re: [PATCH] docs: Introduce deprecated APIs list
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 17, 2018 at 10:08 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/17/18 3:00 AM, Jani Nikula wrote:
>> On Tue, 16 Oct 2018, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> On 10/16/18 7:17 PM, Kees Cook wrote:
>>>> As discussed in the "API replacement/deprecation" thread[1], this
>>>> makes an effort to document what things shouldn't get (re)added to the
>>>> kernel, by introducing Documentation/process/deprecated.rst. It also
>>>> adds the overflow kerndoc to ReST output, and tweaks the struct_size()
>>>> documentation to parse correctly.
>>>>
>>>> [1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2018-September/005282.html
>>>>
>>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>>> ---
>>>>  Documentation/driver-api/basics.rst  |  3 +
>>>>  Documentation/process/deprecated.rst | 99 ++++++++++++++++++++++++++++
>>>>  Documentation/process/index.rst      |  1 +
>>>>  include/linux/overflow.h             |  2 +-
>>>>  4 files changed, 104 insertions(+), 1 deletion(-)
>>>>  create mode 100644 Documentation/process/deprecated.rst
>>>
>>>
>>>> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
>>>> index 40b48e2133cb..2f224f43dd06 100644
>>>> --- a/include/linux/overflow.h
>>>> +++ b/include/linux/overflow.h
>>>> @@ -291,7 +291,7 @@ static inline __must_check size_t __ab_c_size(size_t n, size_t size, size_t c)
>>>>  }
>>>>
>>>>  /**
>>>> - * struct_size() - Calculate size of structure with trailing array.
>>>> + * function struct_size() - Calculate size of structure with trailing array.
>>>
>>> That syntax is not explained nor documented in Documentation/doc-guide/kernel-doc.rst.
>>>
>>> Is the root problem that the function name begins with "struct"?
>>> Please explain in the patch description.
>>
>> Indeed, shouldn't be needed.

I actually thought the problem was with it not knowing how to deal
with struct_size() being a macro instead of a real function.

> Well, this is just a guess (no testing), but in scripts/kernel-doc (at line
> 1907 in 4.19-rc8), we can see:
>
>         if ($identifier =~ m/^struct/) {
>             $decl_type = 'struct';
>         } elsif ($identifier =~ m/^union/) {
>             $decl_type = 'union';
>         } elsif ($identifier =~ m/^enum/) {
>             $decl_type = 'enum';
>         } elsif ($identifier =~ m/^typedef/) {
>             $decl_type = 'typedef';
>         } else {
>             $decl_type = 'function';
>         }
>
> I wouldn't be surprised if a function named "struct_size" looks like a
> type struct.  Maybe it needs to be more strict, with either a space or
> word boundary at the end of each type string.  E.g.:
>
>         if ($identifier =~ m/^struct\b/) {
>             $decl_type = 'struct';
>         } elsif ($identifier =~ m/^union\b/) {
>             $decl_type = 'union';
>         } elsif ($identifier =~ m/^enum\b/) {
>             $decl_type = 'enum';
>         } elsif ($identifier =~ m/^typedef\b/) {
>             $decl_type = 'typedef';
>         } else {
>             $decl_type = 'function';
>         }

But I see it's actually the prefix! :P

Using the above code fixes it for me. Can you send this fix with my
Tested-by, and I'll spin a v2 of my "deprecated.rst" patch without the
overflow.h change?

-Kees

-- 
Kees Cook
Pixel Security
