Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166743;
	b=KqOzFMQ4prwBMne7W8QG7+javCKeyvy4jHG8NlZxjT/mMd3qKcJRon0yZwrjigUnzumo
	 I7AbszCwXyFfEMHPjBHjjf55lMS+GI7w45ETV9y/nMZirK0rBXd+VZdvqCTx9QUVIazJy
	 2ObXPgHkyf7uvRpsExxfZKpZj3WMs0pzHcK1frgeB7WRe2JVKr9Fs5cw/jeAClpfr+6QX
	 3Jt4a5j0bBNUNCUJl/Da3izsQdbyk7IYYnpZ2DrX9n3Ab57gng/+pGLEtJp5SR95XnD43
	 wGIX/6jn2hLKSbvWpdIbrtTQgVDhzwtAdwK/0kPKYKZMqHSkSTXhtVw3o+iJjM2QF3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
	b=tmupMWrOydtdYgvrdjsI31eh3vJoRmYSYVqln+yM3V5o5UDCj8lNq50rhQ7/jJbw5sUB
	 UtzcCmsAXe39kflIEGCXJ58Yseut+HBaha8pI865iWZMAuBcpiRjnQf2nkF/Vn+kQPS6Z
	 HycTUxuLnKUidPr2Inctq53g7aMJhTLFBODAMKoRZWCJuGgARcks6Pt3zaACl2QH7rg4A
	 OAVVx5V275vwjZdFEjnAW/0R/o7aNBFCjJxoYwdUASs9o6zMn9zj/yQkaY0MUeEsGiLub
	 0eG1V0phapd6fxwNRQ23OiXZXfipDCAjHQ7Z2M/x6j8OSpCpz4+FcCCPe45dYfmPkXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=u1CUAc5U;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E6606A321
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 05:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=u1CUAc5U
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso242945b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 22:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793166742; x=1793771542; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
        b=u1CUAc5UGEIg8w651QAnSj1ilJ1Hp07nRBlYJYLip7lca9dtV+G4XIVLxIkkYk+9He
         Gi0KpLWies9ZXilvLmEHfJEIcvI8kzJ1Wyu473aUFgZ+EPn9NADS0gpTZFOInL5tm9Nq
         7qBSbt2D7PxHKFRNJ0ExDlyKLPKzHEsOpZICg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166742; x=1793771542;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
        b=0bWh5xAZ0PlbTSXPp7LTL92xzqJs1mjKffPvC3VHhEKNVHuoofILF+BFkcw4Fw7982
         e+QLNHfPuVoOThyCp5NjAytwWB6fDAOydYQmRlV9Ecpt8o6kxs2cthMPVRT8AAXQlTWi
         K3A9yTzMEdYLzG9ZKI6DmQM7c27DRr7rqqujMffHJSWDK28MRpgs4h5jyYXMtiKcgJFj
         uMe4JGWQhhyotiwK6xwZsX7ryqHi8KtL5Um8sQJE+N4dxTgtTQNyALQWfoZ7XmhXlV8Y
         dACasE8/sD9TQis3EKAF0XcVWkstmUQ4aw8yFCH8p+o3198oHH5gEPhWfVWpTsQLv92Y
         QbHA==
X-Forwarded-Encrypted: i=1; AKwUvBzYO6QvnV0esck/5lbU2kp7W2/LAkfe5eiYNynr8mvYXw+R1By43sSQ9kKdL0580/Yx5iFq4iu1WYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbYxsTfxl0JUkpNxZ62cwZIMlQ1T+UPbsJnrtEt8bmY6y5P+ch
	EHVPLkXgLbqJLK5aI2mYLYCCa+p8OCFZkBHXiy9HsegH5J9q/Gbr5VAwxuIL1Q8UJrU=
