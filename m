Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EBBCA0EC3
	for <linux-doc@archiver.kernel.org>; Tue, 12 Sep 2023 13:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235239AbjILNRJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Sep 2023 09:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjILNRH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Sep 2023 09:17:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AFC10CB
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 06:17:03 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-273e1aec35aso2760497a91.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1694524622; x=1695129422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74/lXDjAicbAQVpv6HCI5jeqajIVNGavg/gPM8Y5/Jo=;
        b=hRnJK+wFBqJIcfswqBqLspQkjytkccrhGA+4sABGreFmE+9URx+icD78lIE1g/8TsW
         09efceDe0UcHxCSV96PRm+19shG08rXNwgoaPsj0GeOnJWrokumx8Fl7hATbgRvvNRlq
         UIQNC4iaLpuulfDvyf9BRM/DvTsr9ANOJxGvNmp0J6jur9CkJXPCrReIgZUmnJl12vPM
         GH6GdftVagDt3GhRObsgNxqLkA/VYTPix/lfsj5bttOg8b9Bv2WH/kNruFpQEP6rWzAm
         Ts3hidBk0J8QXKLE3fQWwzQeT63AdmsT+FQMmd/m/v4ZB/GT3j1teR1PspcdVeSXuf4j
         IMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694524622; x=1695129422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74/lXDjAicbAQVpv6HCI5jeqajIVNGavg/gPM8Y5/Jo=;
        b=OIZMVFNviCY5B+RD0ddHnOwFD4M/On4S65QBDVEf0LwNP1FeGtTgLZ1DmRkUDnt6TQ
         LRqp91KHdQEYtjkW1YhsOvgmYQgNZS9/5/J88gmPhMxwOfudjHvR2iw577qzRNvGd/6e
         4B8HgoJu0/bQqXVNO0o0oIY9pcgoyVU+Geo6V7YTP5JoLm0xj7tW3MD2aEk1Kdld7c90
         C2S84F1leEHztcd8ZqClAtdVD8m4+3dTXn6Z+DYQ0Pz6cK8mYeuGjLmoUyBEeKVo3ok9
         +nDKLgBxFOSS/I8vxw2S7INjQzYJ0+ORL4nRtIYho3Isni78zltodKYRFvFoXYQov7Ha
         QF2A==
X-Gm-Message-State: AOJu0YxhvF94A51nXWXIK6oQ/RsFlbnvdnlROC0hvrmZcv0KWgq5CGRT
        o9s1lZeubH0ULWAHWFN8ROlpGh3Pjkb/rXDLbPz3Jg==
X-Google-Smtp-Source: AGHT+IERwDFvK750zia0Sae/chWY8QEXD4kOdOHvlRSTQo34xsLlidVO5fUIkgz4yvPkVtnGdXKIiS6fw+3sN/KQfUM=
X-Received: by 2002:a17:90a:aa85:b0:268:1e95:4e25 with SMTP id
 l5-20020a17090aaa8500b002681e954e25mr10043598pjq.17.1694524622460; Tue, 12
 Sep 2023 06:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com> <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com> <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com> <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org> <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
 <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org> <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
In-Reply-To: <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Tue, 12 Sep 2023 14:16:41 +0100
Message-ID: <CAPj87rP1sw49Z0HdPhUa-=kDp166RqiuhC9rL+Ef9hpwPD5+JA@mail.gmail.com>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To:     Maxime Ripard <mripard@kernel.org>
Cc:     =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
        emma@anholt.net, linux-doc@vger.kernel.org,
        vignesh.raman@collabora.com, dri-devel@lists.freedesktop.org,
        alyssa@rosenzweig.io, jbrunet@baylibre.com, robdclark@google.com,
        corbet@lwn.net, khilman@baylibre.com,
        sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
        linux-rockchip@lists.infradead.org,
        Daniel Stone <daniels@collabora.com>,
        martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
        Helen Koike <helen.koike@collabora.com>, anholt@google.com,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
        guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Maxime,
