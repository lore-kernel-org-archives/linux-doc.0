Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B8137905
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709746106; cv=none; b=WG7IJyRoEq6F8gFX2hpVjIPezyA/ARDHrALmKDqP6ss0srBufzMzwzZEmGwEpJh5JNFUIsCp1x3KzuCGHUiY37MV5RvINnlRuBKt7K19u5D+OJNxbZxBr4Xb0WMO7Uy+z627NEWy4b0wfituHIAQi+dS2AuVTFKNjkUOSY7NYRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709746106; c=relaxed/simple;
	bh=Ghvs4v77iQQAei2ZZ6uDRzDVbGBXuG2zwoIeqAMdXAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7f4cy1FlpLRYy0Sv07/lRnqLYpqpO6qiENOiSMjVzJhkz1K9OmWEzJSFcfLpV/RFym6i4uNKZwYoxe9JktyN3EaI/7Sqws76dY/PrSXnVpLeS006t76g2Tj/G1rh76D/r1gZm7xNcAt45Q2Azv24UIE1MFN9CeXCCEYGEjpBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mSqbE/Tc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mSqbE/Tc"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56693f0d235so15262a12.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2024 09:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709746103; x=1710350903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9KodEne8KoAKjyIJo45iuD1jcQ25Lud0hklaomu97I=;
        b=mSqbE/Tc3iKRKAOlNhS1KajldC+YZNhZoImFi6KIiNMJHIvV/YGRR0DvlEb1Mxesrg
         NgYlRYfF3cBq79uEttIC9NIDLCA/CwxoIhGePjQq5eoGsys2+Xix5KpLxX0LaG7NDMib
         /0RCD6BWgjcppnVN22iFbd30BYACPVgn6wvzlcj92zJYsU94/t/jrTx2C0oh+dtHJR2t
         hMyUpx5fkTKD1Hy2s60BYxRnNP2cFQu3kHY2rH22OpihRwbH0mi+EpNFGNGXdAAxT8kS
         l6KjWVKZ6T54l1xPlCBFewuagokys9TzPDrXtj6ayXuvXfIBxceD8I5+S0sZj27I1nzO
         yrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709746103; x=1710350903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9KodEne8KoAKjyIJo45iuD1jcQ25Lud0hklaomu97I=;
        b=gm0UEp2e3sq8CM8ghp1H7ozTUJJ3KYHjd9ARKtBqMz1rDDm9QcfnN+ZcF9Sebyzpg9
         yytTMrTV3NVIJaJJp5f3AA7YxPLGqaMHbMDliZ3H7x1WYWUcMAg5bIeV+JNn1IUMnXZS
         qMFlzLlfI7TyQSjHU4G++HATDYCBXhjBfjgHFJ3wONyoXEt9UzuwVT+DyQoKp66/L+9+
         1FnS2MZ5TjKFTP+uTrVtiLiC92re5p/JxwTOzsBj/+RPueTU707BE14QesRiyn2uZ3qw
         EMvEsSPAf4/O9AltMCAewnFyhkeseD892Pn1NX0taFcPNMRmgHuwnLeLcjJ5dyGfEGI1
         RYQw==
X-Forwarded-Encrypted: i=1; AJvYcCWOdvmrjkQafVGuIGIwVxMOgEqiPXq6qQNo+ScZcwfK3A4JgY4O8DV6HA/3e27eh3KBagZof//MmhJ2AlO8y+Jq5//i4pgnyLki
X-Gm-Message-State: AOJu0YyuW2NVNDhch9WM1KmAE62olK/f1avUYZVdfI2xefhiJJ3mQsol
	Sky1WSOD33AVbJd/zLe9e1acKkeW+F0UQl9vqB+oVJ2l9FAspnu4xVmKThmRs+dACRO6LXTtD7u
	5KrYEKAGlTwC1kZZ2U+di6xO/hCJz5Lzoeosj
X-Google-Smtp-Source: AGHT+IHnNtaMgf1oa5P9omQGhKnc6U5AuSPId+mAS/2wEyyxbq2B9XLRNBZ/kNpYHe8+c66dcpBJTdAzKzTpJdifaEU=
X-Received: by 2002:aa7:d5d0:0:b0:566:a44d:2a87 with SMTP id
 d16-20020aa7d5d0000000b00566a44d2a87mr27047eds.0.1709746103008; Wed, 06 Mar
 2024 09:28:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226022452.20558-1-adamli@os.amperecomputing.com>
 <CANn89iLbA4_YdQrF+9Rmv2uVSb1HLhu0qXqCm923FCut1E78FA@mail.gmail.com>
 <a8de785f-8cc3-4075-a5f2-259e20222dcb@os.amperecomputing.com>
 <CANn89iJAKEUu_Fdh0OC-+BJ+iVY0D2y0nAakGLxWZ8TywDu=BA@mail.gmail.com> <11588267-c76d-f0ac-bf98-1875e07b58cb@os.amperecomputing.com>
In-Reply-To: <11588267-c76d-f0ac-bf98-1875e07b58cb@os.amperecomputing.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 6 Mar 2024 18:28:09 +0100
Message-ID: <CANn89i+SiQXeDCKp9yjTz6ReQKxfHn6vHLcWFbCjjW14BiyAbQ@mail.gmail.com>
Subject: Re: [PATCH] net: make SK_MEMORY_PCPU_RESERV tunable
To: "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc: Adam Li <adamli@os.amperecomputing.com>, corbet@lwn.net, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, willemb@google.com, 
	yangtiezhu@loongson.cn, atenart@kernel.org, kuniyu@amazon.com, 
	wuyun.abel@bytedance.com, leitao@debian.org, alexander@mihalicyn.com, 
	dhowells@redhat.com, paulmck@kernel.org, joel.granados@gmail.com, 
	urezki@gmail.com, joel@joelfernandes.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	patches@amperecomputing.com, shijie@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 6:01=E2=80=AFPM Lameter, Christopher
<cl@os.amperecomputing.com> wrote:
>
> On Wed, 28 Feb 2024, Eric Dumazet wrote:
>
> >> __sk_mem_raise_allocated() drops to 0.4%.
> >
> > I suspect some kind of flow/cpu steering issues then.
> > Also maybe SO_RESERVE_MEM would be better for this workload.
>
> This is via loopback. So there is a flow steering issue in the IP
> stack?

Asymmetric allocations / freeing, things that will usually have a high
cost for payload copy anyway.

Maybe a hierarchical tracking would avoid false sharings if some
arches pay a high price to them.

- One per-cpu reserve.    (X MB)

- One per-memory-domain reserve.  (number_of_cpu_in_this_domain * X MB)

- A global reserve, with an uncertainty of number_of_cpus * X MB

Basically reworking lib/percpu_counter.c for better NUMA awareness.
