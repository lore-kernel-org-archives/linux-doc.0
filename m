Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EFA36D4FC
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 04:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359004; cv=pass; b=QSG8ewg6stLdVEKxS9y/YgWDecTWe3ekMDvjPXU/xm+uxX/iBLazcTgOHchfORHpSx9QfFspQOG8/LvoQQFD/CT5cNz8wcHsckyRYsc8VkdKR5TfTOrBSSVfSKlT0uwk0NjEtul2VkvDLCFOc+QLZaEH3D3Z+vqZGp3a37mpLTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359004; c=relaxed/simple;
	bh=OuocpLdMNPQW3Fx2t6L/bKgKdcwFNsKd1HJmgA5pc9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NylerrC5pdO5w7gmGJN9q0m81atJ1q9CJHFWfd7OaDsaHd7aylY0SxilFmu1SSbqyKp+Y55KDjI/QQOSljY7YVn4NH54B024pis4qAHqlfwcMrSUzfmWETcJKf0X9aiBQmxlbIukvekNVLyvXwV1aFUTUH9CcDdu7RB6p5+gmjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ri77OcEB; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ri77OcEB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso10473815e9.2
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 21:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789359001; cv=none;
        d=google.com; s=arc-20260327;
        b=jb0ftUSyXgGsX0kgOXX2mk5sgGEc1b9cwHgfN+kUKArtnaiRljd1FucwQMeqjGwCiS
         aSTLpIjbWgSQpSleiRByybVolr1HQYBuSeRpxKVutGfRNUHxazM/dvT9iyeX6x+BFS19
         dBmr4vv5yucJYzDV9p0Ad6oedTPXci9PRZ1Ee6uJJG7nJi4qpH2MdBaJSBISH2f9HrUU
         hvhBzA0Zs1/WKg+PrF9b9EID8CWRpx0ewghUGDdnDaw4ZJqUzsbLZ3yKWfZkCN3WJivY
         hzoP9O0yaKEXUKjFRcaab/vcOcjXf0zFkxUCrj/E+WdXlWlzpURfBBq/03O4mzlttO3L
         K5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QtqliJ4xhgZPrGv7aDR1sY82Ecpr9o/c+cAlkpJq1QM=;
        fh=GjgpYT/AzJiL5RYCLKgfEnAdTAikEGoNJxaR/8JMqsY=;
        b=pHE14LYOfmv3LofHnVAeFKycj80RqLw9dBe11acN7hRlHes1uAaWFTLJcPO7uXYEy8
         zo/mZ1Wq6CSD/m+qSTYS4riUPw+qGi+ix7oHOIL6uLhHxGpNaETL38vjTDXpvyCuIxNz
         DIrK0gVLrRe8BCrKf3eDsp3nghBRifdh9k6MViq4GH54cKQHgkmhe7VfvmdxlTQJVbLA
         BnU0U68n3brQM7aiOfn/ENL2I0sqP+L/PirYxGtyOVMOmo480Geow3vbentmYBYppN+3
         dJEmLSTISn803TC9xec4iTIi9jn2M2oqXLB+SQaBgc9rim+vx3dRS88gqobXg71/gcIs
         FleQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789359001; x=1789963801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtqliJ4xhgZPrGv7aDR1sY82Ecpr9o/c+cAlkpJq1QM=;
        b=ri77OcEBJSqUsoM6YYvlzR4cddlX/zbZ2Uaw+ACwCz7t8MW00/LAIOLOb8Kh09P8Hr
         f9ivYqMysVpbTVlC3Iwh5T4+BURmduexD0BwFyZCv+G2MWfO5DLvR8QdQPHUD9fg8mxf
         VFJ5YcMPR7J+7w+RH0u9YK0s2QXzgl3hN6lDi0piaKGQASirkAp3t6gpWxljDJuut/TN
         rKPiMvQ4jnl56A0a1gqgf16+dHdm9HKJ3fZHLImQYPQCzpGztAdjL6mIvdbOl/pbpsja
         zZ/jdPf1Q+o+olbdMJznoHgDzSOT3FJe1FSuZHGj3Wc2Mnp5zpeIm9i/RVbVk1pe7Oc0
         qNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359001; x=1789963801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtqliJ4xhgZPrGv7aDR1sY82Ecpr9o/c+cAlkpJq1QM=;
        b=jmSYEa2+1E75LE6XXUK23IWT6YIYKkSbvMWUSfXcuvWDhdwMb6ik2suwLycL7Rc7o1
         pB0nH/L0Iaio99cQZWNq1vClOpvfVBOaJODAAbcQjlk0A3GtcH0m1zt396N+35MmvYOc
         Vnl1gKlS6QluET+yg3M8SedZhEgXh+zhcQ1cgJkftdUz/h5kpA7FG0Cffe/qpd4WnllQ
         JcIupeAwac6bmB9JQIHPOGzO0HMA9n8plEWchzCaWNTvvcOZiKimq9e+BR1RhqvOSP6T
         sSva04SBNoGerMzbdboyKnVHm4mAq6GGA31lLkkungSPqxBWQUrh5B8GqlIm7xumAu47
         6P/Q==
