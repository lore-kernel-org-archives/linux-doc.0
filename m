Return-Path: <SRS0=O1pS=ZW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB7AC43215
	for <linux-doc@archiver.kernel.org>; Sat, 30 Nov 2019 23:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE98D20725
	for <linux-doc@archiver.kernel.org>; Sat, 30 Nov 2019 23:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575155487;
	bh=jAZgwlkFITn9guffx1lS7YNxtuHHSSOb49lbGPlxLGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=SPQ33+kWhIUiZz7mh0OvuvxRVxuVlKEMmYHY95el4ab1LaX1HsRX5D55w84DZjo8l
	 BuuY62wIAnZUCzPvfvz1XxowYa430xGaBy8kb1lVuneKtijCwT8KM0Uhtn+sfxPu9z
	 CbD5rrrp6d/8Vv3td8pZvBJdij0n2DWxu94JYKZk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfK3XL1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Nov 2019 18:11:27 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45404 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfK3XL0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Nov 2019 18:11:26 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so25140046lfa.12
        for <linux-doc@vger.kernel.org>; Sat, 30 Nov 2019 15:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYTY0n3QsHBqZOy36tonEndwNoj7tohoLo0ZADDmXdI=;
        b=gBaDTkp8NLxH62T6UURGOeViYXp6AKFU0DKORiZX14t7T4/suPUQTRa8CdMlMDdrNs
         4xC6JGRELDoDK9nlQaZgkb3NwDJQT7MrbGKx3/x156kwSIekaUnczLiAdIfHQZkXi+MQ
         U+YzULRrT+PXsMAHZCap3wQS93TGauVcU3Qg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYTY0n3QsHBqZOy36tonEndwNoj7tohoLo0ZADDmXdI=;
        b=Z/B5Cqx9gvE08pV5nZwtfsS1tjcNHDtC/FHPw2wZMIc7DXTitTo6clNCJFW6UYW7eS
         hM1GQTqBFdxArHEJvoEdRdq4cJMG5DSbZdLf6KEZscobX/EeFMrWqAJcYg99Rdbs7kNE
         cUS9+4dRmvPySNFHaP/nMQJJb0sL2nOi0Yve1+V8p4w5xVc393zqPN6hD6tWhympmCbf
         BpoXhH1++v56hwPl+e5kl5U4Veg7tITREYJzcNh2SwV/XZmxU5wWY03zdyvmAX0gtEdo
         AN5R57+EFlO4MdqwZCGoyzbYDhbmqueYTdVJ6Co2XNi0xz+46MJFfjWpQA4ojJ60lr0C
         4bWQ==
X-Gm-Message-State: APjAAAWjCmQdh2+xhPlEOaNQC3TwpcOTMKLjW8w+HfOStP6wvCuSm5Lg
        rHMr7nxI9a655uI3PnI5lbziq2pTnyk=
X-Google-Smtp-Source: APXvYqyChqBbvpyyTw2G224p+L+JImIqlAhR2fHEjGb7vGn1DhaKlhqtdiit2m+4g0JMvyF4GG4ZzA==
X-Received: by 2002:a19:3f16:: with SMTP id m22mr35932729lfa.116.1575155482633;
        Sat, 30 Nov 2019 15:11:22 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id z28sm684267lfg.35.2019.11.30.15.11.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2019 15:11:22 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id j6so26672443lja.2
        for <linux-doc@vger.kernel.org>; Sat, 30 Nov 2019 15:11:21 -0800 (PST)
X-Received: by 2002:a2e:9549:: with SMTP id t9mr5158199ljh.148.1575155481093;
 Sat, 30 Nov 2019 15:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20191126093002.06ece6dd@lwn.net>
In-Reply-To: <20191126093002.06ece6dd@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 30 Nov 2019 15:11:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whH-wrF7dx_+NgpYi8pK0vovE2mEFE3sgEYXAQZcPwBjA@mail.gmail.com>
Message-ID: <CAHk-=whH-wrF7dx_+NgpYi8pK0vovE2mEFE3sgEYXAQZcPwBjA@mail.gmail.com>
Subject: Re: [PULL] Documentation for 5.5
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 26, 2019 at 8:30 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
>   git://git.lwn.net/linux.git tags/docs-5.5

You are doing something seriously wrong.

There are DOS line-endings now in some of the  patches, and I noticed
because I got a conflict in

  Documentation/networking/device_drivers/intel/e100.rst

where your version was identical to one I had merged elsewhere, but
had ^M at the end of the new lines.

There are other examples of the same in other places.

I'm not going to pull this. I have no idea what you're doing and how
many incorrect line endings you have that just didn't happen to
conflict.

You have some *serious* tooling issues. We don't do CRLF line endings.

You can do

   git grep "^M"

(where that ^M is obviously the CR character, not the two characters
'^' and 'M" to see it. In a good tree, you'll see

   [torvalds@i7 linux]$ git grep "^M"
   Binary file Documentation/logo.gif matches

but in your tree, you get an additional 59 lines of that bogus CRLF
garbage in these files:

  Documentation/admin-guide/dell_rbu.rst
  Documentation/networking/device_drivers/intel/e100.rst
  Documentation/networking/device_drivers/intel/e1000.rst
  Documentation/networking/device_drivers/intel/e1000e.rst
  Documentation/networking/device_drivers/intel/fm10k.rst
  Documentation/networking/device_drivers/intel/i40e.rst
  Documentation/networking/device_drivers/intel/iavf.rst
  Documentation/networking/device_drivers/intel/ice.rst
  Documentation/networking/device_drivers/intel/igb.rst
  Documentation/networking/device_drivers/intel/igbvf.rst
  Documentation/networking/device_drivers/intel/ixgbe.rst
  Documentation/networking/device_drivers/intel/ixgbevf.rst
  Documentation/networking/device_drivers/pensando/ionic.rst

and I have no idea what you've done to make it do that, but I
definitely don't want the end result in my tree.

                Linus
