Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B402CEB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 12:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjFZMSw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 08:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjFZMSq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 08:18:46 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35B41711
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 05:18:18 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-40079620a83so433671cf.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687781892; x=1690373892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NL1ZhGwp5p1Bk1jm8YK95c2hrmINT6w/AO1rizscdM=;
        b=2+r78AqfAQbVwe38A471bVTPTRy6Tz06JLOVBp5eRvWTq40ptutz99SDdtYiEBzpn0
         1033/ZvHRvxr4lkU6EiqjUfKLL7wGEVrU41Yii5QKSAzYemeyiODMQYpej9HxjqvUtfd
         GXqCuh0CWkUZ5Lzcw5owTf2s05OAeK6pBfoY2ZhKkr7WNZpSRgE6zbbklgAhR9DD7HM1
         b3flBGLCddXNiXYtHWxZ7IduwRuD6IcREkud6bClQ8nRAJxs2Gev/ybra78jom/y/DBm
         wYcMoLR059DdPKt5Wx5t6ciPLimGdtecNN0s4GsEa7xWiyQUquOyRdazJ42W4sCaaXT+
         4vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687781892; x=1690373892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NL1ZhGwp5p1Bk1jm8YK95c2hrmINT6w/AO1rizscdM=;
        b=lm45Gc8d7/vRKWpiNNuC1q+/Xt4OoEFf9Zh0mEysALwOj/LAyJipC6srgabNWnesiy
         X2LIpHWg3Cw1M77r5XizK+qL5fMnH4b/gOxD76cB/5AK9TS/2AvaBFdleDEuWngeRlMz
         IfT85+bC+OP/rIKUyR3KWnpiVn7Ub+P8e7E9pNQunOFxNpZPNgUPEGM5SuXPvMJmQKbn
         jmYEYBc6S86A+BMiXcZKKIpgURdJS2/LbzY7Q+cuRCoZA5+GPFt7HNaJYyIqaPp/mNd4
         AhikiYFjKeYWUXPkjQm+B399GBMHKuEZzdHUmHDhakpE9i3WYGUyF9dhyZTZc1yxmhoA
         UxVw==
X-Gm-Message-State: AC+VfDwnnFPpEFdXwwrZ5Kr5kiyA5vxY45HbSTezWI3a5L0dXmIZKSF+
        mXwunSkIOti5HYlbJEwOpq/JTqSOJXrat1dz0pmDKw==
X-Google-Smtp-Source: ACHHUZ6u0ym0t6UGw+Elhz8kFfslp5Z1MPSPenc+LA2HSYM/ODQbkxMC3hXrBqOVvlStPUbQnzMrEQjt8udM5tvUnwE=
X-Received: by 2002:a05:622a:40b:b0:3fd:ad1b:4e8a with SMTP id
 n11-20020a05622a040b00b003fdad1b4e8amr70924qtx.22.1687781892621; Mon, 26 Jun
 2023 05:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174006.42533-1-tony.luck@intel.com> <20230621174006.42533-8-tony.luck@intel.com>
 <CALPaoCgF04M0Jc-c4VmbKkRSFo677SBGoPHzNCSeQ4S6Bqb60w@mail.gmail.com>
 <SJ1PR11MB60836CD7493B0EAF0F687051FC22A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CALPaoCiaknUMSU4CunSQrRP=WS8DAbToVo5jibh8TaWNZXGMbQ@mail.gmail.com> <ZJX+lmQTUEujF88U@agluck-desk3>
In-Reply-To: <ZJX+lmQTUEujF88U@agluck-desk3>
From:   Peter Newman <peternewman@google.com>
Date:   Mon, 26 Jun 2023 14:18:01 +0200
Message-ID: <CALPaoCh=j+5_dA2Vgj1DtXgFWGCjJDXt=MwSVtMmPuuouWYokg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] x86/resctrl: Determine if Sub-NUMA Cluster is
 enabled and initialize.
