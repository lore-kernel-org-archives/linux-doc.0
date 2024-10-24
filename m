Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8445622B678
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 20:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729802013; cv=none; b=TVtcqY7I5Oz6JVsNtm4yT3DdCtmuwRD2n9HkdVb7eCQ5FobJAfwwga1k49cNVdfKsY+9mGr9AQYb/j1bZCMCSgkZ611nbq+v/CU3rpNZ8mCGP4LGG6zwMNXOmxnsw0Uqun4zaXbaHhKEjg8rmal8yD3WhWOLR1jdT4RUWEk8Om0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729802013; c=relaxed/simple;
	bh=fg6TiyFvbDY3F7rgtjpzzrWknbfNctLjVqZiyU7qibI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTyPSDD7fA6owO6gS2gUZzBIFxCf5rlHIsQ9OadKYJEJIKXKlNVnnoz0XKMZOmFLjcky7zPvCEdj7PQ+S8+zgNYic1slu2odV/0WfAARih7XzkhtYynTmfhQdxWC7UeYj1SxajXRU8kw1rWEFTz7bY10ZZfmLWgzeHljMvle9G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hWQguhp+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hWQguhp+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so200075966b.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729802010; x=1730406810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg6TiyFvbDY3F7rgtjpzzrWknbfNctLjVqZiyU7qibI=;
        b=hWQguhp+CnbddhzmUsGG7rMNi+4y30dOGw59I4DeY4Uo6INaw/VbXaIb6kB63L8wzs
         b1LUD0ODxmE5RhIjPqjBNKnuDUlM/ELWpyX+t5l5fuQIHA4DA+vExwVUohyUKpWdGHhv
         19XvLkFRtWWgPtkSzEQ54Pedp1xTZaydzU8YcEm2yTzekk3K6egKyRdol78NS2wIbZvE
         qY+BuuMGMimOgBgZRVqZ5uxx2uXh+DKGvUNf8wAUSK3d9VRVQ5J3IrsgYC2C27IXqw3v
         By1376iItMEgftZH9EX7RruyuLe6XnU2HAQUOm4P3B23fyTtArX8WsDV6bKUukBEULuH
         mOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729802010; x=1730406810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fg6TiyFvbDY3F7rgtjpzzrWknbfNctLjVqZiyU7qibI=;
        b=Uf4XLuXlFdU7AuDDTtXKGv/KlXQFR/69be5T9+t+FgprdcuxlxkxUaqj9+0UKyCwbV
         sChqXa0oOpVpeocUncQqhey2STwKWquMKP0/HvBBGfnD4/bO0139Co68F04ukX6ETioA
         ZynX+6yGETVKzZkJoH48YHAhEZhjLBLpmq44NOqz18FXJL2WO8sFXAjl25sHOdVC+7up
         7HzreNo22SigBc56AYClMSUb/BohZ8Yt0r/YHCtnMJOkhCP48XtLdE2XoWyGOiqYi/UE
         fJ/ybZR1UdA381fDa+Bkj1gXczNX1GRl0vrzWhcKWktzILxihiJfHd4tbAsOfkoLE8/Q
         6NRw==
X-Forwarded-Encrypted: i=1; AJvYcCW+pWbALun0+NIp30cXXhOEh6QfqxXuAm0R6M6eA0FftpYADt3hNXrVWNaWtr9zxtminGfBwyaHTn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJ8biIq7pKJazKY5/LB9lCGdH1VN3bW/ryLl4gkljVdpwdwdq
	Ag07iK11NXdRouLmK+o8Kv1Ys+Nb8lIWyaMmbVsYJo6OtzU/81Tiojued4ro3T/+1K4vhpBj8yI
	/kk+3l3gP5W8KsNkRdw9PZOE2mIrWiif3CGJf
X-Google-Smtp-Source: AGHT+IFUTfSFqD0LJ8fBf/qBjK9gkH3Z9YIIz4iHZrS73DoGiaBlQz65rZWWLT2VwceQlhDcqTGP7QpWRdHLEYK/iBw=
X-Received: by 2002:a17:907:6d29:b0:a8a:58c5:78f1 with SMTP id
 a640c23a62f3a-a9ad2711791mr278966966b.11.1729802009584; Thu, 24 Oct 2024
 13:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024065712.1274481-1-shakeel.butt@linux.dev>
 <20241024065712.1274481-4-shakeel.butt@linux.dev> <Zxp63b9WlI4sTwWk@google.com>
 <7w4xusjyyobyvacm6ogc3q2l26r2vema5rxlb5oqlhs4hpqiu3@dfbde5arh3rg> <Zxqj7hw6Q6ak8aJf@tiehlicka>
In-Reply-To: <Zxqj7hw6Q6ak8aJf@tiehlicka>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 24 Oct 2024 13:32:53 -0700
Message-ID: <CAJD7tkYsCev299G=h2r_e6i34+ccdXJYphv-bQbROqOd7Lr1Uw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] memcg-v1: remove memcg move locking code
To: Michal Hocko <mhocko@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 12:45=E2=80=AFPM Michal Hocko <mhocko@suse.com> wro=
te:
>
> On Thu 24-10-24 10:26:15, Shakeel Butt wrote:
> > On Thu, Oct 24, 2024 at 04:50:37PM GMT, Roman Gushchin wrote:
> > > On Wed, Oct 23, 2024 at 11:57:12PM -0700, Shakeel Butt wrote:
> > > > The memcg v1's charge move feature has been deprecated. There is no=
 need
> > > > to have any locking or protection against the moving charge. Let's
> > > > proceed to remove all the locking code related to charge moving.
> > > >
> > > > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > >
> > > Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>
> >
> > Thanks Roman for the review. Based on Michal's question, I am planning
> > to keep the RCU locking in the next version of this patch and folowup
> > with clear understanding where we really need RCU and where we don't.
>
> I think it would be safer and easier to review if we drop each RCU
> separately or in smaller batches.

FWIW if we go with this route, I agree with Roman's idea about
replacing folio_memcg_lock()/unlock()
with an explicit rcu_read_lock()/rcu_read_unlock(), and then having
separate patches/series that remove the RCU annotations. If done in a
separate series, we should comment the explicit RCU calls
appropriately to reflect the fact that they should mostly be removed
(or at least re-evaluated).
