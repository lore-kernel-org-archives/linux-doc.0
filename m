Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D798EB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 14:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjFZOco (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 10:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFZOcn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 10:32:43 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABB519F
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 07:32:42 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-312826ffedbso3876103f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687789961; x=1690381961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xifpWCjzQTN6wRfQL9oeo1fgrnPC7xl+aGU5N4Yu6A=;
        b=RVPxNZgu36KUFT5H8FgT+jHwoc06ROYIC9YqiemtZ5d40LXR39skaMUiMgV4EA768/
         ADZ/bbDHZ5XvnvKFxBJzae9FuiIsNGxKe8fmFnOK1Dzh0TArvqizeXoNF9u4+302W6ba
         0VxjXyUzgcKCnJGjgQ/nv8cNE1odKGCUPryU92WObg86FpOId32kNMIdaTbvY+nsyWYK
         XI1cseZM2C26APa4YnVVN5WfVCVxOWBLkGUtHBCQlUqL/OtJpQCEc3hUQUPe+Q+pHKfL
         34npT3MEvrsNBE2pmyQCTio1783XIupfVLOmnsRvbn1N9XppwGfgNhttduphLK9KFHf3
         LDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687789961; x=1690381961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xifpWCjzQTN6wRfQL9oeo1fgrnPC7xl+aGU5N4Yu6A=;
        b=invy9a/WShjrx5ZyhLarfHb23/iMiBzwqsURB7KGS24Yjo1OI6gAYl05u9PKTC2nEo
         e53yVNSKCI2h/iPT3kYtKdh0sZpSN5CTvDDcKbq9UX4hyN9/y0dyHMTt6C8T/aBZn42c
         dL6gjLGtJ4rtx1K+KJxlTTBdnaBqc379eYRVcR8xJsVHsv/4/3/YjjKqsJRY7RcVSvaz
         uUXjPdUVaEl9ZLNLA0QH5Eg3+P6FFck7dKEnIAqp5zI/kOaWvbRdeoCDGtMRO0d6PEVr
         m3dopSO5LF/XLcfOpqGRQhoN8D77cfCj2RJai00uaalQDv3+USWd2D18619cb1CFs6Ek
         TltQ==
X-Gm-Message-State: AC+VfDyDRVv5rruP1WmIaqj39C53TxQ73Cay1bPFBp8w4//1G2zLXqNp
        voaG8+d/ShOMUR3iLF9mOTqQJBzKDGRMtMUx1P3wTw==
X-Google-Smtp-Source: ACHHUZ4IgqEOhodScx0AEA+jCLvvL6P5B9+0OYCeO04Najnk8I35USY/Zjm7Rv0b4Mem2ps/tw2L8geqfmafNkXiry0=
X-Received: by 2002:adf:e98c:0:b0:313:ed13:38d1 with SMTP id
 h12-20020adfe98c000000b00313ed1338d1mr3990360wrm.25.1687789960902; Mon, 26
 Jun 2023 07:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
 <20230623095547.51881-2-alexghiti@rivosinc.com> <87o7l6mgxg.fsf@meer.lwn.net>
 <CAHVXubhk2xf59XbNiRYKdr4J1yadpeX0KMgW1cFMR4GRN97MYA@mail.gmail.com> <877crrl1jm.fsf@meer.lwn.net>
In-Reply-To: <877crrl1jm.fsf@meer.lwn.net>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Mon, 26 Jun 2023 16:32:30 +0200
Message-ID: <CAHVXubit1pun1r-TC48TxR0esfDo49=PYFE+c10HBKqQ=AnZxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 25, 2023 at 10:39=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Alexandre Ghiti <alexghiti@rivosinc.com> writes:
>
> >> Please don't use :c:func:.  If you just write setup_vm(), all the righ=
t
> >> magic will happen.
> >
> > The magic indeed happens with virt_to_phys()/phys_to_virt(), but not
> > with setup_vm(): is there something we should do when declaring those
> > functions?
>
> If the function in question has no kerneldoc comment, there will be
> nothing to make the magic link to.  In other words, if you want it to
> link to the documentation, the documentation needs to actually exist :)

Ok, that's for another patchset then, thanks for your help!

>
> Thanks,
>
> jon