X-Gm-Message-State: AFuF++lffmi8TZD5QnHWRxSnC6+TLO7C/s+NT1G+gKN3Es2UPj3H43Nj
	jKGyT8nXq42kZ7KtGsVjUzwV4rJ/hh0K7hJ3oAFGlrDh+QkPwcFHMN9sWv+mKUe32LtiJ5M9oIr
	jQ+kaakxR9sxZWHoCQ4Mn54isaP9rsmA=
X-Gm-Gg: AYBFou3+72hG1ASILAAhr6+F4392FAAuM+CH1hhcgZm3Gu+fiwkwmAQ4ufRJYzfw220
	xEWqlxbmXdYERv8scR5gme7yxEcv8m/SYV6MXgajOzpnYWMVBdSyBF/BuqYuJQ6uYXvMtnPPz+V
	yilwNa9FRmYg5eqg7eB8Hmw1V1nsTbjTGe017szHwW+ph7MN3fNFNOr+sehnykvWHGN3wCF3gZT
	ilHKGGbKjoROB1DA3qWgqr06u8Ea1leugvGCBZ0YuJysDgyWMdEhacG0ATk7onujRJGXTO5mIfo
	idf5BDyrdtSU7BGAhEU5hhaNLP/+XhlrjAfbJWS6Rxf7i90+0I1KeRKB7jLddBX9R0VtGN8izp7
	tj42+Xxqi63/7dg==
X-Received: by 2002:a05:600c:19d2:b0:49c:fa21:1c8b with SMTP id
 5b1f17b1804b1-49e7a69c84dmr7218505e9.32.1789359000887; Sun, 13 Sep 2026
 21:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912024225.2872265-1-kunwu.chan@gmail.com>
 <20260912024225.2872265-2-kunwu.chan@gmail.com> <892d82bf-aff4-4b0c-9585-8438280b45b1@gmail.com>
In-Reply-To: <892d82bf-aff4-4b0c-9585-8438280b45b1@gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 14 Sep 2026 12:09:49 +0800
X-Gm-Features: AcwNN1XWLLaBfaxSIDxW2V2ijIMl_XRWS1t07_7EbkNNIYKP6enYpyX1l6ij_8I
Message-ID: <CAN_Opa-Rr=R1JfuPb+o=DQTHjQEp_0ceKUU=qSPkJbw6HMcnTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation/litmus-tests: Add SRCU fastpath
 anchor-before-scan test
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, paulmck@kernel.org, 
	dlustig@nvidia.com, joelagnelf@nvidia.com, corbet@lwn.net, 
	luc.maranget@inria.fr, j.alglave@ucl.ac.uk, dhowells@redhat.com, 
	npiggin@gmail.com, boqun@kernel.org, peterz@infradead.org, will@kernel.org, 
	parri.andrea@gmail.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 5:48=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> Hi,