X-Gm-Gg: AYBFou1qJi/E4xFzevXC4XVi2Pz7eihiHDJdC7yZ93dOjjq9MXKsalSIQqx5ZBBz1XA
	iHimd6Um68kT367+MBqUjM0Gdpt2TuII5yEWuSWL7J4Gr6Wj2zt3ro8LO3j1xa/VtFo847P+kUn
	biWh8gyidXX60SygWetzJkYzhrgEDrUXgAb3/jmdQlOnkbghXxi/c0gLTNGN/3gtVNpCcy8f6R+
	WtrcDEN6znTQUt5OM9vaSBZ/pavzdlyknUDagqQ2Q7gCQUiO5n+Yk5QzrB3XqA8GVQLTrVT4Y8W
	nD9HUSwxbLit88QolbkGt59XHM3HH6M1QU9MORe8Y8E+AlgIs6R3406FDdCOhMIJD7ph+donGvy
	zbMHWrS6PqPKC8yoVb4luGvmgVbuxzMpyQOkLnThXXu6/A3d1p5azySzRcWdeXCOZq+bCWt63ku
	osY4nqjiIhKC5rrGcDJoD7S6YEcYLxKZDVwadkBEwoRnhD8aNORZgwXf25Jj5ImZNUi29WH6L4r
	xfF87YpRY0aq1YTVh0UecgTlZrhlUAmtCaAGk2PgfIdj539YAVn5uP6Uw2sz2oZrMU5Ioytp+3w
	juXw4rWjTfl1esIQNX4TaZ7hoOTywZ5oQFoXJ9Sv3YCwIWvDy4N2cih6It9LV+tfgogzofdb+GK
	rBjTBUoe93ds8gvrlCkChs6ctkpf0sS39KzbRdq0GALcSXcrPxas0CtySgaBVnMZ08s1TfTGx
X-Received: by 2002:a05:6a00:4b4f:b0:88d:20ff:15c9 with SMTP id d2e1a72fcca58-8a6e7acb277mr1168038b3a.17.1793166741947;
        Tue, 27 Oct 2026 22:52:21 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cfc785sm695363b3a.38.2026.10.27.22.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:52:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:52:18 +0800
From: Chris Down <chris@chrisdown.name>
To: Jeff Xu <jeffxu@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot
 parameter
Message-ID: <auGNkhSHpBRd2U_5@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin>
 <auDTMb6WMFUpxeZy@chrisdown.name>
 <auDTptDQsB4xBcz7@gremlin>
 <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Jeff,

Thanks for the review!

Jeff Xu writes:
>Could we please keep the test coverage for the unsealed [vdso] case and
>avoid unconditionally skipping whenever [vdso] is unsealed?
>
>There are two regressions I'd love for us to still be able to catch:
>
>1. Kernel or config regressions when sealing is expected to be on:

Yeah agreed. With the cleanup it matters even more I think because when sealing 
is set in one place the most likely regression is probably one that unseals 
everything at once.

>2. Regressions in the new `no_mseal_sys_mappings` boot parameter itself:

In v2 I can check /proc/cmdline for no_mseal_sys_mappings to do that.

Lorenzo, I think that also may inform your question about whether checking for 
the disabled case is redundant, right?

>   When booted with `no_mseal_sys_mappings` (or when unsealed), running
>   the assertions in Patch 3 (verifying system mappings have no `sl` flag
>   and that `munmap()` / `mremap()` -- and ideally `mprotect(PROT_READ |
>   PROT_WRITE)` -- on [vdso] succeed) directly verifies that the boot
>   parameter works and doesn't regress.

Sounds good.

>  or keep strict failure as an option (e.g. `./sysmap_is_sealed` fails if
>  unsealed without the boot param, while `run_vmtests.sh` passes a flag
>  like `--allow-disabled` when `CONFIG_MSEAL_SYSTEM_MAPPINGS` may not be
>  enabled), so CI environments that expect sealing still catch a broken
>  seal.

I like this and I think we can do it without adding some of the complexity that 
Lorenzo was not so happy about:

- Have check_sealed skip as usual when [vdso] isn't sealed and param is not set
- A new test, say expect_sealed, fails in the same case
- run_vmtests runs with -T expect_sealed when CONFIG_MSEAL_SYSTEM_MAPPINGS=y

That should be pretty minimal. Lorenzo, Jeff, how does that sound?
