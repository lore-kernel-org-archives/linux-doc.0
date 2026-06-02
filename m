Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4A13F1ABA
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415684; cv=pass; b=NGxNc4bjxkcattTyokLUrCtiXZmxW2dGI6Y3jAhDxPn83I5rCMzDMQN95ps6EAh2my5yMlwRqbv1on5wBQuVGgpdshz/lD4AGuLQPRLDaxT/qopzS0VKFRgrxbzAG6ZtW95v3XCgN2XWsATo1Id+Id/WEXqGcu89VDIUI03YSho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415684; c=relaxed/simple;
	bh=uv9Sy/kwsbhQqkAS4Zhet+9C0cGQwDE+yhgPZ0iyMCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9quizMEwHcqZc0VJr1cOr4AcGvAnC109PO//SLkjCExrNxpKvRHdUH4lBoLTOS/rRIpEf2cFXA2KSKdyaePSJWZ/077cluHbf+y7Zr1EfqrQNjrNXNOcNad2qcMUR3x/k5YIVDwzgJ/vWtBL0LwqnpuTmNoz1HSeoiauV1WhT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9C10OTg; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9C10OTg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4906238c62eso95242035e9.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 08:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780415682; cv=none;
        d=google.com; s=arc-20240605;
        b=GNK+/lg5kCG8sqrv+6drLVVRdEJ6caN82d9Sse+8/8KVqStEyBigMJsWvr9vVndS0P
         Qwi7rmHKt6UvdYKHpo4QhQ7TZ6Mp/PUqhnBPey3C472XmqFtfmRxCjRNScEUa0p5suxP
         8Go5+H6Jwm4O7jZL4qcCirpHcAtnlqsVIIBtS3UFrspVSFLIH+ghS/Iehv1A5IJpGBB/
         15AvS0uytRGnzhE/t9s3eVmyA6U4TSNOsb/7RQ5l7cwVOyJqhWvU3PiUgOkgT2UwvYlf
         v61JZUj1JFjOmnIM8huRZYLsDg6Ux/qG39LQov/kxwqUv0eN90FhFmvR0Mc+GoZVEbFz
         oj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1R1Ix/hNP2c7DmSyPCrvcGynZL8Qs5aPHoY+LWWhkG4=;
        fh=ZV/HR9eJ3XoRF/V7xahmQflZST8piQim/bXzm1xmuuc=;
        b=FtVqwTVvLB4vZkP8vA+Kd4hS90ail1dWbEW2tGke7zUxEyIS1KHZ7Uj7La7/ar3qgH
         9IhgY5o50IMYSpYzqh3Uh2eFqMGoY7+oMtsAv5xnLjTD/AOzRXeLywLuzzlDTcCCt1r5
         jRPaGto5EPGVkxUzn9DNiVxqTGbFXzjVpNEDAN22lN6dUa91kkU8wcqbumYpLfHAYUS8
         16nARe18S6BT6akZ/8fDCCORm/6IeXEl0TQSu59rsEtPdct2t5EmOOpFC/jswVdXcx6h
         maTKE0TgGFjZrwC+QW4tIHmD9MLSsfqwcjkr+tbQQtSnj277f69EREQKXkCPeBt82Wzo
         /qpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780415682; x=1781020482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R1Ix/hNP2c7DmSyPCrvcGynZL8Qs5aPHoY+LWWhkG4=;
        b=r9C10OTgSxnKjWCcHjPcC+mNsq0xKy7Ozk1R38OOFbFehZ+8V6iPcdoKkWf7kDf444
         yJj1/4x36RJHIsqGQw9kaV0ITPluinJ9VgYn/+iJMAuu609iIANZLUS2O8W9qtI7U/19
         9//meuOMjWYZ4UXDSt73vFRYq7cN50wVkbJrYWBveYCyAnQKEwHhA4o/eXxQKn6p6rur
         ASEd35m4rMBRC8/YSSoj4bA/Klpt7gGv48iuzP2fcENnIoJLauUwVaVdEzOoCMXfolcO
         64ujFypgd6zOKXE354ognlSLL7+N5axMy6OH2g4sPdPlI8+pz1qP3Y1hBoewNkuKHmym
         lEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780415682; x=1781020482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1R1Ix/hNP2c7DmSyPCrvcGynZL8Qs5aPHoY+LWWhkG4=;
        b=NHPPzr9on3OnLVCHLWUD8YPTNqgLPXp4LemynJ6WhdhWGwsKvc53YC4Xi5hVhsf5tk
         NHNQsxfmQjjbnOKyvvWJyyOGg9dO4QwwQC/07jDGVOtfVRqsqGYMUP3aqNiSUJRvS17B
         0S0WJeArD45iqzGckkmIZwGz0p/MMXHYsdZIvdJE21r6r8a3z0Jod7vlL3/vZD3vEEHn
         6WCEjcLRu3d6BQC4NrOZ2LwDIDhk5v4slUgv7Xp7xR03EF6TS1yHse2zNvlkXM9rvf+/
         3tjGUGJOjtUNIY6hiaBfEkpIDH77409FRUUL1J4uGtlFP+XP1SzHh0y22RoDasTPs+ri
         SwkA==
