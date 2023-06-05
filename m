Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCA0C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 05:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjFEFCV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 01:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbjFEFCU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 01:02:20 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C40B3
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 22:02:18 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f6affdb6ddso49628531cf.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685941338; x=1688533338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQqq0ZkiTjUo34FFESouqLsW9G1Vf1I+EZhrNacdQcU=;
        b=h7E8nnN5h52/k8qyeYEcP2SVZdpCR4JS5LRZxdvykpsrHBZ9xZjxzKaSNw+y+AYsYv
         sS7w6H09EoLrJ1YJYriAP9viAwVAEGrvaG5do+lsviz5CtyUxRGszLyCbkR4V3IpPt3b
         F6Vt7wDljFvJNn8Xli56AsHP4NWOHM3gy20NYyGXyFQMJhMtF+mu7JtN4ryhxL8nXV8j
         UvhQQwS1SI//dW2kF/Rx24cgqreF2oignIf9XPlbt4hUzjrv7RX3vpAm1zjl0cK09ADr
         2oSWmwmakCSCF/mQOmxujokeXVozFECx7JLDIvOakxkk+yI2EVZIZRV5Com03yUVqZxk
         wZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685941338; x=1688533338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQqq0ZkiTjUo34FFESouqLsW9G1Vf1I+EZhrNacdQcU=;
        b=J9LhnHiylRhsfJrRfydgo2SlECTJEw+4pCWSGa/Kz1NKerjLyNDJ4BmPXAZqsNBnlX
         pDcmw8+MI5FS9NQy3zLXPqtYsWlfpUM6KvFPGV/MmGQOqIQeT0jxRkrr1y4WyARHoG02
         wjDC23RL9oupQGGT5BTe0hGQVhCod84sxQbHdeVn358hvxdjSs1496uJsrvUdIXnWbuC
         xMgG6jUA/cC0DKpLXosDHZWiHmGm6K5g1Y6rd0czpNEW5hLYPfsCESaZ2hEc9uxCToNq
         Gu/PY5V02H1TugrtMPpEdnW/cQjbQnTiXJsJYyJQ0zHFyOgPojHuAc6cY0SC+f5T7ddr
         Y+TQ==
X-Gm-Message-State: AC+VfDyOgZysW1RpWZIH3uq6EkiO76+BsOMSHc+n1zc1OaUVgWhWpNq4
        A7pv+P1EW6V1RLacFyd70jyVMmjFCBWB6zLFYPcjuq706fA=
X-Google-Smtp-Source: ACHHUZ7Ceo1/xs3hPrnnIfWJcNj1nUgBI/Xg2njUUBGMLjaIlpJLXok1imeJGC7i9moZ8RgEJyd+i0v7dDrwNcl4LUc=
X-Received: by 2002:a05:622a:307:b0:3f4:f199:d98a with SMTP id
 q7-20020a05622a030700b003f4f199d98amr7948724qtw.24.1685941337799; Sun, 04 Jun
 2023 22:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com> <20230604190604.4800-3-eatnumber1@gmail.com>
 <ZH1RjWUfq3Af4fiB@debian.me>
In-Reply-To: <ZH1RjWUfq3Af4fiB@debian.me>
From:   Russell Harmon <eatnumber1@gmail.com>
Date:   Sun, 4 Jun 2023 22:01:51 -0700
Message-ID: <CA+zrezRfP-X4uaY06zDyT=G+KGSLx6wjBL8ZuoSwP6709ad-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] Documents the meaning of "buffer" in dm-integrity.
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 4, 2023 at 8:08=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Sun, Jun 04, 2023 at 12:06:02PM -0700, Russell Harmon wrote:
> > "Buffers" are buffers of the metadata/checksum area of dm-integrity.
> > They are always at most as large as a single metadata area on-disk, but
> > may be smaller.
>
> Hey, I forgot to mention below.
>
> Where is the subject prefix? The patch title should have been "Documentat=
ion: dm-integrity: Document
> buffers".

Ah I missed that in the docs. I'll send a v4 with it included.
