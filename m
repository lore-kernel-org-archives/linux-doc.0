Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6A3AE6EE
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 05:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081774; cv=pass; b=MneTmCKSpZAdpdkR3/h/MDcy5H9hrdpJ0BdJXtjMa/NrFoQ/QKJhQTHpyaPLqfICjno7QcmuaTIcvxV4mysCR7++LT2Xu0UjH14zCmSKuujpUDyi7UedmLRi5I+gOz2jgMK92++9Sv8fXzYbmcreKSMGWOrIA+zuJrH+fbqRezE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081774; c=relaxed/simple;
	bh=4VXYNdBtz6O86chKmpEl3yDwemKRGMRk/kOMzAwANWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKOVfHVEowLkD7ItFGA+kKk/KS9fKS9g1QbScQ4IV/JuePKm+ueMwVTWPk6g2kRW9rPjn8Upvzz6DMxrT+WGTkdCp+/IvyogNu0FuzR4hVSJHywfWVqbWHJneCP8PUijr+YXK/Njei5PCkIF0Hri1yuJ3e++8WcmE/yLSjEhYjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfnxI/QN; arc=pass smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfnxI/QN"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1331e851faaso773135c88.1
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 22:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779081765; cv=none;
        d=google.com; s=arc-20240605;
        b=febc8CRCd/qOaKRi4oTAYUcleWSrOILAltm4YNvYLya2MUpMP+aSSrTSe0dmAhOcA8
         QDGJmQ7DpQg33lzO5BxeaEx5Pf9Xk65FlhTSTr9K02eAYOXOiJWjYRSFvElfyK8z0YzV
         d2h8WlBsLKXPBToWu3HZG1FoPVBo0f8lUUUcjTNCB9a716k4IlH90xtEGKd5Pk2oQ0z4
         xPoy0vbib9XhRK9am4YW1eVeTFB+utGwGEEW2qqwnnlQ6nKpp+TRF8anLSDdfKW3Plm3
         27dhHio1J5OJNjM+6/QWDfFEHjU/gSg10gh/XUL4LLJARIRJd+xU75WaOVUyZnfGlKgV
         AXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tVrmc1+PV/eXO19oXbXbSS9nJEY6DfKgzD6K9F2BhAc=;
        fh=/PFmZOwSsMtoG5+oqK6e2ZIWNl15oOqh37KnxH0qqz0=;
        b=Xot8azZ45j1NR8C855NH42nkRPewR0WtdxvPfPd3H+bH1Jah0UUSJ8yVluXkdghCWc
         v02fK9/8OvacdPVJ3qX6k/Jl571RhT3BKgnLhQpYOT+4R1hW1PV0mw/TZtqwD61iedHY
         b/IOrJlvd/g3cgkTOjGXD9wFKaucVPC0RUjLgsrRY2/g+OuXqiJulmQZ4rSaBHmjoyC9
         6ehDPgon3uAanjfGXCnvkpw/3H+Nxz9vF8jtzeRVtPCAruEagEF1UrMZyKkCYML+wkQP
         od+kaamB7ZOeUrzbe5EHQqndd2EG7J8tQ8MKG4W0keyGOIM2tCQ9mdeEYa/1bB6g74d3
         qZSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779081765; x=1779686565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVrmc1+PV/eXO19oXbXbSS9nJEY6DfKgzD6K9F2BhAc=;
        b=EfnxI/QN0jJAzWUL2+3xggavSYGOOF7hdksB7YzRvKlZ9/sLQuxcYMwnhb5f1JCdGQ
         c8g8Q9S27NP2XVvj/4L54G0eS1OzsIyqmwfZvUWsU2N/4O7gF3GQZhsW9VB1EifuNrKa
         G/Pu6+4hSzoahlq5FQVbHTML+6wAv3fx1MlM+61S3B1JBPS8WmyZAjaEJ+LW0SJb+0PI
         WGJUi/VbrAIr3Ly4gVV55wCboGeosbmFOzZFfULI1ly6FaisWPwcJF7RvbHV2ee/rBKm
         SRuJIAcTAA6xFQLTKOMmPYcm9CrdESmPbvWIZd3GqajgPjU2HTtxSG7K71VvvisRWsRC
         rC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779081765; x=1779686565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVrmc1+PV/eXO19oXbXbSS9nJEY6DfKgzD6K9F2BhAc=;
        b=B/gp7PfLd6humVWTuSKpZkBnAnc+/OmgDFIQD/JU4C0wDOXBvkm+lq0cc3nhBtL7li
         Hk5GGbHndbUgTvysS9u9bSJCY0NlS5hEyR6ezgFyiKSlIOzwpxZM4AStVrEPcGhyjVhZ
         owsplI90P11kzw0YRqfd7xkSMZIQTuXGL47poIDHWN7oW/yUxNyn3gKoR1XhAZdePMEM
         HbJo+I5InRK6apwg+xx54BTWrwIll082N4dCca+1bNfcylUNAzXm4paKcyjXKhT7Rj6T
         kbNn6MX0k98I4qDHOgh+4oi+DjPnCsiCyLaP8sHVwrhkY4p5h34oGvRAkoRC9mU/MCjV
         zIzA==
