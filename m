Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D43C9426
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083678; cv=pass; b=NDaLZUWsyWLeEOVXfy4V+UIwyrzVd8+5Ynwp7Rw1XgWtXvu4TWtGmrHElASW8PImZV1+p1VYjAQg5s17Hp4M2Ohk+/B4PKSsvIjUR1fwAk/SvjmI+2/UkarC4XTTUQG65a9MU7E9eAON1HER0LnGRGP+U8Kl6RD8STF8T6Egxjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083678; c=relaxed/simple;
	bh=7Pa+dNJYGynoLkAUGjb4J4hrWHiM/xV6A//U2j1wNSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpcdu1pjworFWSUm0pz4m8Coww5s6zt64aT5DPWVMZSSSr0FNntfGNNWiff0TEVQL/BH6/Tt8HO70vqiFSDdkL4PKUAZsF3RXzjBbrud0zTEzEWCl7i8Vfa69OwG9c+0ZlbqBOj7Xn7VMSePBewHv1vdjEGk0hAS6l/Onw4nZSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIOfyyrL; arc=pass smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIOfyyrL"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1329fc4bf77so4638104c88.1
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 22:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779083670; cv=none;
        d=google.com; s=arc-20240605;
        b=dL4o5JwvXKSYY+N5b9GvRGf2r8zofOAS3L4HhfMRXo7JaFUwjaJbTTZu94r/iZXsD2
         3XgRVYCHdKPDvFJ1fs4EWi+qag93nltJxWCO8mFLYUBhgTSujsMUohPSdFK/QT7jDZrj
         xDTgZmxpTSdg9306XdVq3gJDZGOmQqb5AdeHtHg9kLEgvuo0iXYg7lUl0kNrOfRG2AAV
         cyB4XBqh3KEHnB0KEeyrJgSKFGHkq8FskC1vKEzy/5lOQX1vrv/m7X5lv9P7s0M/aJrl
         Jmr4dTjIY4TWLPlPDvLD4PjpRIC2EhmHssMFQ4RkPUTy9THUfKq8kBsi+eK+SqxlXbeg
         tMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9Xsm/ouRy8rllw0+gW2As39+lMNLqayO0PK1J5oNAk=;
        fh=3GceYLm4Sy/k1zqiFiSfY4srRpkEq8baFd9e8GQHLsE=;
        b=lh5CI+AtH8Kg3febjBDvCewWfGpN77EKvNzFSh8VcnAO0/CA0rX7qd9hgmV2jVaSQU
         chWY5wLO4B9pq2PwJ4nCov5BEx6dKS62B+QiM/Ej1G4QFYuwFLqzPvRlubUp5bczK9j2
         CMozWkQsyrI0wRGanioGp0CXyEt4Nk3TWSJXikTocy6aM05b8rh1wXxWcPKwZEZ4Lboz
         ltBydU3FymlZxqLVGt8xd7n1wYOKqnolwmIQlX2ve8Nvf1Esc7eaRuvKS7FklbyK7yks
         Bs7cCDCTQ9UogKGbmebO7tDm4UrujPoGHLnFNkHSiG1OyU3OC69T9ZLSbPDpeliQqDAp
         eTDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779083670; x=1779688470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9Xsm/ouRy8rllw0+gW2As39+lMNLqayO0PK1J5oNAk=;
        b=bIOfyyrLlWXW9S5mSboke7I6WyFBcbibXmdMbtCd2GKycKGyFGrChCWZcpjUJfQiDV
         PJcWEW2dPmZJYC/w942ursnqCCGPT4MpoWEIcUIzgAbjEGrpoz5cM72NWQg5dsJiKRKr
         OEFORyufkLLRstvkWGyMmfVZrwRtXkwHnyCeX/u4axdH8oB0lDKy2nilzBxVxGU8DnIW
         hD7ZTDTLxpt4cVTiJ5HRNlskE/aMNoXljrKbY0vCiCxzbW1Vbjl3C64iJunLxe+PFsKe
         3Ax/Q1a7bGZStgYS5bQlFChPv+/Gr46e5W2cFl0pcdfdSUdOcCZLfDeq5k2uEtN53e6C
         2/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083670; x=1779688470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9Xsm/ouRy8rllw0+gW2As39+lMNLqayO0PK1J5oNAk=;
        b=kcnsrkawA42UarsqDelY7cOn0sM2mO0Rk1xkbpWXqQO2pE6CF1Sepxyz9aygP9avUh
         sI1m/AcUNMvw4F7VczQpDBHYuSz+lDGUlqEQsA0CBWX0w/ONGzpECW0FbNmBDoYXU0J8
         txfAS3CZvocmkMc/ms9IhDmm88FhI1AUXEIyACUt0wLJ7qLdmRa+coJgkdhBqOleE8h4
         Db7onvM/IRAsJvSr7tHLZm0/yYllDNWqb2Bg801z9GcgclCaLeI0be3VYlY423d4AmHA
         nkG92fxeNvwSjLudmPYtaAUQ4krni254aO0b9MI7DIFlrYQTAa6IAAERteW7ZVcdvZQm
         SDAg==
