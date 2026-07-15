Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16AC2FDC57
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138172; cv=pass; b=ENV4oSEsmk8zuEoE77/UelTg3Sr7hUN6lD6Mh3rWFUhykIFgbh0aQ/G5LBOlFz0Vjno/5IQ1GWHix1nbTYYYHFaCGxq//B96+aujEa8eGLclbFh1POC0n1antVnY5F3EuPrjdjVkvBru8VpZz2GIsywKgVQxkRby+DqT9CJEc5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138172; c=relaxed/simple;
	bh=u+3FAslbVlj96800WiAMAGOylgc0ssLAYc5uCqETipo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qO0L1rm+mUnWSsEguGQMnT6pw7KtmOOTCFm0OohacC36ZTtSctI12KdnW/l8Yx4DqskfL3vma0yXKUKfBDeDY4pSh2m2zj8Wr7ivpj3hBJevOEvrYP71MlrMvTSSmBbjc2YOQyx4mN3y7W3TvSH4+tgU+LFtd3LBaqd073kcjRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4hgAjv+; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4hgAjv+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c556ada3so5525e9.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 10:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784138169; cv=none;
        d=google.com; s=arc-20260327;
        b=gU2hLrUqjBWPlVwH1kixFlf5FXw9BzjSrXCfULEIEiMk1PayQeepOwMnFVijFx7R04
         W9jXZcbmK4M8l3OhZouQ990v8wptFpZxotOXRP3YiyKqfGmJpqsW5WxOIZUjBMSinEux
         e+VUxHwyMcbvzEM/poZC150qqhC3xVfqrKqPyW3mmLxum8hDiuDWlENnwxdXPBxWHOYw
         xj3KWmA92TxZejALIqbiNt/wNkCBP3S0K/j7pLpCemTC6ARpZ5FwNC+WLbhs4SXXwTFb
         Ng54Fnyr1tYqkRxHoHJS1uIeutU90HwIX+dbfLkinpMTbFTTqVKoZqyosxMJ5/438A6o
         0naw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuBIyMRxxSG5xOKfBj9RRTURzzjnDkJEBKCLyFmN4sQ=;
        fh=sUb8bQS9BFKnvbV4hehKqRiyw+Dt/B2SVrpbXqAocKM=;
        b=bizD4FEhahCv0HS/DvEP9kADVLeMXVEZXQpB+lY3Tu/5zUjRxOEyQlF4mZNTML8PRe
         kK6C0iKohTk7DzxWZwJOM0/sjKVghAf1vWTq86gAxrqQbMpEn6l4/7+4GhfurWKL1wV+
         bkRdZMz5D5za71+OL4hiOhHMPcXec6FBVaiN93hC8iyKOjXjPk5QgLtKXXQEe84XZC78
         cdnpHxEE1tlysNzLfZL7owZfpse8PsfcCunwBcwJI/ZU3szP3TrlCzQglnH3TXqW9i+F
         uSxuJklXumqmVsIX+0VlhXgj162Pfbn1dXl9uG3Ks3pwms0bDSIR4cixWhXzTjxJkxXm
         2VIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784138169; x=1784742969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuBIyMRxxSG5xOKfBj9RRTURzzjnDkJEBKCLyFmN4sQ=;
        b=A4hgAjv+cRMPs1OEpvkfeZIySozAnIHRuQUe/3yE/Xk5dftlFG3toVQSh54TcUDa9L
         Oj0tQ4KRMpYlTiRTcOCT7kjC2lsuBSGe12L7u2aNzp2l0BsfcVZclyE1ZOOv+MCEYUvI
         4aj/+ak8C0mEO3owGJyjU85qe7UnvTkmPhjvsshpylZx50InZMHYIH2Daw3+HuGw0pcc
         8tjLT7N8Mgi/eRumssERQwz90Jt/6COlHuFMjYMXZ7SxF+bGjKzKsoD9beSROq7sewYT
         0SerjmRzmjo4kDWOp+NF15rkocmlO3w64W6v0wpzjkSA211XUGNffeuqujyrT9U14XNt
         hfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138169; x=1784742969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuBIyMRxxSG5xOKfBj9RRTURzzjnDkJEBKCLyFmN4sQ=;
        b=O1jHqTlubGuKIcA4fuZ53FyMIaoscIhtEMN63vUZGMFgy7x7sfPE28nOh40SPMdIDa
         2+0UuQO3TMSgmS3t514N/vGflDLuHlgUtPuJImer58h8pJiOV+ntN0OtXXHghtLUL+Qi
         OJU4sYZxAjjArNkAbhMUmehrHeV+RT5HAxMNehyjiQIXJ0DR5Hd8Gb4+CYfIw9maBU6h
         tQlM5/MU0sbPW4DRVjHLxjhyyxMNs4h69vgBJG7ATncmKek4vanBtrOkN9DZLN0Gk+Lh
         FM9sKJaqnS8dCZvGk6O2smnONiO5cntGXEmei30lOMCInyow5AulneYhxMOor6+j6/++
         e+PQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqj2vcEW/vMnQBBJsYuxyTYy2gjsgAvCRLQgpRvlL77fTqJEzDtVmVc7DrFvGqOwAIzF/iqgu0Y5qY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/1Jcgl/0NPgREQkIj0e3ip/0l+VfbXHT4FfVHKZEBlPWRSno
	eeyxwC8C+cLQg3jpKdWZUw+p6zNs/DEv6f5YvyLiOJMIaywPFDduzst3LEBYdFsU6LyT4gMQC/t
	6FE8rw4v9bfXixrP6jiEHPBHYo4fPfBYIYCvplBCQ