X-Forwarded-Encrypted: i=1; AFNElJ8kV7U0bhfbu6vOaDc3aw7Aqqvf11e/hwZjpYLUbSvhKINymrhmjE7WwlbhEYbNe0zi3nlMQaDZJpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbFvGRKQHuXQi3vcbIKTSt0VLHH1PvPQgA/csdN5p81nE3GgSd
	hd9+IYjsChaGMWJDIFvU4BSf8QhazW1pxdsCpKP3MpG9P7dK0BdvMh0weZQWqMs16v0nLmJR9fn
	Yq1wU7N4/6FBBX6PFkk6sVI+HgtB0F4U=
X-Gm-Gg: Acq92OEbe8siRw2+6CHcj6M7X64DdoKgBI0iaPAw6AOEiyG5tzo2A2ddwNTacl5GWlm
	2GFPhmU5S37uUw71vSrrKpI/cFn9zcZ3mbamtCiQqEFCEP3vjztp+IehQEoUA+Uv0LMadQPvDJf
	5dceRIrQAxO9G4WJGNMB59Ylde/t/sLmTRQc7kzEWbob2DfYo3j190PkyyCuvL/iAFPhkWB2JVB
	lelrEXWKKyMV5ku8sQQF5bdUjHQfyskYCQGzLRzO4q+QdmkTYI0GjXHj9Qwj3Lsz2uVi2jxWsfH
	rFQ5SC3V+LwHc0oEeB3HzQaR1XrvhAsreP50G/4bC5SPKluDsgKDyCcwfodi
X-Received: by 2002:a05:600c:3f0d:b0:490:6e11:c303 with SMTP id
 5b1f17b1804b1-490b50800dcmr5883175e9.13.1780415681566; Tue, 02 Jun 2026
 08:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528212955.1912856-1-nphamcs@gmail.com> <ahz_iYG4lqWL4g-J@KASONG-MC4>
 <CAKEwX=PzMwXXgq=ULAkFD9UqMz+ewLqhKt+xdGxkV7OmA2QG6w@mail.gmail.com>
 <CAKEwX=NNNf0KCZC0ph7VRW0gjnbXd4W5NKEaHM4XzPdN03Ek3A@mail.gmail.com> <CAMgjq7CT0ccCnzmpRGjTGPnNEn4eK==5A-OFbr3+p465dQMH4A@mail.gmail.com>
