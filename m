Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E93D17D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Dec 2018 16:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbeLCQuB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Dec 2018 11:50:01 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42687 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbeLCQuA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Dec 2018 11:50:00 -0500
Received: by mail-lf1-f66.google.com with SMTP id l10so9647600lfh.9
        for <linux-doc@vger.kernel.org>; Mon, 03 Dec 2018 08:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckKTYj8os6C0SnRTgb0UJBdry5aI4TuybA26h+N17BA=;
        b=fLRVKzuEW6L6vp+CLAbARpmwGypmdwBAxrG4wCtb+1WeSgngaAPRHybWYJoyDVnqAm
         2ek77moz6yV4TltaoUUOjxFPj5ToJw2GYRqktYRzQbIjg5PjFwwd4eh9hDqLyLCYkqaR
         WrKmFl92Ry9GHNPAOKxCKzgr3vRERVt7V47Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckKTYj8os6C0SnRTgb0UJBdry5aI4TuybA26h+N17BA=;
        b=WeZhsJRRtmKqXDZFJyAghbPIUakuHpkK7OQ/OjCB5SxpSlSjnytbG63wibUwqzPKbp
         tIQ5H2FbbXeDO2PKYaxG4bfHuQXCc2gMy5rsvf2kYIBrRvYjvvszqZTZ6DBBx/1ygASm
         uGedI7vOweKtwJoUNHa0XoTuR+4MjcE6GM7zfer79UDQGO+ZbF/fAf8jHZNNU/xDO2/M
         N0eSIgAWPS5x8n99P5nKpTsCEX8Tg7L8EadPREX5kDfYl2UKc8EBE0Oaqx81RruMEg2e
         KzRItEOZCGSOxCs8m2BnHlv4f7drzccbTuivmh4Za0u0lZ/ta/hj0JqZiBiX9OezPhur
         H88Q==
X-Gm-Message-State: AA+aEWb49R5WX1MEOQf3zeBAtfd598soj8cxWjzXoA3VDu/M2hBuqzUI
        FfXUGlE52mUNvJh+EprfAG+HPP7X2gA=
X-Google-Smtp-Source: AFSGD/WkIKlSS6+UbvH+aTdKVZJQNtDhLBWltbN6P3wfzLVbrEiz42gnvymfHQePYl2y/6QO3tub0g==
X-Received: by 2002:a19:5154:: with SMTP id f81mr10161072lfb.96.1543855796362;
        Mon, 03 Dec 2018 08:49:56 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id a2-v6sm2620549lji.13.2018.12.03.08.49.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Dec 2018 08:49:55 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id e5-v6so12067473lja.4
        for <linux-doc@vger.kernel.org>; Mon, 03 Dec 2018 08:49:55 -0800 (PST)
X-Received: by 2002:a2e:994:: with SMTP id 142-v6mr9333860ljj.120.1543855794955;
 Mon, 03 Dec 2018 08:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20181202093257.3918-1-geert@linux-m68k.org> <20181203110506.GA7485@kroah.com>
 <20181203121519.GA7478@amd>
In-Reply-To: <20181203121519.GA7478@amd>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Dec 2018 08:49:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiDeCY_ENy9S-6DjPgzzF=1UucJGrKo_K98jYA-yR1jJg@mail.gmail.com>
Message-ID: <CAHk-=wiDeCY_ENy9S-6DjPgzzF=1UucJGrKo_K98jYA-yR1jJg@mail.gmail.com>
Subject: Re: [PATCH v3] code-of-conduct: Remove explicit list of
 discrimination factors
To:     pavel@ucw.cz
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Frank Rowand <frowand.list@gmail.com>, acme@kernel.org,
        tomi.valkeinen@iki.fi, bvanassche@acm.org,
        linux-doc@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 3, 2018 at 4:15 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Linus, I don't think Greg is doing good job maintaining this. Can you
> take the patch? (Or explain what is going on here, because I don't
> think public has full story).

I think Greg is doing a fine job, and I personally will not take
patches to the CoC without *much* stronger reasons than just some
random opinion.

This is an area where everybody has opinions, and there is no inherent
technical agreement (ie no "look, numbers: this makes code 5%
faster"), so my policy wrt the CoC is that changes to it have to have
very concrete reasons for them. IOW, actual problems caused by real
issues, not "in my opinion".

Honestly, the list of discrimination factors looks fine to me, and if
it is shown to be insufficient or problematic, there's the documented
link to the Code of Conduct Committee. That sounds to me like the
right way to bring up problematic behavior - and if the review then
shows that "yes, the CoC should cover this too", then at that point we
have a real and present example and reason to modify the CoC.

             Linus
