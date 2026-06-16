Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C25143CEC7
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 18:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781634791; cv=pass; b=LKPbgFmJtt/oF9nLCM5ogYt9v/Xu9TS3+rPWMtO2px65aSt+TdULQ/4ccymm2rJSPNjU06hOqHHTGdJ/PAVEadKGLMFa9KA9X7BLVXr6RSCasN8ElX5n8LojzWVQl7aIKfy01iBgJMv/yLaUHKZSSOlgESr0+P0JjouI6b8xV0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781634791; c=relaxed/simple;
	bh=NT2iUMwBE5Z85f4aG0bWlhqwSr2O2rCOPr2R/cDrbl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVGlu/qzKrbCU5gTzC5Dg99qhl+atCJb8zdf3CeVKsZ1UdAk4wVMYt0EAi7OfQwb8qvMHcGigCpl5vjqMSVygHw13IlU+wM8FeuzaBzXwrxpK0qgqpVQ/3qucSv0CO58MIAmW1E4UcO0WIAujBfUd5YCAvzfUckoxYDG7hLWxXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5pQ7Yyn; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5pQ7Yyn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b7866869so49919135e9.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 11:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781634789; cv=none;
        d=google.com; s=arc-20240605;
        b=WeGF16Axz0XnXNMls1y8+UJebdbpQnaLQqoOn2Ze7QkgmDQRi9Eq/RBcE8s1SuFU3K
         fhoegcV5yS/zYIvj5MOvC3RZDZ1+HWKTbI76lcpka7VfvFxNC+4MDORLAdF0E/WATuON
         jFgIJqFIhTeplPWS/CJ2vY/dGYIb5+MD6zFnMb6OZGlWYsHVf0yHdJ62WK2KZBr/jGtL
         HuS89sMNMoQwYXu7D/v8jxpNwyN4KfNJwfDopEIIfymsDkHaLHLnWRFyRubH7pQYyHFO
         jdKd+3CsiktAH+0Siyi3PMozb7yPQOieR/5tJBxjktHHAoP+xuKDvs/pec9P1qtkSEtQ
         WSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lXf8nL1WjPPTXu/ygIqCbfgbzskizrSAlTvqvC5a74c=;
        fh=fzMnKknyeXMCupD1ox2fe3PA9Wlxm4D1+vzxkGFZaAo=;
        b=W5XQjx80AmpXAsaNMbj5Rc6/PvRVzniB7MmRC0y6vCIsdWCfTuJ9pi+QJLnHkhCnij
         57nNnFiyO2YLi8naFNp4YS1vFYqLYjC0OvQ/0FtRQ3pV275Nq0b663CSlLNgKGjXyRzU
         P5/KDyiFbXDta7kEyrFEBHsLhyeSeUN29jdIqrqUvzQMJ/a6RolGV8FckYT9pNurPzts
         7i7GeQBFmB7ptAENzOX1FTo5xVbLC/wt0rCD5OdR8cEh03BPqjkKmDUfhzh9VN/i0dbx
         SjUW2fX5AB0QJtut/r1qV3Xe1V6a2qLlRFM+D4M6AJwTqoMqB8PqASJT23VG1rU3cN7n
         pMFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781634789; x=1782239589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXf8nL1WjPPTXu/ygIqCbfgbzskizrSAlTvqvC5a74c=;
        b=b5pQ7YynKEslOsz9nnWT/snLvPkHgApnwQmOs6TF5yYLFPKnbKdDK8PhnrIn2Pf/zY
         2S28uGzVpInosd2i5Fgs9LkMkxUbBU8oDyEXzjubOrGuVWVyb9Oad6CDGkLk6snR9XOH
         V1bku3OvAScAhXbapIFHG9RajRrN/dE6mP4+i717QgIylZt+R57RTeGU1i+WvKWFD4/2
         3x7qVY71mfogGxGosIuR1GUvYchWVCG5I/IA3KGtblrr5sD7y5C8R91ituz6guTru9nc
         eelWulGfv6Fn0XjrKP89tAWg6CSWbKL7F/iiHIKXrkmO6zTUQrUXawyAF2xxyIjx2qYU
         pv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781634789; x=1782239589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXf8nL1WjPPTXu/ygIqCbfgbzskizrSAlTvqvC5a74c=;
        b=J1DVe2cdwnmEa3f9hbflgiTNiTrcSuQ8dd2u+rhl8ITF98GmdSp7TQRHjJW0eSgZWZ
         k3HpnZqipZuiRg3xFN9w+vyC/IYgtQWk6POVkboRIi8E6jbO6BbpGIy7lSfKJEP+8+kE
         cGOYoDVvid8R+3UNH93BQjmpJypNzYX/mORt+3qy0VgnASR97cmtQlhqhD5qNXmcDQBo
         42AXXBmAaUbPNlxee3dEKKcfOukDELlK7RLpy5yZLXICuYXeRLXXtzURsV5FGmjO2Hyb
         srAV+ztliuiX7JNo1Ng3zZfOMjOetkcAzWCzRRofcJ79c/Kn55UcIAqlF6hvBkv5bLlI
         EmfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9iu9XB6WHj8NJbzF7A19QRVH/MJiSgGpPYDvGzx7rz+UFHENBtKAty5WWq1dpu/IlD1BkQ5SGPU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUso2M0YdlRV0oo0Hpq7LA+A/NhTiwbMjMLTeI9kHeAi8WtCM
	e6G37f+GBA1YNbdc0V5roepJRDPORppU7Jext3OMCcwaZ4suEQkiu97G+sQyDCB4Rpae1IZ6ORk
	PJOAzPI3qXy2ruW1hIp62xyYMA+AG61U=
