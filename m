Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FE7C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 14:41:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E36DD6105A
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 14:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhEHOmw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 10:42:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhEHOmw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 8 May 2021 10:42:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E603D61057;
        Sat,  8 May 2021 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620484910;
        bh=9xoaZBLFUC9ZMeKB9X6iYWPYrRpSQYLmnkZQUSv6yME=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PFrYXS9wF8sWo01kfeT6Eq9+7vdTxliPWtJCRnDYq/880WQWtNA7IVwIgU5VfSpRZ
         jDIEECwhJuyeiVq2wALaRUVXPsJwsbiWhr51rDNoObvj4yFTu7KrXF5uzhb4UCq0iH
         H+O7dafrR6A01/HiqBVGc+YWTBiaHo5nZ/iG8aCSJ3/2+el4sJ9R95i25cY2YRxUMC
         B+GeEkeUrDopgKbYMJDoH55z6un6iAs03yloOfuzmlA3LnD2sFc+d3mabfUnC8x0SB
         hQzmo44IxG7831sDa+XBI6wjvLBiFnp0iy5qDmH/uoTrSnIq2+RJiFx1Rk1gaq9Mk3
         U5T0A2R0VIE4g==
Date:   Sat, 8 May 2021 16:41:45 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210508164145.26f7b1e0@coco.lan>
In-Reply-To: <20210508104157.GC12700@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506192756.2a2cc273@coco.lan>
        <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
        <20210506180842.GD388843@casper.infradead.org>
        <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
        <20210507083924.7b8ec1fe@coco.lan>
        <20210508112205.41946ac7@coco.lan>
        <20210508104157.GC12700@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Sat, 8 May 2021 12:41:57 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:

> On Sat, May 08, 2021 at 11:22:05AM +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 7 May 2021 08:39:24 +0200
> > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >  =20
> > > Em Thu, 6 May 2021 14:21:01 -0700
> > > Randy Dunlap <rdunlap@infradead.org> escreveu:
> > >  =20
> > > > On 5/6/21 11:08 AM, Matthew Wilcox wrote:   =20
> > > > > On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:    =
 =20
> > > > >> I have been going thru some of the Documentation/ files...
> > > > >>
> > > > >> Why do several of the files begin with
> > > > >> (hex) ef bb bf    followed by "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D"
> > > > >> for a heading, instead of just "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D".
> > > > >> See e.g. Documentation/timers/no_hz.rst.     =20
> > >=20
> > > No idea! It seems that the text editor I used on that time added
> > > it for whatever reason. =20
> >  =20
> > > I'll prepare a patch fixing it. Some care should be taken, however, as
> > > it has two places where UTF-8 chars should be used[2]. =20
> >=20
> > Ok, I did a small script in order to check what special chars we
> > currently have (next-20210507) at Documentation/ excluding the
> > translations.
> >=20
> > Based on my script results, we have those groups:
> >=20
> > 1. Latin accented characters:
> > 	- U+00c7 (LATIN CAPITAL LETTER C WITH CEDILLA) (=C3=87)
> > 	- U+00df (LATIN SMALL LETTER SHARP S) (=C3=9F)
> > 	- U+00e1 (LATIN SMALL LETTER A WITH ACUTE) (=C3=A1)
> > 	- U+00e4 (LATIN SMALL LETTER A WITH DIAERESIS) (=C3=A4)
> > 	- U+00e6 (LATIN SMALL LETTER AE) (=C3=A6)
> > 	- U+00e7 (LATIN SMALL LETTER C WITH CEDILLA) (=C3=A7)
> > 	- U+00e9 (LATIN SMALL LETTER E WITH ACUTE) (=C3=A9)
> > 	- U+00ea (LATIN SMALL LETTER E WITH CIRCUMFLEX) (=C3=AA)
> > 	- U+00eb (LATIN SMALL LETTER E WITH DIAERESIS) (=C3=AB)
> > 	- U+00f3 (LATIN SMALL LETTER O WITH ACUTE) (=C3=B3)
> > 	- U+00f4 (LATIN SMALL LETTER O WITH CIRCUMFLEX) (=C3=B4)
> > 	- U+00f6 (LATIN SMALL LETTER O WITH DIAERESIS) (=C3=B6)
> > 	- U+00f8 (LATIN SMALL LETTER O WITH STROKE) (=C3=B8)
> > 	- U+00fc (LATIN SMALL LETTER U WITH DIAERESIS) (=C3=BC)
> > 	- U+011f (LATIN SMALL LETTER G WITH BREVE) (=C4=9F)
> > 	- U+0142 (LATIN SMALL LETTER L WITH STROKE) (=C5=82)
> >=20
> > 2. symbols:
> > 	- U+00a9 (COPYRIGHT SIGN) (=C2=A9)
> > 	- U+2122 (TRADE MARK SIGN) (=E2=84=A2)
> > 	- U+00ae (REGISTERED SIGN) (=C2=AE)
> > 	- U+00b0 (DEGREE SIGN) (=C2=B0)
> > 	- U+00b1 (PLUS-MINUS SIGN) (=C2=B1)
> > 	- U+00b2 (SUPERSCRIPT TWO) (=C2=B2)
> > 	- U+00b5 (MICRO SIGN) (=C2=B5)
> > 	- U+00bd (VULGAR FRACTION ONE HALF) (=C2=BD)
> > 	- U+2026 (HORIZONTAL ELLIPSIS) (=E2=80=A6)
> >=20
> > 3. arrows:
> > 	- U+2191 (UPWARDS ARROW) (=E2=86=91)
> > 	- U+2192 (RIGHTWARDS ARROW) (=E2=86=92)
> > 	- U+2193 (DOWNWARDS ARROW) (=E2=86=93)
> > 	- U+2b0d (UP DOWN BLACK ARROW) (=E2=AC=8D)
> >=20
> > 4. box drawings:
> > 	- U+2500 (BOX DRAWINGS LIGHT HORIZONTAL) (=E2=94=80)
> > 	- U+2502 (BOX DRAWINGS LIGHT VERTICAL) (=E2=94=82)
> > 	- U+2514 (BOX DRAWINGS LIGHT UP AND RIGHT) (=E2=94=94)
> > 	- U+251c (BOX DRAWINGS LIGHT VERTICAL AND RIGHT) (=E2=94=9C)
> >=20
> > 5. math symbols:
> > 	- U+00b7 (MIDDLE DOT) (=C2=B7)
> > 	- U+00d7 (MULTIPLICATION SIGN) (=C3=97)
> > 	- U+2212 (MINUS SIGN) (=E2=88=92)
> > 	- U+2217 (ASTERISK OPERATOR) (=E2=88=97)
> > 	- U+223c (TILDE OPERATOR) (=E2=88=BC)
> > 	- U+2264 (LESS-THAN OR EQUAL TO) (=E2=89=A4)
> > 	- U+2265 (GREATER-THAN OR EQUAL TO) (=E2=89=A5)
> > 	- U+27e8 (MATHEMATICAL LEFT ANGLE BRACKET) (=E2=9F=A8)
> > 	- U+27e9 (MATHEMATICAL RIGHT ANGLE BRACKET) (=E2=9F=A9)
> > 	- U+00ac (NOT SIGN) (=C2=AC) =20
>=20

