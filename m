Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B37A2D7DEB
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749869; cv=none; b=UvTwLwTtx7kwKneJFL1NUptjTimsW7140y49P3EF5sbh5a2p6MobiIktYVyA/rJTUrdc5nmRdD7XAGDJf051XqPolGA82nrfAavdHkwvZysmCbMYg29ub5SpYm4jMfeKpQDyEYYpcmu8l6wYpYS5owLBBiil0AAWGmBESj1lFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749869; c=relaxed/simple;
	bh=sW0fcO523ng4pGFY9aQJooiGcb2xLELRhF6pvb9Out4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PF3C9wXsz4xS2KfEFjp2eMdsY370qWJhRhWKT7+i2DTosqw0nt8kr07x3oPHAqNXNwVa5+USr++BbT7YhlNykmj6urZQ5MiZUBvuYhWgLX7j6yH0VBo8bx9rXCumWcq8apHg8NnCS6ZuiAy2/GxbjyiGTVI4/kulD8FhlPdId4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P8pSUfFi; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P8pSUfFi"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ea12242d2eso340691cf.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761749866; x=1762354666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1yPrZJAtYC54ch5kkR2jlvgWTejLF7D5+gBaBiHJFI=;
        b=P8pSUfFiXDPDvWHmEXuinZOCNdErarnp4POZ0SOm+Nft/ANiXqnl82D1ltOuvaxP2s
         RH0K4kWiEOjHoyP3J6XC7Vv3EFYLm+P9ul8yKQuoRy8/xTCUNl6MSBeb+CmCWHSPd3Sb
         JcTJlOBlIgMdppqp1oVg9pEjoUbvzy6XrklLosfX6s5Kb0Cu56C8gBleV0aVVFRKDPe4
         sJZU483KkhPOrqeiIjJFnj4l5NNwWSxVfdReZGU7PYWWlG3Kzti3eXuhCBOq86OLRrlz
         7wCz5egdwKvC6zV5PHkrbqNTTZPrHe55bfZvOf9W1rE+KJAu9Rm6qI+EOx5Ke3jEFoDT
         NoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749866; x=1762354666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1yPrZJAtYC54ch5kkR2jlvgWTejLF7D5+gBaBiHJFI=;
        b=rHrm7MrGeW4xRWxPNN9g7rWICsdOYGV0WLNYvYL9arnz9gGH9pYJVDQ077ytbPxFsz
         de2HeJe9AJXR5IK6xNAqnELUoBRcIo1+DcMbhjy0syiuLRddrgg2t1J7f09Bd88KX3Do
         5PKSYrm+nsmqiamkQmZMIMEdCwah34+tUfDpQTGKv/KwZRwhHNv2xLT80G4iHym1tt1z
         1qx1NGcOeQCK30mNRLYGZ0mw82FjS6+RzVO7GfRsjUu6HJFjoXPXZ8i/UbqVYiyerGHM
         ugeW3ohYCLOCLAiugqxZD+gW5D+274qPAkYJUpekSfgKDQniw6EsxiggrXFk1OjBYuPU
         g/hg==
X-Forwarded-Encrypted: i=1; AJvYcCUXkOzZJtKKcGS8kLrHT8ZgqfiqrDC1gySrLJ5PFxWJdv9WzFuJjYgsvBwguitJ/dHHofq7z0IGZ1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcwVJAVJkzjIxYScBM0wYcnRd8PaegOvJ+hoAlYJ5md8usE8yS
	M5q9tTfwOMX7irUNYv+veJqJCqnd2aX9aZB+B0dY9xifL0+gYQ92U+Ezr6fccQGhSYCsuhjnpkD
	MYw+Y3H0LxXIz61UZ+KMYO80feR/TZvbPOKQ5P31i
X-Gm-Gg: ASbGncsrTwOY8dZDf3jZkdiB5tU4Xeyg7s2aieCdO70xs8ON0cIL4LMbiduvHaIwQbW
	StRdW4Ui2VcNnc+I0zxY5QmgVZWADsFbKu1pPsbFePigCy89Fue83FR6mIfDMUkrupWAfOEcy2z
	me0oeGXXRsNGaKZJsV+2Nic+BptttLib9uUh2TrXk/0jJcP9T06XA+CZE1jTdZXofJQUlypKtMv
	77ZTreU9SGITbMdAOLeu37bAAfsMGlwZRAAYksLLIQ+wVwQUKGnscHhuzj9vD8SaDYXJHXyNS57
	ipBI8VTFtdmqDb8Z17SJivq1ug==
X-Google-Smtp-Source: AGHT+IHJk1Z4xsEEl6nhEK364d+WNrqkglBzi78RQdt59uckdBYZ7htllhsIgZwt9bC5EN7/2oXDuEWCE2gLHAXeC4U=
X-Received: by 2002:a05:622a:11c8:b0:4e4:d480:ef3a with SMTP id
 d75a77b69052e-4ed165a8088mr6994811cf.13.1761749865638; Wed, 29 Oct 2025
 07:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026203611.1608903-1-surenb@google.com> <aP8XMZ_DfJEvrNxL@infradead.org>
 <CAJuCfpH1Nmnvmg--T2nYQ4r25pgJhDEo=2-GAXMjWaFU5vH7LQ@mail.gmail.com> <aQHdG_4yk0-o0iEY@infradead.org>
In-Reply-To: <aQHdG_4yk0-o0iEY@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 29 Oct 2025 07:57:34 -0700
X-Gm-Features: AWmQ_blGYfe_lFn4eY8RCcDjRQso5Ijs05VisPx1zbBZudE9r4ISvY1EtlCdvh4
Message-ID: <CAJuCfpFPDPaQdHW3fy46fsNczyqje0W8BemHSfroeawB1-SRpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Guaranteed CMA
To: Christoph Hellwig <hch@infradead.org>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, alexandru.elisei@arm.com, 
	peterx@redhat.com, sj@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, willy@infradead.org, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, hannes@cmpxchg.org, zhengqi.arch@bytedance.com, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, minchan@kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 2:23=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Mon, Oct 27, 2025 at 12:51:17PM -0700, Suren Baghdasaryan wrote:
> > I'm guessing you missed my reply to your comment in the previous
> > submission: https://lore.kernel.org/all/CAJuCfpFs5aKv8E96YC_pasNjH6=3De=
ukTuS2X8f=3DnBGiiuE0Nwhg@mail.gmail.com/
> > Please check it out and follow up here or on the original thread.
>
> I didn't feel to comment on it.  Please don't just build abstractions
> on top of abstractions for no reason.  If you later have to introduce
> them add them when they are actually needed.

Ok, if it makes it easier to review the code, I'll do it. So, I can:
1. merge cleancache code (patch 1) with the GCMA code (patch 7). This
way all the logic will be together.
2. . LRU additiona (patch 2) and readahead support (patch 3) can stay
as incremental additions to GCMA, sysfs interface (patch 4) and
cleancache documentation (


>
