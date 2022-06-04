Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCD5C43334
	for <linux-doc@archiver.kernel.org>; Sat,  4 Jun 2022 08:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiFDINc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Jun 2022 04:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbiFDINb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Jun 2022 04:13:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1669FD9
        for <linux-doc@vger.kernel.org>; Sat,  4 Jun 2022 01:13:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4FCA60BAA
        for <linux-doc@vger.kernel.org>; Sat,  4 Jun 2022 08:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59727C385B8;
        Sat,  4 Jun 2022 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654330409;
        bh=+d9nlzAColr/B/metFDDTwe69clrkjZVgfv0eOShlo4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BV9Ne/fAYrVblH9VikirgvA2OF5/QiAUUM6vcwtexfCwuZGySfoxeaOhBdruUmHsJ
         Jdjje6m1i3T25F7Rp8iU0MLilXVMzfaxsBcuxB9NtmzkbYa4PfMsgHzrpSgypMAsc3
         QYbycDboZzhwinWGuANJNFbcqvBV2i1jpBpoSZoMvj4UPIuD1D3L58NjWlLsu1Ftzw
         sq80YgPcOkmZ7/3H7z/aKX+0rW1ksPwlDQpDHnDDZn1L/qsG+I+f5Ag7VkivUL+KyE
         GqjicqwTXdm1NUNdxplHSAl4EpX6z0eNuBkdzUX1xdatCbggmcDb1nhG6q++RyaHcd
         SKKyDFWEwA6EQ==
Date:   Sat, 4 Jun 2022 09:13:22 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Adam Turner <aaturnerpython@outlook.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <20220604091322.17a2867c@sal.lan>
In-Reply-To: <87bkv9o9e7.fsf@intel.com>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
        <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
        <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
        <87ee05oior.fsf@intel.com>
        <LO3P123MB26814568842CC74EF831288EC2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
        <4f13e688-1b4c-1a8e-7ca5-b2fc6d21263c@gmail.com>
        <87bkv9o9e7.fsf@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 03 Jun 2022 22:05:20 +0300
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Sat, 04 Jun 2022, Akira Yokosawa <akiyks@gmail.com> wrote:
> > [+Cc: Mauro]

Thanks!

> >
> > On Fri, 3 Jun 2022 15:54:33 +0000,
> > Adam Turner wrote: =20
> >>>> No releases will be removed from PyPI, but if pre v3 syntax is still
> >>>> used, Sphinx 6.0 would fail to properly parse it. =20
> >>  =20
> >>> And that's the crux of the problem. From kernel POV I'd very much pre=
fer
> >>> not setting an upper bound for the Sphinx version. I think it's
> >>> important to be able to build the documentation using the latest Sphi=
nx,
> >>> and gradually iron out the inevitable quirks that arise. =20
> >>  =20
> >>> However, if you decide to drop support for pre v3 syntax in Sphinx v6,
> >>> and we decide to stick to being able to use pre v3 Sphinx, we can't m=
ove
> >>> forward to newer versions until we bump the lower bound for the Sphinx
> >>> version to v3+. (Or we need to hack around Sphinx version differences=
 in
> >>> kernel, but I think that would be best avoided.) =20
> >
> > I might not be grasping the full context here, but I think the main scr=
ipt of
> > kernel documentation tool ./scripts/kernel-doc (a perl script) changes =
its
> > behavior depending on the target Sphinx version. =20
>=20
> That doesn't change my opinion that it would be best avoided! ;)

Em Fri, 3 Jun 2022 15:27:18 +0000
Adam Turner <aaturnerpython@outlook.com> escreveu:

> I'm referring to removing support for the "c_allow_pre_v3",=20
> "c_warn_on_allowed_pre_v3", configuration options [1]_, and the=20
> associated support for still parsing the pre v3 syntax in the C=20
> domain [2]_. This means that pre v3 syntax in reStructuredText files
> would not work with Sphinx 6 onwards.

If all that it is scheduled for Sphinx 6 is the removal of the
old C domain, this shouldn't be a problem. The kernel-doc has
long gone support to output tags with both pre and post v3 syntaxes.

We also changed the automarkup plugin to allow using v3 C domain
tags when compiling against pre-v3.

Tests required, of course.

-

=46rom my side, there are two points to consider when changing
the minimal release:

- Supporting a version that can build docs 2x faster sounds
  very interesting;
- it would also be interesting to support the native Sphinx
  version that comes with the latest LTS releases,
  As I suspect that bots may benefit from a long-term distros,
  and use the distro-provided signed packages on servers.

  Looking at LTS, what we have is:

	- RHEL 9.0/CentOS 9.0:
	  https://centos.pkgs.org/9-stream/centos-crb-x86_64/python3-sphinx-latex-=
3.4.3-7.el9.noarch.rpm.html
	  Sphinx 3.4.3
	- Debian 11:
	  Sphinx 3.4.3
	  https://packages.debian.org/bullseye/python3-sphinx
	- Suse 15 SP4:
	  https://scc.suse.com/packages?name=3DSUSE%20Linux%20Enterprise%20Server&=
version=3D15.4&arch=3Dx86_64&query=3Dpython3-sphinx&module=3D
	  Have have both Sphinx 4.2.0 and Sphinx 2.3.1=09

  From LTS perspective, it sounds doable to setup the minimal
  version to 3.4, but we would need to adjust the scripts to
  select a different package on Suse, as calling:

	./scripts/sphinx-pre-install --no-virtualenv

  Would recommend installing python3-sphinx package there,
  meaning Sphinx 2.3.1.

So, IMO, we have a couple of alternatives:

1. Change minimal requirement to 2.3:
	- No changes required at sphinx-pre-install's logic;
	- all latest LTS will be supported;
	- pdf will still require a newer version than 2.3.
	- allow "fast builds" with Sphinx < 3;

2. Change minimal requirement to 2.4:
	- no need to check for an specific version for PDF;
	- allow "fast builds" using Sphinx < 3;
	- Changes needed at sphinx-pre-install on Suse logic;

3. Change minimal requirement to 3.4:
	- We can drop backward-compatible logic from kernel-doc
	  and automarkup;
	- all latest LTS will be supported;
	- Changes needed at sphinx-pre-install on Suse logic;
	- No "fast build" suing Sphinx < 3.

On a side note, while Kernel documentation builds with 3.0,
it is not really properly supported, as there are troubles
on C domain there (lots of warnings and broken cross references
are generated there). So, I would avoid setting the minimal=20
requirement to 3.0.

Regards,
Mauro
