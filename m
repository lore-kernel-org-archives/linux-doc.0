Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA12BEC22
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 04:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897557; cv=none; b=sbwT0JnnHEdbUImIN1znITR6cjOmzohAK+aGYM2PeqlxOtg1TOH2CusmJWV57DiQgg0JRhY0owC3niHMIigcDqJbTj5jBNUK5BVGnTRCxJwesdyX/9/7JnEbUSeONtScdn3kTrR2mvvrM2hY71xzQqaXQHJ4cGcGXImWyVmApUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897557; c=relaxed/simple;
	bh=ZQ9dTtq2r031HzJ132CMq6x9QAKtupQ430h8sMV5noY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxXeqj9KI/eGo4AuIUGwAlwoENPY/WZtL8qJUvc+lVb39QRIB5PEz4h9Dctcc3cxJ6mxF6z/ndb/jlkFzUjbWjk13nS9rzndN86ysBTgDmtt9jd/PGKmo5/aNAdLYrM8FXmtkMCGQHcT3+e8oF4TjxiFPfSXXEDfMhHEWNwGJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDRckY/r; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDRckY/r"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-81fdd5d7b59so78347676d6.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 21:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759897555; x=1760502355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ9dTtq2r031HzJ132CMq6x9QAKtupQ430h8sMV5noY=;
        b=kDRckY/raXBih9bldtJVHlgVxdeBj2Ik1YtVwSE9OlZKReF1mrYiZpkpM2zhNZ2Kzs
         1wXwYN71AJcWYjETK4nDi56lgQU3JL7XkvT9ZmCr5HpJkXuwIlPh2NrlRtrHKC+5n3Al
         pisKs+I+olEo8QQ8sqz0hQL40C/qiJjuZ18lsl3nk/3j0BMMbGuBD06VRqk6VAbAkQ8G
         nzHUmtzls2VIpFDQsHtRy5Ex2Sor0d9Nsprx0lmcqhe0XvR7HkSeR/7HUJv/taTc/0eu
         NlON5POTToRoBHNBcxCMFOzlhMfHgRNtqKtnTccP7ZCqdXlK3XBteGlQgme0T23Wcz5w
         XWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897555; x=1760502355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQ9dTtq2r031HzJ132CMq6x9QAKtupQ430h8sMV5noY=;
        b=td/7rF0y+PRvVjjTvxtoJjZ3CPv7GLo3/EfZACSBNp9qKUyfExc4F01zSD4EOtoI1i
         j8wximr904Vr0/U+9+rmAKtOuOZFWjzDNNiiYGBv84xV0GkF6RmvuCdtS1HgNiB6WlOE
         5oovKNYpnkdrNyw6fqUH3LQRZ+dwj369gMfTXra1dfbobSStAVAA+Cs7eeFYbuB4m012
         wjoW2KdmZhRtcdBsEalIu1rdaYtJe4a/sDfTzEfUu3qcWlYWvdHnk74zRD2jTRbZLeob
         W5LxerQBsyPFPEjfcOHNSGzgSZ72Nv48fcffXbnTgwf9EcK72kn3kiD26cmJd1uHw9sH
         mcpA==
X-Forwarded-Encrypted: i=1; AJvYcCXRch4jhqSF4oEuqPYwxFBTrLuSLpCAZUtjiim7RZsaPOEJHo8NbFjpRT3qCWxCMNc6h1S/AenT5Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+D2mpVUK+lvGDbDmOLdh7wtbbiP2z8j5IWI9AKZVqywDMTvOn
	S+KRPzb0pRG2ETnL7nZ6xKtT/c8qyLWL1AYwn5+LnIz0VoYtk27JX1M6TlLi+LlQoPVlneUcP4p
	9ywk/xV+ga9BO3UScnwQ3LxiCysamnaU=
X-Gm-Gg: ASbGnctQ2aeL7ZCxM4yf8E2ySKoKviwLv9Zz686F2KrC2NaYVMFJJSI5IRaocJopC06
	ic+K7GvbPjkcqlAAu3iXm72+lch+0SnF3YMUf2qh/YEuV7uwrcJdcXUjvrvELFSbew4DnxHMPNk
	TcuQsd8CtzYMKkAASY4Wl5MexTsZHI/Ru7hhToxs8xyUkBGjHQUX5prEXZLsI1zSv+Cd0aiafH3
	Fudly8QDIydl8ybBUW/pMVOafUMs+kOe5enmvDV/HxLSo9u8NCt/xXAVaksbaqM
