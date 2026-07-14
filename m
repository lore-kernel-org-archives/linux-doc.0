Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825DE35F615
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021563; cv=pass; b=oF9LgR7bZhX0e1f2dU/vZhs5EOEJK3iUMRVogNhRZlLxLje6kptI+zj7naWHG2Wle+W/ksmOW1i9MXtlknj5zOGxDttc3W4dUDXGpK9zqFaZzfkMjt/5mUR7upIXZ8zCj9zH95dguCDk7bkO79RWolmiLyB2a4rE+gTUDjOvZBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021563; c=relaxed/simple;
	bh=p1dnu5tYbRHwHh8fmbzlrVL9fNl20Bz/is+E5vc5VSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAi6dLA9t/mFIuBfD9Eejror1LQckAlFd2MrBY4su9vDbr4lfGHroBa1IxCUdIDVyyTw0izX6HguTq0MMhrPLqzBGYdWuXnQNEVmiB+XjFOAymEIQqrIMFSJNOFCRinA53QZM1ySuotvQAYeXVqrOkuspYAHNx025pZInC6I7Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLbXntiM; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLbXntiM"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81e6f2ee60bso9976127b3.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 02:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784021560; cv=none;
        d=google.com; s=arc-20260327;
        b=MYgWLNWNxH7GBy/3v8Zqa2tnvyhvtEysxb7SYly1jpeECMKv9HD5i2/JzVaV82amBl
         zVdHTPw/GuVPDKqnwRxdhdjLVfWV0uQ7wzl9MgPnT+VFib5iFInoXshsHEHjbzgZ9S5W
         rFv+nx/tSa9p4kQyo+VAlrPrDllu5SrHVNI4uOhTRoTG+luf22urS9znRG9NiD/yQ5Qi
         mdcawCjZWHwOqdok+j144IL2EQ6h532GPmXI9EQFlD7bDSrC+9N9JKIdXJ9gQraiBrlY
         EFPGxI+7dEtXTxdxmk8UKfp9tDpT0i3RDo9iC2/vG1yTv3/CPNUfY82Jpg/06c65+9u8
         Kdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=km8ZAN829Y9YIgjGXOSg/u7i/Qhc6MRJdZPbwDN0J84=;
        fh=ph5tKYiwl3rTS6DC+hnPd/Ogfab0x6aWqcMx3c2ndiM=;
        b=a2EwSCV158MKYE9LL6dFFYAaBCGAOazhTCBwdMj57alCCTLXAgWwQK59havogLMvAu
         yDgPy9J12YxG8ydcxseeHXipv8p6SuyQX9vrk/+rnQ7nwo7ajh1se8RkRHW3tciLeSH0
         +P3WrJs2RCzo8HhYo5mWwS1zdmi4IbM86i3v1qvFpufnNhsjxruXk2m5UNfUN9Q6g7Eb
         ivszKOnwlZNkwqGqwrkNlHtbH5auo7VuNS45d8EJn3SXjhrhCYjOX2QJpWquhJOLWPrg
         FA2qssaox0zKwTz92V60imbd0EgII3zIRIDVUZWoXKUgaqAdFFHpSUUzMrlAbDoRIPi9
         sLjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784021560; x=1784626360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=km8ZAN829Y9YIgjGXOSg/u7i/Qhc6MRJdZPbwDN0J84=;
        b=GLbXntiMdtlU4onN9znizUxY9OH5jeoudTRdZn1cpH9RLG8mEUVR6DPskZ2cWQYZpM
         cjPRLIXYC8hNSlyaV1jhiZ6zDKCVvgaBGe9i7pTQ7JtrEhcx4oA8YrC8OCBfDz1Fyk5u
         Gk1wPH2ZKApW6dMFkFpkNOw6h1AuZazWeGt+XoTpLM3bNxBP+LPoFmAYrOaAfAjleQQm
         ll0ACj59XZNk2iEOlzXhQyGRBdlV8A/2pSSTjW5YicYBm+y6O+eZbBszzBUBcekTjIPw
         sX3Qc/fngUMuprj6+AwiMAQZI0E/FPaKDmVrBu6OFw8Ecy0pdZia1fNNWHtyFBQdJ/vn
         6ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021560; x=1784626360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=km8ZAN829Y9YIgjGXOSg/u7i/Qhc6MRJdZPbwDN0J84=;
        b=U5dS5oxW9HDcf7mpaEKU6bYTMJUZYK0IR5Kmy03VceDC9MZiIz2E22obrS/IOx+/vZ
         rmxecvPuQykDaa35duIq1Qha+KWatzx5CpyGebqs4C5oI09rSM3TkbzENGSi50R6VNwx
         fRCZPYmdc4B4L24P/gvi9Ou+VEqr1BItrZ1m9CebzCHono4hrOgoXGe3d/HtGoRzgmJf
         8Rq/s99SvCikLsl9QBj5qOGrdIYNYv2OJqZXNwEzQK+5A0PaQvDi3ueIvUQ9qiqnIC9Z
         Uu+Z5FWXg1mNyNLgDAeXOi+iw73QKP02ROygDIUihkR16iyMXHVjQuxANye9Bl81hQjG
         GkHA==
