Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5F4E4C2C
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070980; cv=pass; b=PuHRljUFMZFsahYIbFtr4ubo+malk5y5h0gocwGtyU6wHswA7CkxxswkVQaoCKxPa/loihHNLn/NzHFhfOTiKrfw3Kt4ynxgbxlYZ8Cs7ZyBdUy4aM7xNgPytuxj5CZpWajtwZxihR1jgzBq+wtPjIzBGxqdHXB3DlYKrCQCdIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070980; c=relaxed/simple;
	bh=xCgswTJ/xMHw1lRSMwJ1pqZUnBBu1pooak+t1aa0pNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQ2DW4j2ExKfDQxgdo8suOe7XQlrl9K8DQ5DLIjmGb+ZMQytynSMboi9DM1S0h3AedxUa2C3dTzds2VMzMxVeaSX00dGwo+W1DTWYAHPGBmn/7I4P0WbTos5QXwM5azNpQr8g1c99knsl0OZXkiHjV9Ia5Zv9Y3lDa/33vnWkgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tr9vi+MC; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tr9vi+MC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso26599485e9.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 02:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790070975; cv=none;
        d=google.com; s=arc-20260327;
        b=NsS11141DlH3rR2x0ph2IEezgjJhFoI5H/bJMkrXEwFnRRnh3Aqpn5J8A5zbRwiOuU
         kvbWUxte819RiChhupVznzwVCPIfPP9LGnQtgiVcBnMpyfIzBxogMzP2iQScYAj6F6A5
         tUrEYNuiCwoqx4FvWEPwSr2wkS6zZXy9yOEVpQzUeqACE82VRQ5FlkfNyd+Qd7rbXfL2
         0qtt8uoXD+4gQIuQel/usNow1yO++TlqmmJtQWIiyWQrU3H9ibkWEq2QvIx7Z2OW9U4O
         0kOgiofQ/t7Gsq6H5YMAwL+Wj1R6LcxddcJ/LPT2UnJWvX1OOWSlg/sIse52O4Aqezei
         h1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        fh=Qqbv+d0+HpFCYOs/R2R7s9tkxk4qUAkCoUhkc5fV3ao=;
        b=TW0EjCX6iISJi7iLdOHj92ExTOchhVgiEzIo1kEr53ef7FQQ41e6N1pPQxsJXxP+5i
         WoWnLiN4ZRiP0jjar3lLHaWbIRLLhYh0JoprQDzaY7pzPNl0jPAqZ6uH4FQGeMFh7EZl
         BXoxuOhBbUaMWTnuoovxdHd3gj66qNRZnEUphAnfVLd3rP9xSJ08c6QcBrZeImh0oQda
         Q4EJ5Bdr4VkwifPDm41nvUSyNH38LpYpLAZsoW456oaUGUF51b8+6USP1lvl4aXGsoOK
         iaLiagoXmfh6CqBkOBV+TeL6j67DnOIeBDy/tXYCZcCL0nnTk5xGINVgKrLdteN6tA1w
         ULqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790070975; x=1790675775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        b=Tr9vi+MC1ZSYhmvt8E8gHvXsuhiW+RwZCfAMbQ/4V40afkFLSEiDdizYHLUZ1krG6F
         NP0gUq6QrxFqW28XXdCaJ5zgMyirdsX8n1hmxKv+Kx8SzmZ+ze4L80KNPssOZJ+vc7L1
         PTMwNdkk4tzM9y1AI9cODJIC6/A/zBXFzdJ9Xbi3kP2SBDSsIurfTpY1SDYgbl84w+Ul
         pavxN7mZUSFode3gfihnLcT6/6K2FedIhqX7YbmuZxj/Ou8lbsp2oA1IEaOQ3oChgk9V
         Uh/xXZlxX40csubm46oOVjMci2h31t7t94lSw/b9bv4IMfU5iuogVxy3dpmCbTrAEOUz
         d/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070975; x=1790675775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        b=ivM0EdbaBsywXe+II/AiK+GDuNpm4sg2H0o98dEjK52srJ/hg6rZx4jk0VS/kR3I1/
         Ij0B5VM0GmzjfUTCW6fWJ8hfAzghuF0eepXm94gpfLdqA67UhGjYGHFP0+pJEd7QP/QQ
         VIDQAfDbt6MVcR8nF+FwS4N9NVxh7Xb1vj7R+sRcNGqFE77SdUquVBMUScpXk8XGg4h9
         KAqM6JN8fUahPJvHS3ec8zZd2C5jWIDAkyJua9az09UI0k0BhxJ/T3wCLgp359aXcpKs
         fjFe25JyAwLaR0Tp76E/B8LAvi3kl4LdVgpNFXSlyXY1gr4PLosRAh2L1TV6h4JVf75x
         ho0w==
