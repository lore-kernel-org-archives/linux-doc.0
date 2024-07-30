Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD421BA875
	for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354753; cv=none; b=N12qEQoWajb+XaqbuqIJdI+zvpravXp4lWVkVMfis8uY7mpefpd9WflP6LEq9s5y4L8c64/arb/dDltP9rBHcTqW/PTUlr2ROU80vrPQDLmzUOksu5cnkO1rSEvkSg09SMMe+st0KBVJxfdAwY0BuCcWz5jpAK13lvkymLv9O8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354753; c=relaxed/simple;
	bh=7nnrTpVQl5o8iqtbM8SeJvLywzfD17VnoiYWUIk6xso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6ACWaRBI8W1WJ29lDjhWNyHHeVsMUfd8XzRSkhbMowhNuwgZgszwx7Lrv57kevUpNYMRLD/Cw50T/0v/S5J4IvtYC1Qu6mSciCUk+bkzO3UoGnkYvXh9IFPeFvp3q/0efamFJBchlvn0MRM9Hp8VQ/xvVM9lxGb1CLai+nXETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=lPseiuR5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="lPseiuR5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso4157584b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1722354751; x=1722959551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw8Qsqd/KZkDjyfWp80nFufRwrNoDRQN85CCZLcmUUU=;
        b=lPseiuR5s0Sa1oDdnqRx1pzB+JOnNBgbS6AXuf5ER+PLGzFms4b1gUiFI69K3eQRjU
         azUgTyUknCu9YPY+R9LYjBmk/fzj67Tshd7XfdihYj8adUR+VoGPidmYh94/34o+vjil
         5daUErurEFlNkr019piMBKteV8wfLV9+7MSKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354751; x=1722959551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw8Qsqd/KZkDjyfWp80nFufRwrNoDRQN85CCZLcmUUU=;
        b=OJNtV3P/1YHcwpML16S2bPG29UvQKHIZ46u4TAikomPYu656QxU1eiGo5kSglMovon
         16LPSmjrxmTPvyv9kZUhvCBxezhOFDcRqxpfBl9RLymsqjf6XjhH5SmzQNhsW69VDO4f
         gZPL6X6oTHcOpvEXyqCPlYd/GaRNJjrUKb4RaD0XEP+ILZCPNviq5pDHeV4/r6Xrtffq
         3Mci0Qbqf0XJrqcIJOSuwqcra7LODq9dgeacLe0B5urp2tN1Dv6fyFhqhJhJDHAfpfXS
         CKcXaUspXkphY3p+DzSBB6kFfAio1FVJBDVYPg9nH2FbXBdNwwXugHMziDwF9XxJKXnF
         J60Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbL8GuCllb4b2mTpeNavrR9kyaYEHIJLDO7RFf4xyoi1XL1fgKkQxXABNAYmTetY9D69qSPraY5LR+KkHBOj1CunmUi49TSSY1
X-Gm-Message-State: AOJu0Yy4828oY4twP6ISFbPS1IWBrt+uEVZ5RN2rtpZ/qop1L1l+HeMJ
	YQZTmutmngLFTG3I3XOj7vIQ0OXkYCenkwuTXF46S1CvT4gsnF6eWZHk22GXfp/nVpn+6plrjlB
	q7AvW5ImoXzL0ALosVHHCgK4H8eWuZ/n6kBKds440C4XEy5Sz
X-Google-Smtp-Source: AGHT+IG+hWn0qpzI+yyalb00iWHFGVyVmH4evfniZ+5SoF6jRo3s3Rz7MBI2RP6u3735TGwDrdJVwWS3SMyNdBUpnWc=
X-Received: by 2002:a05:6a20:7fa4:b0:1be:e1e1:d5de with SMTP id
 adf61e73a8af0-1c4a12f7ec1mr14013708637.30.1722354750705; Tue, 30 Jul 2024
 08:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729143743.34236-1-davidf@vimeo.com> <20240729143743.34236-3-davidf@vimeo.com>
 <arkcd6cjf42zq62maqsbjzvimxwozrkukusgxhd54v6eyd6ylq@aurn3mek6hr2>
In-Reply-To: <arkcd6cjf42zq62maqsbjzvimxwozrkukusgxhd54v6eyd6ylq@aurn3mek6hr2>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 30 Jul 2024 11:52:19 -0400
Message-ID: <CAFUnj5O7+kH1bZRs9=AB6hx8hjkygwmGRe3khSK0mFLZc=yehg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mm, memcg: cg2 memory{.swap,}.peak write tests
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	core-services@vimeo.com, Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for checking!

On Tue, Jul 30, 2024 at 11:46=E2=80=AFAM Michal Koutn=C3=BD <mkoutny@suse.c=
om> wrote:
>
> Hello.
>
> On Mon, Jul 29, 2024 at 10:37:43AM GMT, David Finkel <davidf@vimeo.com> w=
rote:
> > Extend two existing tests to cover extracting memory usage through the
> > newly mutable memory.peak and memory.swap.peak handlers.
>
> BTW do the tests pass for you?

