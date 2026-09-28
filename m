Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A36B449B11
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601884; cv=pass; b=lScc2LkFZ11ssYDbbbz2UMYx0kt6Xz6tx0CGzEGNMIwyymIMrMPolbf9TFItCl1aVGWl0IMdcvnnaHmH6sd04ymRgxwF8zSVl0RvuI61d165oc8A4dkgec8I0jp/49El2ASA9Ns3aFaqqXBjCm3OuJBShIcib186b7OlOqDotx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601884; c=relaxed/simple;
	bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJDSBwDPs+CCW/aGvw7yJKgT8QJRLM0DKvJslC6yEWbzeP1oV/AMDfWcEZqTqDbXb52N2IJrwYzM7yN/OAzP3kr76zsGsAWjlBES5pv0Nzvghc1+B8F2X8jmef0ikNM3DRG/Cfy9U76IOd1pu4XZ4fNEQaHGebz4iy6QNDuo5U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUXo8JBH; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUXo8JBH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so2604401f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 06:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601881; cv=none;
        d=google.com; s=arc-20260327;
        b=V46rh6MASgeqG1ACzjpCK17ZbgLv5VL2pGh7DMmH7SVky0S++f44JhXVEHIK2p9RTN
         sK9i9aH4t6tqxyFdvpcZp3yn8I/z0AI62pUsdpw8pkG4dIklDIIPyZtrFovPQczPWH4B
         uPHE7F9ZBqpaBMcccdaSOH3zY+NssRA2gm1TJk1SG8LGZ1CnlLfFXH6oPxrqW7INWQQf
         Vuoj0CIUCX/B0FmYDc8/rdYCVQN+pbYm6fh+DalnFQ0ZieryLLNvleWJDlX9sHDdzk11
         QVIxkO9GsnPhwwFlJlXZpH+EcuSW/qyc6O1wqxq4KoI7p8MatUhsgmju7ECfj8AoNF5y
         ekAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
        fh=MzcKGYECRa93tVGDWMEN7TNmhBVBQVKekr2kvfLEqpY=;
        b=rMj4io8eENX+mDIADZDOYVwZUWJg9STMpUeT/hQUQrSaBHqG41nylmTrtxgo9CuFfQ
         5yfmyauYbHx8Fg3flQ0cllqyKlEQaBL1voSt1gon1WYEVLY/17rxpXjtDIvpHxBR1AMv
         zdG0KExR8jXenJkh66UpzIxDW5JesVCgdDWIaBca3RU8EuLqiLSsjff/iK2hqb2sDjH+
         pxyYrT4t6qXzQ5XDxm3bWXMSlRLu8qQO5MKzGABJXzgw01OQ3PdC/th3g6D04Fux2mb0
         js6paRXYOOH3ns63FHpHfZLGoxtJSu4yTzOklTqfXK4Db3OXCzXhnfVbCGq78jZLL9NM
         BHyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601881; x=1791206681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
        b=UUXo8JBHEslABI7CGJ0PDDjiwm0LbNuMedQsOOZhGgkZmmvyfDKRcLzvjXqDtRpgjQ
         ZH3/8ECrJOFrcQ7qCQKOwnOoK0+70LmPsGLnW8hGk1ffkJLguP21c9k8q7mDXZUq1hNM
         AhKEcpOSD2dzC1LpINIK1azIpYQzPvMh1JqAa1mTiMBfFG2/vBQcUxfWpEPi0RGeFYc6
         UIedVqw/6selEJ7KDiw53OVkiDr+dZKeYmSqimqTdrj0e9yVBUPxdmLqLlIm8oAP9TBb
         /ZVDKY+dhqoDkjuNsu0VLWJFxafb+4g6cr1kfcEwX8P6c51EssXwLyDa/cE6SKCSBsfZ
         APjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601881; x=1791206681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnZRje535Omjq7bTjfZY4Rt+ArD7RwaYq15aIzeRtgo=;
        b=V2/sJWfLhSVJBJaCCJy5efPIJsUrMvGrJvNtX8zTbqC9LOE/jaxUvIoAWjP45V5wEv
         fMenEX3BYEpre8LMyZUFtp24Tp0Sc3lGRpFjqEazEirSbkwcyz/7OA4bcbu47rusDdqm
         tvVipeGbECpfKwW7JqIGnqbmZAAOKoqMsigq9yOC1iIv90K75aCkwP3Z5qLmdqc6PFjW
         SzUOhbkdXWzobpm7WZLeC8iC5NE98fTNnRHdHaiaevHeGKTZVl4HmVBInfrHb32LqI6b
         PJIPhFunrr/snr2Y0y0UlvGHCZe3AkD8CRL5y2tT0WFvjKPGnYjrRZybEoucyN/we6J0
         /1PA==
