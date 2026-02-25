Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636032E7635
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045910; cv=pass; b=UFmPX0YwG/GRNF9d8MYNeO/KSNDP96rxolxcxjARSNb2nZ147+1dQ432Uy7F4pgLU3nESWWJN9sdPMpYTcL8rJNplpUBOq/8kD7JBNXBhKOQ6veeiARDVtaKhrAjoeeH5V5sDtkicbxI8akkdhy71UF7pRC7in2NYprw1mF35Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045910; c=relaxed/simple;
	bh=NpKgxwm3BYjy0VCIdvPfujoYw+4fA8FzzoYFYYquMwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cq380xQEU5W5B47ZTXQBCKkwQxwr12185p74dHnUwNoYlbjHV9RX5iz8jF1XoLnPuaaPXNPhgWhVmp6wfrMQU28QJron3ZPuQjspONgACUp5B5OXbAOrVsjeEa9MGdhrS9EMzV2Gp5uOHr+SP0lpw2n9ZWQwR1bCf/6+KONhtYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N51jRMtY; arc=pass smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N51jRMtY"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-126ea4e9694so3945074c88.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 10:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772045907; cv=none;
        d=google.com; s=arc-20240605;
        b=YL65XKpfGNLjMlkmkBU/VXCYSfgsdv5KivvIrcZ8W4qFLx2Ad1sVQpOoQ1wb9C7T6P
         h2POhvomxCup0bTQKiw/8CTvnGzJ5vyNUdtDeLyDO9oszeQv3lYDIy1+nzG+QESyr5PG
         UzSYMjXaprBDWCuhkS2bEuAo2EI+CTOKmFrgTHa2j/Am9WNQkGmFceXPScU2Vulu9R6x
         GM4muu0ouJ5BxaPyImO0QjHyC4qbGoAII+ZquqGU/0DZP7GX8lNHS+geRBShfMq544Nm
         kqQEhe+I8XBQljhrmAfLsAqq/pwoqw4aGwZhLvl8gwFsfIWxjo728j6JJIzFmmWDGZXQ
         lBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArROPpjnJzj85QG9odZcXqmuIgynPaSR2+psVn75qQI=;
        fh=ygQ5ar35d8WsFPl9RwUUApAC05grnDCsUcDVfFyzS3E=;
        b=cUDyD545icTOYoy2+dc4uq8MKDdPJ4GUWBlXeBoMfG6CgFtipwrwJuLl0329GA1qUZ
         f0ZLYlFGDS/rUJRaOfdJ+39KSK0RkxyA1tp9UC4IBPieSstp0X9Qszj5GwndJnmLckfz
         MD8USGVmAr+6BLeoy7osJdAUsF7JOf1cSgzxg20pi2kVqnUamJtF+/bH9FAKy12tETLW
         TYtEVu1RIODTxncUSdrZG1iORiszOm32ayBmOW390+mJyRq+YkjbEdxAbazMERrl5hTC
         ZIC/Z1LedX9ITnxoC8Y1Sl4U/KHMpZhufmBFlrwmQcxVrs/yDzMZljB8SfZDJ/6ED+Bs
         G3jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772045907; x=1772650707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArROPpjnJzj85QG9odZcXqmuIgynPaSR2+psVn75qQI=;
        b=N51jRMtYDtL7IVtY2HOJvZf+x/sK8PBU+Ypt2Rjr7IbyD7CA0CqH9g0nZVooPw9EF3
         PqLfdUo/UKcj4QqrhbUlIZ2OR4EnhVRH/FGH2m2g3YHRmjYFHD5JZQiUdC2yaT3EYYo7
         q373CJwma5FV5w9b5P17QY9lUSKR6iGPpBCcI0BBKFPGUfdITA+quVcxnLSnPzrKqb7X
         CWdiG4Mv67UwO7AZVKGOvTquNRCLJqLI3L4IfSfxG7mwXrsW/ko+GX+10vlchF+0Qqbw
         zPDWLkYlAzqqP2Rnhf4ixvLo0ydTHi3XIPHE2c2pxNlKngQM4jK2zknYSudl8bZhFXRE
         IvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772045907; x=1772650707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArROPpjnJzj85QG9odZcXqmuIgynPaSR2+psVn75qQI=;
        b=f9uJK2IY+nakGdC/Em8+uffpp8ziL1dbKMIqD0+WIyCKK6dOWLOAawvvSQwP+mF7vd
         5ptia5qU/bDSAgA9ZUF5q+ZD6q+uehqn0NBYfyd+UH8LizxbFUrA9dXVK3aUFSyqLk7H
         dI5Z2L4o3JUTmEvqnK/gce8CsdfXD7vFdNmb0knBaKYuJDjm9o3WD2ER5lQJsaLwXhDv
         tYGhQJuV7pAsYQkJS1lsKun0/Vpnb5qAdzpwB+Q539RvGDaVbA4ek1zmdxrXD6twX4Db
         ehvSAzhj5au2izpzco1Jh50H4JgDA11GfD4MOe/GjB5cldQteglcx+TvrM9yk/WYNmtc
         wM9A==
