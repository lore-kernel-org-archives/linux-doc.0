Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC515A8
	for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732288023; cv=none; b=pm7hl0aUnF2wYojE/kCGLZ1amQ4/Q5YKuRJWlJeChBW2EyQUdOW0R4SoEfTXVD5GxLI1JSbmv6IdnWcFSCKZvLeJkBt32MhM9DoLrIIAbL+j6jBgNzo0/y7DyDDPx6uYRKS93VlRwHP2K7FD4bmkWXlQFN5Huj8vfhiNvmjYhE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732288023; c=relaxed/simple;
	bh=ZIE0TbJ33bF99CurhWw5u3B+7prsO8eQjAo6CzhabKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i84sbes/xo+C/kR3MLsdCeLvc1088UHcuR6wpEzXFKPsSw/ly5YWctrPL874HM0zGmGcWUStJfo1VvEA14moQ/WZHOOcY2KMsBXnR6s7elV5btKpgUkw9tXcw45yl+tmCLk/wkfkLzVPT2odWob2Atdbq+ub+nsrEgcCg0H/RZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qyl7+Ywf; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qyl7+Ywf"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-460969c49f2so285821cf.0
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 07:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732288021; x=1732892821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIE0TbJ33bF99CurhWw5u3B+7prsO8eQjAo6CzhabKs=;
        b=qyl7+YwfC//aNtK92nfBalz/X/Sl83rQdTtFc5ViBCXFbszeFSwpl24wfVsj/HfIeH
         5v4/fCo4l6YeMyt7rXIrgrqMRxj0gTBj1WIcAzzwd+K30c/j311OJMbDCp9hG7Hqe/UM
         RM1IKyAyHjodfqEG7up5nsgH1w0QV/OU3VHUBFaQTlGLL3TF5hp2j81J5OgP/kdBLnKR
         mZ44+UrCJhL9D28GWmrL8g1xo+BnZmgXs7lxvMifZp4FLCl2P0pauy7giKqc0a4I1UBt
         Nwjw3dJ5vMFcDuqXWOcYpGwLZSBQ7CUn5sxVOVe/wjgBrIPxAI6xBtiNflpQrhBr7T87
         S5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732288021; x=1732892821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIE0TbJ33bF99CurhWw5u3B+7prsO8eQjAo6CzhabKs=;
        b=dDcjY+v+EGLKwM+QFigug6R0SRoOtjeuqMxQFwkDEiT1mzMVOpnn3YEYEhSGpgarkU
         CkZ5ciRrtZn/51jF5hsEM0GDiR4RISkE4Uu+HG37Uv6/A1+ABqZXS1KUP15yriO4u3XR
         RII7iVlf7EqvpzSrsBg1RZ1Pu9Frw84WAOwfcjnJo4a9gWsShxe7r3s44D0QOMK3BqT/
         LjZeqF4l2VFcidObsCvouk0DB4ntTaM5WzJjQ4dGsXBHtFa1nqT44GaOXU5LvY0wvGLw
         5oexUrFwM1QsgcSASOiK285a0/b9scilAByljtLbcUUtbaC9P/1Nqp2tySXrJOz9E4sS
         +6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWwuQ8upEp2649wIYuYLXdp+eJ1b4hlOHBQuvLolGaI25xSS1KDq5BAw3eBaQHHfq9mv0tHaC5QGB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjHt11LZoPY1kpxB4FDzxJ3eizJvWsNPDpxguJLYuT+hNs6eh
	04F9QPPiqUiR90KRBSCtDaaq5RLpn1OaGvrh0Ctu4xtYNSFcd5TUpgvfWvQQFgI9IgtIlUq3w+y
	oDMCXrT9iVVXWy4l5zC+3f+MTXnPmkgXa9Z09
X-Gm-Gg: ASbGncuRoYvVyXIR14y4uJ5wVTDjzXc1TbPaiw4CNnr6Vp3fO9lfn9SosGv/1s3KL+u
	84cALIhZA3K9FmJRVSyUuencIQB2shPM=
X-Google-Smtp-Source: AGHT+IE3NFWMPB84awBTKVHQKpIkIzfpP6rj90b+t0wNWbJd2/ytMK3K3Pnfa7aAXQadq08IftnKIN2x22mbUHavO30=
X-Received: by 2002:a05:622a:54:b0:465:18f3:79c8 with SMTP id
 d75a77b69052e-4658aadae39mr3213131cf.13.1732288020964; Fri, 22 Nov 2024
 07:07:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com> <hdvig2tptf3hi6nmszafarzqb6j56abfbebppqmruvpihlf435@46b57hyw2pfc>
 <Zz6UTvERgg9ubRu4@casper.infradead.org> <e71408ff-b088-48e6-8b18-bb846a60cc1e@lucifer.local>
In-Reply-To: <e71408ff-b088-48e6-8b18-bb846a60cc1e@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 22 Nov 2024 07:06:49 -0800
Message-ID: <CAJuCfpHZH5MHVPeV_EgNb8cMR6hqq5p=Y76tgRCZK6mXL4LG=A@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] move per-vma lock into vm_area_struct
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Matthew Wilcox <willy@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	akpm@linux-foundation.org, liam.howlett@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, souravpanda@google.com, pasha.tatashin@soleen.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 3:57=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Nov 21, 2024 at 02:00:46AM +0000, Matthew Wilcox wrote:
> > On Wed, Nov 20, 2024 at 02:10:44PM -0800, Shakeel Butt wrote:
> > > If 'struct vm_area_struct' is prone to performance issues due to
> > > cacheline misalignments then we should do something about the
> > > __randomize_layout tag for it. I imagine we can identify the fields
> > > which might be performance critical to be on same cacheline or differ=
ent
> > > cacheline due to false sharing then we can divide the fields into
> > > different cacheline groups and fields can be __randomize_layout withi=
n
> > > the group. WDYT?
> >
> > Pretty sure the people who think security is more important than
> > performance are the only ones who randomize structs.
>
> I agree that I don't think we need concern ourselves with users of this
> setting for precisely this reason.
>
> I wouldn't want supporting this to cause difficulty for users who do not
> enable this when those who do aren't really concerned about the perf issu=
es
> as Matthew says.

Ack. Will keep it as is. Thanks!