Yeah, my tests pass when running on top of an ext2 mount.
At least one of the existing tests failed when running out of tmpfs,
so I've been testing with an ext2 mount in UML.
>
> I gave it a try (v6.11-rc1+your patches)
>
> $ grep "not ok 2" -B30 test.strace
>
> ...
> 315   15:19:13.990351 read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\0\0\0\0\0"..., 4096) =3D 4096
> 315   15:19:13.994457 read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\0\0\0\0\0"..., 4096) =3D 4096
> 315   15:19:13.998562 read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\0\0\0\0\0"..., 4096) =3D 4096
> 315   15:19:13.998652 read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\0\0\0\0\0"..., 4096) =3D 4096
> 315   15:19:14.002759 read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\0\0\0\0\0\0"..., 4096) =3D 4096
> 315   15:19:14.006864 openat(AT_FDCWD, "/sys/fs/cgroup/memcg_test/memory.=
current", O_RDONLY) =3D 7
> 315   15:19:14.006989 read(7, "270336\n", 127) =3D 7
> 315   15:19:14.011114 close(7)          =3D 0
> 315   15:19:14.015262 close(6)          =3D 0
> 315   15:19:14.015448 exit_group(-1)    =3D ?
> 315   15:19:14.019753 +++ exited with 255 +++
> 313   15:19:14.019820 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s)=
 =3D=3D 255}], 0, NULL) =3D 315
> 313   15:19:14.019878 --- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXIT=
ED, si_pid=3D315, si_uid=3D0, si_status=3D255, si_utime=3D1 /* 0.01 s */, -
> 313   15:19:14.019926 close(3)          =3D 0
> 313   15:19:14.020001 close(5)          =3D 0
> 313   15:19:14.020072 close(4)          =3D 0
> 313   15:19:14.024173 rmdir("/sys/fs/cgroup/memcg_test") =3D 0
> 313   15:19:14.028517 write(1, "not ok 2 test_memcg_current_peak"..., 33)=
 =3D 33
>
> grep "^315 .*read.*4096" -c test.strace
> 12800
>
> Hopefully, unrelated to your changes. I ran this within initrd (rapido
> image) so it may be an issue how rootfs pagecache is undercharged (due
> to sharing?), instead of 50M, there's only ~256k.
>
> To verify, I also tried with memory.peak patch reverted, failing
> differently:
>
> ...
> 238   15:30:29.034623 openat(AT_FDCWD, "/sys/fs/cgroup/memcg_test/memory.=
current", O_RDONLY) =3D 3
> 238   15:30:29.034766 read(3, "52801536\n", 127) =3D 9
> 238   15:30:29.038895 close(3)          =3D 0
> 238   15:30:29.043048 openat(AT_FDCWD, "/sys/fs/cgroup/memcg_test/memory.=
stat", O_RDONLY) =3D 3
> 238   15:30:29.043230 read(3, "anon 52436992\nfile 0\nkernel 1105"..., 40=
95) =3D 870
> 238   15:30:29.047379 close(3)          =3D 0
> 238   15:30:29.051491 munmap(0x7f2473600000, 52432896) =3D 0
> 238   15:30:29.058516 exit_group(0)     =3D ?
> 238   15:30:29.062992 +++ exited with 0 +++
> 237   15:30:29.067054 <... wait4 resumed>[{WIFEXITED(s) && WEXITSTATUS(s)=
 =3D=3D 0}], 0, NULL) =3D 238
> 237   15:30:29.067136 --- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXIT=
ED, si_pid=3D238, si_uid=3D0, si_status=3D0, si_utime=3D1 /* 0.01 s */, si-
> 237   15:30:29.067210 openat(AT_FDCWD, "/sys/fs/cgroup/memcg_test/memory.=
peak", O_RDONLY) =3D 3
> 237   15:30:29.071349 read(3, "52805632\n", 127) =3D 9
> 237   15:30:29.075470 close(3)          =3D 0
> 237   15:30:29.075562 openat(AT_FDCWD, "/sys/fs/cgroup/memcg_test/memory.=
peak", O_RDWR|O_APPEND|O_CLOEXEC) =3D 3
> 237   15:30:29.079712 openat(AT_FDCWD, "/sys/fs/cgroup/memcg_test/memory.=
peak", O_RDWR|O_APPEND|O_CLOEXEC) =3D 4
> 237   15:30:29.083848 openat(AT_FDCWD, "/sys/fs/cgroup/memcg_test/memory.=
peak", O_RDWR|O_APPEND|O_CLOEXEC) =3D 5
> 237   15:30:29.083970 write(3, "reset\n\0", 7) =3D -1 EINVAL (Invalid arg=
ument)
> 237   15:30:29.088095 close(3)          =3D 0
> 237   15:30:29.092209 close(4)          =3D 0
> 237   15:30:29.092295 close(5)          =3D 0
> 237   15:30:29.096398 close(-1)         =3D -1 EBADF (Bad file descriptor=
)
> 237   15:30:29.100497 rmdir("/sys/fs/cgroup/memcg_test") =3D 0
> 237   15:30:29.100760 write(1, "not ok 2 test_memcg_current_peak"..., 33)=
 =3D 33
>
> This failure makes sense but it reminded me --
> could you please modify the test so that it checks write permission
> of memory.peak and skips the reset testing on old(er) kernels? That'd be
> in accordance with other cgroup selftest that maintain partial backwards
> compatibility when possible.

Sure, I'll add that to the tests in a bit.
>
> Thanks,
> Michal



--=20
David Finkel
Senior Principal Software Engineer, Core Services
