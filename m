Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FB383C97
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640540; cv=pass; b=jMnb6rcu6oq1uqIRxLRFmdJyghARj8lkfNgilztYkoPJm3m+TNpx+8L1tClWNprENAlNxPqTeRy9Xind8Acx6aHuZG+JdQYzOzFK+XYnNWnkxnNKOg6etBQ4WDU1ZSMUYoviLPuN5jRXxlKbIO7jbU/oyIbjSoNN/PkFYXJZtwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640540; c=relaxed/simple;
	bh=Rnlo4U+8XVQcpe9elBQDCdpqJEQyFEfgWsDtAuY9ZpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L89cO7rcbCkfoVz9A1NZUeRXP01ptQNeez97194osINL2qSQnhM5wiixeujQTeMU9kyHxejiJli1p+x0JdaWoCSrJWHg/lrCYWO3mfx/KIEoDtzl9bhK3Kq0a3XeoDhDpRIVXYuih9UA7BJ46B0Rl6ImtjZiXGj+hvdIzyCx+YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnW95QxI; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnW95QxI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-461a15cce0bso853104f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 13:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781640538; cv=none;
        d=google.com; s=arc-20240605;
        b=OWSl1pYdr5PGminkr58qfQZI7PM83VV4ggBnS8SVYJdwff6gaIy39TMO7UTuylZHiT
         Vp0JI4k2t1lujtmdErwnKM8p5cuTaFErBlNLrjmc3FhIOIJttOxs4LN7+CoPtRIsanNi
         wyN883xhFC2zkAg/HbRB8CCRwz5iFUZp3CR891DvX8yIi7Bo59LIQN5ZnjWfCD17dG2O
         SKN4mX8OyC6UL0stRAn7+jLIz8PspHA1UBLTrMK/d/bwYxyFIAYSoyUtoqDUHgpg/+rD
         SvvcRpmZtLG4elff1fSRsylJCOxZU4CYQQxfmE4mr9PRWfVSI6HGqRh9TyhN9KHWVFQG
         qLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rnlo4U+8XVQcpe9elBQDCdpqJEQyFEfgWsDtAuY9ZpE=;
        fh=EmjKQ9//xbMPvyGlyTyHxVIhvNnXTyp5lBNju7wYuAA=;
        b=LB/TIj0VVET/1DfxaBhSMecvew8Evm97aqK/NNbubGuR2kdGhev0LkMRPPfOxDpcJi
         7QKhH3mg5W6l/yC5JKXzkc1+fUx5iR8Ld/V5Ubz7oLxTp0NUbcFxRSClnyT1C3KJfsde
         mVECeOoYJG+P+Dh+5lryCvHaZA7Ut8IPlyt5D2SGhi2SfIUiC59AzCXkR4KbVfk20NMp
         aN3mUApltAc71oO40dSASthnPVJnDcbMvEr08rWo99V13yvBq/06ta72WnyqMkMtciL9
         0tesBka7GJwRqtGu2tgo8/XHX8yiZ7qeQCiCQgFc3KcA8RgfyqUHw6kbPMO6J4xihuk9
         8WIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781640538; x=1782245338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rnlo4U+8XVQcpe9elBQDCdpqJEQyFEfgWsDtAuY9ZpE=;
        b=dnW95QxITeeI/9lxIY17fmj+vdBkrrlzr9kED70mZ5bZgTKgI1iBkXoF/1MBEk1mKj
         jtvf+keNYMHwayd51QQFSvZ9HmagsOvM1EMm5LeGqt8oAIXZ0mlIKLIhYYw7pGkV+WXq
         4kpGSv1e7W8YIHq6VDHqDyLfYUexX+ISyOY0K/JyNBZPIDW1f3hnhNh3//6BNzA1z8Pw
         M4TJLXtaneJL0tfCQaKTgKGQGiiqV+r4DLsFGRmY7E91TJxmbPCwIf1uGOlz9W1XSOIH
         ecZdhjCpTRMmjaY/vOQIMBVTxNW3TKXsrdGSG7N7JyEasToJir2jpspIZi34Dn37dbOk
         JHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640538; x=1782245338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rnlo4U+8XVQcpe9elBQDCdpqJEQyFEfgWsDtAuY9ZpE=;
        b=IV++7Uz0cNFyTVRUfbCoyr7UexYkWLRWdqxNwsvTGRR8o6AfjlspZ+Tb8TyGRJOtT1
         SJzeEZSYGCj8/IbAA5E8PDoZ4H6+vrYrg4a1BOAwaJYTxNYmL7q2J49p9my7sz9L+Agj
         F5n1LfLCz0Prs1qnlGdvojH0+reWvWtGyjoUPUdh+Q+PuwTTLy0Xv9maOu0uKZybKD2c
         8m/udP2yTvlrmQi0x9xxWZJmYf0rVE0gg8nmL+xjoyvTO0PtsyFthaY8pgLafwEVmTvb
         ylx4pfNCroHesaeh2loWJTsZeb8cTeB9aplD615SskSIL5K7huRu+dKPWJQp+LY7SVHt
         mmMA==