X-Forwarded-Encrypted: i=1; AFNElJ8GS1CYU1uG5IkAfPXvOKf/zTWgWdi7o7jL4Es64irupI9SmuW5XOgKRLkoFINypmdOMBFv0GDE9dk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2hw/iAVHzC4kTH/YQZZKClSfOoixjF1WZJwN1De3p9YzPjXav
	5IOyZP77C6NQ7NuonPSKzrYYqW9qrM+2kuT0bwwypSGP5YGrKYJrCWpzFUalcsSDeUO0ngNSI4Z
	XSPyFxQufTMkoEc++5kR707eLIVXOPQ==
X-Gm-Gg: Acq92OEF/EIuQjI5Qsc33hDW3nDNZs5J7tVkh8nYhJyjVf7jOE1Dg/QH5TgHimsI6yD
	BLjssp017TIFzwIBM3d+N+juUjS3D0m8CDW193d1oMdo69VrVfrHbZCJbpYvKSgb+N3nafaYPTm
	D7XTL42ggwEDhNKZc8O/HJMqwP4hkHz4UljrlQqXhGXTqHz9RlKR4J+mRm0nDkc4+K26UnDuYMt
	nHZMl3fknhaL8bSnj2x+XPJOUXOKGOkomzZByxhKUSI0mZmRZGcbbC8GPWLu9KUZo8cS5V4gIvS
	aab9Luo=
X-Received: by 2002:a05:7022:ff42:b0:132:7ab5:6cb6 with SMTP id
 a92af1059eb24-1350451da55mr5923196c88.2.1779083670222; Sun, 17 May 2026
 22:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516210357.2247-6-ravis.opensrc@gmail.com> <20260517234326.89365-1-sj@kernel.org>
In-Reply-To: <20260517234326.89365-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sun, 17 May 2026 22:54:18 -0700
X-Gm-Features: AVHnY4JSJ_v1VisgQmkmSmbMTe-WurEHckc4yzgeccnY1Ya-JDuePUsGS8NIYOs
Message-ID: <CALa+Y17XTzjAK5ZyKAKZLN1cAE-+c+2DgqpmuHGWgjUAZMgkFg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/5] mm/damon/paddr: add time budget to migration page walk
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 4:43=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Sat, 16 May 2026 14:03:57 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > On populated physical address ranges the pageblock skip optimization
> > alone is insufficient =E2=80=94 most pageblocks contain at least one al=
located
> > page, so the walk still iterates millions of PFNs.
>
> So my questions to the fourth patch of this series are also applied here,
> especially about the assumption of systems having most memory free.  I wi=
ll
> hold digging deep here until the high level discussion is completed.
>
Hello SJ,

Stepping back to look at this with fresh eyes, I think this
patch is in the same bucket as patches 1 and 3 (full background
on the patch 3 thread): it came out of the same parallel debug
effort, where I was seeing long walks during the startup
transient on a multi-hundred-GB monitored target -- before
kdamond_split_regions() and damon_apply_min_nr_regions() had
trimmed the initial regions down -- and was unsure whether
those long walks were contributing to the NMI-side
responsiveness issues I was chasing.

Once the actual NMI problem was fixed and the per-region work
in steady state is bounded by DAMON's region splitting (and by
the scheme's quota when one is set), the per-call cost in
damon_pa_migrate() is already small enough that the budget
isn't doing useful work.  cond_resched() after damon_migrate_pages()
covers the preemption case.

If a real workload later shows a per-region walk long
enough to matter, I'll re-evaluate then with concrete numbers.

Thanks,
Ravi

>
> Thanks,
> SJ
>
> [...]