X-Forwarded-Encrypted: i=1; AKwUvByEsPiEt+NEOD5SHeOoeXklArFaoKgPAK6ubyMD87+KEkyyxWRldEccXKbWgVOjbfCcrafnhFAWABg=@vger.kernel.org
X-Gm-Message-State: AFuF++lHCyXLrNZcyIj2Fd9Lmp9wTeWNTTC6Dji4yoH3gw9DWgHV0xaW
	7AalTJXEsOOvHVLGp+jDMqCaqQsWeveAnJ+om97if48HowFXdKTj858NhEAB10tO/2Ld5y4PURw
	aINO4lFpPKEQYToLuTHlkgqTuisKaY2o=
X-Gm-Gg: AYBFou3awsgMmt2Y/UyCDt9xWO/ocYM1+PkWTk/yzqeR91meU7tS+zZidld6W2VcOcV
	KYBPCxxeXzbidSQnzYOb+RyDBMjdW+AR5KZVUr9aKrN3KHGYP11KQlcWQJikLikePV0NMawaS9R
	ZipKY4BYoI6XBe+0zbWZYS+ROGp1MQvAoP5m3C/QEeDY6ku469zd0eV4PDo8oPgGpxNKLjp5sf+
	3xrBjPbxRuEo761ArDseYGPMfVcbJlAEr5EJTkEGVML0TJbb6PThsOXXbc/ht8KNJBuzIDO+rdp
	xb140LUgyRxi7M0tZv9Gdte2jW2Bw1uekn23Qax166gH31VG2bg5zbSD1gb3XudP/i9YlFlufmm
	NE0HAMSte1VdLHg==
X-Received: by 2002:a05:600c:34c1:b0:49e:799a:8951 with SMTP id
 5b1f17b1804b1-49fc56aba0dmr207997635e9.11.1790070974214; Tue, 22 Sep 2026
 02:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922070950.4173245-1-kunwu.chan@gmail.com> <arIyx4BaA2eArvYM@MacBook-0RXW5>
In-Reply-To: <arIyx4BaA2eArvYM@MacBook-0RXW5>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 22 Sep 2026 17:55:57 +0800
X-Gm-Features: AcwNN1WuirzzkFb6JjmLl9oXFf7utj_0mv7EZ3p-lcOEdTyD2DTvMQxEs2mG2t0
Message-ID: <CAN_Opa_kZ1bwgVw5k9E2KkLkK1WP3+J_=n8GW2m83zZMwXVEYQ@mail.gmail.com>
Subject: Re: [RFC/WIP PATCH 0/4] hazptr: add shared scan path and lockdep use case
To: Boqun Feng <boqun@kernel.org>
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org, 
	peterz@infradead.org, npiggin@gmail.com, dhowells@redhat.com, 
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, dave@stgolabs.net, josh@joshtriplett.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, urezki@gmail.com, 
	akiyks@gmail.com, dlustig@nvidia.com, joelagnelf@nvidia.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, longman@redhat.com, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, include@grrlz.net, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:48=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Tue, Sep 22, 2026 at 03:09:46PM +0800, Kunwu Chan wrote:
