Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF2AC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 23 Nov 2021 11:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236511AbhKWL47 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Nov 2021 06:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236446AbhKWL46 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Nov 2021 06:56:58 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF388C061746
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 03:53:50 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso1977656wms.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 03:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7HCsn3LauvYlw254i5JEp6W9ePQ2LHc/IwCYYFyUPzE=;
        b=TNu6s/w6vt+7IaJeXayLbrq/RXSMlbuqU8t6TjBqQqZkNPDA4qjccqKSdKXMH54Kso
         E7eQwiSGUSG2CHSa31AcKRX4NnBkkmNT0PfEaxVSE+/ETEwcrpogoQeXH1esnxonox8N
         wlYAkcWix/a/Jr4vru+C+4rH46GsjV7b4uvULoxT7pyuzrJ2iJU6s2ryT6T4is6yxaJm
         +hXu5KBeK0yPB5T8IG5WdbBTD7ComXerL+DFtEurTdrcTNd+6mpv4VWxrFXX0wfWLEDN
         sxSgFQjaoI7LmvZiKdLvDI/vK1OmpvF6CCWtKrMRzM4aCHg+EY6llXVXsuzGkiGgLsCF
         QoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7HCsn3LauvYlw254i5JEp6W9ePQ2LHc/IwCYYFyUPzE=;
        b=FUYECrF/Kh9y7yHQNK9vuuDys5Mkk/atvu9hFqYIjEaD9qbJ2Wa9nv6VsA833c86zp
         BtXkLjs1ezTqBErcKfNYleh8Qvdu8ECa0TdV8UsudztjpchAnC8wP66bWf7TyuJHZpV+
         KfTOTXPYj937R16tT0pg8nTGLtCO+1rsumllofsOHKNOPRvAICDyv28l7vhlO2RIh2IM
         zUe947irMjFDSs3TF/Yz7LwlKYbAfAhaoF5oWXGYCw+t9Lsg0c0X2wR3v1+hKhs8aP++
         yiGm5/gfFICT+4cYb6KGzomPnKY6QZyk65xAm7v1+Zd7nIekxvZ9g40U2Ne5BE1QbD4L
         tQmQ==
X-Gm-Message-State: AOAM532LND0DaSi4L9buh4CQWMYMprwWNnE4TT1iqzHclo8dqCNupABz
        6PY+f4pCMjlWIOi4nObZtq6Ni/QZWd06PLmM
X-Google-Smtp-Source: ABdhPJwUJgOXWF/109whZMvPubj9tHLlQt7cpbmmCDcfE/tpcF9iYKuPT590KGCJoe/xH4JtcjO65A==
X-Received: by 2002:a05:600c:22d0:: with SMTP id 16mr2343747wmg.37.1637668429367;
        Tue, 23 Nov 2021 03:53:49 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id d9sm11550737wre.52.2021.11.23.03.53.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Nov 2021 03:53:49 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC PATCH 2/3] riscv: Add early_param to decrease firmware
 region
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAAhSdy0LLu4o6uOB8t_Wv6jsOrrrSMx0pv1E1B5F679gan3i6g@mail.gmail.com>
Date:   Tue, 23 Nov 2021 11:53:48 +0000
Cc:     Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        atishp@rivosinc.com,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Anup Patel <anup.patel@wdc.com>,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Alexandre Ghiti <alex@ghiti.fr>
Content-Transfer-Encoding: quoted-printable
Message-Id: <07AD2CEA-3C9B-48FA-8E67-3B60448A08F0@jrtc27.com>
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-3-guoren@kernel.org>
 <CAAhSdy0LLu4o6uOB8t_Wv6jsOrrrSMx0pv1E1B5F679gan3i6g@mail.gmail.com>
To:     Anup Patel <anup@brainfault.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23 Nov 2021, at 03:44, Anup Patel <anup@brainfault.org> wrote:
>=20
> +Alex
>=20
> On Tue, Nov 23, 2021 at 7:27 AM <guoren@kernel.org> wrote:
>>=20
>> From: Guo Ren <guoren@linux.alibaba.com>
>>=20
>> Using riscv.fw_size in cmdline to tell the kernel what the
>> firmware (opensbi) size is. Then reserve the proper size of
>> firmware to save memory instead of the whole 2MB. It's helpful
>> to satisfy a small memory system (D1s/F133 from Allwinner).
>>=20
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Anup Patel <anup.patel@wdc.com>
>> Cc: Atish Patra <atishp@rivosinc.com>
>> ---
>> arch/riscv/mm/init.c | 14 +++++++++++++-
>> 1 file changed, 13 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 920e78f8c3e4..f7db6d40213d 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -159,6 +159,15 @@ static int __init early_mem(char *p)
>> }
>> early_param("mem", early_mem);
>>=20
>> +static phys_addr_t firmware_size __initdata;
>> +static int __init early_get_firmware_size(char *arg)
>> +{
>> +       firmware_size =3D memparse(arg, &arg);
>> +
>> +       return 0;
>> +}
>> +early_param("riscv.fwsz", early_get_firmware_size);
>> +
>=20
> We have avoided any RISC-V specific kernel parameter till now
> and I don't think adding "riscv.fwsz" is the right approach.
>=20
> OpenSBI adds a reserved memory node (mmode_resv@8000000)
> to mark the memory where it is running as reserved. In fact, all
> M-mode runtime firmware should be adding a reserved memory
> node just like OpenSBI.

BBL does not do this and, even if it=E2=80=99s modified today, older =
versions
will still need to be supported for quite a while longer.

In FreeBSD[1] we only reserve the first 2 MiB of DRAM (we don=E2=80=99t =
care
about RV32) if there is no reserved memory node covering the DRAM base
address, which avoids this issue. The only downside with that approach
is that if firmware occupies a different region than the beginning of
DRAM (or there is no firmware resident in the supervisor=E2=80=99s =
physical
address space, as is the case for a virtualised guest) then it
unnecessarily reserves that first 2 MiB, but that=E2=80=99s not a huge =
deal,
and can=E2=80=99t be avoided so long as BBL continues to exist (well, I =
guess
you could probe the SBI implementation ID if you really cared about
that, but I=E2=80=99ve yet to hear of a platform where the SBI =
implementation,
if it exists, isn=E2=80=99t at the start of DRAM, and if you=E2=80=99re =
virtualising
then you probably have enough DRAM that you don=E2=80=99t notice 2 MiB =
going
missing).

Jess

[1] =
https://github.com/freebsd/freebsd-src/blob/main/sys/riscv/riscv/machdep.c=
#L554-L568

