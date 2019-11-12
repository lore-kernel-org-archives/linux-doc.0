Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 580947D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Nov 2019 06:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbfKLGzC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Nov 2019 01:55:02 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:38092 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfKLGzB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Nov 2019 01:55:01 -0500
Received: by mail-lj1-f178.google.com with SMTP id v8so16491928ljh.5
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2019 22:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=vu8yNJ042Yp47YQbnbFVRbXLP4y6rMyFXBPBR5zJPyU=;
        b=JWe3hVkzeXSbSXDzhveLMZU/T5TFv7nDAgUILIQDxUeWIlPuWRKLKP9J/FH4PujBnZ
         Fj2LgI4tp9DYSLSYRxWHiNcOV/w6hSn7pHsW3t1ozUPs5OfMT8GmbcRukY1JQJGfzP59
         SAJb46fyWj43MZbsZ/G1mdDx1a9ZTj6lFvJE2WAk2ndHRoJbE8+XDImGdiZgHeC1Ql8w
         cOL/MM48+VJWP5H9mWZJJmy4x4xIwW7GMfh9SNfBD74yWGbllD+NEI8RSWBOP0bmGSE8
         Br3biwnOytFzQEqBYYijr8gW0+9hXZMkCV5gnRZRus0zccwt6gYgiSfH0tjzH7V/qfiD
         qwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=vu8yNJ042Yp47YQbnbFVRbXLP4y6rMyFXBPBR5zJPyU=;
        b=RQHvDpwrZdP8Kf7XQwhjjn6g2TZxG1H4BueCR1A5mVgBixLgAYq5DGe9KCE3AJZHgu
         HSzIYcwIvIDu+GOub0SvQ96O8CrzNk2KiJevV5SqVOznmmYzlQgqglRKVhKvyt/SlsWs
         wnkKQv6tQW36gl0E1qhPaBZyCCQCUVoxL9BSRiSQaTbnZs/p92KtEQoVDMBkzkLrQjkQ
         7/jwii3M2tK1gR4Qa+3zHRqkkTQmOxhgF4bMtnuMcYxeew2tQ10ixjmyQ31NiRWKJGiY
         fVQqn2Ff9vtBVpM26IkVJVMr3Y9EJxS0sQsI7oRMCAnxdW7up2ikqLGyfJxPtrkpbLIO
         MVKg==
X-Gm-Message-State: APjAAAWTNjVuTy7fdmZxGYvba2nFTUOGz57T3DwGIQf7+xoXAkNMB2UJ
        z+1ia9LtSHQ20kxFrf9eIlYdAZ8NFwfVr4BTa4v01JBl
X-Google-Smtp-Source: APXvYqxSstqPL/ravxMl62W0TSN4RWsZDTXTaJuBY2QlDFRQ6PLsKdHFXC11euekNxlQywtYO3ojz2pgi1X3WCF2uIg=
X-Received: by 2002:a2e:22c1:: with SMTP id i184mr19120085lji.1.1573541698641;
 Mon, 11 Nov 2019 22:54:58 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 12 Nov 2019 07:54:46 +0100
Message-ID: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
Subject: On global citations, URLs and translations
To:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan, Federico,

While I was writing some new docs for something else, I found that
given that citations are global, some translations are overriding the
normal citations.

For instance, on:

  https://www.kernel.org/doc/html/latest/process/programming-language.html

We have the first link pointing to:

  https://www.kernel.org/doc/html/latest/translations/it_IT/process/programming-language.html#c-language

i.e. the Italian translation; which is clearly not intended. Rather,
it should point to the URL the citation points to.

This may have been my mistake originally, since I wrote the original
file and used citations. Checking now other files around in Docs/, I
see almost nobody uses citations and simply put raw URLs, have a
bottom section on References/Bibliography or use inline hyperlinks.

To be honest, after seeing how citations look in the rendered output,
and given they are global, I think it may be simpler to just use
inline hyperlinks. On the other hand, it is nice to have a common set
of citations (to keep up to date both translations and other
documents). However, if we do this, I guess we need to encourage
people to deal with the Sphinx WARNINGs.

How should we handle this? What should be encouraged for new docs?

Cheers,
Miguel
