Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D31F12F8
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047772; cv=none; b=c7F26UBpU3qEyP9814/7gIhyI6/Sn5HVy0Mo32muXyFCkX0XvHGJ6Pq5tVhk4tBRUHt8CT9buGxy6zXk5R4wtGvPAP5WEJ8N67g3NVBbLMk11mv8UDRNaxgOYdHGO/xAdXKXNX3eZWOpvdDYhhZc8frS4HZ/cGm3Oj4v58WbtLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047772; c=relaxed/simple;
	bh=OVtD/EtoJew27WP5jzIl6+TqCpTQisXiPbL9BiEUe6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uj5IBXHiPrp02wuylpVb6gSpkIstNr4mglFn8/ly+AQ8mKG+xXKu9SUEN5lF9sAXRaw5LPW7RzviZrtwMPye72HL2RD6V0TZ0vU/JjoKGOj8d5EiNoWZeUtPVeC4c/BbcybTfbyGXl6UdbmLHrhCLgOvZC8IUWDG9nKqQPpQFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eIuZMsyp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eIuZMsyp"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so3557423a12.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 02:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740047768; x=1740652568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5iVZZR9foR8lSRa9A1Cz5+1azaBerETQsnQI9/mz00=;
        b=eIuZMsypK0J2u4UqYKBN/pEMS+IKm2RO0myq55UcCqbhnyXZsMGndAl4RsXDOFtyOa
         aD+1ZvqZDXkMD7ABbBIrGm8SScYPksRepMewV0gulX/T/HUdnZyndUcyO0rhh41HxFpG
         kYInDjudwk3iOyW9FOdgC+xp0vUgx0N9lKSWz/7ODb3wv0MtnlbJLFNzhbdQ3x0SekK4
         tYgeTS9ZXz0RXvMGOzugHfP4KTMd9CY9N39IEfEVnpQI/eRw0lfIBSYAEn0+JWNtCHhg
         +B5rw7kQ1tZCY5Ig2JINMqiSSN5hYv2+N4A0pnYtA1/IOtnfPTi0JTR0LbRV1ZpwDQ7b
         wbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047768; x=1740652568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5iVZZR9foR8lSRa9A1Cz5+1azaBerETQsnQI9/mz00=;
        b=dJkerWrFCHNLy54MGgc5gg1tyFVlXrMiqZ9iUzqJVhSxX2yLikqpI4cWehsp04D9iq
         URrSKJJYGJMAALnb3edJHX0uDLtoEJV61Cef76HithAo47QdVUL9ECMPNhQDG0wgprHD
         zs9d4FjaCj0Isz55lYwcdB1mric1rioi2JhgjAuitBIirg6Exj1p6eHn4iuiYHKXoLJf
         C+RN51C5mRlP0G6xWPBQ21YlYcyHn+ZJOaYeOsR4ejAykqQunUNUkNg902l5Oa3/3Trl
         n8Gnadi0K4l05gzCdXBT44jAdLuiJKUcQfsL4RAD1rnZDeoj6isHIGXuo9ulW0TyFbAn
         /ZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsXuwBUh3g6d1gmyrCIMXp0sUtYkNpA/8hbWviotXCCIizf2JRs10smrhuH2a+Lr47XRfAm+0d5Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6mi0EasLg/aBVLYlR1DBUPhl/zhLDkKb1TNxsWePZ2bc2lc/I
	Qe046lMkiJ83Hy9Kr7eNmGTsUmX3h7bbLtU3G4e61TZr5Cks1WTjMcEzML1tUC7FKhOnbrDmJwl
	opOJV1wn4k3IWHygxqFC/SkLhPSulNF929OLl
X-Gm-Gg: ASbGncuO1oQ0IMVmVpkC7UW6EkprGqKN+9Q7gHcglghEeYyTA7rTUTOZja3DugLB0lD
	4Qa6+qCU/UecJofONrWYImL3NvHcB20JU2Ky0mTpQyyu+ApGvlSPssDWDg1pK6lwhBwIqB4QTeF
	Zbe9rtgIQZ042OF19VancKMM3BWg==
X-Google-Smtp-Source: AGHT+IGnhZ/N/b1qnxRs2Jsi8Y/50vjnoyO0zfZHcmC9W4l/D2tFMf5bs5KQUF4JBKbo/wh4l5j30kF1MacTF4c+9t8=
X-Received: by 2002:a17:907:2da1:b0:ab3:9aba:ce7d with SMTP id
 a640c23a62f3a-abbedd308fcmr258749266b.1.1740047767684; Thu, 20 Feb 2025
 02:36:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737577229.git.babu.moger@amd.com> <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
 <Z7XfcV05ZZkHm6bc@e133380.arm.com> <CALPaoCiPkjbTf2He2tXsguxHDtGF+YfVUZScL8dseVc6rvAfvA@mail.gmail.com>
 <ac6860d4-92b4-424e-af4f-d6e3d5722232@intel.com>
