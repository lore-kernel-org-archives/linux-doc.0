Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174C3F4835
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007640; cv=none; b=SRAsOigQqTbD5FYriPf/PjMVNNd//2qccz0chbtxTD/FLVGyjfkV4V2HgYRzqk8Dn44X6sRT4Vn1lwcShjTsTxX/shWJ+WIwAJvCK4Qw+fuczTQk6Y5jgjvPUU5sziBD18A1w7+egYEN+djkWt+NmqGxDihrJlkWJYu75QDlqws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007640; c=relaxed/simple;
	bh=RdwdCAhipRogxhULLdA9JBiW4ojsjgGbdRDQN/qzzv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxePdvCBSod3jce48EYLtFfohQYCuqypSJpQVAJZFx+pmIpc2ZjEKcu5zsx8aiF2SRUemhvYP8tHQAwzGCriJUejHV+5vQIZqKh/anBgspFv4uEl/rQeS9yUCXeNBaVwyQ4LLqkxj079M1I0nw4cSTa4ss19CMJYwGQpsj1ZdzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=QVTJ78Y9; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="QVTJ78Y9"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e56c287b3so60346185a.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 12:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792007637; x=1792612437; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjniCqND0NC3kKHSl3wLORt8DVjtH0W0kWfnOSpM6P4=;
        b=QVTJ78Y9m0OLXKqMrhTp/4hM5OmxBqe7nZ/8JVvRK4wjP/bAsvJQzxAURfhQ5MH/t1
         0t/qL35MJavlsQI2gd+So2+Z1Y49lBbXdo8j2XLRfEKMHycfk4v0dSto2jmRuwoOCAcp
         MxjPs2l1M+Sr7FhCmz8HPAitzypsU7Jxk7HbbRuzMlMKY6SBN7YM3ngtys8KZfTXUP8j
         YeHzl34+Yz6fm2JfiodMX7Zw6IOlwv/H0dwL/pIA5V7bE1fex95RNCMSei3rcZd0vF9K
         Y2UQSWFcNay8CM2kUNEghmhOe5akTPss6f+bVrHfXDMcgs8HmYBsicYtQz4S3oy4eBfS
         iZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007637; x=1792612437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RjniCqND0NC3kKHSl3wLORt8DVjtH0W0kWfnOSpM6P4=;
        b=xp5gBXvs42sSP50CwlOLRa4Ei9S3lHjO8hRkwHwhRdwvhS34Dwfbt562BmzXnKh6IG
         3A9ae8a8/UWHmszXPRNp+pWB01nVbYZ9NlYokrc5Afwl8nJiw4W4InY0qFoQrX6n98Sp
         UegSSJZRxdEpfzrmHJfTH9C6Sjvz2JOsJ6Y/JXOQKK1CKw9LIUpqPPI2wjpvThhB6tQU
         FrAmH2EdpjUEK/Pp1Sq6mGktVKibRKaOM0itfsViqnBOEKqJRBJygSWqR5R7puozy8E6
         XTT5mueS4YFo++/znIJiREz9xDMxh2h4bqx2xy/ohGQ5yqFJv6wOW7lARLIjq3zyjRGX
         VoPQ==
X-Forwarded-Encrypted: i=1; AKwUvBycw7cfOmbSqk0n55tzZOSV9UC7NN7kZ5AZEf77hoV6ke9AUfQLTa6f8463N4feoIk5sowa2mTysEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6PaTZ1BueJl9gYxSmJF0wKtrbbX0dd5AAHaxy68elMHrJ7uY/
	h2KQIpLZ2unOnUQ6PIn0mMFjzFHYCmcKqnpfUX2hyM6VrkB22pAs9shmzi+rC7ngmNE=
X-Gm-Gg: AYBFou0Q1j2VslU+l3nQhilANyH0zr62AWlJLVKZWnPmcXa+xfzl9TDmOv/sK8M/kMZ
	qE5Z/Zrh5V4lYo3yNrsVR4I1ir1ZlZ1MyyFz4Pn96EXm7zDsyOtH3EMjJ0QpMubevTF2Fhnnvjp
	CcFjWcdjO0mbX9aVOnC8D9tVprIadzHOnqTKts8GrtU+JU7V4WtxXOD3YAMNLpJ75MXCd4DC8FG
	wR+mRdIVgmHNKLITKhtrl2clYf3c0MLk8ljS2sMb+J/uWx8CXw+aCtJKdP1mOuIDKpuPQoXmOSC
	8Xqv+l9n3oVh1LP9MiKVRy4YHpCg8e3OGM464UIrK14AaPsc8exrcc++HDdfGL1jl0IIIY6BURy
	cHrZVbDbF+cKBWPoBQ/GUt5nRKCGKtaX1VFnP0aKL0gnSCu6+VJjBvoM3GO+s0Kvbmz2VXlz+Cs
	mTisXxmKKS7GxwwHduWlrYQUOCpu93f+8JBYNxQeJqysxhx/SgxQn6pf+TWn0O43OtYdmAToEZy
	3lx1hs=
X-Received: by 2002:a05:620a:270d:b0:93c:2c15:e508 with SMTP id af79cd13be357-93ebd20e626mr2844276585a.45.1792007636645;
        Wed, 14 Oct 2026 12:53:56 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50080b7sm567630985a.8.2026.10.14.12.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:53:55 -0700 (PDT)
Date: Wed, 14 Oct 2026 21:53:54 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <20261014195354.GA371161@cmpxchg.org>
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org>
 <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora>
 <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>

On Mon, Oct 05, 2026 at 01:06:28PM +0200, David Hildenbrand (Arm) wrote:
> On 9/22/26 15:38, Chris Li wrote:
> > On Mon, Sep 21, 2026 at 8:56 AM Nhat Pham <nphamcs@gmail.com> wrote:
> >>
> >> On Fri, Sep 18, 2026 at 11:50 PM Chris Li <chrisl@kernel.org> wrote:
> >>> No that time slot is too late for Asia developers. I don't think we
> >>> should use that time slot for swap alignment.
> >>>
> >>> We should find a time slot more friendly to Asia.
> >>
> >> Any time slot would have that kind of problem. We're spread out across
> >> the globe.
> >>
> >> Let's just use a standardized time slot we have for MM alignment sessions.
> > 
> > There are more swap maintainers in Asia than in the US + Europe, at
> > least based on the maintainer file. Please be more inclusive. If the
> > alignment is done without key stakeholders, it miss the point.
> > 
> > Sigh, we can't even align on a time slot.
> > 
> > In that case, let's keep discussing on the mailing list. At least it
> > is accessible to every one.
> 
> Looking at the mailing list, that approach doesn't seem to work.
> 
> Finding a time slot that makes US, Europe and Asia happy is ... tricky.
> 
> 1 AM is certainly unpleasant.
> 
> US vs. Asia is also tricky, but doable.
> 
> China 8AM vs. US West Coast 5PM?
> 
> China 9AM vs. US West Coast 6PM?
> 
> (Europe is 2AM vs. 3AM, who besides me from Europe would join?)

Either slot works for me. 8pm/9pm on US Eastern.

Apologize as well for the late response. Travel week followed by
post-travel sick week...
