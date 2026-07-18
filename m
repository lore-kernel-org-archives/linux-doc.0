Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF123A99F
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 01:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784337755; cv=none; b=JowWlpqomDhQtRsiijWs2qFrSqMgKR1Xbvpq6DZBdsBA0jXhPXXtU9cFb+ZnK0KeqQEdmUfr9cg3yzECd/HclJjCrAczyuPlc3BrVQnkXI16368WYGtNRPYugbtKkthmzcJOWUoBoUzjTua9SLY5ymxbdakXnnL8ZJl5SnCmm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784337755; c=relaxed/simple;
	bh=qvvX7eGpnon2kJAYw00KnM4ei55hlmOfmJ2fryzV6yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOTx225XlmVgewcvi/dJmtTnRPLTCRu4gB/AftXmplwVfp0gqKQk9bQ8TIsa+oKAOr87+Rp4rNC4swrLcDzqH4iolrAbA4ObMuU90vvmuuOJVheA6202p8a7AZamGuWpVDst9MNSOOWotSQ9/NFbch+ANC38FB7s/WSKf7266cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IblG8h8q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IblG8h8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED211F0155A
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 01:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784337752;
	bh=1sLoppV8+TdV+Vhsdxce2LoaHXJJ1H5bqgRw/kxgZF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IblG8h8qor2f0ewW9cZsNWUp9KWaVF1ciHPOez+379N0xGhaazRCkYuHol4rzeGa7
	 T79d3YqgahD2LHpft0zSHQ8ZTdRkggvcJfW2y6YV9o9FIKKepz1B6EpjD50xn1LUj0
	 B8CjDgLUZA3xjBnCffI2XBmMGxCxfSgLVsnSIcVALIpCwqIb9ejjccoDDPRfDcS0wu
	 VbUSb9kGgF9olEYNcNxKx/suPI7B9Lnzd6bvgkTQCpl1vbd0gcUBqTJNkEslZcvZv2
	 9lKAWvobEcHhSBBbWBDnqlfZOkRM/AFk1vpXUG+bARG9OR1YngiaEL3dYmywfqeNq9
	 QdbkK3SSewbig==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1740c36c5cso153618266b.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 18:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpmHLhEVtN1/EyKdhxtDgGuXIqZsotKJXgVkzrDFTHBHB/A0MSOItMqA4VyLl9YrhhIxSceYjKkGtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGM3uip3SMx6sDjI13VEuD+afxp8FhAqHpcYjJojAhSdto/mKw
	G3RLWJXxBoPP441DrP2KU9t/LQaK7bXiiHW788ofZ4A+nMgDrrX2deXbBl/qY/Swm2AKk8Elz/d
	Ar6v5p7Sqz0983I9vBKPT8SX6z39lJm0=
X-Received: by 2002:a17:907:8e0f:b0:c19:45e2:b3c2 with SMTP id
 a640c23a62f3a-c1945e2b59fmr152919866b.10.1784337751563; Fri, 17 Jul 2026
 18:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com> <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
In-Reply-To: <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 17 Jul 2026 18:22:20 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMB5ujLvaE=Vqo-TMBmuNEsjxKbhQZXdvxH2BokK=s25w@mail.gmail.com>
X-Gm-Features: AUfX_mwCz7mSEnlf0zMh4BWAJigaOLZBXo3xjsSIEftA2Oqygiglol4aExmseqc
Message-ID: <CAO9r8zMB5ujLvaE=Vqo-TMBmuNEsjxKbhQZXdvxH2BokK=s25w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global shrinker
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 6:18=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 17 Jul 2026 16:51:49 +0800 Hao Jia <jiahao.kernel@gmail.com> wrot=
e:
>
> > This series fixes and improves the zswap global shrinker (shrink_worker=
()):
> > Patch 1: Fix missing global shrinker when memory cgroup is disabled.
> > Patch 2: Extend shrink_memcg() to support batch writeback and update it=
s
> >          return value semantics, thereby improving the writeback effici=
ency
> >          in the shrink_worker() path.
>
> Thanks.
>
> [1/2] is a cc:stable fix so it isn't really appropriate to combine this
> with [2/2] which doesn't fix any bugs.  Because the two patches may
> take different paths into mainline, with different timings.  But that's
> OK, I can deal with the splitup if needed.
>
> The [1/2] changelog lacks a description of how the flaw impacts users.
> Please describe this fully and maintain that info within the
> changelogging.  This info helps -stable maintainers and others
> understand why we're proposing a backport and helps myself and others
> with timing decisions.
>
> Finally, AI review might have found an issue:
>         https://sashiko.dev/#/patchset/20260717085151.22822-1-jiahao.kern=
el@gmail.com

We discussed this one in the previous version, it's a theoretical
scenario that can already happen today.
