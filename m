Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99723DB323
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820391; cv=none; b=jviaqW2HgUKQxxd5ybItc7Hbrnh+//JS2fLnsx3a9tkaNjxCBnr7Wqcyzc9oeoIeU9sfnOBk7FLe1RXNDzP5hK2udYhLtBX7YJVRyiJB4GNnU5WWRdsejcp53ynxkJChUcEUKtqzVe2lNP8sBG+kffa14qsuvPZ2trqKVsPv8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820391; c=relaxed/simple;
	bh=YdMNsjxZ23NQ3I+MJOUkNCO8UifC8kwSZB7rLrjQs9Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKlsne2AFug2NASUouv2UontgGPqIBjqyMagmwbUHwYNN/4okjHTEDJVweWU0A5oWFD25dbJqhRxUnKEIj2GlG4w/0VZLH68O7FOZsN4OXY2hl3Tw3mD4HMevdcZNxJv+fLW5GS6Actq4RD0TTFua9IABvTs5eO0k/Mdx4Sm6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pt0n8TEX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt0n8TEX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39686abd426so1715284a91.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787820387; x=1788425187; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9MKQBXQ2qiIPcch87en2gxSQXnqBJNIJwYDdb9qgoaA=;
        b=pt0n8TEXm6OOOOYsB+4fID83h6iprA3VEpU5yhkhxWKXloUVOkGaw8T2pGh6vnAccl
         UHn+AEnbqHhJ5HLnUEtWZlJZwR8Yiz+uzvBUiPYcyHqWusgwD15l5fwCRf1wnELZ6cG2
         bcAJPVc80WAqEiLcm4wsLlabunq2DtN3gzRlgDcYH8Mb5RrjBguDE/ehdhgiibU/EhDB
         mYm/E6gR0WLCIHUPuwNck/oN2ahsuS6EJvPTAAeFW9wOcmm3PZ5gw5nTbfVt5rLA+iTb
         2kZoT3iltU6Exk9NXJxAUhJQGqgz8taW2SszAGu09/MHxa8nwEL5/gX4r52i115cVpfF
         IjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820387; x=1788425187;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9MKQBXQ2qiIPcch87en2gxSQXnqBJNIJwYDdb9qgoaA=;
        b=f13fXQnNINKh+Xq9pfhPPXyEg2JolO+jE7L3+Eb3jVytKUVgYcGtqfPUyBIFn64ADM
         Kk03avAvW9kX5MIw2WX93uUArf7yMKeUdkaPJ6MNs8Z7CQ9EHhVvYqQ+G6nusej+IFbp
         DB57TjBeG8S6pm59Nu4/pVR7TBxI1RCV56D5HFUhV9wYPdWqUr4bL/+YJS/T6C7/KyGR
         b8Gz+7qWoTdQEZWBG9HrXnpW/8Fna9r/1NoutA0AmSzzgl0vZ6a9Bh1HFACh4H7I4SQu
         9KpiiBlnDtot4Z811IW+B1flLzBttWBg6a9vq3G1Uw4af+S2YhPLMChUKxvFkgdXVtz1
         /XlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvazC9p0nV+1waJtlngA/7bNpiLSTGdTgVSvbsl34t8bAbQa8J6Fjm9wwp25hL1WQdcoIhGbNJtC0=@vger.kernel.org
X-Gm-Message-State: AFuF++l6qet10EB3nErauzMgSTb8+4azg811WPRsNEM4HgaQb/nRPk6Y
	LjsfhywYqAeBKAk75e63LZLXcSNRyvnNXJtKXM1xJ/AibnNqM6C0DwvI
X-Gm-Gg: AR+sD128e+oPlM1mIciy0fORcOdQgcy3RMGKYHIxJLv5TucTHbgqqAH++eGOO09n1UN
	fB+yGCqnN4V6eepr3lkIUPe0YxM5kXEktST5SySkfr8C+Uv/M1fmS48XTf8WvONcGMUPfJGFXRw
	OVs+3s5BwZoqKR1n2XSC4Q+f9yEazmhgHoddL+vQ6wMbKkq0enV2+Z6uClUt095M4rIgptnlED3
	nNLJVVQLBHzJn3olyPuIxwbcNxM3qHyRyBteRvxukPjJ8xtMIzsBtf34e30f//8vphYaEESg+mt
	cttwYS2vgms54d/YwY2BcwQjmGperYrAVs7kpUyi0UdqFpN7tivIJ9kL2pfhIl7aTx7DxZHkgdP
	8Pwvi8idFeUUnl7Ur0qYBE+5WpB1QgvDbdSoWIDa0Q7RBVRtxMkLLqd71IhWMYWvZDet47Wj7It
	EHl1ZVfvq9OoJJhCYZu8aE3x/LQiH547qRUp3Q2J81oSf+oNj5na4HJNM1lV7oSqlJStlHVqdjj
	4Ge6aPHOwqwpCKfuNtnYcZRS3u4dH9R7+473l5EydICXRC7Ph4sqkMXePqkTJ7DZadAWwWVhCY7
	jb2dVw==
X-Received: by 2002:a17:90b:1809:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3966d199247mr26527608a91.5.1787820387338;
        Thu, 27 Aug 2026 01:46:27 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39675922253sm2042307a91.4.2026.08.27.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:46:26 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:46:22 +0900
Message-ID: <m2y0dsuf1d.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: david@kernel.org,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
In-Reply-To: <ao2l9Ao7BQI6uRKC@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
	<f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
	<ao2Tl9CLL7WjHYun@gremlin>
	<bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
	<ao2l9Ao7BQI6uRKC@gremlin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello David, Lorenzo,