> > Hi all,
> >
>
> Hello Kunwu,
>
> > This RFC/WIP extends the current v3 hazptr implementation [1] and
> > adapts the lockdep use case from Boqun Feng's earlier hazptr series [2]
> > to the current hazptr API.
> >
> > [1] https://lore.kernel.org/all/20260919000056.3132131-26-paulmck@kerne=
l.org/
> > [2] https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmai=
l.com/
> >
> > The lockdep conversion replaces the expedited RCU wait in
> > lockdep_unregister_key() with hazptr_synchronize() for dynamic-key
> > lookups.
> >
> > The series also adds a shared-scan kthread for concurrent
> > hazptr_synchronize() callers, rcuscale support, and an LKMM test
> > for the acquire-before-scan ordering.
> >
>
> Thanks a lot for picking up this, much appreciated.
>
> Do you happen to play a bit with rcuscale and see any performance
> difference between hazptr_synchronize() vs synchronize_{s}rcu() on
> various configs?
>
> > I tested the lockdep path on a 96-CPU ARM64 KVM guest with Boqun's
> > original mq workload [2]. With a multiqueue virtio-net device
> > (`-device virtio-net-pci,mq=3Don,vectors=3D6`), tc mq add/del x100
> > completed in 850 ms with hazptr and 860 ms with expedited RCU.
> > The rmmod workload similarly showed no measurable difference
> > (1360 ms vs. 1380 ms over 10 runs). There were no crashes or hangs
> > in these tests.
> >
>
> You could also use /proc/interrupts to measure the IPI counts during the
> whole operation, and you should be able to see the difference there.

Hi Boqun,

Thanks for the suggestions.

I collected both the rcuscale synchronization latency and the
/proc/interrupts IPI counts from the current implementation.

On a 96-CPU ARM64 KVM guest, the rcuscale results with
nreaders=3D0 are:

                avg       p50       p90       p99
nwriters=3D1:
hazptr          98 us     96 us     101 us    110 us
rcu             8.4 ms    8.0 ms     8.0 ms   16.0 ms
srcu            8.0 ms   15.9 ms    16.0 ms   16.0 ms

nwriters=3D16:
hazptr          8.0 ms    8.0 ms     8.0 ms    8.1 ms
rcu            14.9 ms   16.0 ms    16.0 ms   24.0 ms

With a single writer, hazptr completes in ~100 us. With 16
concurrent synchronizers, the latency approaches ~8 ms, while
RCU rises from ~8 ms to ~15 ms. The shared-scan batching
appears to be effective here, while the scan-kthread polling
mechanism has a significant impact on the completion latency
once multiple waiters are present. This also motivates the
Bloom-filter redesign you suggested.

For the lockdep workload (tc qdisc mq x100):

                wall-clock    IPI/op
hazptr          ~810 ms        5.1
exp RCU         ~790 ms       12.3

The hazptr path shows substantially lower IPI activity on this
workload (~41% of expedited RCU), though the wall-clock time is
similar. The lower IPI activity does not translate into a
measurable wall-clock improvement in this workload.

I'll update the shared-scan design based on your Bloom-filter
suggestion, make the rcuscale target cover multiple objects,
and add the forced-slowpath debug option. I'll then rerun
the measurements with the updated implementation.

Thanks,
Kunwu

>
> Regards,
> Boqun
>
> > This is still RFC/WIP. I would appreciate feedback on the shared-scan
> > design and the lockdep conversion.
> >
> > Kunwu Chan (4):
> >   hazptr: add shared-scan kthread
> >   locking/lockdep: use hazptr to wait for dynamic key lookups
> >   rcuscale: add hazptr scale type
> >   Documentation/litmus-tests: add hazptr acquire-before-scan test
> >
> >  .../hazptr/hazptr-acquire-before-scan.litmus  |  49 ++++
> >  kernel/hazptr.c                               | 274 ++++++++++++++++++
> >  kernel/locking/lockdep.c                      |  30 +-
> >  kernel/rcu/rcuscale.c                         |  65 ++++-
> >  4 files changed, 407 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-be=
fore-scan.litmus
> >
> > --
> > 2.43.0
> >
