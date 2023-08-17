Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652E3EB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 12:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350870AbjHQMbB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 08:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350868AbjHQMa0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 08:30:26 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8930F271B
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 05:30:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-307d20548adso6696769f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692275421; x=1692880221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuXRQgl4ayeLkSDW0JDXF701tiBxNx39rnIctWWyMXI=;
        b=aChaWqCmxgNz4ErLIuuWG8YWUTpIMuWQcpYeSAw6ad1zEDeV4yx9J2tNqzpnFbCrns
         PCQTvhSO/4u2KNK7H2+Yq3qzuuSXjGouARW32o6DufshbycXVEwSU9sycB1bbBuEgGAA
         8RvslNCsO+5SvuZHAwq5e3DVlYCAbIo09tpG94aUyWECdzd0b1zMjph6aeBhozJPW7or
         4NGroOxgf38+UejID4sxd23ygh49ZWXhgqlFX1Xg2UkcgjgICCT9tiI/2nvtQyRzVyMG
         ZUloXEwidFP0HJTqdTEL0HzVsWbstB/2NhIWwxW59IWixATiMTM/iieV2DcqCZWmtRss
         CgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692275421; x=1692880221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuXRQgl4ayeLkSDW0JDXF701tiBxNx39rnIctWWyMXI=;
        b=jpShoJXPRKhl0KXu5kyVGSGyvxqXm5H4FQCvOgALnGFhoQ35q3ojvuyBfnwhTB9PfE
         dxdkSatNs0VhPWiSFVBvu841PNG2OYg0CSdYY5UH1MTf7tTfh1qMEibEhNOFOwbnAQYv
         ZECMaY8GMugpQxuYcKCLfIuV1NYXhSu/5YzOGkOOOp3Drw+apEu5IsuZX/4WiA/zGrYc
         VmQ4E/SPHcGAChe3hrtAFNxvTrRE7R6DFBraUNlnbvwroaPGrhChR7sMpCAHbYAFqmmV
         P1vqEiTlEzeeJ/XrPCHQRseHopb8iRoyQ4yqXzrMZELCqFM9PyRATJr/PfchLwYNGQug
         VmVg==
X-Gm-Message-State: AOJu0YzadZGRp+mLRaxp0WXP0b2dbiOnquXUKFN/2+NrqnuJxQtWIhJP
        UeFrApfAF/8W/Ix0uJcsqFU9zuuGjIHrWnWKSEe5pw==
X-Google-Smtp-Source: AGHT+IFUYAZNKpCPoVJxK7pTg2muMvrUAbItalLhCm+pS3KOCxcwVO8wFJ81MCKfe2JRVnuXtvkCmhwyTjkxHmr5bIE=
X-Received: by 2002:a5d:674d:0:b0:315:a34f:b520 with SMTP id
 l13-20020a5d674d000000b00315a34fb520mr3544053wrw.71.1692275421081; Thu, 17
 Aug 2023 05:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <202308151010.JGqiPc9F-lkp@intel.com>
In-Reply-To: <202308151010.JGqiPc9F-lkp@intel.com>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Thu, 17 Aug 2023 14:30:10 +0200
Message-ID: <CAHVXubjTrGQTCh0paUV9YO-0kbntqLu51FpjAJpfjZHtp-9tCQ@mail.gmail.com>
Subject: Re: [lwn:docs-next 37/49] htmldocs: Warning: Documentation/riscv/boot.rst
 references a file that doesn't exist: Documentation/arm/uefi.rst
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Tue, Aug 15, 2023 at 4:36=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.lwn.net/linux.git docs-next
> head:   90cd0c18573ad0583dec098a586f86d281947eb9
> commit: e0bec22f06641e4a7ccd7fb1f8ed4588839b660b [37/49] Documentation: r=
iscv: Add early boot document
> reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151010=
.JGqiPc9F-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308151010.JGqiPc9F-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Warning: Documentation/riscv/boot.rst references a file that doesn't e=
xist: Documentation/arm/uefi.rst
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Sorry I missed this, I respin another version right now.

Alex
