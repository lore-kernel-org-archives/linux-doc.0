Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EACEB64D8
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 17:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjFVRcj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jun 2023 13:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbjFVRci (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jun 2023 13:32:38 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E8C1BD2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 10:32:36 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-311367a3e12so6702361f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687455155; x=1690047155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYzOr+m6ZxzxEvl2PF3jrjUYErtnMeTqwLS2G94marM=;
        b=ibqirJS/+biMpP8g0L5piVynHBTRRV0bAE5mOryNRHtbZi+mUnHRxl1c12p9uwMXoo
         VIA3AI2PNjkLGz2Lni0gPEPKYC1WiIWn39+K/xKx3l2kv003L3E5cnDW8khAhpgiXT1o
         zZhWog/JvqMDRqfmAEF1tlWoTjKMM18+q3PudZ8F1Id2V5ef5Vpi+xNIR1WDV2vDgad+
         hDiD0aKhjmRs29GFgxUG/6gtQL5Uv69OvhuVtj861qNiHJ7ZcnpLdQsMYtt3xOStWaiu
         Ew1FgY0Pbc3vEwbdd//PJgWVjUMI/q7UnDKCy3eGhRGfFQ8d5Zt6lnxi/L1gzBRm3nhm
         JfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455155; x=1690047155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYzOr+m6ZxzxEvl2PF3jrjUYErtnMeTqwLS2G94marM=;
        b=HbEM5PUGFVZ1eHKhWRqNGoeb8SP19s76L3VcEgR2tVaELM6iDvV8x8+E+SuzgYefHk
         x3wIk6+9Cr3yrF3hpirLoEJpx5AKEAHj8zzzjV6Ds/KF/sjXnAtWg5hK2vQ61i0rcLti
         DkbSfA5KSxOYBE7lMvjpm0xsoLgLwLFneiE4YmQJ94VClukAza/5r/hRGY9MxyzrVPKA
         Dau2Td66BDs2XDZuRzDxhGhm4mopcqNm3iWOpjbnMYYv63K8KIR5giukO8VtRhx8aXmL
         Gg2TL6fcaY3PDia11xVpHF+AnFXcMgCXN62ff+EuwHLb7PHS66LArwocMizU1TvJ1uYh
         QI/A==
X-Gm-Message-State: AC+VfDyuQaR223ChA1Nr2GJQI7oddq7mRUv7zgKUKuKw6I52dYCA2yDv
        EFXqmXuFgbpTO9EF3O2roPf1h5xIJZeCd1Luf8L8UA==
X-Google-Smtp-Source: ACHHUZ4a2mEPLo7cxfgHRoQCrjnAyTY6kt8y7S9iJ/FgJPnbTeWHOErvMKTvucsyVTz5v4YV/fO/IM9DesMd11bIA1U=
X-Received: by 2002:adf:de87:0:b0:311:1029:e325 with SMTP id
 w7-20020adfde87000000b003111029e325mr16013813wrl.70.1687455155123; Thu, 22
 Jun 2023 10:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230621072234.9900-1-alexghiti@rivosinc.com> <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-d6da578719f8af903d6746ef@orel> <20230622-4af59422f118ea634836d351@orel>
In-Reply-To: <20230622-4af59422f118ea634836d351@orel>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Thu, 22 Jun 2023 19:32:23 +0200
Message-ID: <CAHVXubgJQhShbOfaQeOTxM61g_tUnLBxa-0JK+WE+YQRGkYRQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 22, 2023 at 7:24=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Wed, Jun 21, 2023 at 02:19:50PM +0200, Andrew Jones wrote:
> > On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
> ...
> > > +Hardware description
> > > +--------------------
> > > +
> > > +The firmware can pass either a devicetree or ACPI tables to the RISC=
-V kernel.
> > > +
> > > +The devicetree is either passed directly to the kernel from the prev=
ious stage
> > > +using the `$a1` register, or when booting with UEFI, it can be passe=
d using the
> > > +EFI configuration table.
> > > +
> > > +The ACPI tables are passed to the kernel using the EFI configuration=
 table. In
> > > +this case, a tiny devicetree is still created by the EFI stub. Pleas=
e refer to
> > > +"EFI stub and devicetree" tree section below for details about this =
devicetree.
> >                              ^ redundant 'tree' here
> >
>
> Can whoever applies this drop this 'tree' I pointed while applying?

Yes, sorry: @Conor Dooley give me the overly long lines you wanted me
to break and I'll send a v3, it won't take much time and I'll fix this
too!

>
> Thanks,
> drew