X-Google-Smtp-Source: AGHT+IGCzC/VmZmzeTX400uWDZErCSGt3UANlTSe4ykGek43SJ+F9tUSaXyAxxMkUOYFF2TqLUurlhwf+xhIS36qFZk=
X-Received: by 2002:a05:6214:62c:b0:77e:c29b:679b with SMTP id
 6a1803df08f44-87b2ef7fc5amr24134816d6.65.1759897554997; Tue, 07 Oct 2025
 21:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-4-laoar.shao@gmail.com>
 <CAADnVQJtrJZOCWZKH498GBA8M0mYVztApk54mOEejs8Wr3nSiw@mail.gmail.com>
 <CALOAHbATDURsi265PGQ7022vC9QsKUxxyiDUL9wLKGgVpaxJUw@mail.gmail.com>
 <CAADnVQ+S590wKn0rdaDAHk=txQenXn6KyfhSZ3ks6vJA3nKrNg@mail.gmail.com>
 <CALOAHbBcU1m=2siwZn10MWYyNt15Y=3HwSGi7+t-YPWf0n=VRg@mail.gmail.com> <CAADnVQKzW0wuN3NfgCSqQKVqAVRdKVEYMyJg+SpH0ENKH6fnMA@mail.gmail.com>
In-Reply-To: <CAADnVQKzW0wuN3NfgCSqQKVqAVRdKVEYMyJg+SpH0ENKH6fnMA@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 8 Oct 2025 12:25:18 +0800
X-Gm-Features: AS18NWBI41AxLcXzli8BL1gzQnleRiXmQ_JGmwEiCOIcXhbDR3K7nn2-xDL2UY0
Message-ID: <CALOAHbBzS2RunZzEk8-rkU60M8jKEJ8FwiPgZqNeoXDy++L5hA@mail.gmail.com>
Subject: Re: [PATCH v9 mm-new 03/11] mm: thp: add support for BPF based THP
 order selection
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Liam Howlett <Liam.Howlett@oracle.com>, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, Johannes Weiner <hannes@cmpxchg.org>, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, Matthew Wilcox <willy@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	David Rientjes <rientjes@google.com>, Jonathan Corbet <corbet@lwn.net>, 21cnbao@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, lance.yang@linux.dev, 
	Randy Dunlap <rdunlap@infradead.org>, bpf <bpf@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 12:10=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Oct 7, 2025 at 8:51=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com>=
 wrote:
> >
> > On Wed, Oct 8, 2025 at 11:25=E2=80=AFAM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Tue, Oct 7, 2025 at 1:47=E2=80=AFAM Yafang Shao <laoar.shao@gmail.=
com> wrote:
> > > > has shown that multiple attachments often introduce conflicts. This=
 is
> > > > precisely why system administrators prefer to manage BPF programs w=
ith
> > > > a single manager=E2=80=94to avoid undefined behaviors from competin=
g programs.
> > >
> > > I don't believe this a single bit.
> >
> > You should spend some time seeing how users are actually applying BPF
> > in practice. Some information for you :
> >
> > https://github.com/bpfman/bpfman
> > https://github.com/DataDog/ebpf-manager
> > https://github.com/ccfos/huatuo
>
> By seeing the above you learned the wrong lesson.
> These orchestrators and many others were created because
> we made mistakes in the kernel by not scoping the progs enough.
> XDP is a prime example. It allows one program per netdev.
> This was a massive mistake which we're still trying to fix.

Since we don't use XDP in production, I can't comment on it. However,
for our multi-attachable cgroup BPF programs, a key issue arises: if a
program has permission to attach to one cgroup, it can attach to any
cgroup. While scoping enables attachment to individual cgroups, it
does not enforce isolation. This means we must still check for
conflicts between programs, which begs the question: what is the
functional purpose of this scoping mechanism?

>
> > > hid-bpf initially went with fmod_ret approach, deleted the whole thin=
g
> > > and redesigned it with _scoped_ struct-ops.
> >
> > I see little value in embedding a bpf_thp_struct_ops into the
> > task_struct. The benefits don't appear to justify the added
> > complexity.
>
> huh? where did I say that struct-ops should be embedded in task_struct ?

Given that, what would you propose?
My position is that the only valid scope for bpf-thp is at the level
of specific THP modes like madvise and always. This patch correctly
implements that precise design.

--
Regards
Yafang
