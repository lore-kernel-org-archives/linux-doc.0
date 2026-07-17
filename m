Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DEE2DCC13
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307372; cv=none; b=Lm+VJut7w0ERaKcC2SPuqUtaLgrJly6zky+1uiIz4I6YWfz158s/Dg2omUHEhbyXaijg90u53AiaAVKgXFBBELNGa+lY1bMRcENGvXSmb13lQG0LzqnsMJbpv97w16pgT/IyLafPFgJAXnXqn/2Yajs9i/XZRWLqVDQIE9jaV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307372; c=relaxed/simple;
	bh=YaHlt41/hvOJvLvitj/2kxV3NYCQuixNvOi36N10KU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvwz4efSb0KTymvM2nGK293gDflMomNfTFondFYUrjNZcSFCuJQEYYcfIWdIs4Hn99keUxhrJN1tpxdXRQ29FF4lKAVygP4BMcJzqTESo7GFoGIrE9WqpvhDSe87Br91GQC7BRnrAvTYL0BjOANPA5Y/o9XznmBz8ju6wX4pbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUi2FbPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUi2FbPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3264F1F00ADF
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784307371;
	bh=YaHlt41/hvOJvLvitj/2kxV3NYCQuixNvOi36N10KU4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MUi2FbPm3fwo7a8P3d5fdAYLmDCQg3kxkoNN5vhp7ggx/WyX66s8yJlZ1SBJIvh7i
	 a2OL+Rhs7B+NX5vt40G3lXMuMlqgIdtHFnEbwxIPTNEmpF/g0rXnLVARMGVkYeINDw
	 yPI2b4sWELW3OKh/WnsYhjrBsEMqT8aWBc9dQnE5GqK5otRTG60vTIm/KsD3sjhAUh
	 i5uXe2WDauDfCFarcaHpNcfbmT4Z83XNC0iB1vTjLbUKmAL7gjYKX9Ecu7FzHEamLC
	 GJYVIBoP1HI/Z7EJ8u0g79yTbG1sAx/Twt8wwbQ4p87vjktQs2l8r8jMsu3zuf2NSL
	 jlXTp4boWMofQ==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e533aacf2so267749885a.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 09:56:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RomIL9eJDBwdB8K0CTwBhAqbJQoGoqsWbrxFyb5o4HdBQj1Tnt5e1Xe01sKhSxaTdF6VvMh22P/SCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFZCuo3oF4jTvFfgihlqdxHz9OYsUZLOAKA5YQOWaVMQmMnyz
	nrKBQ9KBDml9mtJ/7edI23GGurBlu5/JHO9RyWtcdJPZKFWUnbqhc0us4ruClvnx2p/4KF7De3X
	NYcP+ZIwGmQwSlcIhBm+8eASsULSekTs=
X-Received: by 2002:a05:620a:1988:b0:92e:5259:1154 with SMTP id
 af79cd13be357-930b3ecc422mr401488385a.39.1784307370342; Fri, 17 Jul 2026
 09:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-3-jiahao.kernel@gmail.com> <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
 <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com> <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
 <b910e870-9583-a2f5-b681-e69edb9af290@gmail.com> <CAO9r8zMLGMpsQ+HbLA5SFSMEc_ctuZoScJMkybnXMp+_0MW-yQ@mail.gmail.com>
 <CAKEwX=Patm4+gxtxwDYBFXFh+jfaOUSvtKtVZFvp=oQwNmdu1Q@mail.gmail.com>
In-Reply-To: <CAKEwX=Patm4+gxtxwDYBFXFh+jfaOUSvtKtVZFvp=oQwNmdu1Q@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 17 Jul 2026 09:55:57 -0700
X-Gmail-Original-Message-ID: <CAO9r8zP8L_4dOSVQT8v6v83uAN1ZG_7vTMxfp5jDME8U2sxEhw@mail.gmail.com>
X-Gm-Features: AUfX_myUxG7G3wSjX3kFU7KHxWXdkDog2oSpDszGYJpxnIxoJbNXRcZjOxi9Vho
Message-ID: <CAO9r8zP8L_4dOSVQT8v6v83uAN1ZG_7vTMxfp5jDME8U2sxEhw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Nhat Pham <nphamcs@gmail.com>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 9:50=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Thu, Jul 16, 2026 at 1:35=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> >
> > It is a bit alarming that the store rejection rate is still 43% with
> > batching, but we can worry about this later :)
>
> Yeah I think it's unavoidable at the time the global shrinker is
> awaken, unfortunately :( We need to kick off shrinking way ahead of
> time if we want to avoid this, especially since the rate of zswap out
> is going to be faster than the rate of writeback (CPU vs IO).
>
> Sort of why we implement the proactive reclaimers :)

Arguably, reclaim should wait for zswap writeback and retry, similar
to how allocators wakeup kswapd and retry, instead of just skipping
zswap. I was actually thinking about doing this at least for the memcg
limit case, eliminate the sync shrink_memcg(1) call in zswap_store()
and instead wakeup an async flusher and sleep.

A problem for another day I guess :)
