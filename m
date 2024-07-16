Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44E50297
	for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721167590; cv=none; b=sVHC1QCQYJuEJc2TbYhxmZF/BhsmkGyuHKtQyYn7QDIrgK52EkrJmj5YmtGJPoP7SGadX3YKZtRJ1Eobxj/lrYDjk6XS4LrDNiUzM0TAgvf04/DD86OFrEnbbNQ9ELnP88K4nt3gEoBvHmyo8TzSXApPHrFkZdLYdY4uKE7WRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721167590; c=relaxed/simple;
	bh=w2aJTmvDOMvn6K+ayRVj7cPeNTzCuJAPOw72W6PM9lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Osq+N6Cqxj6iRmAAKXUXGbl7ZYP1pOigteDMiKMTRe4npoj0HmZbEH22UK+nEPhmlMknRGxQy93xgtsc+lC2dUIZJV1uFCWx+Jmu8WUWwJWF70463KRR+uyJEQG+/9Hi6t6pPh/nM7Li4V84/HOfcYiUScgLWjUQoN6XG9nxCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=iFYn1rCP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="iFYn1rCP"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-78aeee1068aso3065076a12.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1721167588; x=1721772388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2aJTmvDOMvn6K+ayRVj7cPeNTzCuJAPOw72W6PM9lM=;
        b=iFYn1rCPz8Yjz2EqLEmXGiJwH/zAtHBURGmwCoilfR2SeKKpx4O0cDZlR2kk31aShx
         GFn72ubRuT+2Rp7ns/omxxe3uiBjun9JBL+Kb5/ElpuqkjlY3ZCKKl+6zkcLC43yvdq6
         vgenCo2lVDOAIw1tMNUvFiaHR6sKyHFJ/LcgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721167588; x=1721772388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2aJTmvDOMvn6K+ayRVj7cPeNTzCuJAPOw72W6PM9lM=;
        b=pQN6mzBsrMvoEQVt6n16frxr3R1GYopC/O+MnD7wDJ6ZlPuUKfXyioGbZ8MuOy1p8s
         q8Sy7CDORdUYApft5tjBGBIhA+3mCqLsNFm1hk8u91Wz5uqJl4qsTSYFJrXYdr/n+FRD
         J+EV9NAwdig34Rn525s7PbYbEyy5lfnzYhbDCGNY3HdGSUj6StzjW0NKGdJw4RPu2u73
         9v3ozpbxwxngakOdD1y4JZPnkWS9I3hqI4CifCG2Z4QzwGzEP89pktumng0IJDK+WnhN
         a9+QNwbmBg0sMcm8IbML259EbDhZRtRxKd85PWhZ4jBXd1cIzXysl5E8nlOlDr/lMkul
         0vtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXkxhBDZSBejG2EAEaU/WzvaV9bdevIeb2ntaZxETa3Qojj6cxX3/LTyeli3G5efgpWcyOCWfoPfeU+3o7XKJnvlN4pO0R4gMh
X-Gm-Message-State: AOJu0Yyqb3VMG7LWObxpCZApS0mlNEdAcG9RRt/HG0oQe7TP/T4ft7lc
	c88uaXlKLZGXDcvMGNht/aKNmxE8SPPe+x5NISmKE1WbcVv0pUiGvYZ7MupiAqSHIjRXBNArTMh
	iA0jV3BzejEyENws9CXRvm95kK4lobaWwwTlAWg==
X-Google-Smtp-Source: AGHT+IHa4OUEBjwkyORdqOTlwB6SwJ3UGLm7iossoLCCGBgQW/WBnp341S1YhpWMm7wMFcfIxWpuIGR1HiBOvvInuxU=
X-Received: by 2002:a05:6a20:a123:b0:1c0:7ec3:c7ae with SMTP id
 adf61e73a8af0-1c3f12ac92dmr4304824637.47.1721167588247; Tue, 16 Jul 2024
 15:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715203625.1462309-1-davidf@vimeo.com> <20240715203625.1462309-2-davidf@vimeo.com>
 <ZpZ6IZL482XZT1fU@tiehlicka> <ZpajW9BKCFcCCTr-@slm.duckdns.org>
 <Zpa1VGL5Mz63FZ0Z@tiehlicka> <ZpbRSv_dxcNNfc9H@slm.duckdns.org>
In-Reply-To: <ZpbRSv_dxcNNfc9H@slm.duckdns.org>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 16 Jul 2024 18:06:17 -0400
Message-ID: <CAFUnj5MTRsFzd_EHJ7UcyjrWWUicg7wRrs2XdnVnvGiG3KmULQ@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Tejun Heo <tj@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <roman.gushchin@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 4:00=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Tue, Jul 16, 2024 at 08:00:52PM +0200, Michal Hocko wrote:
> ...
> > > If we want to allow peak measurement of time periods, I wonder whethe=
r we
> > > could do something similar to pressure triggers - ie. let users regis=
ter
> > > watchers so that each user can define their own watch periods. This i=
s more
> > > involved but more useful and less error-inducing than adding reset to=
 a
> > > single counter.
> >
> > I would rather not get back to that unless we have many more users that
> > really need that. Absolute value of the memory consumption is a long
> > living concept that doesn't make much sense most of the time. People
> > just tend to still use it because it is much simpler to compare two dif=
ferent
> > values rather than something as dynamic as PSI similar metrics.
>
> The initial justification for adding memory.peak was that it's mostly to
> monitor short lived cgroups. Adding reset would make it used more widely,
> which isn't necessarily a bad thing and people most likely will find ways=
 to
> use it creatively. I'm mostly worried that that's going to create a mess
> down the road. Yeah, so, it's not widely useful now but adding reset make=
s
> it more useful and in a way which can potentially paint us into a corner.

This is a pretty low-overhead feature as-is, but we can reduce it further b=
y
changing it so instead of resetting the watermark on any non-empty string,
we reset only on one particular string.

I'm thinking of something like "global_reset\n", so if we do something like=
 the
PSI interface later, users can write "fd_local_reset\n", and get that
nicer behavior.

This also has the benefit of allowing "echo global_reset >
/sys/fs/cgroup/.../memory.peak" to do the right thing.
(better names welcome)

>
> But then again, maybe this is really niche, future usages will still rema=
in
> very restricted, and adding something more akin to PSI triggers is way
> over-engineering it.

Yeah, I think this is niche enough that it isn't worth over-engineering.
There is some value to keeping broad compatibility for things moving
from cgroups v1, too.

>
> Thanks.
>
> --
> tejun


Thanks again,
--=20
David Finkel
Senior Principal Software Engineer, Core Services
