Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1903A268
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lVOXQsbs"
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C977012B
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:37:55 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507c50b7c36so6539127e87.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698165474; x=1698770274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ00iT5MBLthBXpEW1UVbJpzOdfkXUyxCtvUUc+C6ro=;
        b=lVOXQsbsoLo4Tc5Cjs3xTpMdldD1eRpUaUvmdLtuCDqQUxrmgdSPiLtyheha7Oy0I+
         D67g/qeYZjTe2S9ZbwVYwDKwEQH2r1tTvoVF0N+lLo58+afjhq0vknX2bmPUY9KDXhZO
         jH3hIikXoHyC5e2jCsAEWfq2cC5d3Z5LugHiRhg93yrUnOyuLj1+jBKXRbGZGHClQ0ob
         pbLXmTx42ldtP9w/O3ssd1I5gi2MdvGsR98KKTcvUuAneJ0vbU8v9YOa1Z/LHLEnksM2
         7et0pWQILrJ2+cwa1eGXW8Z6mTuj6CTSXxn4ePkpkEbU+Ffzbh2a9tc3kydkAnUWyblC
         1Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698165474; x=1698770274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQ00iT5MBLthBXpEW1UVbJpzOdfkXUyxCtvUUc+C6ro=;
        b=eiBCHpj/voXi7BO/6OzXAad6WN1JdKfIaPskvytnJXsHLEAiNxRE7c73Df5g9lve66
         MEb64ldrV9AI0hvpoYCsUCNiRx5XiGHoWKWlI3Dofj7PbaEKJL8cbhJe3vEZT4jFeVGD
         yVNvD2pEtIhKPlORCigHAkUsW6nr/swXXq1PPnS69UJiuC0luduW7mAsT+VoGW1xovB2
         6r6kvqXXC8Zujie8lZK1Js0A5USmkFkdktIHDjPTMj7W9vitBJJGsaEtRJcQtOqWzIZX
         Nvqzs6cQTROOw/dZR1qO2Iy0mBeELSWo4fE7e2bMftkvbQXttfBuUKREEQVh/3hcIdBL
         ywrA==
X-Gm-Message-State: AOJu0Yx5YWqF3aQ5aS296oxMBjowgBvtPjBRlkdIlR476TWDgK2lF0fV
	qmbRHQnymzY2VxldXLXEhGc+p0WN4yihYZBpkM2jeYKjBHxHIUT5
X-Google-Smtp-Source: AGHT+IHU0SuW8qIrTkg9+1VPEqjIrc2hDcfHXiQbZ/0vtxjVpobAABBwhRBFea6xvpHVBg9QxcWjpITCntgT0kGXieE=
X-Received: by 2002:ac2:5104:0:b0:507:b17a:709e with SMTP id
 q4-20020ac25104000000b00507b17a709emr9561597lfb.1.1698165473946; Tue, 24 Oct
 2023 09:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-3-cleger@rivosinc.com>
 <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
 <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com> <56f6af04-bdf4-4b85-99dc-9eb4f391d7ad@rivosinc.com>
In-Reply-To: <56f6af04-bdf4-4b85-99dc-9eb4f391d7ad@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 24 Oct 2023 09:37:17 -0700
Message-ID: <CALs-Hsvy411MnHQXHLK8u4JmM+LO5R2tuCxY6zQco7BKJONqPA@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar crypto
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 2:30=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
>
>
> On 24/10/2023 09:18, Cl=C3=A9ment L=C3=A9ger wrote:
> >
> >
> > On 23/10/2023 18:21, Evan Green wrote:
> >> On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <clege=
r@rivosinc.com> wrote:
> >>>
> >>> From: Evan Green <evan@rivosinc.com>
> >>>
> >>> The Scalar Crypto specification defines Zk as a shorthand for the
> >>> Zkn, Zkr and Zkt extensions. The same follows for both Zkn, Zks and Z=
bk,
> >>> which are all shorthands for various other extensions. The detailed
> >>> breakdown can be found in their dt-binding entries.
> >>>
> >>> Since Zkn also implies the Zbkb, Zbkc and Zbkx extensions, simply pas=
sing
> >>> "zk" through a DT should enable all of Zbkb, Zbkc, Zbkx, Zkn, Zkr and=
 Zkt.
> >>> For example, setting the "riscv,isa" DT property to "rv64imafdc_zk"
> >>> should generate the following cpuinfo output:
> >>> "rv64imafdc_zicntr_zicsr_zifencei_zihpm_zbkb_zbkc_zbkx_zknd_zkne_zknh=
_zkr_zkt"
> >>>
> >>> riscv_isa_ext_data grows a pair of new members, to permit setting the
> >>> relevant bits for "bundled" extensions, both while parsing the ISA st=
ring
> >>> and the new dedicated extension properties
> >>>
> >>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> >>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>> Signed-off-by: Evan Green <evan@rivosinc.com>
> >>> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> >>
> >> My tree might be out of sync, but in my search for riscv_isa_ext, I
> >> also found a use in print_isa() (cpu.c) where we're reaching into
> >> riscv_isa_ext[].id and assuming it's always valid. If that's still in
> >> there we'll want to fix up that spot too, since now with bundles .id
> >> may or may not be valid.
> >
> > Oh indeed, the array is visible outside of this compilation unit :/.
> > I'll check that before sending V3.
>
> After looking a bit more at that, it actually seems that id is used in
> cpuinfo to determine which extensions are present which means you are
> right, bundle_size needs to be accounted for.
>
> Looking at it also raises the question (again) of exposing the "bundles"
> extensions themselves or not in cpuinfo output. With the current setup,
> the bundles extensions won't be visible in cpuinfo output. For instance
> if Zk was in the isa string, then it will not be visible in the cpuinfo
> output, only the child extensions. One solution would be to always have
> a valid id for each extension. So we would have one for Zk for instance.
>
> We would then have a similar setup for all "bundles" or "subset"
> extensions, they would have a id for all of them. For instance, Zk would
> become:
>
> __RISCV_ISA_EXT_DATA_BUNDLE(zk, RISCV_ISA_EXT_ZK, riscv_zk_bundled_exts)
>
> Same would go for zvbb (riscv_zvbb_subset_exts would only contain Zvkb):
>
> __RISCV_ISA_EXT_DATA_BUNDLE(zk, RISCV_ISA_EXT_ZVBB, riscv_zvbb_subset_ext=
s)
>
> For the sake of completeness, I feel like it would be good to have all
> the extensions (bundles or not) visible in the riscv_isa_ext.
>
> Any objection ?

I could be persuaded that it's a good idea, but there are arguments to
be made for not defining them as separate bits:

1. Having two (sets of) bits that mean the same thing means usermode
now has to decide which one to query, or query both. Multiple values
that mean the same thing is always something that makes me nervous.
2. To avoid these two sets having different answers, we'd have to
solve the reverse problem too: If all of the bundled extensions that
make up Zk are on, we'd need to detect that and turn Zk on as well.
That code would also need to know the difference between a pure lasso
like Zk, where you should flip it on if its components are on, and the
loose change variant we were discussing on the other thread (Zvkb?),
where you cannot.

Pretending pure lasso extensions didn't exist on their own was a way
to sidestep the problem.
-Evan