In-Reply-To: <CAMgjq7CT0ccCnzmpRGjTGPnNEn4eK==5A-OFbr3+p465dQMH4A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 2 Jun 2026 08:54:29 -0700
X-Gm-Features: AVHnY4JuNWTHfiBCJhA05cKPBhtFvToyOb40WTAxv5a1N06Szobh-7Laznmn538
Message-ID: <CAKEwX=M3WAkSY=Zd35dEuQ6V3ZiNR02bKAN_DnCgVr69w9=0sQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm, swap: Virtual Swap Space (Swap Table Edition)
To: Kairui Song <ryncsn@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com, haowenchao22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 10:49=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Jun 2, 2026 at 12:22=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Mon, Jun 1, 2026 at 8:56=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> > >
> > > On Mon, Jun 1, 2026 at 12:34=E2=80=AFAM Kairui Song <ryncsn@gmail.com=
> wrote:
> > > >
> > > > On Thu, May 28, 2026 at 02:29:24PM +0800, Nhat Pham wrote:
> > > > > III. Follow-ups:
> > > > >
> > > > > In no particular order (and most of which can be done as follow-u=
p
> > > > > patch series rather than shoving everything in the initial landin=
g):
> > > > >
> > > > > - More thorough stress testing is very much needed.
> > > > >
> > > > > - Performance benchmarks to make sure I don't accidentally regres=
s
> > > > >   the vswap-less case, and that the vswap's case performance is
> > > > >   good. I suspect I will have to port a lot of the
> > > > >   optimizations I implemented in v6 over here - some of the
> > > > >   inefficiencies are inherent in any swap virtualization, and
> > > > >   would require the same fix (for e.g the MRU cluster caching
> > > > >   for faster cluster lookup - see [8] and [9]).
> > > >
> > > > This could be imporved by per-si percpu cluster. Both YoungJun's
> > > > tiering and Baoquan's previous swap ops mentioned this is needed,
> > > > and now vswap also need that. If the vswap is also a si, then it wi=
ll
> > > > make use of this too.
> >
> > Oh and the MRU cluster caching I mentioned here is not the allocation
> > caching. It's the lookup caching, basically to avoid doing the
> > xa_load() to look up clusters for consecutive swap operations on the
> > same vswap cluster (which is the common case with vswap). For v6, it
> > massively reduces this indirection lookup overhead. Performance-wise
> > it's an absolute winner, just more complexity (because I need to
> > handle reference counting carefully).
>
> Ah alright, that's interesting. And I think we can keep things simple
> to start, since sensitive users is stil able tol use plain device this
> way.

Of course. I'm hoping vswap-on-zswap will not be too terrible at a
start. We can then optimize for the swapfile backend case later.

>
> BTW maintaining MRU is also an overhead, I'm not sure if the lookup
> pattern always follows that?

Yeah I had to be a bit careful in v6 to make sure the cache (and cache
invalidation) happens at the right time. I've had this idea for awhile
- there's a reason why I waited until v6 to implement it :)

For instance, when physical swap allocator runs out of slot for a
cluster, we try to reclaim the swap-cache-only slots. That involves
taking the rmap back to vswap layer, to check swap cache and swap
count. This is a very random pattern, so it does not benefit from this
lookup cache, and in fact invalidates the cache :) So I had to add
some hint to avoid going back to the vswap layer to check for
swap-cache-only state.

>
> > I also just realized we'll induce the indirection overhead on
> > allocation here too, even if the cached cluster still have slots for
> > allocation, because we look up the cluster (which is basically free
> > for static swap device, but not free for vswap devices). Might need to
> > take care of that to maintain vswap performance (but it will then
> > diverge from your existing code...).
>
> That part should be indeed coverable by the si->percpu cluster though, I =
think.

Yeah agree - we just need to be a bit craftier with it. The
fundamental problem is in the current model, we're only storing offset
and si, then look up cluster based on that. But for dynamic vswap,
that look up takes the xa_load().

Once we move to per-si per-cpu cluster, then I think it becomes ok to
store the cluster pointer directly, correct?

The reference counting needs to be carefully handled though. I think
in my old vss design I did something fairly silly - just hold a
reference to it while it's in cache, then add CPU offlining handler to
clean up. Not the end of the world I suppose, but maybe there's a
smarter scheme.
