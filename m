Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845C1D5174
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 02:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775615639; cv=pass; b=TgASzKeBluY1lby8JG9XjHaAc/aLljpd48JoS9ybZRuCXykPRPy1L8igHh1CAwCGjPwbPPfjFqjGk5gEpC3Ze+tuR9viFt7YN/yQeEvLHPfyxP2PZLB+0mX96w8WkmLKZvUTZbX4HyIqLGx9kYUADnTd3p+n5avmcgcPwktOZvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775615639; c=relaxed/simple;
	bh=7p0WMUL7/V0EDl47mpobYNxTF2Xp6yijjFfguyflBPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNZsg9HrW5BInYagFugk4MGomn0HiJk1FKW9epprmmaOfDeXpuUcsAg/4pjErKuBXYwjxxXlJYOAriW4bG6ULUWm2hYi00IqTPGVXLu3rslut2DxGUeHqPj0ACCxAn3HZPMoO0Jw7J4tQEH28JQhiGb6sNnS346jKY5ae2AFBZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDS81We8; arc=pass smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDS81We8"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12c15414820so397243c88.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 19:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775615636; cv=none;
        d=google.com; s=arc-20240605;
        b=FgQHIsiGsDgmSdX0XRocWz0kxF/mflxWsFUeGCBe1giq51iuFnl0+ZIDt9OAmbbR7R
         FEwsXz5vQKo3lstpMgnDlrKZIqWhtrYoJjV3EHfQSLBIgUdCt6tWOw8UfQ6rrol4S5sI
         7LGEoB7eWSum4KLsLhp7aom1BUw7uTI2ViiRvpnFc5Tu1lr7P4AvbFuBxHseg7GraJsc
         ODOpVD8nQlQuZAyJt/1/PVKDwlDzuRVXSSCTiSG+speIbPuD/qTbZoEDfYovgZO74t0k
         gkTr5D9ia9p8TeLYq/3nHpKCli39U8QbRDAyvvOGFI9S6y1zconR3jp6fbgGgfm9WqHN
         W7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pHlbK/BsBx2bsBdFDlq8m41PA5eMLpW+4eYLKAyppzY=;
        fh=MbFKafNTWS7CLRMZVzU6qtb2uMMbJPk8sl2LEZVAIwY=;
        b=Felhiv7FBurgThpy8gf5bZBqeyocG3dB5rNXTxdol24PwCFXLWZJTtUZuXKz5ZSnGq
         M3VLR5V8DPZzujYeBF9jQX/WNEuuJjYp+du/NSHV4X3ZIMZKXBg9i7uh1unmKX2RfjU1
         A1lWgJK2s2GUTk05BXlcEZABKh79FRWVyzGz3oDdALdw0+wjJwzyKypyIbBj1dtZzwlE
         k4pr+7v9vPlq2SCNrQK5yOa0XlzoCXwDb5FkrWCj3bJwdPfZXmcaVNiTnFnQxRCwEQNq
         hIUnS/XBcMAGgZseTqlflsJfGiz/Nc6fCyv5y9yfo4w+fkfSYgwYPdeI5uQY/gsERa96
         UZOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775615636; x=1776220436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHlbK/BsBx2bsBdFDlq8m41PA5eMLpW+4eYLKAyppzY=;
        b=rDS81We8DOJWygo73+J+39BS5iyAAWp3xQHqGC0PC7GxDJdbXQWFRKwSlSXbQxwkum
         Yv9If/8YifgMXc3iM/zrU8NEPuirzP4Pm3OQWUPE6SFeUMWxtmz0QgoHcyxfemNvCJRE
         b5dvwZ8yye2F5Jz60ai9vDTzp27aQCaCsMx7XNDvRcNETENhBKamN5HmcO2GVEW2Kg83
         xvuQx8s1jO/G6AbwBFuPuOm+S+bms9TzkqnIIplEQBukxYHq8vwTx8Yq5sM63NKmf2tQ
         pPyXNnQpJ7koLhf9srp5EiCw97sfMFDESCWO5i71SHYzdPmIPZeanm2nPiaHzhfOng8r
         1E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775615636; x=1776220436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHlbK/BsBx2bsBdFDlq8m41PA5eMLpW+4eYLKAyppzY=;
        b=Z1Zhzlb+xGiTKYkXkDYQdIj0DCXJXFe042ZeYQ2ugsJBtAsLNE83pJNuvgX5XsnnI+
         wUc4P4lqEA1yOJgtBYSKqFa08J7zmh/FcHa6v2SKNtLbcp+y+KpJDkBujGMoAvlqHh5L
         k0TXrtHUdK79zMsmjOYaHJZQtDKtGfIpfteuXVZUvAMW3fQcgIH7FGabla4k8yUbPPy2
         yxhyPU5y6GdpfCa/xJTGESE6L9qEYEXkh2pjXdqDFPzyO33JTVitnupyEqh+lEDEIXo+
         sv5PB7AbMlR8rXBNXlyjLUsHm+gm5WFwhI4+ouo9bIJeOLdQjF/tnmTgM9pwOWoQgRnI
         dl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWO9yzBbrbcFAdODhrvuVDbP01Fr6d8G7YNTqH1BmwKuLFYMrRzeyAAdzMYU4gR3/4D4AZPXi1Al4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKuoGXvPqIKfJQC46pgkIiwlQo0jNbCC5xC42EPI9UYyecY5T
	HvAF/jGXFz4+PZ0vS2r7ZHO1NLtf2JsYjpCiy1POXnvReRnJnj/ypscZOh04gjaszRlfWpjEDsK
	DW+ZZjrI1eJ6Fcpc/Ys86KWLuvysABA==
