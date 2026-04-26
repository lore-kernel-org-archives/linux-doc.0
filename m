Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35B2FE07D
	for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777239271; cv=pass; b=UZCX5jo5T1gRCuTPY7SwUrfP4uqRjPJXPYU6yOoz2l1rFAeUKkfXt+0nLlpqy2zXG1T2hpMPDUVuhWq0+dO4u1snmpmr9B0uioeqzZtvbRS1AzYMLmZdhTN8OBbZP4jGrzj5fW8NTjnT1+VZtU574c+tO32FQnEzXMnZOxB3Vfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777239271; c=relaxed/simple;
	bh=HsSs83RmZrSvjzRRCJ6GTLFO98z4Wxwxr15vYAjqJKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKDrB/aBtxpZM1yoM6QobQVUI90CX2G1OFjNzp0vcnjn8/Ou9GuhusDND8Jv71MgTBE8yYz3xoWIzxW0AYAH3bdlluDhIgXmVlZjPp56nSUXAkPBtFCvki94tMJbi0vTB8SgSBRogXkTt7M3t7Cy52SQ2pruaMiavZC5DIKwokY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UV4DWJ7Q; arc=pass smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV4DWJ7Q"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12c726f46baso11798288c88.1
        for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 14:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777239270; cv=none;
        d=google.com; s=arc-20240605;
        b=YaAdq0B0m1/7u5TvbeMgDYhQMlgSzdIco8CR7kP+0F6lySfl8Z8l4nL9z3MehQYyfK
         M5DXvDr87noxDBcqlQLRRS3SXddy7c728OpGlXDefEElxSNeKVaH0DTCM+gMJKzYSlpu
         uClyzyKRGQ/TnneN1vEH1gg32Fn+G8wljqbCHMn6HUodBBaY4bzzF2oL6sD+ZOjYMocG
         ASo4tcaAvDqSOQmWwT00/rQd1rRFxm5M4ckzEk4OOEGII8Wl/XeEQzAwwKbcKpZBOqc5
         rhRbfpZAETy5pEIgyImsHzEWJh2IkmZAX/FJgpa58xq3WBdz5horCPLAMNMvjbWQbWvB
         /zIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TaKTyAaE5njWlrSRpOaq+xnYt0Ofwnonz8Dpdwbk1HA=;
        fh=uZ3L6e2OCADB2vI28xZiHPz4VhjYMcTqEHUcSoUVsUs=;
        b=L1HlAYJhbDnXypDnAQOmT2tLPNtsPmcBf1k9pFaQDYkmul7etakSjfU1vo6/w6uUEM
         O9EFYW0BBmtFyyLq9PlTrBQame8pNjJPKC8vHlHIlDnAs6xJAPSJxXzl7JQtzwphEZr7
         hwBnqH5bBAXwiTyOUiEFl+gJHHjg+oLL9H+MVMtP2eRS51Zs1eZJQcwr44RkW5NsMxCU
         +jDx++yrD/tvx0nFCnkVe+6Ww0zQwenaUZ8BuITKFRzgyM7p0Gdv+MGEN4UDZL2tQBYq
         egmHPmbYWMN9UesTr+JKl3FNQLKeJx0PUc08DeyIHRPgX8IvD5J/EahbX6QKvevyPyHc
         X6yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777239270; x=1777844070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaKTyAaE5njWlrSRpOaq+xnYt0Ofwnonz8Dpdwbk1HA=;
        b=UV4DWJ7Q6qKScgacUra+DD1/GIVH9bZU5rFhLxriYymcokDcro1CkscGzunO3R+Zgu
         JDzQSjGnmDgSq3ivl+miozBp7UigZht8SDs33hsxxUZNH+rlrm+EnphRTxod5rZidwtB
         7dGQigfVeqDw7DU8+QqpyVNgPAP7OCUe9Wh10mF4HMZyNg+9rcs8Gus0pVU8LMpXsCJy
         Vz3ibek4sV153homOOcyKkeEMzrZNVwlPSizTodPhuAnU5MukAX6dlmrr0pp3QDqlb4D
         Uf+FqbrKwvEqy/leuWJwlTrwLDz3z+LlnrQEwKYOavVBVW2Fk7N0zJzm8bqGhfH6ji8c
         rWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777239270; x=1777844070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TaKTyAaE5njWlrSRpOaq+xnYt0Ofwnonz8Dpdwbk1HA=;
        b=AJzBG31nvj5KkOj9HM3sSGPRJ5G0e9ZTIyBRxhruZ61QxIOj174kGwRFpk6nyBHeR4
         IIcJcTevwzh6Wt6JVrRyRaYxROFGK2GC6nSFAlzJcRN5UPIyU/0KRsqWBu6s5/JeJ19H
         FG0V+YOS+qsVsinu0zLOFo6DEexzeWSG1X7taz+gC4ydM71WNJqACyWj4GKLw7HTTB3T
         Qwa26JvkM0sfc2mud9/FvlMoHFX5eiB18zEhfVkwh1I7YoMEGghODAwZ2/EAsm7l4xtL
         ZoqjX7bulLEm0dYBthoBwLkcUZ97m0UxciGs69kq7jgQW/sgcZefF1NsLAGpmIqR4CmP
         qfBg==
