Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33364C7EE2A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232892AbjFEFAn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232710AbjFEFAi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:00:38 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255D3FF
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:00:28 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-62614a2ce61so39677856d6.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941228; x=1688533228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMHK7oKJtfxrboWZ+YOCD56wMtQusnOlExjiceVji6Y=;
        b=AO2wIfXSSBo198e2ltfaTOu2QOj24vEpkNFyx4KZ3V9r2rp1VTVSdxXOahK8Ohhjl4
         fbpXGU7qa/ghHEDe1sh2pAqDMAffrFaQvuyYeg0BLYIj5Yj1wYlsO+lmAqzTSL/NT8PF
         nctAqt0RwJLUBXA1e1nG3KVanpCYgeUdq18S4et1S58qPMEDyQNVDdV4YoOdJCq8vL6u
         rEvXZqh0ZvrhyHg5IeidfDwxsknvnsvzYSKkeszhWqDIl/Ir8x591A+KM3PJUcZYmXit
         Kit/BPGoP/eJz/sTE268iBUzB0yX+AjpIk62RFU7ltdQYPDPP7nTjf2YPM7XZWGdVaE0
         GMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941228; x=1688533228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMHK7oKJtfxrboWZ+YOCD56wMtQusnOlExjiceVji6Y=;
        b=bTajPjm9EKGCVsmsFdmso8AQVwmKGKG6PKk3xuOOpEMkfoiUnJufJUuAcZT540tWns
         ak9V5Zu31PxZJRb/d/G5Zp+GhX1AUYR8noQ1KhRYAhPBRu13B5iJbLFzV3Wu7dBZKLyg
         Qm6pWOmkSzMnv+QpDFx1e5HduJ6HDr9syoe/9p6mp0m6Wt/fur9YNVLiXucEg9D9uWxW
         EngFi0sbg2NDIL/n2Jfkq5Xz1irlalDXN8dsaKZqwey9gzLG9Pc7WZrD/PFBBCPfa4iX
         CUsE1BvkFyKG1NmvdIWupem0caeFD4/3wx6pUzMe3GDh5fsntWbHtwiGL6k9etfEkD+i
         +TEQ==
X-Gm-Message-State: AC+VfDz6LgD0BRE5JvktjFK1Bp0DRs4+7AFSfoCHlbY/XJW/a2bKpNGH
        zCH7NLNJiO8dA1muHUAbHxOLNFFXOHR35k0HlEAP/WOym5lggQ==
X-Google-Smtp-Source: ACHHUZ42OzC/oLGiNPIulQMfSLig/7ajfXq5lFb82JYgKGctpqoUgJqy30JOKEeygfLpptL1GCLver3IVpkuBCN0/nA=
X-Received: by 2002:a05:6214:2603:b0:621:451b:6e1c with SMTP id
 gu3-20020a056214260300b00621451b6e1cmr7970582qvb.6.1685941227669; Sun, 04 Jun
 2023 22:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com> <20230604190604.4800-2-eatnumber1@gmail.com>
 <ZH1Qh90x9ncsBTik@debian.me>
In-Reply-To: <ZH1Qh90x9ncsBTik@debian.me>
From:   Russell Harmon <eatnumber1@gmail.com>
Date:   Sun, 4 Jun 2023 22:00:00 -0700
Message-ID: <CA+zrezQT88K85YHuiD3TSmBN-cqhgfSjMp6zo7DoH-AdR3j8yg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Fix minor grammatical error in dm-integrity.rst.
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 4, 2023 at 8:03=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Sun, Jun 04, 2023 at 12:06:01PM -0700, Russell Harmon wrote:
> > "where dm-integrity uses bitmap" becomes "where dm-integrity uses a
> > bitmap"
>
> Do you refer to one bitmap or uncountable bitmaps?
>
> I'm confused...

There is only one bitmap on-disk, written to by bitmap_flush_work [1].
In-memory there's many (it's stored as a linked list of pages), but
the docs seem to be implicitly referring to the on-disk
representation, so this would therefore be referring to a singular map
of bits, or "a bitmap."

[1]: https://github.com/torvalds/linux/blob/master/drivers/md/dm-integrity.=
c#L2876-L2877