X-Gm-Gg: AfdE7cmvUIJoqCjcDoJaucDHjwmg+V1suiBS0ckk1OR9vX74des0Js8OBJI645f6ptj
	WKMoHgY/JcDhWpPR3Ym8II5GjIxP4f7FSIAU/mKmXQonlsipuKsZimTvBK3MKq3/Nj8Ct7ccI8W
	CJ3prCiU04tbE31D4/ozNKIDTd/tuZopYQkcSatDbwRPwMMaMi0mFqKUDeJLaqA+S6jVyCR/85X
	5zEcRBfqy9hCpvFQVJiBTimqtFQsRX6YAYRLN19etI9vCMPD6aHLnDw31vixRCLWaTFjBEo+8oo
	tkJRofc1OS7gxzUghwgsy0dy7WLmfR1LIFHdAVYmp7eWHf4DI1BFaWTYuocyq6vidOfEeQ==
X-Received: by 2002:a05:600c:4ec6:b0:495:4069:b0de with SMTP id
 5b1f17b1804b1-495414230f0mr128295e9.9.1784138168394; Wed, 15 Jul 2026
 10:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714121529.2237261-1-wangzicheng@honor.com>
In-Reply-To: <20260714121529.2237261-1-wangzicheng@honor.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 15 Jul 2026 10:55:56 -0700
X-Gm-Features: AUfX_mzAYIm26JZUendtoZyWaKS-eWpz07CFW-u1bis9rmp-d5YT8fcNAcUgKUM
Message-ID: <CABdmKX3y841t4Oqg3RRHTGXWP-LMMSi_exDuxAc4jR9v9ChD2g@mail.gmail.com>
Subject: Re: [RFC v2 0/3] mm/mglru: proactive aging via memory.aging
To: Zicheng Wang <wangzicheng@honor.com>
Cc: akpm@linux-foundation.org, yuanchu@google.com, tj@kernel.org, 
	hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, weixugc@google.com, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, willy@infradead.org, 
	denghaojie@honor.com, baoquan.he@linux.dev, kaleshsingh@google.com, 
	tao.wangtao@honor.com, zhangji1@honor.com, wangzhen5@honor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 5:15=E2=80=AFAM Zicheng Wang <wangzicheng@honor.com=
> wrote:
> The benefit is workload-dependent: file-cache-bound servers gain from
> aging, anon-bound servers do not, so no kernel default is correct for
> all.  The kernel also cannot know when to age: on Android the right
> moment is the foreground-to-background transition, when the app's pages
> are cold but their PTE accessed bits are still accurate from foreground
> execution, a framework concept.

When an app transitions and becomes cached, we attempt to reclaim its
entire workingset. We basically cat memory.current > memory.reclaim
and freeze the cgroup.
https://cs.android.com/android/platform/superproject/+/android-latest-relea=
se:system/core/libprocessgroup/task_profiles.cpp;drc=3D65bd7ab941a709bf0498=
71406981022b988e1721;l=3D706

File / anon balance vs hotness and generational placement doesn't
matter in that scenario because we want to get rid of all of it. So I
don't really understand how you'd want to use an aging knob.
