Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C2377D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 10:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfJ2K6e (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 06:58:34 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51281 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ2K6e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Oct 2019 06:58:34 -0400
Received: by mail-wm1-f66.google.com with SMTP id q70so2057345wme.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2019 03:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZjGwkh0cbenMQuHQv0e6VyAjAyf6cn4GEktc9y7mIVo=;
        b=Z5k/Bw76iZIRzQquIwCWRPsWqro/fntSp3jiRq9sQ8osHo6Q5gNdjQmHperI7Hsrw5
         UReAobtRNUuBo5vBt/Jzp1LEPaoE1+Qw4k2YsPDLrPV0zLt3H/1Uzk0PJyeF2Y7mXDom
         JDhHb497uuBlYNkvM/VOICBsiQCU0FqczJGXJPUSnz04Ko6D+lI91McRZRdLlz/h7xSq
         2vxxrFKcFkLH/5/2rgdYkaFN5mbaqE2FgvDihHwSKmIMxRyfT/Up+azgKH4e5q/Rbak3
         IkLU9HtYgfCI3AepuI2RsME3/zE66ElMm8aX++9CQFNuj8yIXtE5pqoxPMKUMIIW3Crg
         CCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZjGwkh0cbenMQuHQv0e6VyAjAyf6cn4GEktc9y7mIVo=;
        b=pVGsMMpS1rbZ4DaJD7P4hTJ6QxwJwFhk9MU7sSbFkV4rin4/X1l/pbndAstwgesSdD
         MHPvrsa8zZKYP126/DP09n/j4WNv//sV3L8xBeH1UV8ZDcte2W4/A9yf6IyD7RuIwQT6
         8ynTMPdbMqWI17nxgQnOzmMkR0HwN389PBLyI8EyELOKtwLyWEYnIl2nm299gMzWj7Nx
         cfNwcZcgAXbz3AhhMyeKEU51x5w0Hb35L4NmJUw7GkbNdkw2TGZBAQTjKzW6+qWwm6Xx
         g6ajNr0zTeIzH+1mEqirK6WkTKk33OkvZJj5QeBlMVMf5BoEUYpudLFD9r6Yx2IBt+5a
         MVmw==
X-Gm-Message-State: APjAAAXhILgitZf3eK2z2N1v3Ki5DFEShsXwWnGhNwJu4sgsqacld4Dd
        6tA/55rxagyhxYQYLUhnHQvBjXmYSQgFWVg1KMhB/H0o
X-Google-Smtp-Source: APXvYqxQWqzmg0NCxmJEePG+7QKJFzoXsECdF+ETmacOmqCarK5rUb+s9sgWl//M4SrkWc4F+9B+QrpLnajQij7w+W0=
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr3755329wme.92.1572346712496;
 Tue, 29 Oct 2019 03:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAODfWeEohxJYW1w9g5u8G7RV+OKDqycWw0uEEqRoTQCVvfvKjw@mail.gmail.com>
 <CAODfWeH67_ZfO7yrrQ+EcFgXd8stA23y6hUtimhzEbXvWmjhbw@mail.gmail.com> <20191029032130.444c6fce@lwn.net>
In-Reply-To: <20191029032130.444c6fce@lwn.net>
From:   =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= 
        <hector.oron@gmail.com>
Date:   Tue, 29 Oct 2019 11:58:21 +0100
Message-ID: <CAODfWeF_xAhQJvRSBiDBQco8OG0kaH69eD=VbxBjB2fnPAXWnA@mail.gmail.com>
Subject: Re: [PATCH] doc: fix warnings for unused files in toctree
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Jonathan,

Missatge de Jonathan Corbet <corbet@lwn.net> del dia dt., 29 d=E2=80=99oct.
2019 a les 10:21:

>  - Please send patches inline, rather than as attachments; that makes
>    them much easier to review.

Sure, I need to fix my SMTP git configuration.

>  - Please work against docs-next and look at the history of what you are
>    working on. For example:

Where do I find the docs-next tree?

> If you could please review the rest of your patch and resubmit against
> docs-next, I would appreciate it.

I will do. Thanks for your review and hints!

Regards,
--=20
 H=C3=A9ctor Or=C3=B3n  -.. . -... .. .- -.   -.. . ...- . .-.. --- .--. . =
.-.