To:     Tony Luck <tony.luck@intel.com>
Cc:     "Yu, Fenghua" <fenghua.yu@intel.com>,
        "Chatre, Reinette" <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "x86@kernel.org" <x86@kernel.org>,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "patches@lists.linux.dev" <patches@lists.linux.dev>,
        "Eranian, Stephane" <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Fri, Jun 23, 2023 at 10:20=E2=80=AFPM Tony Luck <tony.luck@intel.com> wr=
ote:
> On Fri, Jun 23, 2023 at 05:19:37PM +0200, Peter Newman wrote:
> > On Thu, Jun 22, 2023 at 6:02=E2=80=AFPM Luck, Tony <tony.luck@intel.com=
> wrote:
> > >
> > > > Unfortunately I'm not getting as good of results with the new serie=
s.
> > > > The main difference seems to be updating the 0xca0 MSR instead of
> > > > applying the offset to PQR_ASSOC.
> > >
> > > I think I may have reversed the actions to update the MSR in one of
> > > my refactor/rebase. The comment here is correct, but that's not
> > > what the code is doing :-(
> > >
> > > Can you swap the bodies of these two functions and retest?
> >
> > It's a small improvement, but still not great. Still only node 0
> > giving believable results, but at least no more empty results from the
> > second package.
> >
> > I poked around in /proc/kcore and noticed that my snc_ways is still 1, =
though.

It turns out I just forgot that I had KASLR on. snc_ways was in fact 2.

The real problem was my test program was assuming that the absence of
the snc_ways file meant no SNC, so it was using cache IDs instead of
node IDs when choosing a mon_data subdirectory to read results from.

With that fixed, the results look good:

cpu: 95 (3), rmid: 17 (g16): 0 -> 32313974784 (32313974784)
cpu: 198 (3), rmid: 103 (g102): 0 -> 26078961664 (26078961664)
cpu: 117 (0), rmid: 59 (g58): 0 -> 26692599808 (26692599808)
cpu: 152 (1), rmid: 113 (g112): 0 -> 33368244224 (33368244224)
cpu: 33 (1), rmid: 77 (g76): 0 -> 26902077440 (26902077440)
cpu: 63 (2), rmid: 76 (g75): 0 -> 32478494720 (32478494720)
cpu: 90 (3), rmid: 94 (g93): 0 -> 31206088704 (31206088704)
cpu: 136 (0), rmid: 13 (g12): 0 -> 28095463424 (28095463424)
cpu: 37 (1), rmid: 177 (g175): 0 -> 31255060480 (31255060480)
cpu: 124 (0), rmid: 6 (g5): 0 -> 31128502272 (31128502272)
cpu: 102 (3), rmid: 68 (g67): 0 -> 28848963584 (28848963584)
cpu: 103 (3), rmid: 62 (g61): 0 -> 26091233280 (26091233280)
cpu: 71 (2), rmid: 123 (g122): 0 -> 29157933056 (29157933056)
cpu: 94 (3), rmid: 69 (g68): 0 -> 27776458752 (27776458752)
cpu: 102 (3), rmid: 174 (g172): 0 -> 26349281280 (26349281280)
cpu: 155 (1), rmid: 3 (g2): 0 -> 33489125376 (33489125376)
cpu: 40 (1), rmid: 16 (g15): 0 -> 27142750208 (27142750208)
cpu: 69 (2), rmid: 156 (g154): 0 -> 29294411776 (29294411776)
cpu: 121 (0), rmid: 63 (g62): 0 -> 30636777472 (30636777472)
cpu: 171 (2), rmid: 93 (g92): 0 -> 26103046144 (26103046144)

(and it turns out I never needed to manually look up the node IDs,
because the test output would have already told me, had the test been
working correctly)

Sorry for the extra trouble. The series works well for me.

Tested-By: Peter Newman <peternewman@google.com>

Thanks!
-Peter