>
> This is more of a knee-jerk reaction, but
>
> On Sat, 12 Sep 2026 10:42:24 +0800, Kunwu Chan wrote:
> > synchronize_srcu_atomic() may end its grace period immediately when
> > its scan of the per-CPU lock counters finds no readers.  Correctness
> > requires the grace-period anchor written by srcu_gp_start() to precede
> > the smp_mb() ordering the lock scan.  This ordering ensures that any
> > reader whose lock increment is missed by the scan cannot have
> > incremented its lock counter before the grace-period anchor, and
> > therefore cannot be a pre-existing reader of this grace period.
> >
> > This litmus test models the key ordering between the grace-period
> > anchor and the lock counter scan, where "seq" models the
> > grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> > ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> > smp_mb() and the lock scan.  P1 models the reader-side counter
> > increment, with the smp_mb() of __srcu_read_lock() following the
> > increment.  P2 models an observer that sees the reader's increment
> > before seeing the anchor.
> >
> > The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > which permits this outcome.
> >
> > Tested with herd7 7.58 using linux-kernel.cfg.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-ancho=
r-before-scan.litmus
> >
> > diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-befor=
e-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before=
-scan.litmus
> > new file mode 100644
> > index 000000000000..efa9c0c4e047
> > --- /dev/null
> > +++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.=
litmus
> > @@ -0,0 +1,57 @@
> > +C SRCU-fastpath-anchor-before-scan
> > +
> > +(*
> > + * Result: Never
> > + *
> > + * The synchronize_srcu_atomic() fastpath may end its grace period
> > + * immediately when its scan of the per-CPU lock counters finds no
> > + * readers.  Correctness requires the grace-period anchor written by
> > + * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
> > + * This ordering ensures that any reader whose lock increment is misse=
d
> > + * by the scan cannot have incremented its lock counter before the
> > + * grace-period anchor, and therefore cannot be a pre-existing reader
> > + * of this grace period.
> > + *
> > + * This litmus test models the key ordering between the grace-period
> > + * anchor and the lock counter scan, where "seq" models the
> > + * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> > + * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> > + * smp_mb() and the lock scan.  P1 models the reader-side counter
> > + * increment, with the smp_mb() of __srcu_read_lock() following the
> > + * increment.  P2 models an observer that sees the reader's increment
> > + * before seeing the anchor.
> > + *
> > + * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > + * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > + * which permits this outcome.
> > + *)
> > +
> > +{}
> > +
> > +P0(int *seq, int *ctr)
> > +{
> > +     int r2;
> > +
> > +     WRITE_ONCE(*seq, 1);
> > +     smp_mb();
> > +     r2 =3D READ_ONCE(*ctr);
> > +}
> > +
> > +P1(int *ctr)
> > +{
> > +     WRITE_ONCE(*ctr, 1);
> > +     smp_mb();
> > +}
>
> As P1() has a single memory access, this smp_mb() can't have any
> effect on the outcome.
>
> The one you see in "__srcu_read_lock() following the increment" is
> there for other ordering requirements, I guess.
>
> Ditto smp_mb() in P1() of 2/2.

Hi Akira,

Good catch =E2=80=94 P1's smp_mb() is indeed vacuous as written.  I'll add =
a
critical-section access after it to match __srcu_read_lock()'s
semantics.  The verdicts don't change, but the barrier now has
something to order.

Will include the fix in v3.

Thanks,
KunWu

>
> Thanks, Akira
>
> > +
> > +P2(int *seq, int *ctr)
> > +{
> > +     int r3;
> > +     int r4;
> > +
> > +     r3 =3D READ_ONCE(*ctr);
> > +     smp_mb();
> > +     r4 =3D READ_ONCE(*seq);
> > +}
> > +
> > +filter (0:r2 =3D 0)
> > +exists (2:r3 =3D 1 /\ 2:r4 =3D 0)
> > --
> > 2.43.0
