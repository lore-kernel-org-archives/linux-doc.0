Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8FFFC7D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 22 Aug 2018 18:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbeHVVjk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 22 Aug 2018 17:39:40 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:55828 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbeHVVjk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Aug 2018 17:39:40 -0400
Received: by mail-it0-f65.google.com with SMTP id d10-v6so4018538itj.5;
        Wed, 22 Aug 2018 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cTvAc1zpKZQvfaROkoZCq7LpeHQ42AoUkfQgArIF0cQ=;
        b=TuqQKvs8M6r1OxO0zx8xQLOs0HI6l9DCTyUQ5suRiMh6pzlHj1LD3z91Y/c0Gsx39s
         fcP8dUDrl11LAfuyHJlCkLSA891LjtbEn0Aywrrof75asvMMefNlQOKhRGyXy+O7snrV
         97XGNCYTTEmD8QzlFdlBGDjgeYl4fcpQ3HzB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTvAc1zpKZQvfaROkoZCq7LpeHQ42AoUkfQgArIF0cQ=;
        b=RuWnsYQ5YjmRwmXAIRcDfteo9vfWsQKDnlRYyul2jEwE9gYFF1+8dn4hQSeJ8+VIx3
         1AOtEez4wDlFL90ORncGYD7jKT9CuIDFlfmQIVM3BYmybpom7FyHSwlu/IZRTHSLq4ae
         46WvdNKf3y2tFzZbQrQ2SsD3WF93F4pGXG8w7rISWENxOyOw81RdGDlYL6eZOM7E2yxi
         RIF8fdbMPpe8OHBpLm8iLjSdnIO98oS0V6fTONCRbzyCdmmiy8MEb01CNK4w0J6arnbE
         gNsa6EGDDG4lKM66I+SzyeBTl8uSth0c4osAqg9upCZ7sVW7c/CcQhJwPeGQvw8evk8o
         AogA==
X-Gm-Message-State: APzg51AGnLICUsEJTa+/ewhs7aFJ//G0rhW+MkM+LegUBuvNax0L4evJ
        6ae/iuaoQw+JyxhbYQh8icF/YSSY3FoDn8efigw=
X-Google-Smtp-Source: ANB0Vda+gBFHnXe0Ld+9XekP4D83YAQ9OLSahuNeBL2F3OEtjuubgyw3826j6TCyhegX7iAJIX45ZqRKmNxqiBnRLls=
X-Received: by 2002:a24:3046:: with SMTP id q67-v6mr4413483itq.9.1534961623866;
 Wed, 22 Aug 2018 11:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <9f90ed3678d32bdde88d63e877880dcb08a97e15.1534519501.git.joe@perches.com>
 <7275a821f20ba080b6a262089ceeaf8fa94d4bab.camel@perches.com>
In-Reply-To: <7275a821f20ba080b6a262089ceeaf8fa94d4bab.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 22 Aug 2018 11:13:32 -0700
Message-ID: <CA+55aFyd5D9Rj2Wm+rP9QnZg2Jd_LKqPTKTmPv+doYN=JXra=w@mail.gmail.com>
Subject: Re: [PATCH V2] license-rules.rst and LICENSES: Use only spdx version
 3 with -only and -or-later
To:     Joe Perches <joe@perches.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Rob Herring <rob.herring@linaro.org>,
        Jonas Oberg <jonas@fsfe.org>,
        Andrew Morton <akpm@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 22, 2018 at 11:01 AM Joe Perches <joe@perches.com> wrote:
>
> How likely is it that this is applied at rc1?

I'm staying out of the crazy license name bikeshedding, so it's going
to be up to the people who have decided they care.

I think whoever *did* care and argued for the change to the SPDX
format is a hopeless wanker. "GPL-2.0{-only,-or-later}" is in no ways
better than the "GPL-2.0{,+}" that was in an earlier version of the
SPDX spec

So I want nothing at all to do with pointless patches. Life is too
short to deal with this.

Other people disagree, so I expect I will get these kinds of stupid
noise patches through the usual channels.

But I refuse to actively spend my time on them.

                  Linus