X-Gm-Gg: AeBDiesxGYF9Oj3QzEmu93UxvNqCeX4OssaLEG21voun6OXTP+E8yJqGrWTPkdpU0Ik
	35fUdl56qYso8yPJyGX35Gnh5l5kHdEMBfXROljc7aGpHuW3gyMzYuTedvafChOPwE2nLtzjnPm
	W7oPuAqPLNTCCo8tXtlmuzYExq71TFjLYgD8mWdo4j55D8cU8s9wheTbaxzo12uu6kV/dsTh8xK
	Iawfxe0RbhUf+7PgNaN1UYJ/4HC+7WIfN/FW7PC2awfRIMCtDfm1jmo+Lfztohx5eGFFrcVE3VM
	Ab5nBtDq1wQ5wzZ/uw==
X-Received: by 2002:a05:7022:60a1:b0:128:ceac:6db4 with SMTP id
 a92af1059eb24-12bfae11275mr7059978c88.6.1775615635809; Tue, 07 Apr 2026
 19:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407001310.78557-1-sj@kernel.org> <20260407160546.52220-1-sj@kernel.org>
In-Reply-To: <20260407160546.52220-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Tue, 7 Apr 2026 19:33:43 -0700
X-Gm-Features: AQROBzB51dj7-apCsQJ1K1CEdPrKZ_udnrigOM_8d5fSjl2af8KxTgRvnKk80zw
Message-ID: <CALa+Y17YnrOe=UXWBMKJ1U6seKJuauDqAdTDYo1cCYnrP_vSFg@mail.gmail.com>
Subject: Re: (sashiko review) [PATCH v6 1/1] mm/damon: add node_eligible_mem_bp
 and node_ineligible_mem_bp goal metrics
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 9:05=E2=80=AFAM SeongJae Park <sj@kernel.org> wrote:
>
> Adding another thought at the end of the mail without cutting the previou=
s
> unrelated questions, so that Ravi can answer all my questions at once.
>
> On Mon,  6 Apr 2026 17:13:08 -0700 SeongJae Park <sj@kernel.org> wrote:
>
> > On Mon, 6 Apr 2026 12:47:56 -0700 Ravi Jonnalagadda <ravis.opensrc@gmai=
l.com> wrote:
> >
> > > On Sun, Apr 5, 2026 at 3:45=E2=80=AFPM SeongJae Park <sj@kernel.org> =
wrote:
> > > >
> > > >
> > > > Ravi, thank you for reposting this patch after the rebase.  This ti=
me sashiko
> > > > was able to review this, and found good points including things tha=
t deserve
> > > > another revision of this patch.
> > > >
> > > > Forwarding full sashiko review in a reply format with my inline com=
ments below,
> > > > for sharing details of my view and doing followup discussions via m=
ails.  Ravi,
> > > > could you please reply?
> > > >
> > >
> > > Thanks SJ, providing your comments on top of sashiko's review is very=
 helpful.