X-Forwarded-Encrypted: i=1; AKwUvBxivkdOhjinkuBudgxp6WA9IopwoWWmo32y8rhVjSF5N7lydh5hfcfWHhOtDA+JR1+WN5TzsDlzBvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbaxdiYR8+j28RYLEnuxjjDeIZzPNwByRTL4DDi9E9gRO8xQVY
	W9APg4sjbvzVQzlR3HOVwmIzFbDh7hUnT808nTTuCE/R1ZPCycPRd5QtIzHkPkKwR+OcUJXj65E
	zSBNLg3yYN4vlK0kXGFJNUrTbKvzk2TY=
X-Gm-Gg: AYBFou3fvoZBzCZAitxNE7AWBFi+lQsP+7yDE5m6nz3/UxJ40DZSL1e5VoHm8BQ+MUg
	c7JDBnC+lLvBnJBjvHVjodzAPWyuEWFECRpW+PpWmTqc+TPxXULc++E3pfMA8yPYl+FQL6x42ho
	1UzOPW6nlV0QTU9MxD14FTnr600H6M5fkYZHeV1qtpZZClO4OskHL6fYe4/gTITW+Ek6TBOQaTM
	a+7Hu/G7VmBup8fk9+OQbE+U4/Ldp7pEBmQA0DZIBFLv2ZLfmK0TQvxh66RtrfvgjBCubtV3UYk
	9LExUU+YFccGgWYPGBadO/rPux9GHzkCmUfBOVp9pyjWrirks9FnjwlGLdXPJQf1sSNQynstinS
	3oyVwKLPryi3NDqqujTwJdPttGvA=
X-Received: by 2002:a5d:59c9:0:b0:488:8232:d159 with SMTP id
 ffacd0b85a97d-4888232d348mr16059474f8f.13.1790601881245; Mon, 28 Sep 2026
 06:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com>
 <CACePvbVQsHXt4=+qfKz-KTar9CG+3OiAfLd1EZgnRE-1gyoKOQ@mail.gmail.com>
 <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com>
 <CACePvbWTZgbL7U-hrgV=V0egHZ13EqMCOsUbnKTcLvqnv85zUA@mail.gmail.com> <CAKEwX=M1tc5fLSgxbq9S9TU1AKJWtRZA0AwGQZgNXJ_76hThFg@mail.gmail.com>
In-Reply-To: <CAKEwX=M1tc5fLSgxbq9S9TU1AKJWtRZA0AwGQZgNXJ_76hThFg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 28 Sep 2026 14:24:28 +0100
X-Gm-Features: AclHuK-U3fLTMhHK0pk3rONO7wDcH81pPs_iHjZbfq38GiuI5bJWs1UPQRmTG2g
Message-ID: <CAKEwX=M0afcz+b1pBd+R9Ddwqwcf2MuC0XUpC6seL=yU-cn57A@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:14=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> Vswap does not have that, because vswap is not an ordinary swap
> device. It's implementing the concept of virtualization (the "V" in
> VFS, if you want to make that analogy), made optional to reduce
> overhead when indirection is not needed. That gives you all the
> machinery you need for backend transfer:

... for zswap/compression backend.

It's a necessary condition for non-zswap inter-tier transfer, but not
sufficient. So it's not a solved problem quite there yet (and I don't
know if it can become worth the squeeze, as the data becomes
increasingly colder as you move down the tier).

> layer, where you can update the backend, without having to go and
> chase down all the external references - no PTE walk needed.
