Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821082;
	b=VpKC4qeahMv0NqMitBJQ4BtiPCrSs65NPc65p9SRjRLT9U/c9MaCdp5L6QTG395BVLoX
	 /QsjKBKL2F+1YzUxSJU/higdR6sbuTbx1UYXXKlc0R6/S/fR/hCpuNeuRHpxwOm5PdMT5
	 b4ithrBxNlK5JWoKx8KlEzVXaUxw+jbhkbBZ28nGO0eEvd246laN/NMGyaMHA69McmOOJ
	 FgRU+1OeV0HhnQTh3XE2j9RITGdIGKIgpjZYoy2HiJWVTb47csDNEMWQsXBpqzhtWD+ki
	 xp11oCw3h5V6tQitIfEdPnqhYj+TkkVkbRvcguWKq0/hHuTORJLRrKb4OrLToJ5RnhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
	b=yM4TgU5fIiKomacw/taLU+DDPJoXK/1vGC53EXHLqVLj5WVy2Kx4Y1ySmV4mnYr/loHc
	 +DPW2TehlGO5OaZGx/T94Xu2CBt+HW25/kagEoBHhbvug5qa+b/3mWdi15WQcKoDyYyMa
	 wtOKTv/6RSHqDGx8IrQ/TdQuUd9WFE5sQIs7JeZ8efSf1NUezKspvv4GcG+rQIDlmJxxh
	 Ua9sCegIvU+6zoH+5adi7cx2dLWwmoc7VdiWjUD/5mfeH8aoMV70hShg4jbjFtnPeUkPV
	 do0LOJvB281USZjrFFsiXYbPkRnO9ORyIAeg2h9hKkrEXXTH12VQHj1rV/5qp+i21EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TJnxG9tU;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF93607F955
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 19:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF93607F955
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TJnxG9tU
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-998d151f441so306641241.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793821081; x=1794425881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
        b=TJnxG9tUZrPoE5M3bA/Qth/IxImRtZ6ZkMq6PZ7AxPARnJxjkE6uy8PDC0QRGzKkSB
         elYXKbXAU1qgJmeMb4qGyjSeThpKbLb0Yi0WVcXpGBSoVRJ/r4fqm2IFP/kgV03Lu0Oq
         g1sHEZF1Qc7zHAWXnlT6K4sHkyT/rmCkscbyZ94x25Si4yeTdZ9RuHwcsPs53vXxUTEP
         fTXl66YSox2ZvpqrGc2tyR8PROaI5AT2J328hxLCMTkBv6amz9S5MBAHLtY8Ggf3obm6
         KE/iJbxoQ5Ov1xzUOHsepj+BfiVK2Eb0rr3Hm5xfME8cVGLzdFqlw2ULC41owtgjTu/8
         gRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821081; x=1794425881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHsVZIyLB4LY6jVwLQ9hDHHfJ9C6/ccEH9xuZg5C7+0=;
        b=SDsmYKoKtTEBu54BkWRT0V46a4BF1v9oXx+xfeDNYx0VQgU8k8K7l6da/387VRHuPc
         xM4NmNiFMyKuCZ+iCZc9UpBQ8gHtBCzoRIIpdl5Ap7fmGyTAimEQftBUT9lDh74IIBpO
         im5OyuOer80TMVnejuYQYdr+SwMba8WAoe6s4R54xqhfgZuVhbMw7d0Q4Qcej/0XRgY5
         juBkoRft+lyGrBqVxSBT1vFEc7z1k7tGvqCbf63Q5+G26+5cZKriNIv+USnGLl2L4aPj
         nB3sFAJZHbY//Rs3VVl1UilQGVmmsWnmmcbYm7HgHIKRu6VC7GalH9UvjxYMnbNhPr/j
         h5TQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8jQdzAXUuKOJYH92peKPoEfLRAr5B7G2QtEG0sWG/HzQ5Cuw6DBY8S8kscVFRo5CydCJJQUzcWrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fiCIhUagXRWaSyYpEe4YpWBlukhsC72BEIbRmB6pXzEfYhkRl
	YknbytulMZDNvHOw/zobqoq00hvH3PLmSOxC53AX3TSaz3wB8DbD/qeuBoxU08zQtCg=
X-Gm-Gg: AYBFou1UkthIdAkvkVMfE6lETOMNfvkUPnlOL4U5VcleOZZXKAW+13f4YiWy0dyG24U
	MCG3intFoDOmmsnkm6x1AMo9baIQKYh++ZoiwtnlSa5ZnpilstndPT9Iug0qUoZRPuDkyQffpJv
	VEdeugchF1yAWPgRqJZTyRsnMqUmZHXzE02IDNj+P4vM1/wdqzZROTiGmdVL2b+LvqHEPA2XdNc
	QeVcjV8e/rIy2MzN5WBW6w6Gycs4ygJBNsWpQ1g9YRoX5JI/dt2aw+kVTkf011kbKIfIgHwx2Rd
	wV4nrvo9E9lQydmwDVAVwmXd8zEqSiEIllxj30DbS2Pw29zS0SZwr6JikNoA7J9WdqRNTzhs3Pf
	4l5d5sDAXlLY4giUPMRIuGcwUKOClRz3M7W7EcrQcoGQdBt+N1hIXKtQLbQ2L1Ods3h3SN0klKm
	m/wC0gdpUCank05QSHIgj3zcN6PiY9VAxnx9WQa0GBBS3Rnm7WndHrIzWzeDxeQemi0tVfdw6zW
	kF4wzBTXnDDPsVnXldRPiPW626R/sLxCfXtR//s4LME41UXpBpB/kDRlfvgbBuhK+88+J0hQJN4
	yv5T0tDCLlCyykM6bHej3sGzyrv8vHyOx6IQke0yfF8NWmMhdq3BHH2giq5E2KKL6z01uR2K983
	ueLqygGsS3gmXcjzvOKi7QIOaIowKyid7WIUAh5hhDsdgpNlRdA==
