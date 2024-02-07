Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97EE1272D1
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 21:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707340000; cv=none; b=pw7hYox5qU2ej+wbBwrp9QZoHQQaZt5ykiDDlG22N5qNSK5lAVoELoR5AHyhvLuYwsBK/ILjTomvl7Xg3f8Te6I0+prgOjisiq8I3sq0qjhcTv5TUK/1JD+aHWgeaZ9e6FvnkkVeYrN48t1K7zxgCLLk2qquAHKyfc5cEnMUuds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707340000; c=relaxed/simple;
	bh=kfCF66+nsP3XZFTo8GwalkScCc4V7eApC34k00p2TZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7xvouS0VUlA5HasOMom+VciLNEQz+0U/+DtWqQzwmC54QuZy50u7OeNVUXwsNKl54jNSrrZvLbFrY6L17QF1yfnCY6cwjvDrWIho/EeVQzccRCbo+zH/HT6W7RdonNdnjrJCusK8p++xMocBNyE/CAeY4zxlKnRfZlL3tastyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=gZLbPrCv; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="gZLbPrCv"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-59cf4872e1dso450438eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Feb 2024 13:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1707339998; x=1707944798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NchtCtztTYgLVk31R6XXB+U98ZPDL1AD+o55ip7WTnY=;
        b=gZLbPrCvgHu/1S3PNVV7VNGkZK4GUtWwndnwsnVg0IYtf+6D/5cc6xtcFuI/D18KRK
         iS1RHfHBuTqtWF13P5KSgR9ktQZn99sBhWXuUNm09XW3154ruHUltQCUL+0KONTyXs+B
         AHO0iupgzeJ4GLmlqVH8ptQ43rxdOql2bwNWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707339998; x=1707944798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NchtCtztTYgLVk31R6XXB+U98ZPDL1AD+o55ip7WTnY=;
        b=JcjCyumPtIvjwZ3W5JokCmgEi28VqMKtzQMQK6m1hWFibpgFx2jepS6+AKFlkrU2aD
         CmoDXxNcLynLxyUtTbjUSHHZYiGCUTwA1+fO8ELU1pFnl/PB5qCJykzAsvTkMKDTwk0A
         +R4svv76nSOSzxPDANfpANJGk5Z+2zLCVrhyIX2SzD/8wHj/Q0jGTtnAmMZH/zNe1cay
         DNIryoGuad9x9kE1+p+ec1hUzE1+5hPQCPRGKb4wRGYqRyqLvl7WficDfCw09mzIwf/P
         cKHJStBX0PJxbM4PwMqeuKVm7cMxsYOX6e4FXMHhtiF1wjU3BUVparA57hXHxxfw9oSu
         r+gg==
X-Gm-Message-State: AOJu0YzmeYPdQzJ+gZD4THdOjNadYsrZhwC7G5oa2MRBouxKVizxrTe+
	wKwh2Y/PMAPbiKvHmie60qzyvaUfLzQkOj/jWX5RcxVdMH/1gbJwvREZ8Yt3+1aPW6NMuMNaEFO
	eUi2fTNerUVsjSmBJPb/PB1jW3rzZzKhFErU6iQ==
X-Google-Smtp-Source: AGHT+IFHJ8RzBy8kDruajhclKaKc5G+oGuGhBt6+ikiR1rVtLI1ZIksnvJc+jThp9pyXy+1XUd/hTd9KJKxiBGbCd0Y=
X-Received: by 2002:a05:6358:d09b:b0:179:1f6:4775 with SMTP id
 jc27-20020a056358d09b00b0017901f64775mr3847995rwb.31.1707339997647; Wed, 07
 Feb 2024 13:06:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204194156.2411672-1-davidf@vimeo.com>
In-Reply-To: <20231204194156.2411672-1-davidf@vimeo.com>
From: David Finkel <davidf@vimeo.com>
Date: Wed, 7 Feb 2024 16:06:26 -0500
Message-ID: <CAFUnj5PjgQM8G=s2TxJS73_GnytOACog8PFuzASgYNfLH2Uo-w@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Muchun Song <muchun.song@linux.dev>
Cc: core-services@vimeo.com, Jonathan Corbet <corbet@lwn.net>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Did I miss a reviewer on this change?

I've clearly missed the window for 6.8, but it would be nice to get
this into a staging branch for 6.9.

(I can definitely rebase and re-mail if necessary)

Thanks,
David Finkel


On Mon, Dec 4, 2023 at 2:42=E2=80=AFPM David Finkel <davidf@vimeo.com> wrot=
e:
>
> Other mechanisms for querying the peak memory usage of either a process
> or v1 memory cgroup allow for resetting the high watermark. Restore
> parity with those mechanisms.
>
> For example:
>  - Any write to memory.max_usage_in_bytes in a cgroup v1 mount resets
>    the high watermark.
>  - writing "5" to the clear_refs pseudo-file in a processes's proc
>    directory resets the peak RSS.
>
> This change copies the cgroup v1 behavior so any write to the
> memory.peak and memory.swap.peak pseudo-files reset the high watermark
> to the current usage.
>
> This behavior is particularly useful for work scheduling systems that
> need to track memory usage of worker processes/cgroups per-work-item.
> Since memory can't be squeezed like CPU can (the OOM-killer has
> opinions), these systems need to track the peak memory usage to compute
> system/container fullness when binpacking workitems.
>
> Signed-off-by: David Finkel <davidf@vimeo.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst       | 20 +++---
>  mm/memcontrol.c                               | 23 ++++++
>  .../selftests/cgroup/test_memcontrol.c        | 72 ++++++++++++++++---
>  3 files changed, 99 insertions(+), 16 deletions(-)


--=20
David Finkel
Senior Principal Software Engineer, Core Services
