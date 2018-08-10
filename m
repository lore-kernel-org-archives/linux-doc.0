Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E2E8C7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 17:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbeHJUWc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 16:22:32 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33625 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbeHJUWc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 16:22:32 -0400
Received: by mail-wm0-f66.google.com with SMTP id r24-v6so2076067wmh.0;
        Fri, 10 Aug 2018 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kPSVhjfaOxOd+GxbIJMoV0BYyps/tceCOxFgDKuLtbI=;
        b=nAwjnDgKJogxei4HaELzKQHeXP/BV87J0pK1KQHEVg0cCda1rsIisGECzv5ynwFaFb
         eeC4Es9ZJbTNwwaBmH6Aci2YTsfZahv7pYWaUsMLVGNBW5kzOnZ0mWmv/ZjtL7lY4+6m
         gD9haKtr4d+Xx1OXdxs6n7nsYJpbbJEOulOQ0pMSSn+pYycZebBamLUGcvop5Jv4Hh2M
         fPVe6Oabz76auxv9tNSEGViX7uMOWNlO2yN99oEhSx788X/r+ayW/fPbEq0kHnaflmWk
         xTU9rTRoXVNs2iUF91ml5rJiibs5pB9KUY3AyjxV1tYsGhQkTHQ3i6UCHhflu/r8TjbT
         //gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kPSVhjfaOxOd+GxbIJMoV0BYyps/tceCOxFgDKuLtbI=;
        b=iMuZKnGigexVQCrbqAB4FB/lE+DeSGhzRUgsAb13coZTWMRMs7k9Ct5lBaXU4R+Qpp
         L1sRaqqpr6zNWdiJaNrudPeBFgt7qCSmn3KSQncUocM7z3YWuQQCNsy8zgwy0/gCnghz
         DhWVgCXQjzWOu2QQLRGekbjCjYSvYILEOGgOsEF5Hu3pbNon13MGekDIMLFdfVXG53t7
         dejJSeZRtcMQe4fySgoSmoyXhBEnZ+hAXfFkA9n3JY8iQWBfgbhVwZeL6vmvbQgHbk+m
         VPmIJWEwjVMk1Sp03hMDaNwW0AKNVGR8LCDEYpk4rtd+yRiFluytmkfWf4PYCWfjBjW4
         u1sw==
X-Gm-Message-State: AOUpUlGZGkXkkY5/uf4dskVYC46/3MM8Ow9Zg+cs30ZUDZ4F23n4PXLx
        5EF4JFvhHw0B8lwGY+5HZAdmospRleLA9wgYZFY=
X-Google-Smtp-Source: AA+uWPxs8UVigLbD2EOvTcVzPxM++OJq+Z9QpCPjzlZbrqE9ED9usTsYEafUTnTQoJAhsDaMr8IyJT14iDJZ7q70iXY=
X-Received: by 2002:a1c:adca:: with SMTP id w193-v6mr1988696wme.147.1533923500115;
 Fri, 10 Aug 2018 10:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20180809052328.27942-1-me@tobin.cc> <20180809060734.rtqqu4sexbwzuqmm@ast-mbp>
 <20180809072753.GF32374@eros> <80bdc251-9f57-602f-6536-b34651684bb7@iogearbox.net>
 <20180810014636.GJ32374@eros> <20180810065752.2ab5473d@lwn.net>
In-Reply-To: <20180810065752.2ab5473d@lwn.net>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Fri, 10 Aug 2018 10:51:28 -0700
Message-ID: <CAADnVQL-ekJXQoP+Peuh1uBJ1RGxMJ0G0DVp-UoGcWOY9BATeQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/4] Convert filter.txt to RST
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <me@tobin.cc>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, linux-doc@vger.kernel.org,
        Network Development <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 10, 2018 at 5:57 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> The objective actually is to have SPDX tags in all files in the kernel.
> That includes documentation, even though people, as always, care less
> about the docs than they do the code.

right, but let's do that as a separate patch set.
In the current set I'd focus on reviewing the actual doc changes.
In particular completely removing
Documentation/networking/filter.txt
feels wrong, since lots of websites point directly there.
Can we have at least few words there pointing to new location?
