Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A8F267D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Apr 2019 21:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfDWVa5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Apr 2019 17:30:57 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42033 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbfDWVa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Apr 2019 17:30:57 -0400
Received: by mail-lf1-f65.google.com with SMTP id w23so12865708lfc.9
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2019 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gj/C1n+4JzJjjhUoe8msJVAVKtyw85XXivazIssjzrg=;
        b=cigG1jTIozfeAIS/XLpR6jV/YEmZREqI1ziiBnf1BbfcpDoj3jhUEXe15oKYKIuGnE
         jBPvCcMGDw2U+nN6GPExSYnVApWcT64Iy7swJUmzNCeKgR7uVrxmYWoz2erEJ3jiVbab
         XF0N53UmdOg8uJOYvVxhhV+od04HlT+3VUatNKjeF5yfRDx5dF0Cu9pZoaasj4dN7h9t
         5IQ01ja27mYBXWbhP1in5Ht5RU+YCYbNdzQ+ND5CL94NqDSGoeqOSIWpOK8uy6z0AUA4
         qN/IUMWHEMPBk0a4iQaVub+N+1TalO9A71MXI0sTN0Zoq/reYsHlOImQHKu7MGe0C4i4
         R65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gj/C1n+4JzJjjhUoe8msJVAVKtyw85XXivazIssjzrg=;
        b=rcpf94lh2pJPRt8pxmJvUvFu8ka2bFcoRK/DPed/yDpTC9G7Gm2IiAoCLsLR+6GGpR
         5V39jfNIvKXtx2u/ZhZB8yjf1UvNj9d0A2YCTjD52tOC+9ldUl94jJhjXHOm+AisibSZ
         vvqFASKhCPuq5KWPmRlyiVshJJe6M4u/f4pDrV2RqAbzzXlw7iFYfGMPWjM3zTgAJzKq
         kJp4+DUY0lF27u7TUTM7IPfJMKyfBhOkPJNBPUFAClXZOv0Yv/DNvFLce3I8QD4ZRZ4/
         12IClK1GtV5v3+mbUXhlU0G5PcZuPIX3howOLLk1usuRbWzZQ9nq4jFQi7JbMcTVDL1v
         bEAw==
X-Gm-Message-State: APjAAAUkwIa6cvt0xVZ0JP43VrwUyMtk0Knonh7sc62241Ac6zc3BIeF
        3u25Ey1oB/tFsDh3FZBiaCYSchk1EH3KHEBM5/3IMA==
X-Google-Smtp-Source: APXvYqw5sqlx6rYco2PwRId3MXLuHuEkR0+CdFN5dPdrXDVjgtRlcAiFlNcLVn70F9u+GsoI/xvF4Hpk9DZI+i3WRqQ=
X-Received: by 2002:ac2:4647:: with SMTP id s7mr14850759lfo.168.1556055055246;
 Tue, 23 Apr 2019 14:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555938375.git.mchehab+samsung@kernel.org> <03cdacc3db76c5ff984c1507ea6434650d36d822.1555938376.git.mchehab+samsung@kernel.org>
In-Reply-To: <03cdacc3db76c5ff984c1507ea6434650d36d822.1555938376.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Apr 2019 23:30:43 +0200
Message-ID: <CACRpkdY_OHTU6dN-2BXYhPYyAVW62nSzqfNx66bAB++=epGMbg@mail.gmail.com>
Subject: Re: [PATCH v2 15/79] docs: gpio: convert docs to ReST and rename to *.rst
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 22, 2019 at 3:28 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> The API described at sysfs.txt is deprecated.
>
> Still, as it is still part of the Kernel (and will likely be
> there for some time, as we don't simply remove APIs). So,
> it makes sense to keep it there.
>
> The conversion of this file is trivial:
>   - add blank lines and identation in order to identify paragraphs;
>   - mark a literal block as such.
>
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
