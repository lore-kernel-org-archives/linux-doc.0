Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21082C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbjFEFG3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjFEFG2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:06:28 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4500BB1
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:06:27 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6261890b4d7so39786026d6.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941586; x=1688533586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0m9/08QZWQ/wUkhRL9qb7LK9JpSK87yrVqMhqYcFTg=;
        b=OmhIaZ2utadUtezKyG+Zm/rH5PAs0WyJsaSotZ3oZgslwE99nqCR4OqDVQkHFS9MkN
         ZM8ONRB1FHzNin6P0FWPoM9GePGz59ub53JjCqlWgVpn8MkdiyL3n3JrBmJbWgiA4YdW
         48BoFcDBARTfN9CqLNKAoZWXnBsw2ubV4jL6XDPam3YrcY3jCWx8xhHlywRx/lVOSl9m
         B8inz/HcOmSegnwocLOSawD7m2yqkmijVDU/8FkdhlU/PrxhhECstMNVvkaeNsJ3PVzg
         wnTOIqLMzitxcbsx/fcEnqrXtOBGw46sXOwjPxkoFQWDD7CNYXG2d5SyhSMXhqdtkUkT
         FOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941586; x=1688533586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0m9/08QZWQ/wUkhRL9qb7LK9JpSK87yrVqMhqYcFTg=;
        b=QzGNiMBf0zS92jCRH7OxrXvocZ/4DLZErqyhhxW5OAeFlk3L0kbPYIgFIUIa7PHUID
         TT0QtSs9D/4HLeeki6yFX83LkN/mjkxoCpmMwBX91KWg08rJcc9cZgsLAb874OJH9uiH
         /b+gK7GX7Jw7AewvVzZHwEonaK9EaSXD0yQqLR2wRRTSAFD6n3zFH7Vip26IFw8ihMiJ
         8Uk1ACLo9UGveZ8jt0tBHnazOm7CBlMV6m00nnMMn+3yMi0hgClDGJzlDnMdSOO4pZsJ
         PBvQKBCDO7iH+GYWAiLfKJYN1Ch0yoLlwMT8QquQVdtDk4FQscFJw+VtamrnFFe/C95S
         TF4Q==
X-Gm-Message-State: AC+VfDze0LVrfLsGhLeVDkRs484ToskY9g24iZORe1u2ESf2CrDyaKFt
        Qh63huNJoEffGrs5/v56WfF3vfsG4jFLhyX44oQ=
X-Google-Smtp-Source: ACHHUZ5f+kUrUqUxyh0/XUqZrXk9aTJgcO2RlWDc+1IGWvGMJkOOSmnZ+SlDuxv7TojAyru181PMwZGP8Jl7APEbUE0=
X-Received: by 2002:a05:6214:d4a:b0:62a:8f5f:2f9a with SMTP id
 10-20020a0562140d4a00b0062a8f5f2f9amr7728472qvr.41.1685941586040; Sun, 04 Jun
 2023 22:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com> <20230604190604.4800-5-eatnumber1@gmail.com>
 <ZH1T1hK1CzHhhNuo@debian.me>
In-Reply-To: <ZH1T1hK1CzHhhNuo@debian.me>
From:   Russell Harmon <eatnumber1@gmail.com>
Date:   Sun, 4 Jun 2023 22:05:59 -0700
Message-ID: <CA+zrezT7+EziQRnUaSiEfrv87k0Gp7SOgiKnfe2PN6T5DJ8Pbg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] Document an example of how the tunables relate in dm-integrity.
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Same as with the patch adding default values. Can you recommend
something to say in the commit beyond the summary line?

On Sun, Jun 4, 2023 at 8:17=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Sun, Jun 04, 2023 at 12:06:04PM -0700, Russell Harmon wrote:
> > For example, on a device using the default interleave_sectors of 32768,=
 a
> > block_size of 512, and an internal_hash of crc32c with a tag size of 4
> > bytes, it will take 128 KiB of tags to track a full data area, requirin=
g
> > 256 sectors of metadata per data area. With the default buffer_sectors =
of
> > 128, that means there will be 2 buffers per metadata area, or 2 buffers
> > per 16 MiB of data.
>
> Again, the patch description duplicates diff content.
>
> --
> An old man doll... just what I always wanted! - Clara