X-Gm-Gg: Acq92OGjXP5vTqpSxT/TbSgQgY+LI4lwU4MnxKJc7JI2+QafjTSVW4OnAVbyrdotYdq
	Ro+QC5AbEJE32pZBhip45283ixQEi99k9DM/k3DLtlb9kyzrKx08H4ZSoZwZDfW08m68LXSlPtY
	zmun7S7K5nmklAha2x79OkwoWL9brjosskTTnTeVV0JPKyo7M2TYwFo/HIJBO8H/mHpXslrEIFN
	QXu405B26fet6+Pqj3T8z8lFVcX5bmpsZNYpszsk5ZElACaoXAtIqC1A6m6cZTgl8PkIXRTFKUM
	+x1hlcJsQsGNeEi26wuJ8JuPQJ+NshWHLUhhA99Rvz3l/+4gr4jCRck=
X-Received: by 2002:a05:600c:4e89:b0:492:1e36:bafd with SMTP id
 5b1f17b1804b1-492333df13emr10676665e9.37.1781634788536; Tue, 16 Jun 2026
 11:33:08 -0700 (PDT)
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
In-Reply-To: <CAO9r8zMimM8n54BL1viuX3pYzO=wzQU89LhCF1HW0bAv97ZQtg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 16 Jun 2026 14:32:56 -0400
X-Gm-Features: AVVi8Cfr8CEOZKUUld5jFV5E_U7IZnrXsKXwb_Qx9BDKSv9h1SLfYRc_8OLu6YY
Message-ID: <CAKEwX=Nz9SWcEVQGQjHN8P8OANJY4BG0w+iQOzoNOWuteoVjAg@mail.gmail.com>
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

On Tue, Jun 16, 2026 at 1:31=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Mon, Jun 15, 2026 at 8:08=E2=80=AFPM YoungJun Park <youngjun.park@lge.=
com> wrote:
> >
> > ...
> > > - "zswap tier only": Only zswap is allowed. Fallback to other swap is
> > >   blocked.
> > > - "zswap writeback disabled": zswap is allowed, but if zswap_store()
> > >   fails, pages can still fall back to other swap devices.
> >
> > Upon double-checking the code, my previous clarification was wrong.
> > You are right. Sorry for the confusion. "zswap tier only" is indeed
> > equivalent to "zswap writeback disabled".
> > (I'm not sure why I read the code that way...)
> >
> > As I initially thought, it might be possible to replace the zswap write=
back
> > control with the tiering mechanism.
> >
> > If we need to keep the existing interface, we can integrate or share th=
e
> > underlying logic (though the specific details need more thought anyway)=
.
> >
> > It can be summarized as follows:
> >
> > - "zswap tier only" + "zswap writeback disable" -> meaningless (noop)
> > - "zswap tier only" + "zswap writeback enable" -> meaningless (no writa=
bck backend exist)
> > - "zswap tier with other tiers" + "zswap writeback disable" -> uses onl=
y zswap
> >   (can be replaced by "zswap tier only". This code could be intergrated=
, modified or something.)
> > - "zswap tier with other tiers" + "zswap writeback enable" -> works as =
is

TBH, without vswap, we should not allow setting zswap as its own tier.
It's meaningless. Maybe makes it a no-op, and warn users what they're
setting is gibberish?


>
> Hmm we might want to somehow disable memory.zswap.writeback if tiering
> is enabled, to avoid having to deal with this. But I am not sure how
> possible this is.

With tiering and without vswap, you still need an interface to
prescribe that a cgroup can:

1. Allocate slots from a certain swap device.

2. Use zswap, backed by those slots.

3. But no IO is allowed to those slots (no writeback or fallback on
zswap failure).

So we still need memory.zswap.writeback, until we get rid of non-vswap
case for zswap.
