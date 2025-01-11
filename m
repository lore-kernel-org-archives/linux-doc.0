Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE853156F54
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736588756; cv=none; b=SM85jiToof5sc/1t15zN51suTR72CIYLv1uTC60G/Prrn1UXtpIIPg4dOv3ymgAWGMSBLoFH2xu07/1lfBt9OugqSV83zUg5PhcFqrr+YhMY98kKSVjOLO2sBRlJUIodIKiSM5XYVuA8is2+kR7/JpnTFyqCRO0r6WVxRjDuoxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736588756; c=relaxed/simple;
	bh=oWH2l2Is7xlqMrYGBqUebxyAWxzhjEcfg1lrJhwyF+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyxuLZZvVbCrTqefJrm2PcMaNkc8J0UwF2eDIChXZkIqFqRMqP/Bg9dS7FeUYM9lZuQp8x0p6EmEM1mxnpbOo+E5/e2YifJXG3SpvyKT5xJbhtf+GlFtSv5PX2m4tPaman2aNDjftfaTbSSZBfytpJGIx3OpElSuIdE1+kQhqak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OAQzGE9n; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OAQzGE9n"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4678c9310afso24761cf.1
        for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 01:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736588754; x=1737193554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWH2l2Is7xlqMrYGBqUebxyAWxzhjEcfg1lrJhwyF+g=;
        b=OAQzGE9nbDWs9EyVwDBZoHIKSqfiguimpdn3fNLxBDs0ytrg7WWEu35Iz+T+jNoHOP
         heUhb/FI28/DeT8TEbfhlyjHVrL1uP/xM/TBKzm2eaij/VPvEB3nJsOsGlDG2dV9Nvxo
         I3SWDRS9jUjVTMkuOUQ1qsyBNYVUScbU0RoJfCe09ZjCVasMTsxSNg5dG0q8jfE5I1d2
         KP7JARmwyFtEtl0lwAoOaRVgvLD1UZpbjn6eZdA7UYT4GDbt2B5Uhg12+U73XoTNFx+9
         vEx/b6lUQYW2lnem09GeAepE5HUXB71h14ux2WHNmbPLLEuPUqeO120NHhpP0f65rGGK
         Aa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736588754; x=1737193554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWH2l2Is7xlqMrYGBqUebxyAWxzhjEcfg1lrJhwyF+g=;
        b=K7YYyuYI8YAmqNqWJr/p0fRGvMV4wGwlrSzU9ApbytqX/iRRQ0F3C7LGtfhvaXymV/
         tyVARXTzsqaHT1WxurVPVlUz+VizC4FQriRSuMBDpS8L/U5N1JWNR9O5oeuj2nML/3ON
         bHf2F48JPbTke2XU4/nzMqFY+yyZgSt8NmeZ5f914Ab+6PxRyClbUJM4ymRXC8OgmO6M
         /G/pR3AWUSd1+y18XtEE8hEpWJ6DRtv43qZjcO5RBFNkDd3HthmonGsw3NVYgn7TVZyZ
         TP7lAV57nBvz3cES8kWzxOZFBUiIKfbAkUvW38WwUBXfWZEqoel/LKhoZpXqFOYjbxHi
         8k2g==
X-Forwarded-Encrypted: i=1; AJvYcCVIdJ3CnoENDfGjXS8sPTkbS+YC2FLQsorrwuY3c0rgINte/GS1PIw7XFvnfxtC2TbnrTdnnoCzOwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIz7XhHpuhbbq2V94sWtHMBwSVNXW19Y1bkq0N9LYtYLTGIALf
	FYQSW0KC3zLpXIFEcNEi27HX0hiUzDh3kq5JwC5apvsnfEttZTOwimERvnjmKC19DCAPcxOTy6r
	Ftl5p77A7DOoMQotJ37zqQ/2Ieu5wYnAXL5Pc
X-Gm-Gg: ASbGncvz/sEzHjZziOMPsUZ4fYgALudEfbe4z5VzG0S9UWyyZ+BV/z3bYQW2yOTaYmp
	yBhd9mXzMWdDmY9Sz7mAMXuLsUJ9U9+yPAOh3tQ==
X-Google-Smtp-Source: AGHT+IGhIG2CngGEbgawYJjo0rZQOmtUym3oXRx6tZFSBOM4GfAYmvCUJp9dfUNCK3WK8BUs1iJeig+fCZsKFy6cjbM=
X-Received: by 2002:ac8:118a:0:b0:46c:9f17:12dd with SMTP id
 d75a77b69052e-46c9f171447mr414841cf.19.1736588753300; Sat, 11 Jan 2025
 01:45:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <Z4H5Et1Hd-JxOJKM@casper.infradead.org>
In-Reply-To: <Z4H5Et1Hd-JxOJKM@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 11 Jan 2025 01:45:41 -0800
X-Gm-Features: AbW1kvbii1zCUiOl90M4f1ttosMhVd4eHlKP_X8K3onQwYNCQW4CfAqU6ROBXJo
Message-ID: <CAJuCfpHxGfv8568Kvh784f2cc1XZQCi2Gv=9accf6T-3+GSoaA@mail.gmail.com>
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, peterz@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 8:52=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:47PM -0800, Suren Baghdasaryan wrote:
> > - Added static check for no-limit case in __refcount_add_not_zero_limit=
ed,
> > per David Laight
>
> Ugh, no, don't listen to David.

I thought his suggestion to add a check which can be verified at
compile time made sense. Could you please explain why that's a bad
idea? I'm really curious.