X-Forwarded-Encrypted: i=1; AFNElJ+6p9ahXhkGVOg/1TX5Oi+tyjM9wjERDtv3SXbTHUrD8qdLaF5ljFegt2xHLuuFNclU31xRsJQMses=@vger.kernel.org
X-Gm-Message-State: AOJu0YxheNJREUSOAiT9vx7ffUk+VBe96o2xV1dqqI4lH2aDyGHJ04gl
	rWJ3HO51jms6beUqpWiHa0D4OacEoNfv2F8iMmxDdEkeTrhbSBs/GU2ZESnpS692KG7Lx9HaA9A
	lCdX1L1QbdbmYm4Mi6xJmUaKGVtwG/A==
X-Gm-Gg: Acq92OEJMd9/bUXEnvJkKnXSU+P4n59MjYrHFKA7ewREnfnlkKodXPdMQd3ylRZpry1
	nPoDEeCr5et+7CC7yxMnGKup/3oUjvviHqwsYu/suHBW2jX+PL/SFK/nkN92pSRIpt5Jk2xW0yV
	WNIuqS81g6/uDyChLe43B19XNUuYWXlK3Qfuz6l5rJm77zrVnqP4FfBGAAdX0l4VFuBD9+3Urwi
	5WgLsdguSGKjyGmqB3T+1aP/zWePKR8cAZnodnlzO8NyU6VHqVtmCj+lO16GLH0Z4N1Eok9zt4Y
	20bInoM=
X-Received: by 2002:a05:7022:301:b0:12a:6d05:3938 with SMTP id
 a92af1059eb24-134ffc6a83fmr5895472c88.7.1779081765523; Sun, 17 May 2026
 22:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516210357.2247-3-ravis.opensrc@gmail.com> <20260517183658.4510-1-sj@kernel.org>
In-Reply-To: <20260517183658.4510-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sun, 17 May 2026 22:22:34 -0700
X-Gm-Features: AVHnY4LE0W1Cr7WTCe0QcWx8Sq82GcO7UNuwTXn-H1Hzh7EXFfcqQ3AqG5J0WCk
Message-ID: <CALa+Y14PXA_anNdvJCzx4RfKoKj6hNmEG39KUvMALtOBznprkw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] mm/damon/core: cap effective quota size to total
 monitored memory
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:37=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> Hello Ravi,
>
> On Sat, 16 May 2026 14:03:54 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > The DAMOS quota goal tuner can compute an effective size (esz) larger
> > than the total monitored memory because it integrates over cumulative
> > deltas without bounding by the actual workload size.  Once esz exceeds
> > total monitored memory, the per-tick "remaining quota" arithmetic
> > stops being meaningful: any scheme can apply to the entire monitored
> > space and "remaining" stays positive indefinitely.
>
> Nice finding!
>
> >
> > Cap esz to the total size of all currently monitored regions as a
> > final bound after all other quota calculations.  Add
> > damon_ctx_total_monitored_sz() helper that sums region sizes across
> > all targets.
>
> You could also make an arbitrary cap by setting the static size quota.  T=
hat
> is, if there are not only quota goal but also the size quota and/or time =
quota,
> and the different types of quotas disagree about the real quota, DAMOS us=
es
> smallest quota.  You could read damos_set_effective_quota() code and kern=
el-doc
> comment of 'struct damos_quota' for more details.
>
> So you could apply the total monitoring region size cap by setting the si=
ze
> quota of the total monitoring region size.  Could that work for you?
>
> Adding the total monitoring region size cap makes sense to me, and I thin=
k that
> will make user experience better.  But, if the size quota based cap works=
, that
> could also be handled on user space in an easier and even a betetr way.  =
If so,
> I'd prefer the direction, to reduce kernel code complexity.  What do you =
think?

Hello SJ,

Agreed.  quota->sz combined with the smallest-quota-wins rule in
damos_set_effective_quota does express this cap from userspace
without kernel changes, and keeping the kernel side clean is the
right call.

If the UX argument carries weight later, I'm happy to respin v2
with sashiko fixes addressed.

Thanks,
Ravi

>
>
> Thanks,
> SJ
>
> [...]