On Tue, 25 Aug 2026 23:28:24 +0900,
Lorenzo Stoakes (ARM) wrote:
> 
> On Tue, Aug 25, 2026 at 04:17:54PM +0200, David Hildenbrand (Arm) wrote:
> > On 8/25/26 15:12, Lorenzo Stoakes (ARM) wrote:
> > > On Tue, Aug 25, 2026 at 10:37:41AM +0200, David Hildenbrand (Arm) wrote:
> > >> On 8/25/26 03:59, Hajime Tazaki wrote:
> > >>> We add an ability to execute kselftest on nommu platforms.
> > >>>
> > >>> Currently there are several issues if we wish to run kselftests on nommu
> > >>> targets:
> > >>>
> > >>> - it cannot compile/build test binaries because the current files mainly
> > >>>   assume to build with glibc,
> > >>> - some of the tests are not able to run on nommu targets as there are no
> > >>>   fork(2) syscall.
> > >>>
> > >>> The first issue can be avoided if we can build static PIE binaries (if
> > >>> targets support it), but in our case (build on ubuntu/glibc and run on
> > >>> alpine/musl-libc), it fails to invoke due to lack of the GNU ifunc
> > >>> mechanism.  Thus, we need to cross-compile with musl toolchain, which
> > >>> needs to be solved the first issue.
> > >>>
> > >>> The second issue is the lack of fork(2) syscall on those platforms.
> > >>> Especially the test harness helper (kselftest_harness.h) uses the
> > >>> syscall, which cannot be simply with vfork(2).  `timeout` command used
> > >>> in `runner.sh` never works for nommu platform as it uses fork(2).
> > >>>
> > >>> nommu component in the mm subsystem has several known issues and having
> > >>> test cases should help this situation, thus this patchset is very first
> > >>> step toward enriching test environment which has not been well tested
> > >>> for a while.  The test cases is implemented based on the document
> > >>> (Documentation/admin-guide/mm/nommu-mmap.rst).
> > >>>
> > >>> So, for the first step, nommu targets only support low-level API of
> > >>> kselftests (kselftest.h), and implement tests in a new target,
> > >>> TARGETS=mm/nommu.  Other targets are currently not even able to build
> > >>> due to toolchain issues but will be addressed once the initial
> > >>> introduction which mainly focuses on nommu test will be settled.
> > >>>
> > >>> The patch was initially combined with other patches but is decoupled to
> > >>> only focus on test framework and testcases.
> > >>>
> > >>> - rfc:
> > >>> https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
> > >>>
> > >>> Hajime Tazaki (2):
> > >>>   selftests: run tests on nommu architecture
> > >>>   selftests/mm: add nommu mmap and mremap behavior tests
> > >>>
> > >>>  Documentation/dev-tools/kselftest.rst         |  14 +
> > >>>  tools/testing/selftests/Makefile              |   1 +
> > >>>  tools/testing/selftests/kselftest/runner.sh   |   9 +-
> > >>>  tools/testing/selftests/kselftest_harness.h   |   4 +
> > >>>  tools/testing/selftests/lib.mk                |   8 +
> > >>>  tools/testing/selftests/mm/nommu/Makefile     |   7 +
> > >>>  .../selftests/mm/nommu/nommu_mmap_test.c      | 265 +++++++++++++
> > >>>  .../selftests/mm/nommu/nommu_mremap_test.c    | 353 ++++++++++++++++++
> > >>
> > >> That's odd.
> > >>
> > >> 	tools/testing/selftests/mm
> > >>
> > >> itself should know which tests can be built and ran on nommu. nommu-only tests
> > >> can be placed in mm/nommu, but I would expect tools/testing/selftests/mm's
> > >> Makefile and run script to compile and run only selftests that are supported on
> > >> the given platform.
> > >
> > > I mean I think at this point with mm/nommu/nommu_xxx.c it'd make more sense to
> > > simply have selftests/nommu/ + update the mm makefile to not build stuff that's
> > > broken on nommu there.
> > >
> > > That way positively nommu-stuff is put in its own place and what's broken on mm
> > > specific to nommu can be fixed there.
> > >
> > > I'd rather isolate them clearly rather than having them live in a subdirectory
> > > of mm.
> >
> > My understanding is that some MM tests could be enabled/changed in the future
> > that support both MMU and NOMMU. Not sure how to best handle that.
> 
> Well by default won't everything run? And it becomes a list of what doesn't
> work with nommu?
> 
> I really don't want to see any maintainership burden or extra work added
> for nommu as it's afaic deprecated.
> 
> >
> > So wiring up mm/nommu as a separate thing did sound wrong to me. So it should
> > either be integrated or the tests in fact completely moved out of mm/
> 
> Not integrated, because then it starts adding work for people. I'd rather
> have separate nommu tests, any mm tests that aren't compatible with nommu
> can just be somehow excluded.
> 
> Having a 'don't run on nommu' or even just some means of setting which
> tests to skip (I think Mark Brown suggested as much in reply to an earlier
> version of the series) seems a good idea.
> 
> But yeah, tools/testing/selftests/nommu seems the best place for the
> nommu-specific stuff.
> 
> Can maybe do some ../mm/ horror show thing for reducing duplication as
> needed...

As David mentioned my goal is to run all selftests/mm tests on nommu,
but as I explained situation to Lorenzo, it currently doesn't any
tests of mm/ on nommu platform (plus cannot build).

so I'd like to start as minimum as possible for this patchset, thus
creating different TARGET at mm/nommu, which I thought it should no
harm to the parent directory.

But I can move from selftests/mm/nommu to selftests/nommu for now, and
will propose to move into mm/nommu once it will be more meaningful to
do so.

# btw, I started to looking at code toward virtual mmu; I cannot tell
  how it'll be tho now.

-- Hajime

