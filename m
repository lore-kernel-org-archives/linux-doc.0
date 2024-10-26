Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7222611
	for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2024 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729956404; cv=none; b=e/Z0VT3iEASfSheB6hlw5u97XW90Z8grwVjRB/ly3QLPk0mLXk0cbdJZpJtp1W3Gg8IzyDaSc/ztWckqDaZCXlIQq5vUQlPbYUXlujC90H7Ba1WQunTZLLxgw/gJBx+CQMKYsCgIc4ELLH4DfQtFzh+o7ZQFiMDGxwFlEmZa31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729956404; c=relaxed/simple;
	bh=j+TOt+oBoXAXIref9ySAzCU2ABgXyfapBlEIF4iWO1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ho+IOLsqdO5VJ+fq0i3iGfJSxGIMbMRqAOENdHyTHLdAdRz/BQ+WITYI2ahpiTrkdaf16417atiKGewK4dveH91rxktZltpmpT1NtwPGasrK80B6u1AabX9GVUT07MBdiomEemgSqoxOapeRNzLk85bhasF/V2coJz96uc5HSW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AjL6l7+G; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AjL6l7+G"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4a5ad828a0fso931707137.2
        for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2024 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729956402; x=1730561202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xurp/dzSZiTxc3Q4P+xg6SJq6yioLcLs/RNUwkLIb8=;
        b=AjL6l7+GeCucLC039+KUBJEpfMLFJTqa0BwpRv8aWyhHqixAF/LHqfYhNi6DYoZ/I8
         MxP86klQHfyTmhG9Q7pE3JDNYyNbuu2GVk7VeJ91S8djr1Ok9xY8XZy+rtO66vIgJV/d
         ezrABfljnUtef0RrKtiU6sTCz87kanBup1raQstwmw4TW/q181JdL85G3A+rIMUD536l
         muHMWAfHqCwdRk4qK+7b3mZdSNW5qU0YGu324yLJbxvt28zk0AF+FtSvZwmBFiDTt6oR
         jVckIumRUmjxj7d88UbFBONJXFtor/nxiqnh0WHTfjXOGHMcJzIN9EDsFSZpGwM1dskW
         MSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729956402; x=1730561202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xurp/dzSZiTxc3Q4P+xg6SJq6yioLcLs/RNUwkLIb8=;
        b=cjZHGPK4YkoKB6dGnYGl3FfdPgX2Cx00jydSxexyCTekaxIiw5K3oete1ZEwCPEgkD
         jwoV40dJDzfg7QmxQMP/MW7/oRgYB6VLwt39IJwSp6pq4JRcTmeSiAXDH7bb4iDPmJPs
         CPuHfGUyS10oNIYwef69VCI0Y6/6ecWGW9WRXj4DH4UqfZ2dGEAczF78sZeH0j0c8H6A
         3+sYfFqcMtIYkqIpFHdepYpBXnl9Y77FZuPsdTVcCExxPkT/jk77ElDzV2OoJ1XfhUWT
         EWb80MdY4eSSCqy2vHOrz7s+uE5i29jtLLUn9aZo5EQhMcG+eFPeS4qj1jCJcfqJ3Wa9
         K37g==
X-Forwarded-Encrypted: i=1; AJvYcCXBEm2vx60xdkDd16n9+9JBktSCUiTmf1paUvV3hX9WVKeavVhF+ob5FQX/R8jGdQGN9w+fpxswzPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQM7+hpowCQQWnWLpRACJkucRbia9dcISImVT+mkblG1ufFIcW
	ocxVvzv+sm5axmcr70YKRdPnSIb3jeaTVdRcs7W8zLm0ROKIFnDGhzgci+MA6txPvqhK++zR3Ry
	esaB15oS5DOkeqViqYFxy7c43z4vLk7g2sPUK
X-Google-Smtp-Source: AGHT+IErUT0EIQ3izExbmaeiykyMEE+HsZfO112pFWJqZp8vISP3bZ5byVVQr2RWeeWRFFt6XPR1QkksNOhNbda7Msk=
X-Received: by 2002:a05:6102:5112:b0:4a5:b0d3:cbbe with SMTP id
 ada2fe7eead31-4a8cfb27a5fmr2090677137.1.1729956401467; Sat, 26 Oct 2024
 08:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-6-shakeel.butt@linux.dev> <iwmabnye3nl4merealrawt3bdvfii2pwavwrddrqpraoveet7h@ezrsdhjwwej7>
In-Reply-To: <iwmabnye3nl4merealrawt3bdvfii2pwavwrddrqpraoveet7h@ezrsdhjwwej7>
From: Yu Zhao <yuzhao@google.com>
Date: Sat, 26 Oct 2024 09:26:04 -0600
Message-ID: <CAOUHufZexpg-m5rqJXUvkCh5nS6RqJYcaS9b=xra--pVnHctPA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] memcg-v1: no need for memcg locking for MGLRU
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2024 at 12:34=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.d=
ev> wrote:
>
> On Thu, Oct 24, 2024 at 06:23:02PM GMT, Shakeel Butt wrote:
> > While updating the generation of the folios, MGLRU requires that the
> > folio's memcg association remains stable. With the charge migration
> > deprecated, there is no need for MGLRU to acquire locks to keep the
> > folio and memcg association stable.
> >
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
>
> Andrew, can you please apply the following fix to this patch after your
> unused fixup?

Thanks!

> index fd7171658b63..b8b0e8fa1332 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3353,7 +3353,7 @@ static struct folio *get_pfn_folio(unsigned long pf=
n, struct mem_cgroup *memcg,
>         if (folio_nid(folio) !=3D pgdat->node_id)
>                 return NULL;
>
> -       if (folio_memcg_rcu(folio) !=3D memcg)
> +       if (folio_memcg(folio) !=3D memcg)
>                 return NULL;
>
>         /* file VMAs can contain anon pages from COW */
>
>
