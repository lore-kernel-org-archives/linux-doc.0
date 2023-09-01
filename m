Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B60DCA0FE6
	for <linux-doc@archiver.kernel.org>; Fri,  1 Sep 2023 11:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbjIALSx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Sep 2023 07:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235165AbjIALSw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Sep 2023 07:18:52 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F151A8
        for <linux-doc@vger.kernel.org>; Fri,  1 Sep 2023 04:18:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso2411015a12.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Sep 2023 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693567127; x=1694171927; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OKUKkscMbo2sHkOR54IFbAf9unUVXEKFng+dXrwZ0uc=;
        b=oGaJ2jX++DUcKx9ukTj4lX6zRLwa5i1lHA0RCht4MGafc4KFhphlru+BEMWzvA6fiD
         FB7tVURifrYRGtas1ZoZoYylnPAb1EVBf6qxoyo/UxBfMiF0JlXCIdhPlW8qDQagXuta
         6hhH/66J1+RuwIdTS+JcO5sk9IfpS0u8MftcL6n9h6iRLRoH+paH59uNLvN82Ue5vQEa
         O/ghtxcqu67jQ+JKH3VZQ4ryGg6dfaog2g+otqdA/RXCcJhgvN+fMQwvbrauSoFJrrQx
         zR9gxmM8XpLvrB6ggdocSAnjMw6tpLZLmKiiCb7qRkPWvGgn9K2uYuIWoH86Z3G+eFnb
         lrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693567127; x=1694171927;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKUKkscMbo2sHkOR54IFbAf9unUVXEKFng+dXrwZ0uc=;
        b=bAtG2+W/ZlDMZxzZ5COshQ2mdtvlLRM+IWKAvz5lJh1Dcr/Q3U5w65vrZ1C+Ixdayy
         EMbB4BsXukoS5E1GKII7824FI+hbFHGQankFhRqD0CruNkcCCDF0YDuxJPIIA0hFeTJB
         jBJq3nX/qENzUiUGAWRT1Cd7qTWaGiXZeLK2n4DQN0tsHPc1sBElMDQjExvoAYL8Ub81
         ssJObs6cgoh5NgPmkYz33RrjuyANm0IYrqB7Yf3K8Pngugl+Q+5pSvc4Z0Ert+PlFBl4
         dJT07563lS+Z5CfayjA086LPNZSHhX4eLXO8BP4tPvPd0nP12AteokF8geRjefm1cQ2B
         Ootw==
X-Gm-Message-State: AOJu0YyEMpwHIn99R1CFqO19Bnr2gNOQjKLYVPV/XtcAIV4s7b7eeEmX
        Du8LPlnsKQV7v1Pk1dzndQU=
X-Google-Smtp-Source: AGHT+IG+Zbe9r5mysEIrYUr3UOXcmH2XzJhLI9upk37KkQ9CZqt8ivRVPRxY96SxINk75tUMyLGPLA==
X-Received: by 2002:a50:fb17:0:b0:522:2ce0:d80a with SMTP id d23-20020a50fb17000000b005222ce0d80amr1627609edq.35.1693567127342;
        Fri, 01 Sep 2023 04:18:47 -0700 (PDT)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7dccd000000b005256e0797acsm1951524edu.37.2023.09.01.04.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:18:46 -0700 (PDT)
Message-ID: <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
From:   Eduard Zingerman <eddyz87@gmail.com>
To:     Daniel Borkmann <daniel@iogearbox.net>,
        kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Date:   Fri, 01 Sep 2023 14:18:45 +0300
In-Reply-To: <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
References: <202309010804.G3MpXo59-lkp@intel.com>
         <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
         <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > Hi Eduard,
> >=20
> > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git m=
aster
> > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add=
 description for CO-RE relocations
> > > reproduce: (https://download.01.org/0day-ci/archive/20230901/20230901=
0804.G3MpXo59-lkp@intel.com/reproduce)
> > >=20
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59=
-lkp@intel.com/
> > >=20
> > > All warnings (new ones prefixed by >>):
> > >=20
> > > > > Warning: Documentation/bpf/btf.rst references a file that doesn't=
 exist: Documentation/bpf/llvm_reloc
> > > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that =
doesn't exist: Documentation/bpf/btf
> >=20
> > Could you send a follow-up fix for bpf tree?
>=20
> Hi Daniel,
>=20
> Will send the fix shortly. Strangely, I did check this syntax locally
> before sending the original patch, and had no warnings reported.

I followed reproducing instructions but can't trigger this warning,
tried several sphinx versions:
- 1.7.9
- 2.4.4
- 4.3.2

I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
labels from the documents (and these are link labels, not actual
links), but it looks like I don't have a way to check the results in a
way compatible with test robot.
