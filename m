Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FBDC04A94
	for <linux-doc@archiver.kernel.org>; Tue,  8 Aug 2023 19:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbjHHTJ3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbjHHTIr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Aug 2023 15:08:47 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099A6320A7
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 09:30:53 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-40f0b412b78so45305001cf.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Aug 2023 09:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691512228; x=1692117028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9zS30PvoHblPo8YN82wx1JKihZIxwLEMzYHF89G6sU=;
        b=JxkiD+KImTdpxowKTxCMVuHGj5xbzTknclhg2q/PeurKijqyDnr5dqnIOuqfPssoHW
         meOnV+wMCNz+zV0rdFaY4SJuzELS7O3RX5vaYkPloJ5J/AzGmU4CqptKFw7TA+5L2bxe
         tYE6kwcOldBT10jMVvsFi78DBuUiDQxhi1xclwHQn/lGIH2pRjXRCFZ7F2EsaRRemfRE
         DiMmERvJ/pAraelh6huRcWsYVfaeqt7cxYrABG3cRnFzsp6cF4Fn45yMaGugEynpPSZ6
         FCF2NhbSQ2TvGP/ZkiufCs7JpMkTt3fxZ52CuiKZtEdz1IcZ9fPudSUx2OYnLE70Bp+q
         z+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512228; x=1692117028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9zS30PvoHblPo8YN82wx1JKihZIxwLEMzYHF89G6sU=;
        b=PPdP0os4AsoEo1KuahZcdano2R2K/IIUvYlcUy0FTwRLE2GxNf297X1KsFr0vkawFB
         qwbmzG5Op8KI3qVAnMUAdvQARPHRlqt/xUgRi6hMTG033h9QweES3yBDaUDHrMRXDH8m
         jcCTY0/infN6ICx1TjFv9gbR7kLSbEVGSJEict7GcHvC7yL/QJYDoeq9TMJj+FuITIEH
         GaBWSZj+8F2EGbj+09HajtL2b/IpvSu+2+F2zMFZs6ycNGDDB/ej8nM7284r6T3Q6DVV
         NbUeCEFnyqvo7mGt923MiVLkmuK2AQpuXjEMbJbkxWgfwkt5NIojWA9dd0OPtX4RZL9U
         N7hw==
X-Gm-Message-State: AOJu0YxDDTBfoRqCRJlO8G734kvW/uxiCAufEsUYzM5O/bp4VGwZYQzw
        /0JqpzJIzGSOwm5EuG0RSZTGa6a2+ZAXzNl34E4ckE2+FJzLnbQ1s8A=
X-Google-Smtp-Source: AGHT+IHwj3koprvncE8FX41F8VhQ9ofHcuhvfeQaw4c/xsViq681+NAYgINd4xXSKcG2d8KRUWa6MORkInxl0+tlgIk=
X-Received: by 2002:a17:90a:c583:b0:263:5c6a:1956 with SMTP id
 l3-20020a17090ac58300b002635c6a1956mr9160440pjt.25.1691492249057; Tue, 08 Aug
 2023 03:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-21-sunilvl@ventanamicro.com> <20230808-chalice-easing-1369c7386082@spud>
In-Reply-To: <20230808-chalice-easing-1369c7386082@spud>
From:   Anup Patel <apatel@ventanamicro.com>
Date:   Tue, 8 Aug 2023 16:27:16 +0530
Message-ID: <CAK9=C2XZ7_tfSK6HNN1Em5fAHrknWBqGaD9gPL8yGs8AzE3vQg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 20/21] RISC-V: ACPI: Create PLIC platform device
To:     Conor Dooley <conor@kernel.org>
Cc:     Sunil V L <sunilvl@ventanamicro.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Robert Moore <robert.moore@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Scally <djrscally@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 8, 2023 at 2:12=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Aug 03, 2023 at 11:29:15PM +0530, Sunil V L wrote:
> > Since PLIC needs to be a platform device
>
> For the unwashed, why does the PLCI need to be a platform device?
> (And while you're at that, please try to make use of the extra ~20
> characters per line that you can use here.)

As suggested by Marc Z, only timers and IPIs need to be probed early.
Everything else needs to be a platform device. The devlink feature of
Linux DD framework ensures that platform devices are probed in the
right order based on the interdependency.

The PATCH5 of the v7 AIA series converts the PLIC driver into a
platform driver. This works perfectly fine.

>
> > probe the
> > MADT and create platform devices for each PLIC in the
> > system. Use software node framework for the fwnode
> > which allows to create properties and hence the
> > actual irqchip driver doesn't need to do anything
> > different for ACPI vs DT.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Co-developed-by: Haibo Xu <haibo1.xu@intel.com>
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
>
> > +static struct fwnode_handle *acpi_plic_create_fwnode(struct acpi_madt_=
plic *plic)
> > +{
> > +     struct fwnode_handle *fwnode, *parent_fwnode;
> > +     struct riscv_irqchip_list *plic_element;
> > +     struct software_node_ref_args *refs;
> > +     struct property_entry props[8] =3D {};
> > +     int nr_contexts;
> > +
> > +     props[0] =3D PROPERTY_ENTRY_U32("riscv,gsi-base", plic->gsi_base)=
;
> > +     props[1] =3D PROPERTY_ENTRY_U32("riscv,ndev", plic->num_irqs);
> > +     props[2] =3D PROPERTY_ENTRY_U32("riscv,max_prio", plic->max_prio)=
;
>
> My OCD wants to know why this gets an _ but the others have a -.
>
> > +     props[3] =3D PROPERTY_ENTRY_U8("riscv,plic-id", plic->id);
> > +     props[4] =3D PROPERTY_ENTRY_U64("riscv,plic-base", plic->base_add=
r);
> > +     props[5] =3D PROPERTY_ENTRY_U32("riscv,plic-size", plic->size);
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup
