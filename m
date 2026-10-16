Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D447DD54
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154117; cv=none; b=DpuoebqzliIfmviFH94Y7BqMQGcsbV97e0CS7Vo9El0VCczfhTxLED24TU5KqcKecmZDmQjjIuG9Zi3DleQR1907shgvTAWnqka6NzgQxkSh5daNrso/ICANomXuKjR9B8LJ3lygmsp2ooIJ2ictrJYWK59fwcIo2y7EOfFG2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154117; c=relaxed/simple;
	bh=cXn/JAAY5QHO7gSOwDgZG/1D2SkKrfxhPsylIeP28zI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=T/iAMRZAeKia2tKdwKCusmuxMdsiNEtJlwWzVx+ZfgeB8I5XPzOCcxKQ62QCgOH+9xxIXsqTDTCZXgbtG6BeP9jXAhXqrY71hRgky7JryVARL3jWZwov1DVoVL/PZNMjHLgWUb1a6ithMdOz07EiqIZBle+zC8MtWck3dDJ55jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9G5zY/b; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9G5zY/b"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd1da63bff6so229443a12.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 05:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154115; x=1792758915; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HVfYgQsMCF8Qw1/e6sPegSr7q8k8sKUP9Wx/2uIXt/8=;
        b=f9G5zY/bZFP2eE6g2Tl8on9Hwt3NcGuFrF8gmIKzEga+k2NqrGWrWR8EfZ97pXJ7yL
         aM4OADqGRO5zcUvj976hqF6M/vZZ2yhFmyIF+iEDVL8awcF3t4CUm7EQjtB0CMNk8AUx
         VVwh+5BTgrlf9tC4sp4+BP3EhQoa51b2fcjz3G2M/ZBoKXpyL3eq+DTJ8OtriTah6lod
         XXwQfgMakEywqCzVtuZReAbYadssWK5p3toXTeK60WGa90vcPzLJXd5t9pI/e2xu9+w/
         LpL3EiZh3bAhYkpf8Plzedt7ALDnJSfmrQ7W8SuU9Q1Z9aH6DCPgDvNXrABdug+XZRGE
         JwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154115; x=1792758915;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVfYgQsMCF8Qw1/e6sPegSr7q8k8sKUP9Wx/2uIXt/8=;
        b=u16xWpV8+Izgay8C/H22UhLxPEmBH7kawlFNmM083luYBW77Gdnw05Tmo5uI4eUE0h
         Zpo7pHODLY8gxQDiSZiFmWKdZVKQfkJiWWA3FBNd8G2a5qBzyeQ7ZuQ3QlZokqH89WDW
         g5v8SwnqAdLHuCOLUH5V5UcoiqHDd1HqG6hgcywp+Ga5wnxLMFnpWNm14/eopG/KYjnC
         InN+iYnxbur5cBDeW5iM95NsPm+Q38fG8WN/lnJPUBm3rDPNRz50r2xEEgvMKmUHmycz
         tYwgaKv7YU2xmb+SlsH4T1wBmCPgUinQ6UPczJVjbj7B3vTmFbt4zhYRZhO/X1o5Me3P
         7Eiw==
X-Forwarded-Encrypted: i=1; AKwUvBwKwTMAfOKJU9XU0SZRPFqZWxtLQe/GXnDBjwMFje8uZYsSAgF1IxdDcLmS9exkOfMUcI4rA5sSNIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbNc6lWLDe9XRDZjmFu26Mzx/+hCCVReybkcobU/IFB214hoYE
	GV4bLv8nhhgMjc7sJoad04lmkJw5p70AwUAA5yYKj17Yh/h25FzMwQ88
X-Gm-Gg: AYBFou2swJ9MdsHuwvK/Z2TMSSvQwsxkEd6p9Jut/slNgSt6X19CFeJm8JH3yNZleBU
	WBHyR/hZ6paPM3SsqSh4BySehg14W7+TSDg4cEbnSnV63aNplJZmajk+A+bGwsaLO4Kq6KuAXQ9
	5QXTpQZA+3yaaGj72achHfiDVHLGHJABUVo1dplqUlNoonr2KtMzSgWypM32xQCZ9LYElSLuVcI
	c8gq2LMOWvECCT4yq8QT7y+kWczCN4gCaDifwGxK0fobRZi+aLMe5WGNWQuS+/NLqzK6/87+KR7
	BJC8lu++zmintjr4zFLntv7FthkvUai7Eu/noYlt76F12LiNOMCY09bxFUWptptAh7OvA0xob8z
	3B0f4/ff+Mt/wDm3YenW9aPaR+t0zmxdS6z/NNhijIkiPioewFvcFFPQs5VLjeD+a2pZpM/vSlw
	f7FUTv6TIAoYfpzgkPduJYAvr9Fw95PUtuhIoaW7bKOWC5gQ7p3jzy/KfzhojqjcnWmWK+c3qed
	bsRzWMwnnsiHBf1jYaiyQV4LozXB04EoRgr102YwQB0WoGwhu4bAjKOz6cOjm4Q70F2AnzPQ/la
	vg==
X-Received: by 2002:a17:90b:4d8e:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3acbb8bf8cfmr2230412a91.37.1792154114934;
        Fri, 16 Oct 2026 05:35:14 -0700 (PDT)
Received: from [172.20.10.4] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4972fe6sm4162850a91.15.2026.10.16.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/damon/reclaim: improve grammar and style
From: Aveline Noir <jm5905938@gmail.com>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015080623.808458-2-manuelebnerli@mailbox.org>
References: <20261015080623.808458-2-manuelebnerli@mailbox.org>
Date: Fri, 16 Oct 2026 20:34:51 +0800
Message-Id: <179215409165.864368.11903228864381211337.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792154097; l=2627;
 i=jm5905938@gmail.com; h=from:subject:message-id;
 bh=cXn/JAAY5QHO7gSOwDgZG/1D2SkKrfxhPsylIeP28zI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgboJ0y2WZIrQV0H4HJI1WEQ5sxS6pM
 Nc/XEYGLW8ee6wAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLmlhrl3kquPOrFE+xeC/g7LLIxZBSwDp24vLbGOb7+M1Qt1DRDethJgmuvu9LttDVtPsNydeRW
 aZIKr2ijYEAE=
X-Developer-Key: i=jm5905938@gmail.com; a=openssh;
 fpr=SHA256:oSxqik6Pl1M8EjQW1QXKHoylm1jy0sguOWFFJlA9zf0

Hi Manuel,

A few suggestions from my view for you here :)

On Thu, 15 Oct 2026 10:06:23 +0200, Manuel Ebner wrote:

> @@ -30,12 +30,12 @@ guests could mitigate this problem.
> -DAMON_RECLAIM finds memory regions that didn't accessed for specific time
> +DAMON_RECLAIM finds memory regions that weren't accessed for specific time
>  duration and page out. To avoid it consuming too much CPU for the paging out

"weren't accessed" fixes the grammar, but "page out" still doesn't
agree with the subject. How about "DAMON_RECLAIM identifies memory
regions that have not been accessed for a specified period and
attempts to reclaim their pages.".

>  operation, a speed limit can be configured. Under the speed limit, it pages
> -out memory regions that didn't accessed longer time first. System
> +out memory regions that weren't accessed longer time first. System
>  administrators can also configure under what situation this scheme should

"weren't accessed longer time first" sounds a little strange to me.
Maybe "Within the configured speed limit, it prioritizes regions
that have been idle longer for reclamation." would read better?

> @@ -88,11 +88,11 @@ identifies the region as cold, and reclaims it.
>  sampling and aggregation intervals. The auto-tuning aims to capture meaningful
>  amount of access events in each DAMON-snapshot, while keeping the sampling
> -interval 5 milliseconds in minimum, and 10 seconds in maximum. Setting this as
> -``N`` disables the auto-tuning.
> +interval to 5 milliseconds in minimum, and to 10 seconds in maximum. Setting this
> +to ``N`` disables the auto-tuning.

Maybe "between 5 milliseconds and 10 seconds" would read more
naturally here.

> @@ -113,8 +113,8 @@ quota_sz
>  Limit of size of memory for the reclamation in bytes.
>
> -DAMON_RECLAIM charges amount of memory which it tried to reclaim within a time
> -window (quota_reset_interval_ms) and makes no more than this limit is tried.
> +DAMON_RECLAIM recordes the amount of memory which it tried to reclaim within a time
> +window (quota_reset_interval_ms) and stops when this memory limit is reached.

Agree with SJ that "charges" fits better here, since this is quota
accounting. 

> -While keeping the caps that set by other quotas, DAMON_RECLAIM automatically
> +While keeping the caps set by other quotas, DAMON_RECLAIM automatically
>  increases and decreases the effective level of the quota aiming this level of
>  memory pressure is incurred.

Maybe "While respecting the limits imposed by other quotas," would
be another option I think.

Thanks,
Aveline