X-Gm-Message-State: AOJu0Yzv802kmYByeSL3CCrNxdmeQ3VJb4RUPVjqQCKJkE1slI4ne3l6
	CwYh0yempfhU462nMUny19o9IlneAxHmCJ4/v+huk9cGmiVqgXfCfxucHzRUpeUSdReg18lrcSp
	t75EwWdL76z7sMMDC6lEvUuUQ9NQVeDU=
X-Gm-Gg: AfdE7cnbrVlDb3DG6+yaGHtyYga3g/fm68XL1CANvJvDr4Ks1gw9Wt9ewA4O0cbqQ0E
	AvPxuu1ZVYau11DD8kvb5g1baoVJJXsX090fFdZ/YdA33z3xWeHU6m+6KIIPdbxiysCz8MMaryl
	I3wzbDQBSXkz1ZyzleyaUMoMLZqiBNPNq7kQ65VccZ5MYxorayA2Po9U68LsA16YlEmRs2O/1h1
	BJaNfz3enQbViHHUHDJzRzuh//qlJaATw3bWeWpXk0IV6ROX60tTpkrs8GsPJarRNw5m92LavYX
	R8jvYOoO
X-Received: by 2002:a05:690c:6c85:b0:80b:f376:a205 with SMTP id
 00721157ae682-81e908371eamr96207737b3.22.1784021560366; Tue, 14 Jul 2026
 02:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alUXH8qRRjno2eZG@wyuan.org>
In-Reply-To: <alUXH8qRRjno2eZG@wyuan.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 14 Jul 2026 17:32:12 +0800
X-Gm-Features: AVVi8CdNfQDAQrIo6mijxxRKNCVQGIhu-RwEyNghvTYFw8J9QzhCOOb26gqSG5E
Message-ID: <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026)
To: Weijie Yuan <wy@wyuan.org>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>, 
	Doehyun Baek <doehyunbaek@gmail.com>, Jiandong Qiu <qiujiandong1998@gmail.com>, 
	chengyaqiang <chengyaqiang@chengyaqiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 12:51=E2=80=AFAM Weijie Yuan <wy@wyuan.org> wrote:
>
> Hi all,
>
> Since I made many noise these days on the list, which took up a lot of
> maintainers' time. This email summarizes the patches for zh_CN that are
> currently pending on the mailing list.

This is awesome. Maybe we can establish a dashboard for the activities
in zh_CN/TW related patches of linux-doc.

I personally kept a knowledge base in the IMA (an app for storing
knowledge base in the cloud) in our club to monitor these activities.

Dongliang Mu

>
> -----------------------------------------------------------------------
>
> * Ben Guo (2026-07-13) 4 commits
>   [PATCH v2 0/4] docs/zh_CN: update rust documentation translations
>   [PATCH v2 1/4] docs/zh_CN: Update rust/quick-start.rst translation
>   [PATCH v2 2/4] docs/zh_CN: Update rust/general-information.rst translat=
ion
>   [PATCH v2 3/4] docs/zh_CN: Update rust/arch-support.rst translation
>   [PATCH v2 4/4] docs/zh_CN: Update rust/testing.rst translation
>
>   Reviewed by Dongliang, a part needs to be revised. Expecting a reroll.
>
>   cf. https://lore.kernel.org/linux-doc/17094968-1385-4dba-aae8-5d93a2aaf=
59e@hust.edu.cn/
>   source: https://lore.kernel.org/linux-doc/cover.1783905132.git.ben.guo@=
openatom.club/
>
> * Doehyun Baek (2026-07-08) 7 commits
>   [PATCH v6 0/7] docs/zh_CN: update DAMON translations
>   [PATCH v6 1/7] docs/zh_CN: update DAMON design translation
>   [PATCH v6 2/7] docs/zh_CN: add DAMON_STAT usage translation
>   [PATCH v6 3/7] docs/zh_CN: update DAMON index translation
>   [PATCH v6 4/7] docs/zh_CN: update DAMON start translation
>   [PATCH v6 5/7] docs/zh_CN: update DAMON usage translation
>   [PATCH v6 6/7] docs/zh_CN: update DAMON reclaim translation
>   [PATCH v6 7/7] docs/zh_CN: update DAMON LRU sort translation