X-Forwarded-Encrypted: i=1; AFNElJ+4fGj1ayQKsJLfako/+nIivswWMNstxNE0ul1vevOivlRxehc40b/eB7Vq4NPvlamzlG+f/O0Ifkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywec99Bh9ebHjm3kf787HjWKmaQdJRt4oIVOhML+Anu8tHZHzcU
	V8vPp5Zkb8vi88nJxN4NzSgcznrAXZBp1WqEQfOq6X6UX+nEAtqXWwnacteaKDwD2gZBqho5uyD
	aHICi2iXW1aM/d8hf7VjNA4NzbIncTA==
X-Gm-Gg: AeBDiesNkWFrrAn9W4/2N6sPfhir2GTPss3oE+LeI6fwlqANYMmgU9G4ti5Qvq4IawU
	nfJyIhKCm7wwICqT+zSsG8hmyMsd/nArQrjL7gpurkZSrygfLhFsZrS1viw8r69Z7kxiogdGKxn
	XnkSSLepTNNSa5vLGeb5PhFC25UbRhoTxIzlAaQMK1LSzyyPFb3LvNgevw8c59sfdmcT7MJzLxt
	S5FJsfZJ2TFCe4boFGPMgYqn1p6KOajW/v//4a4PLabXScO3Ze5XX6PCyFSQJ3s4eMpCPhj1HeJ
	+37UQFW7uL6qUq3Lwl7hYoJ394ycsuQezWcQ4x3Lpni3dYd7yw==
X-Received: by 2002:a05:7022:f688:b0:12c:8f92:c6c6 with SMTP id
 a92af1059eb24-12c8f92cb31mr16334892c88.33.1777239269510; Sun, 26 Apr 2026
 14:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426003245.2687-1-ravis.opensrc@gmail.com> <20260426171941.86007-1-sj@kernel.org>
In-Reply-To: <20260426171941.86007-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sun, 26 Apr 2026 14:34:17 -0700
X-Gm-Features: AQROBzDubMp7QfuC4Dc3-rPJ1yR-TE2i0vS80hEPb2W-_-1yGSxmrEhAmWcksJs
Message-ID: <CALa+Y14J3w-Drc3wtFR_xE75NX1QKxP8+riXx++a7RyPkm0OLQ@mail.gmail.com>
Subject: Re: [PATCH v8] mm/damon: add node_eligible_mem_bp goal metric
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 10:19=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> On Sat, 25 Apr 2026 17:32:45 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > Background and Motivation
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > In heterogeneous memory systems, controlling memory distribution across
> > NUMA nodes is essential for performance optimization. This patch enable=
s
> > system-wide page distribution with target-state goals such as "maintain
> > 60% of scheme-eligible memory on DRAM" using PA-mode DAMON schemes.
> >
> > Rather than using absolute thresholds, this metric tracks the ratio of
> > memory that matches each scheme's access pattern filters on a target
> > node, enabling the quota system to automatically adjust migration
> > aggressiveness to maintain the desired distribution.
> >
> > What This Metric Measures
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > node_eligible_mem_bp:
> >     scheme_eligible_bytes_on_node / total_scheme_eligible_bytes * 10000
> >
> > Two-Scheme Setup for Hot Page Distribution
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > For maintaining 60% of hot memory on DRAM (node 0) and 40% on CXL
> > (node 1):
> >
> >     PULL scheme: migrate_hot to node 0
> >       goal: node_eligible_mem_bp, nid=3D0, target=3D6000
> >       addr filter: node 1 address range (only migrate FROM CXL)
> >       "Move hot pages to DRAM if less than 60% of hot data is in DRAM"
> >
> >     PUSH scheme: migrate_hot to node 1
> >       goal: node_eligible_mem_bp, nid=3D1, target=3D4000
> >       addr filter: node 0 address range (only migrate FROM DRAM)
> >       "Move hot pages to CXL if less than 40% of hot data is in CXL"
> >
> > Each scheme independently measures its own eligible memory and adjusts
> > its quota to achieve its target ratio. The schemes work in concert
> > through DAMON's unified monitoring context, with the quota autotuner
> > balancing their relative aggressiveness.
> >
> > Implementation Details
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > The implementation adds a new quota goal metric type
> > DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP to the existing DAMOS quota goal
> > framework. When this metric is configured for a scheme:
> >
> > 1. During each quota adjustment cycle, damos_get_node_eligible_mem_bp()
> >    is called to calculate the current memory distribution.
> >
> > 2. The function iterates through all regions that match the scheme's
> >    access pattern (via __damos_valid_target()) and calculates:
> >    - Total eligible bytes across all nodes
> >    - Eligible bytes specifically on the target node (goal->nid)
> >
> > 3. For each eligible region, damos_calc_eligible_bytes() walks through
> >    the physical address range, using damon_get_folio() to look up
> >    each folio and determine its NUMA node via folio_nid().
> >
> > 4. Large folios are handled by calculating the exact overlap between
> >    the region boundaries and folio boundaries, ensuring accurate
> >    byte counts even when regions partially span folios.
> >
> > 5. The ratio (node_eligible / total_eligible * 10000) is returned
> >    as basis points, which the quota autotuner uses to adjust the
> >    scheme's effective quota size (esz).
> >
> > The implementation requires CONFIG_DAMON_PADDR since damon_get_folio()
> > is only available for physical address space monitoring.
> >
> > Testing Results
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Functionally tested on a two-node heterogeneous memory system with DRAM
> > (node 0) and CXL memory (node 1). A PUSH+PULL scheme configuration usin=
g
> > migrate_hot actions was used to reach a target hot memory ratio between
> > the two tiers.
> >
> > With the TEMPORAL tuner, the system converges quickly to the target
> > distribution. The tuner drives esz to maximum when under goal and to
> > zero once the goal is met, forming a simple on/off feedback loop that
> > stabilizes at the desired ratio.
> >
> > With the CONSIST tuner, the scheme still converges but more slowly, as
> > it migrates and then throttles itself based on quota feedback. The time
> > to reach the goal varies depending on workload intensity.
> >
> > Note: This metric works with both TEMPORAL and CONSIST goal tuners.
> >
> > Suggested-by: SeongJae Park <sj@kernel.org>
> > Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
>
> Assuming below two minor things are addressed,
>
> Reviewed-by: SeongJae Park <sj@kernel.org>