> >
> > I'm glad to hear that it is working for you :)
> >
> > [...]
> > > > > +static unsigned long damos_calc_eligible_bytes(struct damon_ctx =
*c,
> > > > > > +           struct damos *s, int nid, unsigned long *total)
> > > > > > +{
> > [...]
> > > > > > +                           struct folio *folio;
> > > > > > +                           unsigned long folio_sz, counted;
> > > > > > +
> > > > > > +                           folio =3D damon_get_folio(PHYS_PFN(=
addr));
> > > > >
> > > > > What happens if this metric is assigned to a DAMON context config=
ured for
> > > > > virtual address space monitoring? If the context uses DAMON_OPS_V=
ADDR,
> > > > > passing a user-space virtual address to PHYS_PFN() might cause in=
valid
> > > > > memory accesses or out-of-bounds page struct reads. Should this c=
ode
> > > > > explicitly verify the operations type first?
> > > >
> > > > Good finding.  We intend to support only paddr ops.  But there is n=
o guard for
> > > > using this on vaddr ops configuration.  Ravi, could we add underlyi=
ng ops
> > > > check?  I think damon_commit_ctx() is a good place to add that.  Th=
e check
> > > > could be something like below?
> > > >
> > >
> > > I plan to add the ops type check directly in the metric functions
> > > (damos_get_node_eligible_mem_bp and its counterpart) rather than in
> > > damon_commit_ctx(). The functions will return 0 early
> > > if c->ops.id !=3D DAMON_OPS_PADDR.
> > >
> > > That said, if you prefer the damon_commit_ctx() validation approach t=
o
> > > reject the configuration outright, I can implement it that way instea=
d.
> > > Please let me know your preference.
> >
> > I'd prefer damon_commit_ctx() validation approach since it would give u=
sers
> > more clear message of the failure.
> >
> > >
> > > > '''
> > > > --- a/mm/damon/core.c
> > > > +++ b/mm/damon/core.c
> > > > @@ -1515,10 +1515,23 @@ static int damon_commit_sample_control(
> > > >  int damon_commit_ctx(struct damon_ctx *dst, struct damon_ctx *src)
> > > >  {
> > > >         int err;
> > > > +       struct damos *scheme;
> > > > +       struct damos_quota_goal *goal;
> > > >
> > > >         dst->maybe_corrupted =3D true;
> > > >         if (!is_power_of_2(src->min_region_sz))
> > > >                 return -EINVAL;
> > > > +       if (src->ops.id !=3D DAMON_OPS_PADDR) {
> > > > +               damon_for_each_scheme(scheme, src) {
> > > > +                       damos_for_each_quota_goal(goal, &scheme->qu=
ota) {
> > > > +                               switch (goal->metric) {
> > > > +                               case DAMOS_QUOTA_NODE_ELIGIBLE_MEM_=
BP:
> > > > +                               case DAMOS_QUOTA_NODE_INELIGIBLE_ME=
MPBP:
> > > > +                                       return -EINVAL;
> > > > +                               }
> > > > +                       }
> > > > +               }
> > > > +       }
> > > >
> > > >         err =3D damon_commit_schemes(dst, src);
> > > >         if (err)
> > > > '''
> > [...]
> > > > > > +   /* Compute ineligible ratio directly: 10000 - eligible_bp *=
/
> > > > > > +   return 10000 - mult_frac(node_eligible, 10000, total_eligib=
le);
> > > > > > +}
> > > > >
> > > > > Does this return value match the documented metric? The formula c=
omputes the
> > > > > percentage of the system's eligible memory located on other NUMA =
nodes,
> > > > > rather than the amount of actual ineligible (filtered out) memory=
 residing
> > > > > on the target node. Could this semantic mismatch cause confusion =
when
> > > > > configuring quota policies?
> > > >
> > > > Nice catch.  The name and the documentation are confusing.  We actu=
ally
> > > > confused a few times in previous revisions, and I'm again confused =
now.  IIUC,
> > > > the current implementation is the intended and right one for the gi=
ven use
> > > > case, though.  If my understanding is correct, how about renaming
> > > > DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP to
> > > > DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP_COMPLEMENT, and updating the docum=
entation
> > > > together?  Ravi, what do you think?
> > > >
> > >
> > > Agreed, the current name is confusing. How about
> > > DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP_OFFNODE?
> > >
> > > The rationale is that this metric measures "eligible memory that is o=
ff
> > > this node" (i.e., on other nodes).
> > >
> > >  I think "offnode" conveys the physical meaning more directly than "c=
omplement".
> > > That said, I'm happy to go with "complement" if you prefer.
> > > both are clearer than "ineligible".
> >
> > Thank you for the nice suggestion.  I like "offnode" term.  But I think=
 having
> > "node" twice on the name is not really efficient for people who print c=
ode on
> > papers.  What about DAMOS_QUOTA_OFFNODE_ELIGIBLE_MEM_BP?
> >
> > But...  Maybe more importantly...  Now I realize this means that
> > offnode_eligible_mem_bp with target nid 0 is just same to node_eligible=
_mem_bp
> > with target nid 1, on your test setup.  Maybe we don't really need
> > offnode_eligible_mem_bp?  That is, your test setup could be like below.
> >
> > '''
> > For maintaining hot memory on DRAM (node 0) and CXL (node 1) in a 7:3
> > ratio:
> >
> >     PUSH scheme: migrate_hot from node 0 -> node 1
> >       goal: node_eligible_mem_bp, nid=3D1, target=3D3000
> >       "Move hot pages from DRAM to CXL if less thatn 30% of hot data is
> >        in CXL"
> >
> >     PULL scheme: migrate_hot from node 1 -> node 0
> >       goal: node_eligible_mem_bp, nid=3D0, target=3D7000
> >       "Move hot pages from CXL to DRAM if less than 70% of hot data is
> >        in DRAM"
> > '''
> >
> > And the schemes are more easy to read and understand for me.  This seem=
s even
> > straightforward to scale for >2 nodes.  For example, if we want hot mem=
ory
> > distribution of 5:3:2 to nodes 0:1:2,
> >
> >       Two schemes for migrating hot pages out of node 0
> >       - migrate_hot from node 0 -> node 1
> >         - goal: node_eligible_mem_bp, nid=3D1, target=3D3000
> >       - migrate_hot from node 0 -> node 2
> >         - goal: node_eligible_mem_bp, nid=3D2, target=3D2000
> >
> >       Two schemes for migrating hot pages out of node 1
> >       - migrate_hot from node 1 -> node 0
> >         - goal: node_eligible_mem_bp, nid=3D0, target=3D5000
> >       - migrate_hot from node 1 -> node 2
> >         - goal: node_eligible_mem_bp, nid=3D2, target=3D2000
> >
> >       Two schemes for migrating hot pages out of node 2
> >       - migrate_hot from node 2 -> node 0
> >         - goal: node_eligible_mem_bp, nid=3D0, target=3D5000
> >       - migrate_hot from node 2 -> node 1
> >         - goal: node_eligible_mem_bp, nid=3D1, target=3D3000
> >
> > Do you think this makes sense?  If it makes sense and works for your us=
e case,
> > what about dropping the offnode goal type?
>
> Now I recall I suggested the offnode metric because I suggested to run a
> kdamond per node.  That is, having one kdamond that monitors only node 0 =
and
> migrate hot memory to node 1, and another kdamond that monitors only node=
 1 and
> migrate hot memory to node 0.  And I suggested to do so because I knew it=
 is
> suboptimal to run DAMOS schemes with node filter.
>
> We made a change [1] for making that more optimum, though.  The change is=
 now
> in mm-stable, so hopefully it will be available from 7.1-rc1.  So I belie=
ve the
> single quota goal metric should work now.  Ravi, could you share what you
> think?
>

Yes SJ. I think we can make it work with single goal now that the
below commit is part of mainline. will give it a try and post an
update.

> [1] commit e1ace69c33ec ("mm/damon/core: set quota-score histogram with c=
ore filters")
>
>
> Thanks,
> SJ
>
> [...]