X-Forwarded-Encrypted: i=1; AJvYcCUUBDkkmFsApN/vud3b6jmhSe40VJ87pPicmnruWc1KblEGI7vLKwuQYL5XHSrGwWpqcLiNPsqRRnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hV1L84/5VNKnGidWYskplkwK0Zib4+DnXJk1SMEQhzxz4u3C
	xtlokoBUK5CXOtxbBvTyVuHFPJyvS4RhFiOmyvIpAj7wcOXUvgf2crNMuSbVWtvXKrivmhNCkga
	SUm8QE0kqEF67W9sDdQfVOZMjTvmXeQ==
X-Gm-Gg: ATEYQzx0CPEKiz+NsbmGVz5OH8zPDvUTpYPROqSE5J7skfOz9Of8Y6vj+S5/8u5BUGy
	YyjUUnHUZ6yDo6uWrfK4UD2Pun2qBK+AnbEu6l05upalmD4KHVX5yRRa1TANghO3NfgPeK0C2UL
	Ak30mikdxjYn+K7Ds3ekTpUQXC9Lx25qWPqFHnS+2bR1AU7OvmKXV8TW7D3hI89uOAPkNmeghUR
	3n8cVm5Beidhjr3F+F2yRoGxEV3o4KEzldl6EbCW5wlpWV1ix7TX2HR3xhevaSu0p4i6gEniAs8
	ygqzJ8E=
X-Received: by 2002:a05:7022:4589:b0:11b:ca88:c4f7 with SMTP id
 a92af1059eb24-1276ad3fecemr6585546c88.40.1772045907494; Wed, 25 Feb 2026
 10:58:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223123232.12851-5-ravis.opensrc@gmail.com> <20260224055451.58713-1-sj@kernel.org>
In-Reply-To: <20260224055451.58713-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 25 Feb 2026 10:58:15 -0800
X-Gm-Features: AaiRm53tTS4j79q29YaqOt6DqbWcBTOrpnxU-5ZG60LfsiyErPqmfboGnXJ-bZE
Message-ID: <CALa+Y14yVxW+NSP6-G+93yHFLKhFhvKMQowGUR1MBcPgvO_q-A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 4/4] mm/damon: add PA-mode cache for eligible
 memory detection lag
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 9:54=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Mon, 23 Feb 2026 12:32:32 +0000 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > In PA-mode, DAMON needs time to re-detect hot memory at new physical
> > addresses after migration. This causes the goal metrics to temporarily
> > show incorrect values until detection catches up.
>
> I agree this can happen, and could be problematic on some setup.
>

Thank you for acknowledging the issue.