In-Reply-To: <ac6860d4-92b4-424e-af4f-d6e3d5722232@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 20 Feb 2025 11:35:56 +0100
X-Gm-Features: AWEUYZlXmTvbxaQXEpd1mqvPfLmY_ybKERyUy6C1f7TW_OoIZRNmv47Q6k7qu2s
Message-ID: <CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com>
Subject: Re: [PATCH v11 17/23] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, tony.luck@intel.com, fenghua.yu@intel.com, 
	x86@kernel.org, hpa@zytor.com, paulmck@kernel.org, akpm@linux-foundation.org, 
	thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com, 
	pawan.kumar.gupta@linux.intel.com, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com, 
	mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Reinette,

On Wed, Feb 19, 2025 at 6:55=E2=80=AFPM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi Dave and Peter,
>
> On 2/19/25 6:09 AM, Peter Newman wrote:
> > Hi Dave,
> >
> > On Wed, Feb 19, 2025 at 2:41=E2=80=AFPM Dave Martin <Dave.Martin@arm.co=
m> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Jan 22, 2025 at 02:20:25PM -0600, Babu Moger wrote:
> >>> Assign/unassign counters on resctrl group creation/deletion. Two coun=
ters
> >>> are required per group, one for MBM total event and one for MBM local
> >>> event.
> >>>
> >>> There are a limited number of counters available for assignment. If t=
hese
> >>> counters are exhausted, the kernel will display the error message: "O=
ut of
> >>> MBM assignable counters". However, it is not necessary to fail the
> >>> creation of a group due to assignment failures. Users have the flexib=
ility
> >>> to modify the assignments at a later time.
> >>
> >> If we are doing this, should turning mbm_cntr_assign mode on also
> >> trigger auto-assingment for all extant monitoring groups?
> >>
> >> Either way though, this auto-assignment feels like a potential nuisanc=
e
> >> for userspace.
>
> hmmm ... this auto-assignment was created with the goal to help userspace=
.
> In mbm_cntr_assign mode the user will only see data when a counter is ass=
igned
> to an event. mbm_cntr_assign mode is selected as default on a system that
> supports ABMC. Without auto assignment a user will thus see different
> behavior when reading the monitoring events when the user switches to a k=
ernel with
> assignable counter support: Before assignable counter support events will=
 have
> data, with assignable counter support the events will not have data.
>
> I understood that interfaces should not behave differently when user spac=
e
> switches kernels and that is what the auto assignment aims to solve.
>
> >>
> >> If the userspace use-case requires too many monitoring groups for the
> >> available counters, then the kernel will auto-assign counters to a
> >> random subset of groups which may or may not be the ones that userspac=
e
> >> wanted to monitor; then userspace must manually look for the assigned
> >> counters and unassign some of them before they can be assigned where
> >> userspace actually wanted them.
> >>
> >> This is not impossible for userspace to cope with, but it feels
> >> awkward.
> >>
> >> Is there a way to inhibit auto-assignment?
> >>
> >> Or could automatic assignments be considered somehow "weak", so that
> >> new explicit assignments can steal automatically assigned counters
> >> without the need to unassign them explicitly?
> >
> > We had an incomplete discussion about this early on[1]. I guess I
> > didn't revisit it because I found it was trivial to add a flag that
> > inhibits the assignment behavior during mkdir and had moved on to
> > bigger issues.
>
> Could you please remind me how a user will set this flag?

Quoting my original suggestion[1]:

 "info/L3_MON/mbm_assign_on_mkdir?

  boolean (parsed with kstrtobool()), defaulting to true?"

After mount, any groups that got counters on creation would have to be
cleaned up, but at least that can be done with forward progress once
the flag is cleared.

I was able to live with that as long as there aren't users polling for
resctrl to be mounted and immediately creating groups. For us, a
single container manager service manages resctrl.

>
> >
> > If an agent creating directories isn't coordinated with the agent
> > managing counters, a series of creating and destroying a group could
> > prevent a monitor assignment from ever succeeding because it's not
> > possible to atomically discover the name of the new directory that
> > stole the previously-available counter and reassign it.
> >
> > However, if the counter-manager can get all the counters assigned once
> > and only move them with atomic reassignments, it will become
> > impossible to snatch them with a mkdir.
> >
>
> You have many points that makes auto-assignment not be ideal but I
> remain concerned that not doing something like this will break
> existing users who are not as familiar with resctrl internals.

I agree auto-assignment should be the default. I just want an official
way to turn it off.

Thanks!
-Peter

[1] https://lore.kernel.org/lkml/CALPaoCiJ9ELXkij-zsAhxC1hx8UUR+KMPJH6i8c8A=
T6_mtXs+Q@mail.gmail.com/
