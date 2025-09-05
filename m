Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45A828689A
	for <linux-doc@vger.kernel.org>; Fri,  5 Sep 2025 21:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757106237; cv=none; b=mRuZpzEGOAZP2kSSGWRjEqhw34F26DHGG+x6OWuXuvzty5uKOcZxJG+ycem8rGTkPdTDLhHVz9D9WtwjB+8ieWUZMdsFKFhWBwjmHXXKpg+WvTD1yH1j5KgNqBLk55U6Nae9Zuyp1k7lS7OUVHTTRvV0nLh6AJpWWzfvWTlMd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757106237; c=relaxed/simple;
	bh=2qxjiecdOA4RF6h3Y0hYloSjHErvoYXsbOiReTTNtXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyvOSAe5xIusMEbWM1l2MFLSl9bERh4X+p/4CHJCcy6Bn6W61oDbztdXPHcnJLkKdzZ1wwJ+kmrtJYWYY9rbwXyMGa6WUq00IDEjTQd21vEMCflMWbNqluR6Kh+tTggBaOqJtwPTd7RsmDAsOITIahepUx/QMiYJeYzHXp5/HvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LuhDmD+Q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LuhDmD+Q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd9d72f61so20765e9.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Sep 2025 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757106234; x=1757711034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPyIINiU/ceaI2cj/Yt91Ki4eqt+oAkeBgX7XlUsaZI=;
        b=LuhDmD+QMwq7GfpTab2Bl5qMacvc6ry+gD4v4QelOW0OuQLwkNuzLEslJi5YbGvGQe
         m9hJb2Dn2G2av0vPCeoHkrlAZ089EwEXSzyMPvTqTJHiElTkD2otKOEKW24Hg+laN5R6
         JyGtwLiQBx6Bi2DBE2hn9Srv2omVGNU6Vra3z+8foaR8SAThjaqTlkGpyu9hMMXxI883
         sjTBbrSJ0y/N/fSrSrffaf0xdCtXAEIUJIoe3AteIpRKLeC22tKkgQ+JHYRI7fRPnilm
         ZCLsTygR8nFlNg2QUQyrN0U9WOT4O0NvfFuXBjNGGyE0XCLImp6HntqUBmUE/ubNzTbv
         g7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757106234; x=1757711034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPyIINiU/ceaI2cj/Yt91Ki4eqt+oAkeBgX7XlUsaZI=;
        b=naB5KhdZ/JcUpEY/66JDyuYnIWGp7qjG5UvHc1yOTMr1xNe4y4AR/ur5lBYQI9PoF2
         fjWxCLNF1sCSwRKM7Xa1vEcY5wBRhDp8U0N18sSvehRYmTsJFaNIQG5xZpdwlgaOVtEC
         IXmSBP8cAdVs1pbZHWpI4KChU0raOkuuZXEbOXgR3p9QSb4OF8r7DXLnbRlKg46668F+
         XGyn6iiKojUuFKt+8g3bByjRo+p5Kqk7WFtjVbjR4JbdtAPb30sLr8ZoL+4w5YsuAb74
         dCxWPHS71HL8ztsb0cCWcx6iLyQHQzRYvf+eBAhBCyQd4CC8WhmbjzzjfBTcGZP/bo75
         g5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+p723/eeW9Wwo9k2qYBuZphndOriwbGMvWJaa0odmfyYmMlOoZDgSB9scxzG4zoIOJtnDoWE0pPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1doohnYH9SqdCJzCeOwte2R/HpoEvWMHdUtXU/ocTiAh2tkbg
	kMh/mI7uU2oHnjaeujorwgDcZrBBXISg6pkfHULML49PDSluYkNk6RvSE6hBUruIndkL5shzzYh
	MD5xczbYmoG1sRGGFOGCj2Ul4mKS6qyweTPbsekTg
X-Gm-Gg: ASbGncteTzlAiMCgFS92kL+A+afGaugjmdue5xuSC+80ZwNEkqfWjTtKLQeQqZCY5Ps
	6Bp7t4Zn6PBegMUlGFL7P4lDgQ/ZE8nl7CqW6LDTwztKH5l0Ka7Dx95HmN37WVYk21X0RuxC04K
	Q0Xfs6Jn1l+n+oToeTFOsFWdn2nA7erIlbMkoy0OX3D3c2XehrzGjCiWXXdVjM/nXlvgZfpD8AV
	fO1xGSBuNfZFMrCwibNoyhW9A==
X-Google-Smtp-Source: AGHT+IHfnLuS8/hFfgk/YHQsdhLGdiMAZxHIYm7G3lXTwcShqcMGim7FOZX7jFPvq8GAlqHgICGQ/V2KHajcGPUVs4w=
X-Received: by 2002:a05:600c:4f50:b0:458:92d5:3070 with SMTP id
 5b1f17b1804b1-45dddad796amr298505e9.6.1757106233773; Fri, 05 Sep 2025
 14:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903203805.1335307-1-tom.hromatka@oracle.com> <20250904175138.GA886028@ZenIV>
In-Reply-To: <20250904175138.GA886028@ZenIV>
From: YiFei Zhu <zhuyifei@google.com>
Date: Fri, 5 Sep 2025 14:03:42 -0700
X-Gm-Features: Ac12FXz4r5dUSwU8ErtpQOTyiN1SLsGRcsf4tz3TSVCAhgm3LT_uELjv0duJZaM
Message-ID: <CAA-VZP=ZDsEESH0XJLiOp0CEBVR7DQn+dC82PdWzLqVTgSB_HA@mail.gmail.com>
Subject: Re: [PATCH] seccomp: Add SECCOMP_CLONE_FILTER operation
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Tom Hromatka <tom.hromatka@oracle.com>, kees@kernel.org, luto@amacapital.net, 
	wad@chromium.org, sargun@sargun.me, corbet@lwn.net, shuah@kernel.org, 
	brauner@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 10:51=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
> Looks like the only lockless reader is
>         struct seccomp_filter *f =3D
>                         READ_ONCE(current->seccomp.filter);
> in seccomp_run_filters(), so unless I've missed something (and "filter"
> is not a search-friendly name ;-/) we should be fine; that READ_ONCE()
> is there to handle *other* threads doing stores (with that
> smp_store_release() in seccomp_sync_threads()).  Incidentally, this
>         if (!lock_task_sighand(task, &flags))
>                 return -ESRCH;
>
>         f =3D READ_ONCE(task->seccomp.filter);
> in proc_pid_seccomp_cache() looks cargo-culted - it's *not* a lockless
> access, so this READ_ONCE() is confusing.

> Kees, is there any reason not to make it a plain int?  And what is
> that READ_ONCE() doing in proc_pid_seccomp_cache(), while we are
> at it...  That's 0d8315dddd28 "seccomp/cache: Report cache data
> through /proc/pid/seccomp_cache", by YiFei Zhu <yifeifz2@illinois.edu>,
> AFAICS.  Looks like YiFei Zhu <zhuyifei@google.com> is the current
> address [Cc'd]...

I don't remember the context, but looking at the lore [1], AFAICT, it
was initially incorrectly lockless, then locking was added; READ_ONCE
was a missed leftover.

Can send a patch to remove it.

YiFei Zhu

[1] https://lore.kernel.org/all/CAG48ez0whaSTobwnoJHW+Eyqg5a8H4JCO-KHrgsuNi=
Eg0qbD3w@mail.gmail.com/