X-Received: by 2002:a05:6102:6b0b:b0:7d0:3ed0:c61c with SMTP id ada2fe7eead31-7d0726a9cd7mr6446000137.16.1793821080773;
        Wed, 04 Nov 2026 11:38:00 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d2a3asm2569956241.8.2026.11.04.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:38:00 -0800 (PST)
Date: Wed, 4 Nov 2026 14:37:59 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for preserving
 tmpfs files
Message-ID: <auuJM8c-bE43NP54@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-11-dmatlack@google.com>
 <2vxz1p90jzx4.fsf@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz1p90jzx4.fsf@kernel.org>

On 11-04 17:59, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Add luo_tmpfs, a kexec test for preserving tmpfs files and memfds, and
> > for retrieving tmpfs files onto a tmpfs mount with struct
> > liveupdate_shmem_retrieve_arg.
> >
> > Stage 1 preserves the source files of each test case. Stage 2 runs
> > each test case in its own directory, with its own tmpfs mounts, so that
> > block usage can be checked exactly with statfs() and st_blocks. The test
> > cases cover:
> >
> >  - The restored file: contents, size, position, seals and holes, for
> >    linked and unlinked source files.
> >
> >  - Creating the file: it is created like with open(O_TMPFILE), with the
> >    requested mode minus the umask, owned by the caller, and not linked
> >    until userspace links it, unless it asked for O_EXCL. Also O_RDONLY
> >    and O_WRONLY files, other open() flags such as O_APPEND, O_NONBLOCK
> >    and O_CLOEXEC, read-only mounts, and directories that the caller
> >    can't write to.
> >
> >  - Preserving files that can't be written to: a binary while it is
> >    executed, through a read-only fd, files on read-only mounts and
> >    superblocks, and immutable files, including sparse ones, whose holes
> >    are filled. Preserving someone else's file that the caller can't
> >    write to fails, and so does preserving a file through a write-only
> >    fd or an append-only file.
> >
> >  - Executing restored binaries: a restored binary can be executed
> >    before the session is finished if it was retrieved with O_RDONLY, but
> >    not if it was retrieved for writing, since LUO keeps the file open
> >    until then. These test cases execute copies of the test binary.
> >
> >  - Block accounting: the file fits a mount of exactly its size, and a
> >    large folio that extends past the end of the file is charged in full.
> >    Running out of space, or hitting the memcg limit, fails permanently,
> >    and leaves nothing charged to the mount or the memcg. The session can
> >    still be finished.
> >
> >  - memfds: they are only retrieved as memfds, with their seals, and
> >    files from tmpfs mounts only onto a tmpfs mount.
> >
> >  - Interactions with LUO: invalid arguments, which can be retried,
> >    retrieving a token twice, and outgoing sessions.
> >
> > Also check that the size of a preserved file is frozen, and that the
> > test doesn't trigger kernel warnings.
> >
> > Enable CONFIG_TRANSPARENT_HUGEPAGE for the large folio test cases,
> > CONFIG_MEMCG for the memcg test case and CONFIG_TMPFS_XATTR for
> > FS_IOC_SETFLAGS. Those test cases are skipped without them.
> >
> > tmpfs quotas are not tested, since the test runs as root, which is not
> > subject to quota limits.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  tools/testing/selftests/liveupdate/Makefile   |    1 +
> >  tools/testing/selftests/liveupdate/config     |    4 +
> >  .../testing/selftests/liveupdate/luo_tmpfs.c  | 2055 +++++++++++++++++
> 
> Umm, no way I am reading all this...
> 
> LLMs are great at generating tests, and I'm not saying there is no value
> in this. It is just that this massive code dump is unreviewable by
> humans. It is also unfair to the human reviewer because it took many
> orders of magnitude less effort to _write_ them with an LLM.
> 
> What do you all reckon we should do about this? Trust the LLM to get the
> testing right? Do we give up human maintenance of tests entirely? Do we
> do fault injection to test the tests themselves?
> 
> Or do we make the tests smaller and more human reviewable?

We need good test coverage, but I believe we can break this patch down 
into smaller changes where tested features are incrementally added.

> 
> >  .../selftests/liveupdate/run-vmtests.sh       |    1 +
> >  4 files changed, 2061 insertions(+)
> >  create mode 100644 tools/testing/selftests/liveupdate/luo_tmpfs.c
> >
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Pasha