Thank you SJ. Will send v9 addressing these two changes.

>
> [...]
> > +static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *=
c,
> > +             struct damos *s, int nid)
> > +{
> > +     phys_addr_t total_eligible =3D 0;
> > +     phys_addr_t node_eligible;
> > +
> > +     if (c->ops.id !=3D DAMON_OPS_PADDR)
> > +             return 0;
> > +
> > +     if (nid < 0 || nid >=3D MAX_NUMNODES || !node_online(nid))
> > +             return 0;
> > +
> > +     node_eligible =3D damos_calc_eligible_bytes(c, s, nid, &total_eli=
gible);
> > +
> > +     if (!total_eligible)
> > +             return 0;
> > +
> > +     return mult_frac((unsigned long)node_eligible, 10000,
> > +                     (unsigned long)total_eligible);
>
> Sashiko found [1] total_eligible after the casting could be zero on 32bit
> system, resulting in divide-by-zero.  As I also replied to Sashiko review=
,
> could you please fix this?  It seems we can simply remove the castings.
>
> [...]
> > @@ -2389,9 +2528,9 @@ static void damos_goal_tune_esz_bp_temporal(struc=
t damos_quota *quota)
> >  /*
> >   * Called only if quota->ms, or quota->sz are set, or quota->goals is =
not empty
> >   */
> > -static void damos_set_effective_quota(struct damos_quota *quota,
> > -             struct damon_ctx *ctx)
> > +static void damos_set_effective_quota(struct damon_ctx *c, struct damo=
s *s)
>
> Sorry for finding this late.  Could we keep the dmon_ctx parameter name?
> Otherwise, we introduce unnecessary change below.
>
> If the mult_frac() divide-by-zero is not a real issue, I wouldn't insist =
this
> change.  But, if we will make a new version, let's do this together.
>
> >  {
> > +     struct damos_quota *quota =3D &s->quota;
> >       unsigned long throughput;
> >       unsigned long esz =3D ULONG_MAX;
> >
> > @@ -2402,9 +2541,9 @@ static void damos_set_effective_quota(struct damo=
s_quota *quota,
> >
> >       if (!list_empty(&quota->goals)) {
> >               if (quota->goal_tuner =3D=3D DAMOS_QUOTA_GOAL_TUNER_CONSI=
ST)
> > -                     damos_goal_tune_esz_bp_consist(quota);
> > +                     damos_goal_tune_esz_bp_consist(c, s);
> >               else if (quota->goal_tuner =3D=3D DAMOS_QUOTA_GOAL_TUNER_=
TEMPORAL)
> > -                     damos_goal_tune_esz_bp_temporal(quota);
> > +                     damos_goal_tune_esz_bp_temporal(c, s);
> >               esz =3D quota->esz_bp / 10000;
> >       }
> >
> > @@ -2415,7 +2554,7 @@ static void damos_set_effective_quota(struct damo=
s_quota *quota,
> >               else
> >                       throughput =3D PAGE_SIZE * 1024;
> >               esz =3D min(throughput * quota->ms, esz);
> > -             esz =3D max(ctx->min_region_sz, esz);
> > +             esz =3D max(c->min_region_sz, esz);
>
> Above change is unnecessarily introduced.  Could we keep the old damon_ct=
x
> parameter name?
>
> [1] https://lore.kernel.org/20260426005341.B393EC2BCB0@smtp.kernel.org
>
>
> Thanks,
> SJ
>
> [...]
