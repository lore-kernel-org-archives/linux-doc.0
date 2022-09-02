Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5496CECAAA1
	for <linux-doc@archiver.kernel.org>; Fri,  2 Sep 2022 20:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiIBU4p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Sep 2022 16:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiIBU4o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 16:56:44 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9E0D5987
        for <linux-doc@vger.kernel.org>; Fri,  2 Sep 2022 13:56:43 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y29so3092608pfq.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Sep 2022 13:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NkWBtoQgaFgitib08Hogz597NWzZXTmetYtlLX3bjJM=;
        b=BuT9IDve2TGSeyV2xVrLtW1biKQx/mFIgbGZypdATS1Z7uDnehqhR3zvfRFwE85N2l
         geqNC5btX4GgaZhP8ikwsupUe67WhX8d6hDyKdw4uS9NunFY0rcsPCP2ffiqH8jSx3yb
         iJ+hq0Yo6Va/+sDjrKL6o2Vt9gNtqFRmK+zEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NkWBtoQgaFgitib08Hogz597NWzZXTmetYtlLX3bjJM=;
        b=HYp/DYIB75e9nURnQBwYw1RTUJC59zOEYoTknB46Mn8ALMOLXMd9OS440UzGPipxgL
         AhVJUwHjyomncYJcYc6NifnSkNvFzOd1pZITn4ZQ7Iqg5Xi+/A2bnG3M6BpHRmGboWvo
         AkFRtbQtAhnnI2O2anOqZGQUShPCzEnC1TVcvl3TbqGozxUFiz0zx5c0Idv8yecwu7n5
         zhxv/8v9ja3VN6U1PP5gSnZzWP6VXQZHYk82RHNaamSVRbFlp/Hlb149auz1lL9xvBSy
         gxoo+iEo1Uk6Es6hAG7qbqeLXLN8HW91++JEDQZfTEBoFtXJ1WrzdpCgExuLKY2iWNPS
         u+7A==
X-Gm-Message-State: ACgBeo3zTjcMl5Gsyse6Xcv71DYU/udDsD/7ckpmrAik1xjacwD+NaH/
        jzYXJ/QjLAumpy6mrb5bpVaVWw==
X-Google-Smtp-Source: AA6agR7UPfToOXkX6y0bP59PLNMacjH+/Eg/CEcBCC0g8WRpn5gE1sHE+FxsKJfPgd77J60smN7UPQ==
X-Received: by 2002:a62:1ac1:0:b0:535:87d:d63f with SMTP id a184-20020a621ac1000000b00535087dd63fmr38496405pfa.74.1662152203362;
        Fri, 02 Sep 2022 13:56:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u3-20020a170902e80300b0016c57657977sm2086294plg.41.2022.09.02.13.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:56:42 -0700 (PDT)
Date:   Fri, 2 Sep 2022 13:56:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Len Baker <len.baker@gmx.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Francis Laniel <laniel_francis@privacyrequired.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] string: Introduce strtomem() and strtomem_pad()
Message-ID: <202209021352.549A5D5@keescook>
References: <20220901190952.2229696-1-keescook@chromium.org>
 <88e8b096-aa04-2447-cb21-a83b5e57e963@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88e8b096-aa04-2447-cb21-a83b5e57e963@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 02, 2022 at 08:53:34AM +0700, Bagas Sanjaya wrote:
> On 9/2/22 02:09, Kees Cook wrote:
> > One of the "legitimate" uses of strncpy() is copying a NUL-terminated
> > string into a fixed-size non-NUL-terminated character array. To avoid
> > the weaknesses and ambiguity of intent when using strncpy(), provide
> > replacement functions that explicitly distinguish between trailing
> > padding and not, and require the destination buffer size be discoverable
> > by the compiler.
> >> For example:
> > 
> > struct obj {
> > 	int foo;
> > 	char small[4] __nonstring;
> > 	char big[8] __nonstring;
> > 	int bar;
> > };
> > 
> > struct obj p;
> > 
> > /* This will truncate to 4 chars with no trailing NUL */
> > strncpy(p.small, "hello", sizeof(p.small));
> > /* p.small contains 'h', 'e', 'l', 'l' */
> > 
> > /* This will NUL pad to 8 chars. */
> > strncpy(p.big, "hello", sizeof(p.big));
> > /* p.big contains 'h', 'e', 'l', 'l', 'o', '\0', '\0', '\0' */
> > 
> > When the "__nonstring" attributes are missing, the intent of the
> > programmer becomes ambiguous for whether the lack of a trailing NUL
> > in the p.small copy is a bug. Additionally, it's not clear whether
> > the trailing padding in the p.big copy is _needed_. Both cases
> > become unambiguous with:
> > 
> > strtomem(p.small, "hello");
> > strtomem_pad(p.big, "hello", 0);
> > 
> > See also https://github.com/KSPP/linux/issues/90
> > 
> 
> Should'nt strscpy() do the job?

strscpy() will always NUL-terminate. If someone is moving a
NUL-terminated string to a fixed-length buffer (that is _not_
NUL-terminated), using strscpy() will force the final byte to be 0x00,
which will likely be a regression. For example:

struct wifi_driver {
	...
	char essid[8];
	...
};

struct wifi_driver fw;

char *essed = "12345678";

strncpy(fw.essid, essid, sizeof(fw.essid));

	fw.essid will contain: 1 2 3 4 5 6 7 8

strscpy(fw.essid, essid, sizeof(fw.essid)):

	fw.essid will contain: 1 2 3 4 5 6 7 '\0'


-- 
Kees Cook
