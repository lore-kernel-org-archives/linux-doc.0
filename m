Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF18CA0FE6
	for <linux-doc@archiver.kernel.org>; Fri,  1 Sep 2023 12:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344496AbjIAM11 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Sep 2023 08:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242802AbjIAM10 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Sep 2023 08:27:26 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04553E7E
        for <linux-doc@vger.kernel.org>; Fri,  1 Sep 2023 05:27:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52a069edca6so2516707a12.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Sep 2023 05:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693571241; x=1694176041; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sgI0xbxYTnIozBg6qR2i6OaxrBj+2f5KxhMrbzKOc7A=;
        b=ofwzxMBUlcnuRLBq1c9CAKDP4oOVJxe+FFMqA2P2lJSeAZRLuGNQsj0exp6lvg7K7y
         tX2ZbtleM5CqHeHvT6lraP3vOF8niXjET3GHNNTFGDfEiEJAZs0zdIT0f6QjHjJAOqMr
         1tWBEnJGnlJIb99fjKxaEUaNNmWGOovttCK1TFjlyVkd7X+reU7rnOREQilc1eCg5W8d
         l02xzYv4wLZWiegFX845O8bqh/uXF/rrQnDEo9Shs7D93hyPxk05evxxmf5mDV9GLPo8
         kdOKuAt3IAKptcIdrVuBWE023EsKQUOfA5UNKCbksXB69CmeUE3Z+5xr38S4Mt53TJGX
         o5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693571241; x=1694176041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgI0xbxYTnIozBg6qR2i6OaxrBj+2f5KxhMrbzKOc7A=;
        b=IUkMrql9mhxsUNv/aIqpbyoBFouzQ3Ppov4Et+zplKKkpMmwo+KY6FRKnbj93pQqF+
         zE7IczHH32dXIwvaMN6aw92e9IeFcCff/H1wWwbLdwi+0MT16vPOec1jwa0Ft9i/eSEG
         r0x1H5ShM6EgYkhKiKLEfG3t3aIUEa9fxOHvnKWqZ8aAuP+IgSY2/8yrwDt+06RwBM2d
         48BfrBlxlE3Uan9p1iq7siG/gefdtQ90FWb5aCncI6jrvkw8cKzaOMscBxXP9BRckkUO
         XnkW4XHC9Z4TKAieHG0dXx3BcGa/iEzGCS+c3tDcuNYSk/DAgm4lWmxeNJJWSZUBRHUX
         gcfg==
X-Gm-Message-State: AOJu0YxBGqQDadsScbRQGp6HW6K4bpB5VqWZUbursP9KB9kTSlO2PsVL
        FPP8XjvLpwzl1act2xgleWU=
X-Google-Smtp-Source: AGHT+IGf6+KepRN6d8ZuMSkWsAknNYyFjt2PjOo3jINVqEJTPxMtvKEQcwOBAz2aTmreRqsuYuyn1g==
X-Received: by 2002:a05:6402:1518:b0:51e:309:2e11 with SMTP id f24-20020a056402151800b0051e03092e11mr2067183edw.36.1693571241367;
        Fri, 01 Sep 2023 05:27:21 -0700 (PDT)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id w4-20020aa7da44000000b0052241b8fd0bsm2002475eds.29.2023.09.01.05.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 05:27:20 -0700 (PDT)
Message-ID: <d4c9c399724d2465945d432ce658ff2d9baa296f.camel@gmail.com>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
From:   Eduard Zingerman <eddyz87@gmail.com>
To:     Philip Li <philip.li@intel.com>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        kernel test robot <lkp@intel.com>,
        oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Date:   Fri, 01 Sep 2023 15:27:19 +0300
In-Reply-To: <ZPHXqAUX6aLXp9Dy@rli9-mobl>
References: <202309010804.G3MpXo59-lkp@intel.com>
         <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
         <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
         <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
         <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
         <86cd932cd5a6ecf44b3d4dfd2b9446bd721d9e78.camel@gmail.com>
         <ZPHXqAUX6aLXp9Dy@rli9-mobl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2023-09-01 at 20:23 +0800, Philip Li wrote:
> On Fri, Sep 01, 2023 at 02:48:26PM +0300, Eduard Zingerman wrote:
> > On Fri, 2023-09-01 at 13:22 +0200, Daniel Borkmann wrote:
> > > On 9/1/23 1:18 PM, Eduard Zingerman wrote:
> > > > On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> > > > > On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > > > > > Hi Eduard,
> > > > > >=20
> > > > > > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/b=
pf.git master
> > > > > > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > > > > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/=
bpf: Add description for CO-RE relocations
> > > > > > > reproduce: (https://download.01.org/0day-ci/archive/20230901/=
202309010804.G3MpXo59-lkp@intel.com/reproduce)
> > > > > > >=20
> > > > > > > If you fix the issue in a separate patch/commit (i.e. not jus=
t a new version of
> > > > > > > the same patch/commit), kindly add following tags
> > > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.=
G3MpXo59-lkp@intel.com/
> > > > > > >=20
> > > > > > > All warnings (new ones prefixed by >>):
> > > > > > >=20
> > > > > > > > > Warning: Documentation/bpf/btf.rst references a file that=
 doesn't exist: Documentation/bpf/llvm_reloc
> > > > > > > > > Warning: Documentation/bpf/llvm_reloc.rst references a fi=
le that doesn't exist: Documentation/bpf/btf
> > > > > >=20
> > > > > > Could you send a follow-up fix for bpf tree?
> > > > >=20
> > > > > Hi Daniel,
> > > > >=20
> > > > > Will send the fix shortly. Strangely, I did check this syntax loc=
ally
> > > > > before sending the original patch, and had no warnings reported.
> > > >=20
> > > > I followed reproducing instructions but can't trigger this warning,
> > > > tried several sphinx versions:
> > > > - 1.7.9
> > > > - 2.4.4
> > > > - 4.3.2
> > > >=20
> > > > I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/b=
tf'
> > > > labels from the documents (and these are link labels, not actual
> > > > links), but it looks like I don't have a way to check the results i=
n a
> > > > way compatible with test robot.
> > >=20
> > > Strange, perhaps LKP folks could chime in and provide some more guida=
nce e.g.
> > > wrt Sphinx version.
>=20
> sorry for late info, this one is using 2.4.4 sphinx, the full make comman=
d is
> like
>=20
> 	make W=3D1 --keep-going HOSTCC=3Dgcc-12 CC=3Dgcc-12 -j32 ARCH=3Dx86_64 S=
PHINXOPTS=3D-j1 htmldocs=09

Hi Philip,

Thanks for info, I'll keep 2.4.4 locally to be in sync with test robot.
For some reason script/documentation-file-ref-check (which reports
this warning) did run for me until after I compiled the kernel.
Probably some issue on my side.

Thanks,
Eduard

>=20
> >=20
> > ...sigh... I rebuilt the kernel and all of a sudden warnings are shown.
> > Sorry of all the noise, will send the fix soon.
> >=20
> >=20

