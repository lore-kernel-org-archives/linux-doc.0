Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD58C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 30 Nov 2021 19:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235527AbhK3T7U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Nov 2021 14:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbhK3T7T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 14:59:19 -0500
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D4AC061574
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 11:56:00 -0800 (PST)
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
        by smtp2-g21.free.fr (Postfix) with ESMTP id 5224D20039C;
        Tue, 30 Nov 2021 20:55:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1638302158;
        bh=sezEjJHtBVF7YDdC0TgseJ5pryDT4r9vv+QK4tgEo8Q=;
        h=Date:From:To:Cc:In-Reply-To:Subject:From;
        b=h82Lkhs4kEDZ/GJhQ7Ql2KAjOv9W8Zb3JON4DJ+LW2+lzgUl9d+xj9d+JT+Ej1RIF
         366bAqpKTEsHWIBKQlg3f1bLxq5/QLt0rCI0asbe4q+0Y5rf9gV86GZXljoxV3mN6U
         aNWIquVFHl0AAAEFwJQbKC3Qilon4ehEitOMVrszPzIsvglpFQxqSwFbdaWYoj95Q+
         cNkUKXZ7/u3VC20SYSob4w9PzXYp233RyB6Ir0NhP4hKZu5zpMqk3df+bPKZXAy0cI
         gUlC+QBS/w5r8KDANmqFnGQU/0aFrLWoWjF5jeME4hP58ZX9HahBO9AbMCWBvdeVk2
         8ngZeecSimH7w==
Date:   Tue, 30 Nov 2021 20:55:58 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Cc:     Harry Wentland <Harry.Wentland@amd.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mark Yacoub <markyacoub@chromium.org>,
        Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Roman Li <roman.li@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Roman Gilg <subdiff@gmail.com>,
        Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        nicholas choi <nicholas.choi@amd.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>,
        Alex Deucher <alexdeucher@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Message-ID: <1893256771.1756365.1638302158271.JavaMail.root@zimbra39-e7>
In-Reply-To: <3bfcb46a-6d7c-fb11-4b78-d068a620baa3@amd.com>
Subject: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [88.120.44.86]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - FF3.0 (Linux)/7.2.0-GA2598)
X-Authenticated-User: ydirson@free.fr
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



----- Mail original -----
> De: "Rodrigo Siqueira Jordao" <rjordrigo@amd.com>
> =C3=80: ydirson@free.fr, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, "=
Christian K=C3=B6nig" <christian.koenig@amd.com>,
> "Alex Deucher" <alexander.deucher@amd.com>
> Cc: "Harry Wentland" <Harry.Wentland@amd.com>, "Linux Doc Mailing List" <=
linux-doc@vger.kernel.org>, "Mark Yacoub"
> <markyacoub@chromium.org>, "Michel D=C3=A4nzer" <michel@daenzer.net>, "Ba=
s Nieuwenhuizen" <bas@basnieuwenhuizen.nl>,
> "Roman Li" <roman.li@amd.com>, "amd-gfx list" <amd-gfx@lists.freedesktop.=
org>, "Roman Gilg" <subdiff@gmail.com>,
> "Marek Ol=C5=A1=C3=A1k" <marek.olsak@amd.com>, "Pekka Paalanen" <ppaalane=
n@gmail.com>, "Aurabindo Pillai"
> <aurabindo.pillai@amd.com>, "nicholas choi" <nicholas.choi@amd.com>, "Mal=
ing list - DRI developers"
> <dri-devel@lists.freedesktop.org>, "Simon Ser" <contact@emersion.fr>, "Al=
ex Deucher" <alexdeucher@gmail.com>, "Sean
> Paul" <seanpaul@chromium.org>, "Qingqing Zhuo" <qingqing.zhuo@amd.com>, "=
Bhawanpreet Lakha"
> <bhawanpreet.lakha@amd.com>, "Nicholas Kazlauskas" <nicholas.kazlauskas@a=
md.com>
> Envoy=C3=A9: Mardi 30 Novembre 2021 16:53:55
> Objet: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
>=20
>=20
>=20
> On 2021-11-29 3:48 p.m., ydirson@free.fr wrote:
> > Hi Rodrigo,
> >=20
> > That will really be helpful!
> >=20
> > I know drawing the line is a difficult problem (and can even make
> > things
> > harder when searching), but maybe it would make sense to keep
> > generic
> > acronyms not specific to amdgpu in a separate list.  I bet a number
> > of
> > them would be useful in the scope of other drm drivers (e.g. CRTC,
> > DCC,
> > MST), and some are not restricted to the drm subsystem at all (e.g.
> > FEC,
> > LUT), but still have value as not necessarily easy to look up.
> >=20
> > Maybe "DC glossary" should just be "Glossary", since quite some
> > entries
> > help to read adm/amdgpu/ too.  Which brings me to the result of my
> > recent
> > searches as suggested entries:
> >=20
> >   KIQ (Kernel Interface Queue), MQD (memory queue descriptor), HQD
> >   (hardware
> >   queue descriptor), EOP (still no clue :)
> >=20
> > Maybe some more specific ones just to be spelled out in clear where
> > they
> > are used ?  KCQ (compute queue?), KGQ (gfx queue?)
> >=20
> > More suggestions inlined.
> >=20
> > Best regards,
> >=20
>=20
> Hi all,
>=20
> I'll address all the highlighted problems in the V2. Thanks a lot for
> all the feedback.
>=20
> Yann,
> For the generic acronyms, how about keeping it in this patch for now?
> After it gets merged, I can prepare a new documentation patch that
> creates a glossary for DRM where I move the generic acronyms to the
> DRM
> documentation. I prefer this approach to keep the improvement small
> and
> manageable.

Sure, especially as the Right Solution(tm) is not necessarily obvious :)

One thing I thought about is that a context could be specified together
with terms.  Like "BPP (graphics)", "FEC (CS)", "DMCUB (amdgpu)".  Well,
"CS" may not be a good choice but you get the idea: that would keep all
terms together and keep it easy for the reader.

That way it could be easily be generalized at some point by just moving
it to a generic kernel level - provided the solution suits the doc
community at large.

Best regards,
--=20
Yann