Hopefully less mangled formatting this time: turns out Thunderbird +
plain text is utterly unreadable, so that's one less MUA that is
actually usable to send email to kernel lists without getting shouted
at.

On Mon, 11 Sept 2023 at 15:46, Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Sep 11, 2023 at 03:30:55PM +0200, Michel D=C3=A4nzer wrote:
> > > There's in 6.6-rc1 around 240 reported flaky tests. None of them have
> > > any context. That new series hads a few dozens too, without any conte=
xt
> > > either. And there's no mention about that being a plan, or a patch
> > > adding a new policy for all tests going forward.
> >
> > That does sound bad, would need to be raised in review.
> >
> > > Any concern I raised were met with a giant "it worked on Mesa" handwa=
ve
> >
> > Lessons learned from years of experience with big real-world CI
> > systems like this are hardly "handwaving".
>
> Your (and others) experience certainly isn't. It is valuable, welcome,
> and very much appreciated.
>
> However, my questions and concerns being ignored time and time again
> about things like what is the process is going to be like, what is going
> to be tested, who is going to be maintaining that test list, how that
> interacts with stable, how we can possibly audit the flaky tests list,
> etc. have felt like they were being handwaived away.

Sorry it ended up coming across like that. It wasn't the intent.

> I'm not saying that because I disagree, I still do on some, but that's
> fine to some extent. However, most of these issues are not so much an
> infrastructure issue, but a community issue. And I don't even expect a
> perfect solution right now, unlike what you seem to think. But I do
> expect some kind of plan instead of just ignoring that problem.
>
> Like, I had to ask the MT8173 question 3 times in order to get an
> answer, and I'm still not sure what is going to be done to address that
> particular issue.
>
> So, I'm sorry, but I certainly feel like it here.

I don't quite see the same picture from your side though. For example,
my reading of what you've said is that flaky tests are utterly
unacceptable, as are partial runs, and we shouldn't pretend otherwise.
With your concrete example (which is really helpful, so thanks), what
happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testing
until it's perfect, or does MT8173 testing always fail because that
test does?

Both have their downsides. Not doing any testing has the obvious
downside, and means that the driver can get worse until it gets
perfect. Always marking the test as failed means that the test results
are useless: if failure is expected, then red is good. I mean, say
you're contributing a patch to fix some documentation or add a helper
to common code which only v3d uses. The test results come back, and
your branch is failing tests on MT8173, specifically the
hdmi-inject@4k test. What then? Either as a senior contributor you
'know' that's the case, or as a casual contributor you get told 'oh
yeah, don't worry about the test results, they always fail'. Both lead
to the same outcome, which is that no-one pays any attention to the
results, and they get worse.

What we do agree on is that yes, those tests should absolutely be
fixed, and not just swept under the rug. Part of this is having
maintainers actually meaningfully own their test results. For example,
I'm looking at the expectation lists for the Intel gen in my laptop,
and I'm seeing a lot of breakage in blending tests, as well as
dual-display fails which include the resolution of my external
display. I'd expect the Intel driver maintainers to look at them, get
them fixed, and gradually prune those xfails/flakes down towards zero.

If the maintainers don't own it though, then it's not going to get
fixed. And we are exactly where we are today: broken plane blending
and 1440p on KBL, broken EDID injection on MT8173, and broken atomic
commits on stoney. Without stronger action from the maintainers (e.g.
throwing i915 out of the tree until it has 100% pass 100% of the
time), adding testing isn't making the situation better or worse in
and of itself. What it _is_ doing though, is giving really clear
documentation of the status of each driver, and backing that up by
verifying it.

Only maintainers can actually fix the drivers (or the tests tbf). But
doing the testing does let us be really clear to everyone what the
actual state is, and that way people can make informed decisions too.
And the only way we're going to drive the test rate down is by the
subsystem maintainers enforcing it.

Does that make sense on where I'm (and I think a lot of others are) coming =
from?

To answer the other question about 'where are the logs?': some of them
have the failure data in them, others don't. They all should going
forward at least though.

Cheers,
Daniel