> >
> > Add an eligible cache mechanism to compensate for this detection lag:
> >
> > - Track migration deltas per node using a rolling window that
> >   automatically expires old data
> > - Use direction-aware adjustment: for target nodes (receiving memory),
> >   use max(detected, predicted) to ensure migrated memory is counted
> >   even before detection catches up; for source nodes (losing memory),
> >   use predicted values when detection shows unreliable low values
> > - Maintain the zero-sum property across nodes to preserve total
> >   eligible memory
> > - Include cooldown mechanism to keep cache active while detection
> >   stabilizes after migration stops
> > - Add time-based expiry to clear stale cache data when no migration
> >   occurs for a configured period
> >
> > The cache uses max_eligible tracking to handle detection oscillation,
> > prioritizing peak observed values over potentially stale snapshots.
> > A threshold check prevents quota oscillation when detection swings
> > between zero and small values.
>
> But, I feel this might be too overfit solution for a specific setup.
>
> >
> > Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> > ---
> >  include/linux/damon.h    |  45 +++++
> >  mm/damon/core.c          | 421 +++++++++++++++++++++++++++++++++++----
> >  mm/damon/sysfs-schemes.c |  30 +++
> >  3 files changed, 460 insertions(+), 36 deletions(-)
>
> The size of the change is quite big.  I'm now curious if the problem is
> significant enough for this size of change, and if this solution is only =
the
> single and the best one.

I understand. The cache was consciously separated as patch 4 because it
represents ONE possible approach to handle detection lag - not
necessarily THE approach.
My goal was to share what was needed to achieve equilibrium with my
synthetic benchmark workload,
while making it clear this could be dropped or replaced with alternatives.

>
> First of all, I'm curious if the problem is that significant.  I assume y=
ou may
> seen the issue from your test setup that you shared with the cover letter=
.
> From my understanding of the cover letter of this patch series, however, =
you
> are testing this on a setup having two complementary schemes.  And you us=
e
> TEMPORAL tuner.  The motivation of TEMPORAL tuner was for setup that not =
having
> a factor to move the quota goal value without additional intervention.  I=
n
> complementary schemes setup, the schemes becomes such factors for each ot=
her.
> In the case, TEMPORAL tuner might be worse in terms of the size of tempor=
al
> oscillations.  I don't know details of your test setup, but I suspect the=
 use
> of TEMPORAL tuner might made the issue bigger than real.

That's a fair point. I chose TEMPORAL because I wanted to move the required
amount of pages as quickly as possible to reach equilibrium - essentially
"migrate at full speed until target is reached, then stop." For my multiloa=
d
benchmark with uniformly hot memory, this seemed like the most direct
approach.

You're right that with complementary schemes, the schemes act as factors fo=
r
each other, and CONSIST tuner with its feedback loop might make the detecti=
on
lag problem more manageable through gradual adjustment.

>
> I also assume the real world people may use DAMON with auto-tuning mostly
> because they don't know the access pattern of the system and assume it wi=
ll be
> dynamic.  In the case, even if we perfectly solve the issue, some of
> oscillation will happen.  So, I think the issue in the real world might b=
e
> smaller than that we can find on some specific test setups.

Agreed. Real-world workloads with mixed hot/cold memory and dynamic access
patterns might behave differently from my synthetic benchmark where all mem=
ory
is uniformly hot. The uniform-hot case is essentially a worst-case scenario
that forces continuous oscillation regardless of detection lag compensation=
.

>
> Meanwhile, the node_[in]eligible_mem_bp concept makes sense to me.  I'm w=
orried
> if this patch is unnecessarily delaying the progress of the main change.
>
> So, unless we have clear evidence of the significance of this issue, I'd =
prefer
> dropping this for now.  After that, if the issue turns out to be signific=
ant or
> this solution is proven to be significantly beneficial, from your next mo=
re
> realistic test setup, or from real world usage after upstreaming of the m=
ain
> change, we can revisit.  What do you think?

I agree with dropping this patch for now. Let's focus on getting the
core metrics merged first.
The cache mechanism can be revisited later if real-world usage shows
it's needed.

Thanks,
Ravi.

>
>
> Thanks,
> SJ
>
> [...]