Hi Michal,

> Clearly his is supposed to be ASCII tilde:
> Documentation/cdrom/cdrom-standard.rst: if (cdo->capability & =E2=88=BCcd=
i->mask & CDC _=E2=9F=A8capability=E2=9F=A9)

Yes, for this specific file, iconv //translit should solve everything.

In the case of cdrom-standard, those came from the LaTeX conversion.
>=20
> Use of =C2=AC is also very dubious in documentation (in fonts it is under=
standable):
> Documentation/ABI/obsolete/sysfs-kernel-fadump_registered:This ABI is ren=
amed and moved to a new location /sys/kernel/fadump/registered.=C2=AC
> Documentation/ABI/obsolete/sysfs-kernel-fadump_release_mem:This ABI is re=
named and moved to a new location /sys/kernel/fadump/release_mem.=C2=AC


> Documentation/powerpc/transactional_memory.rst:  if (MSR 29:31 =C2=AC =3D=
 0b010 | SRR1 29:31 =C2=AC =3D 0b000) then

Yeah, this should probably be better written as:

  if (MSR 29:31 =3D=3D 0b010 | SRR1 29:31 =3D=3D 0b000) then

> The use of =E2=88=92 is rare can could be replaed with ASCII hyphen-minus=
 entirely
> without making the text harder to understand:
>=20
> Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml:          0: RE=
FIN1(+)/REFIN1(=E2=88=92).
> Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml:          1: RE=
FIN2(+)/REFIN2(=E2=88=92).
> Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml:      External =
reference applied between the P1/REFIN2(+) and P0/REFIN2(=E2=88=92) pins.
> Documentation/scheduler/sched-deadline.rst:     ((M =E2=88=92 1) =C2=B7 W=
CET_max =E2=88=92 WCET_min)/(M =E2=88=92 (M =E2=88=92 2) =C2=B7 U_max) + WC=
ET_max
> drivers/gpu/drm/drm_color_mgmt.c: * - range: [-2^2, 2^2 - 2^=E2=88=9215]
> drivers/iio/light/tsl2583.c:                     * sheet (TAOS134 =E2=88=
=92 MARCH 2011):
> drivers/staging/iio/adc/ad7280a.c:       *                         (Numbe=
r of Conversions per Part)) =E2=88=92
> sound/soc/codecs/sgtl5000.c: * is the array index and the following formu=
la: 10^((idx=E2=88=9215)/40) * 100

