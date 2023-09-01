Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F5CCA0FE6
	for <linux-doc@archiver.kernel.org>; Fri,  1 Sep 2023 09:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbjIAJ00 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Sep 2023 05:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjIAJ0Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Sep 2023 05:26:24 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15E4E7B
        for <linux-doc@vger.kernel.org>; Fri,  1 Sep 2023 02:26:16 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so2312995a12.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Sep 2023 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693560375; x=1694165175; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aFmHZTLlIQkbBzornOPgrV8aRoSDhdsHZyavX+Ey+So=;
        b=pDOoB3x7CGw2lSTd8GNalwzBTvTGbwL9LTXG6s8GxmVmaI033Xad3jOmjK2IczNUVJ
         2JpkfcPVPysUuinPcuBMjY0GdB7HF+GRLJr7zVGXGM0LF935SN4HwO6eoJSFOk6jtJbP
         HBOPhD/fTEHKBqNeZCDhirfflxPjFDgv1hv9Avw7is5GFRGk2re++IS9WddZfOm60fY/
         ssis1Gfby9OTIfBnoqz7/u+/yyxIYNK12B8cZFZotyoOoZhc4rFUAMQv0xxnLN9lphjZ
         bJZJUkxgOuB2EhcqP6RZ7B+yfRdmqBGsTZNVdcYyMUN8N9llQ/tVyaMXfNXjSqaFxGCH
         hGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693560375; x=1694165175;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFmHZTLlIQkbBzornOPgrV8aRoSDhdsHZyavX+Ey+So=;
        b=mAa2JKVBI5xO1/aFmTQHnWTXZsUcQUn/UiiRtS6KuELyLjX2wR/1Y7N2sS13DHc/3b
         Ic82Z83l1NoXa8ZEzrYFJgOG8CuNdYSYwW7u7qCZP19W8wgUitn8yEraUz+VARgliwD4
         tXb5auo9uhatPqtWnr5n5MKMYRyr8+K9isJ2jPVVZSZB1AyRMbyGPCUnzXoxdUw5uBBQ
         s//NiLRpDD/kR/d7kwS/9eM+zF/VYM789RDNo75mk7n/SQUN8mISwajIYL1ByHceddGZ
         AW6M97QAS3O69ft9R98RfpRC5Udiy2zlkbrTn2W9aulJfVKcegj4t+QiHkMoGP9EOws5
         ciew==
X-Gm-Message-State: AOJu0Ywx4/y2mISWVNxxwOR6SnKj91gqervft/Imlp3VZSb5egBOeX0w
        c0lQtLqhhfRw8xBwQKfxPNpr7MADTzM=
X-Google-Smtp-Source: AGHT+IHehlB4aC9ZcuCGZ1KNjx6dilk4rgHXOqoik7CTyzTtojx4tshpzbkwbfQmLuov5rA7oLztzw==
X-Received: by 2002:a17:906:2249:b0:9a1:da9a:f1c5 with SMTP id 9-20020a170906224900b009a1da9af1c5mr1163975ejr.45.1693560375260;
        Fri, 01 Sep 2023 02:26:15 -0700 (PDT)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709060f5500b009a1be9c29d7sm1754642ejj.179.2023.09.01.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 02:26:14 -0700 (PDT)
Message-ID: <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
From:   Eduard Zingerman <eddyz87@gmail.com>
To:     Daniel Borkmann <daniel@iogearbox.net>,
        kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Date:   Fri, 01 Sep 2023 12:26:13 +0300
In-Reply-To: <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
References: <202309010804.G3MpXo59-lkp@intel.com>
         <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> Hi Eduard,
>=20
> On 9/1/23 2:05 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git mas=
ter
> > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add d=
escription for CO-RE relocations
> > reproduce: (https://download.01.org/0day-ci/archive/20230901/2023090108=
04.G3MpXo59-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> > > > Warning: Documentation/bpf/btf.rst references a file that doesn't e=
xist: Documentation/bpf/llvm_reloc
> > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that do=
esn't exist: Documentation/bpf/btf
>=20
> Could you send a follow-up fix for bpf tree?

Hi Daniel,

Will send the fix shortly. Strangely, I did check this syntax locally
before sending the original patch, and had no warnings reported.

Thanks,
Eduard