X-Forwarded-Encrypted: i=1; AFNElJ+xR2VWqeLlZ4eG4wsM8fekuiRDn5mF0MId18KvkrJOmX5StR1EtPyk/2HApq89anwtvdHMTeXAh9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAiuBEhRLL0FzbT02RMaaAowmKntIiX8MFd+B+fAoO+aXBWsM
	siKjXol9hG73ZhPVjGJoi3PgB83rU2wFldiBTDpQSn0AfUKlHKTdlGqNrL2toMwEo39BZOVhtx7
	L7m4p67DfBjYtONFJWSVPxnFMG6EGoPo=
X-Gm-Gg: Acq92OHBNgEYlGW2kZgfJj8EjuP2GacOVBIli3UKSMsHBC84xNvIpNweej/X73j9UkK
	aLfU5N8ElEGGMlMZYyla4dK6s695Pcs2f2yFJ9ia1Kabm44DEv88sHDovQe4L1HlbgpT8AUY5KD
	/lMXfmh2FOQtBXZixttN4cDq68yn7fqMFJ6rI3dLambfXotItKGD+YbD+VeENcpgZIghmMxqL1l
	qcqv8DawAdBuS2AUH/PiJr9tDJcNW6jqh6jtMhNdpFzLxEAyMk4xZiD/YTBC8ZivAk+iPJcQmBg
	b06C9+yaQSbeAdLTPmSkbjONZ0DQjJ1+gIz8d/N8SfdZxMhUZF4oN2Q=
X-Received: by 2002:a05:600d:8443:20b0:490:b0e0:3de2 with SMTP id
 5b1f17b1804b1-492333f7715mr12498135e9.33.1781640537700; Tue, 16 Jun 2026
 13:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aictKA0XWMWbxFdN@linux.dev> <CAO9r8zPvCaCqvoUhPdAN5Oi_Sj0mK-t7DJhOOz3Xf1DT-Wrgcw@mail.gmail.com>
 <aieUQUBHI+E3uNPW@yjaykim-PowerEdge-T330> <airzE7jD9UtyR17J@google.com>
 <aisEWnb3pzmVC4dl@linux.dev> <aiu06fbV7rWqY0Bm@yjaykim-PowerEdge-T330>
 <aiw2p5ANjsQUCIHA@linux.dev> <ai5y923elCSZp41j@yjaykim-PowerEdge-T330>
 <CAO9r8zOVqbJEaBqTHw=r2bYw7Lm1tO0TU9QuG+eH1rfqcTAJJQ@mail.gmail.com>
 <ajCgzNIPLhjTRSXR@yjaykim-PowerEdge-T330> <ajC+FNpkVpI4pbBz@yjaykim-PowerEdge-T330>
 <CAO9r8zMimM8n54BL1viuX3pYzO=wzQU89LhCF1HW0bAv97ZQtg@mail.gmail.com>
 <CAKEwX=Nz9SWcEVQGQjHN8P8OANJY4BG0w+iQOzoNOWuteoVjAg@mail.gmail.com> <CAO9r8zOD7XaJ0Uo_LLLDTRKbeTOmAwmM3q8q6rUyH3oS-X3Csw@mail.gmail.com>
In-Reply-To: <CAO9r8zOD7XaJ0Uo_LLLDTRKbeTOmAwmM3q8q6rUyH3oS-X3Csw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 16 Jun 2026 16:08:45 -0400
X-Gm-Features: AVVi8CcJkF64DjJPscg6dRd5pZugnnFWUYYuUhZo9kqIJ3vQ0Lo_eZdOtaRqDxM
Message-ID: <CAKEwX=N=Umi94wdKcLxEWOqUwhz6=Lj909pc1Pr_5ivVnZmdPQ@mail.gmail.com>
Subject: Re: [swap tier discussion] Re: [PATCH v3 2/4] mm/zswap: Implement
 proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: YoungJun Park <youngjun.park@lge.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, mhocko@kernel.org, 
	tj@kernel.org, mkoutny@suse.com, roman.gushchin@linux.dev, 
	akpm@linux-foundation.org, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, chrisl@kernel.org, 
	kasong@tencent.com, baoquan.he@linux.dev, joshua.hahnjy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 3:54=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Tue, Jun 16, 2026 at 11:33=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> >
> > TBH, without vswap, we should not allow setting zswap as its own tier.
> > It's meaningless. Maybe makes it a no-op, and warn users what they're
> > setting is gibberish?
>
> Why? vswap is transparent to the user. Why can't zswap be its own tier?

Without vswap, if you set zswap as its own tier, which phys swap
device should we allocate from for the backing slot? :)

With vswap then it makes sense (and would probably be the "default"
for zswap setup until we enable zswap writeback).