Agreed.

> Asterisk operator is clearly meant to be ASCII:
> Documentation/cdrom/cdrom-standard.rst:         NULL,                   /=
=E2=88=97 lseek =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         block _read ,           /=
=E2=88=97 read=E2=80=94general block-dev read =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         block _write,           /=
=E2=88=97 write=E2=80=94general block-dev write =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         NULL,                   /=
=E2=88=97 readdir =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         NULL,                   /=
=E2=88=97 select =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         cdrom_ioctl,            /=
=E2=88=97 ioctl =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         NULL,                   /=
=E2=88=97 mmap =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         cdrom_open,             /=
=E2=88=97 open =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         cdrom_release,          /=
=E2=88=97 release =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         NULL,                   /=
=E2=88=97 fsync =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         NULL,                   /=
=E2=88=97 fasync =E2=88=97/
> Documentation/cdrom/cdrom-standard.rst:         NULL                    /=
=E2=88=97 revalidate =E2=88=97/
> Documentation/filesystems/ext4/blockgroup.rst:filesystem size to 2^21 =E2=
=88=97 2^27 =3D 2^48bytes or 256TiB.
>=20
> There is only one place where =E2=9F=A8=E2=9F=A9 is used which is very du=
bious:
> Documentation/cdrom/cdrom-standard.rst: if (cdo->capability & =E2=88=BCcd=
i->mask & CDC _=E2=9F=A8capability=E2=9F=A9) ...

Yeah. Again, this was due to LaTeX to text conversion.

> The middle dot is mostly used in mathmatical formulas that would be
> unintelligible otherwise but there are a few odd uses:
> Documentation/ABI/testing/sysfs-module:KernelVersion:=C2=BB=C2=B73.3
> Documentation/ABI/testing/sysfs-module:KernelVersion:=C2=BB=C2=B73.3
> Documentation/devicetree/bindings/clock/qcom,rpmcc.txt:                 "=
qcom,rpmcc-msm8992",=C2=B7"qcom,rpmcc"
> Documentation/devicetree/bindings/clock/qcom,rpmcc.txt:                 "=
qcom,rpmcc-msm8994",=C2=B7"qcom,rpmcc"

Yeah. It sounds that space would be the best replacement there.

> Documentation/translations/zh_CN/kernel-hacking/hacking.rst:    =E9=98=BF=
=E5=88=97=E5=85=8B=E8=B0=A2=C2=B7=E5=BA=93=E5=85=B9=E6=B6=85=E4=BD=90=E5=A4=
=AB=E4=BA=AB=E7=94=A8=E7=9A=84=E7=B3=9F=E7=B3=95=E4=BC=8F=E7=89=B9=E5=8A=A0=
=E6=9C=89=E5=85=B3=E3=80=82
> Documentation/translations/zh_CN/process/howto.rst:   =E3=80=8AC=E7=A8=8B=
=E5=BA=8F=E8=AE=BE=E8=AE=A1=E8=AF=AD=E8=A8=80=EF=BC=88=E7=AC=AC2=E7=89=88=
=C2=B7=E6=96=B0=E7=89=88=EF=BC=89=E3=80=8B=EF=BC=88=E5=BE=90=E5=AE=9D=E6=96=
=87 =E6=9D=8E=E5=BF=97 =E8=AF=91=EF=BC=89[=E6=9C=BA=E6=A2=B0=E5=B7=A5=E4=B8=
=9A=E5=87=BA=E7=89=88=E7=A4=BE]
> Documentation/translations/zh_CN/process/management-style.rst:.. [#cnf2] =
=E4=BF=9D=E7=BD=97=C2=B7=E8=A5=BF=E8=92=99=E6=BC=94=E5=94=B1=E4=BA=86=E2=80=
=9C=E7=A6=BB=E5=BC=80=E7=88=B1=E4=BA=BA=E7=9A=8450=E7=A7=8D=E6=96=B9=E6=B3=
=95=E2=80=9D=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=9D=A6=E7=8E=87=E5=9C=B0=E8=AF=B4=
=EF=BC=8C=E2=80=9C=E5=91=8A=E8=AF=89=E5=BC=80=E5=8F=91=E8=80=85

I wouldn't touch translations.

> The =C3=97 =E2=89=A4 and =E2=89=A5 uses look fine.

Agreed.

Thanks for double-checking those. I'll address them.

In the mean time, I'm already preparing a patch series addressing
the issues inside documentation, using some scripting to avoid
manual mistakes:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Dfix_utf8

(patch series is not 100% yet... some adjustments are still
needed on some places).

Thanks,
Mauro
