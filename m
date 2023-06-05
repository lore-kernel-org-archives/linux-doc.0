Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D506AC7EE2A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjFEFFk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbjFEFFj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:05:39 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5463B1
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:05:38 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3f80cd74c63so49323881cf.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941538; x=1688533538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3kCCtU+NI6gwJFuc3XerKWBHFS/pAXCNLdgl7Npq2M=;
        b=JDAd22k8j12dr9aUA1CZCKpY6Rd8YQk1RIPO39sT4BbWoMylCSSV4Zb4EWI+Fif9B2
         IAN4i3+SHcsDgnny8WmeDFWLDsJNU2h1XxjRg9t6L3riZ68nCP1oQrXMzhisZb09PtVG
         hD3fT12ZrkCymF29Jrsunr7EKPjKhsiffrgxxUgum6m1Us4RHwDQ4qGbUqSPUA2La1Lq
         YpjBfKP9heqzqXjqrbre5JrO0MIPRM4r/6SysZ9gMpQ+YQ63w2nmzWEl55g4LsJRaThR
         XmF/+7t/bkwT24yyebagwcXIlAb+Onbh2j4Uo86h5u16V+3mZ1LwXqLKzyx9ryMvnhMP
         REew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941538; x=1688533538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3kCCtU+NI6gwJFuc3XerKWBHFS/pAXCNLdgl7Npq2M=;
        b=jbaTGxNdJUHMeSgDPgZ52iFYXlHOM2vCIpf03rc0Qu5Q47VxeJWBgB6xWtQfyHEI6i
         HxjpoCfh94Tpn1IrLu6rptGPcahYpm3/JidU/3bRdNtMQu/dwaRMlSRMPGUy64Zr+8mK
         fgS8HHk+dPllywRFF46bz67ONx2bZyX2CjwIAYSofKgOims2X9BoShRJH4xBomsmTKZW
         +JJnNK88zqaysd2FdDOdzo7cnb+Ld1WLOPGbYfqFRUO0DH2Lc1hcBA19cw8xtRvO8+1E
         3soL3ooggqH1pLw1JQLTa8YPGElCNB12m6BJXeBuamlif7Pub66PDUOvl7CDBF4WqN5h
         9rgA==
X-Gm-Message-State: AC+VfDzRmQYkolDwtlW3VUkdJYEoDgZ7uERAHxRXjIpkuE0r1mL3JYeA
        KvJwn8hkGsd2bNFbD9YlUmdjvzBuoG9X0ifcYKY=
X-Google-Smtp-Source: ACHHUZ7rNrXYgwmPX2/cv4b/f94Z1wFDGnN8hkperzEHWHpoVXDt4NP1KbgkL8xcJQixRREjc5NR5JG7AQmKhnYkSbM=
X-Received: by 2002:a05:622a:188a:b0:3f4:e0cc:739c with SMTP id
 v10-20020a05622a188a00b003f4e0cc739cmr9197499qtc.27.1685941537433; Sun, 04
 Jun 2023 22:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com> <20230604190604.4800-4-eatnumber1@gmail.com>
 <ZH1TmkyVJbIlNUEE@debian.me>
In-Reply-To: <ZH1TmkyVJbIlNUEE@debian.me>
From:   Russell Harmon <eatnumber1@gmail.com>
Date:   Sun, 4 Jun 2023 22:05:10 -0700
Message-ID: <CA+zrezSnteG0k5nAsTj9_Hpqq6pfMxGE3X47pQx4M_MOqTvOvg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] Document dm-integrity default values.
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 4, 2023 at 8:16=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Sun, Jun 04, 2023 at 12:06:03PM -0700, Russell Harmon wrote:
> > Specifically:
> >   interleave_sectors =3D 32768
> >   buffer_sectors =3D 128
> >   block_size =3D 512
> >   journal_watermark =3D 50
> >   commit_time =3D 10000
>
> Your patch description duplicates the diff content below. Please write
> in a mood that evocates curiosity to read the diff (and make sure it is
> also imperative).

I'm not sure what to say in the commit message that isn't already
captured in the diff content and the summary line of the commit. v2
was such a patch, but you asked to add some content to the message. Do
you have a suggestion for what to say?

v4 that I'm about to send says "Documentation: dm-integrity: Document
default values" in the summary line and has no other content in the
commit message.