Maybe I can take a review tomorrow.

>
>   Needs review.
>
>   source: https://lore.kernel.org/linux-doc/20260708073246.1652828-1-doeh=
yunbaek@gmail.com/
>
> * Jiandong Qiu 2026-07-06 2 commits
>   [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
>   [PATCH v3 1/2] docs/zh_CN: add process/changes.rst translation
>   [PATCH v3 2/2] docs/zh_CN: update sphinx.rst translation
>
>   Waiting for response(s) to review comment(s). & Needs review.
>
>   cf. https://lore.kernel.org/linux-doc/ak1SG5mw7y2UZrvR@wyuan.org/
>   source: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiuj=
iandong1998@gmail.com/
>
> * Yan Zhu (2026-06-12) 10 commits
>   [not found] <cover.1781105672.git.zhuyan2015@qq.com>
>   [PATCH 01/10] docs/zh_CN: add LSM/index Chinese translation
>   [PATCH 02/10] docs/zh_CN: add LSM/apparmor Chinese translation
>   [PATCH 03/10] docs/zh_CN: add LSM/LoadPin Chinese translation
>   [PATCH 04/10] docs/zh_CN: add LSM/SELinux Chinese translation
>   [PATCH 05/10] docs/zh_CN: add LSM/Smack Chinese translation
>   [PATCH 06/10] docs/zh_CN: add LSM/tomoyo Chinese translation
>   [PATCH 07/10] docs/zh_CN: add LSM/Yama Chinese translation
>   [PATCH 08/10] docs/zh_CN: add LSM/SafeSetID Chinese translation
>   [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
>   [PATCH 10/10] docs/zh_CN: add LSM/landlock Chinese translation
>
>   Needs review.
>
>   source: https://lore.kernel.org/linux-doc/tencent_7080BF6BB8F05936649DD=
C091FFD8C45210A@qq.com/
>   Note: cover letter missing on lore archive.
>
> * chengyaqiang (2026-05-22) 1 commit
>   [PATCH] docs/zh_CN: fix KASAN SW_TAGS mode description
>
>   Reviewed by Dongliang and Zenghui, will merge to docs-next @alex ?
>
>   source: https://lore.kernel.org/linux-doc/20260522075735.2022734-1-chen=
gyaqiang@chengyaqiang.com/
>
> * Haoyang Liu (2026-03-05) 1 commit
>   [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-=
overview
>
>   Expecting a reroll.
>
>   cf. https://lore.kernel.org/linux-doc/29bd0dbc-c6f9-43ce-b95f-4e787e3fe=
9c3@gmail.com/
>   source: https://lore.kernel.org/linux-doc/20260305192048.16405-1-ttttur=
tleruss@gmail.com/
>
> -----------------------------------------------------------------------
>
> Okay, I have checked the 200 most recent messages on the mailing list,
> going back to 15:09 UTC on February 25, 2026. If I have missed anything,
> or I made a mistake somewhere, please let me know.
>
> As you may have noticed, I borrowed (stole) this idea from Junio C
> Hamano. Sending this kind of message, somewhat like a weekly status
> report, not only helps maintainers keep track of outstanding work, but
> also lets contributors know the current status of their patches.

As mentioned before, can we have a dashboard to see the status of
patches in zh_CN/TW? This is more useful in my mind.

>
> More importantly, it gives newcomers an overview of the current state of
> the project. New contributors can begin not only by submitting patches,
> but also by reviewing patches already posted to the mailing list,
> thereby learning how our workflow operates. This may also help reduce
> the review burden on our friendly maintainers.
>
> I would like to try this kind of periodic report as an experimental
> effort, with its frequency adjusted according to the size of the patch
> backlog and the level of activity on the mailing list. What do you
> think? Please feel free to make comments.

I think this is fine since linux-doc or narrowly zh_CN/TW do not have
many volumes of patches per day.

>
> By the way, I borrowed the subject line directly from Git's "What's
> cooking in git.git". Does anyone have a better suggestion for the name? ;=
-)

fine with this title

>
> Thanks,
> Weijie
>
