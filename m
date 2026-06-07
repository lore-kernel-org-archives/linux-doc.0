Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8138910E
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780839793; cv=none; b=puVmDhzHkTSm+TmOjWpinDS5Jo5gYRQhwlbItWL55snVtlY+JGJv5Cw9s6oBTeo8+z0mjGlosNkxDJyLOOS24Ri8vgbJF7uzk4P1UR1gztbSAcUuYXHBkBuku4+KE4bXT6OLxKXRE8NCURRYOa29j++ZRgP1A4sVDv/VGNKdmdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780839793; c=relaxed/simple;
	bh=Yo2T+crBrnIPw1FsPV22gFWsI07IndQmTQOuDrcH9tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjjLhsfD22G7F9bPnYSmGESWNaF7eAAuFG6ivmqOm7byzKLWWj4VFmKTLYkMdl1IzPUE9+3xkdXjFeMqb8/mFjBEe8VeWr1ombuv97XM298veGwikM1v4LokaDFrx46lpry/SkicCcSZFHnfKZj7tNL9TFcvEh2q6Job2NEI35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kA/TIw3D; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kA/TIw3D"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccf181a52bso34134426d6.3
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 06:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780839791; x=1781444591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1i1ZZY3NH0NksSKwhex65P8mcwZtC9iSbou0/cGuXtQ=;
        b=kA/TIw3DaMXpzDIQc9rYbQ+Vf+PjPP+aOOMzFq4hkbokjma2MkYufzDNpq6XDAtFeM
         eU6Z2kVP5gbBRu7cqrXDmdcSQWt50DrGM1MSC36XQz05KtlQJxHC2sMsViHVxlCsYLj/
         m4kGhQRWoDXxw96N1pVDhuqb106ftMMfk1Da/5G5PVBtgeRaKOEhvR91+ISu/TRPhtnT
         EQSXBrJLVN1li53BXyr9CpnZ5AowmfuAbaEuuFsKPEanKsvUDGOgjbwcHgF8phRlDen/
         rhIm8ytCLNkEQkESYGIiNSE0VHf55o3eUROQTxnQJyHs6BUyK6O3fYZ6ky1t73hCnqkC
         j21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780839791; x=1781444591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1i1ZZY3NH0NksSKwhex65P8mcwZtC9iSbou0/cGuXtQ=;
        b=QMOz/zHtC6+ayKYmEduBsz3QBVE+O2JauBhwerDevqiU2XjBdThK3q1CwRb1GrNeVh
         uI4gE4Y3n994gsWQDRjL0Su3jw4U8wok0i3n4UiyInEcDbbefKu5qayygeJtulnRFLn6
         bpXnDKpiH14+J/B/iQ2QDrSFklAZcx/pSj83njK6FORE0WCv70sWHN9QgICxMJb/DbUg
         VPRvn1k/cBWHPIfPWjLgk8hs6pG34vfOGeOSiki5KXxWe5t5IIvk3DiCGF+BTC8cy0m3
         7DLNoTRCu3TUsQd9wWBBFgTir6yOS3h2lsHNvsgaSb6OzdjU/xA6BjC+ErixnUN9qAQH
         Wb0g==
X-Forwarded-Encrypted: i=1; AFNElJ8znQFVfjkapZAyfVETtX9NCPNdWdutlgy6vreBACbRkFjnKajKXP9XKB1j79QtVwJ20YJOGcNRFTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLdY2mHp71jDimhnHSz+tMDb1kIt8Fextrp++8EFyK2p/wCTH
	mwdyOdcOZ5vl6xUgJj/yfENbwHoqskWwyscFLWFGLvmw+5f6q+B8VWgkxZUsBWc4wrQ=
X-Gm-Gg: Acq92OH0y89Ue0BfYd0R1X1uTuIOsBPiLfuY8ejH0992pmF5IRjaC6NQMjyY6dGmgiI
	YvrPZrKhv54QIFZ7TqLl6h3wZDMuqbj0SDolEueA34+FZk2VeaqXawEvCDpHyD7KY+ojzFtXKUh
	sz+ZQwmGcbqktPec3yh9SUStUy15HEY8hn2GNMhpVp1053AI1suTqW8TIG9M0fd2MoCUCw1xspO
	DcwmvCLpbQNc7H7BMmPKQoDsLFLzq5uwoLJyzrHgMWE+XQj9iSmuGhsErP42ax8LXGL5+uW4b6Q
	6r7giYCQuzFLxVjclBpHLnqtxbzs+HV6UlXPeF/7P6kwq4YOsDrEZY++YhDgwjwbQ5Sj+Pt2r85
	iWACwWg0vlHNyy4Hf4Gx5j9eo+QiM9FHsK352esyY9pNZSRjCEVUfWNU73aW5OTfNF+2wqbo769
	ieWMuImy/XIN5zXH9ErM0Gaf4NmGlnOHQEXVNOmk6G856V/wQDnCprsVJ16EyVtA==
X-Received: by 2002:a05:620a:2990:b0:915:6e30:5bdf with SMTP id af79cd13be357-915a9cad06cmr1888383385a.19.1780839790896;
        Sun, 07 Jun 2026 06:43:10 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a40d566sm1415396285a.47.2026.06.07.06.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:43:10 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:43:09 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, jasonmiu@google.com, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
Message-ID: <aiVp5RlbWRz5VnPB@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <178083348872.1648214.17778188633648887952.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178083348872.1648214.17778188633648887952.b4-review@b4>

On 06-07 14:58, Mike Rapoport wrote:
> On Fri, 05 Jun 2026 03:32:26 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> 
> Hi,
> 
> > [...]
> > data structure. Keeping all of this within the same `kexec_handover.c`
> > file, and also under the same global version, is no longer sustainable.
> > 
> > To address this, this series:
> > 1. Refactors and reorganizes the code by splitting out radix tree
> >    and vmalloc into separate files.
> 
> I'd keep vmalloc where it is, it's more of a memory preservation primitive
> rather than a data structure of it's own. The data structure it uses is an
> implementation detail.

kho vmalloc is absolutely a data structure. KHO core only provides the
basic handover mechanism (FDT nodes, physical memory ranges). vmalloc
is a structured representation on top of KHO, and should provide its own
versioned ABI.

If we change any of the vmalloc serialized structures (like kho_vmalloc,
kho_vmalloc_chunk, or kho_vmalloc_hdr), then vmalloc won't work and
compatibility will break.

Core KHO does not need vmalloc; nothing in kexec_handover.c uses it.

Instead, vmalloc has external customers:
- memfd (uses it to preserve serialized folio metadata)
- KHO test suite in lib/test_kho.c (uses it to preserve physical address arrays)

> Let's minimize the churn where possible for the sake of git blame and
> backports.

It is much better to do the right cleanups now while KHO is young. Once more
subsystems are added, this refactoring will be twice as hard. Modularizing the
code now guarantees a simpler, safer, and scalable design. Placing each data
structure in its own file gives us code that is easier to maintain, review, and
less prone to bugs.

> > 2. Moves and organizes internal and ABI headers into structured
> >    directories under include/linux/kho/ and include/linux/kho/abi/.
> >    Instead of cluttering include/linux/ with prefix-styled headers like
> >    kho_block.h or kho_radix_tree.h, we use the already existing
> >    include/linux/kho/ directory (e.g., kho/block.h and
> >    kho/radix_tree.h).
> 
> This looks to me like unnecessary churn.
> These all are bundled with KHO anyway, there is no header dependencies
> that justify small headers for each two functions and netiher
> linux/kexec_handover.h nor linux/kho/abi/kexec_handover.h are that long
> to start splitting them.

External users only need to include the headers they actually use. For
example, LUO shouldn't have to pull vmalloc or radix tree KHO
declarations, and memfd does not need block.

From a maintenance point of view, it is much easier to catch ABI
changes when the file with the appropriate version has been changed,
and most likely the version of that file should be updated. If a single
header contains compatibility versions for several different data
structures, it is easier to miss the correct version update.

Since we are splitting the source files (like kho_radix.c and
kho_vmalloc.c), the headers should logically follow the same
modularity.

> 
> > 3. Introduces a standard set of compatibility helpers in
> >    kho/abi/compat.h.
> > 4. Decouples the compatibility strings of individual KHO subsystems
> >    (radix tree, vmalloc, and block) from the global KHO version.
> >    This enables independent, granular compatibility versioning.
> 
> I agree that we should decouple versioning of these components from the
> global KHO versioning.
> Can't say I agree with the way you propose to do it.
> 
> I don't like that each user of a KHO component should include that
> component version in its own version string (or whatever it may become
> later).
> 
> It requires ABI headers update each time a user decides to add a new
> data structure and worse when there is a change to that data structure.
> It creates coupling of the data structure user with its particular
> version and just looks ugly IMHO.

It is actually the opposite.

If a user adds a new data structure, that new data structure will have
its own compatibility version. Instead of the current approach where
the global version string needs to be updated, only the new version
string would be added.

Also, if someone updates their code to use the new data structure, their
compatibility string is going to be updated anyway, as part of using
the data structure requires including the dependency in their
compatibility.


> Suppose we added new fields to vmalloc, but made the implementation of
> restore to be able to cope with both old and new versions. 
> How this would be reflected in memfd versioning?
> We'll add both versions of vmalloc to memfd version? And all other vmalloc
> users?

Backward compatibility is not in scope at the moment, but we can make
the version parsing more granular in the future.

Instead of a simple strncmp(), we can introduce a standard callback
interface for data structures. Each data structure implementation would
implement this interface, and we would pass the parsed version string
to the data-structure-specific version check.

> Or, say, we add support to kmalloc() and use it in kho_block.
> Then we'd have to add kmalloc() versioning to all kho_block users, right?

I was thinking about this. Since we don't have examples of data
structures depending on each other right now, I simply made sure
there are no duplicates in the compatibility strings.

If data structures have interdependencies in the future, we can easily
remove this uniqueness restriction. The users of block will still
include the block compatibility string (which automatically includes
kmalloc), and if user also depends on kmalloc, they will include it
as well.

> I think the versioning of each component should be handled by ->restore()
> of that component. If it sees an incompatible version in the preserved
> data, it returns an error. The versions can be stored e.g. in the base KHO
> fdt.

Hm, I think, checking compatibility inside ->restore() of each component may be
too late in the boot sequence.

By checking the composite compatibility strings upfront (before invoking
the actual restore/retrieve callbacks), we can guarantee that the entire
state configuration is fully compatible. If any mismatch is found, we
can cleanly abort the live update.

Additionally, keeping the versioning managed via composite strings on the
serialized data and registered handlers keeps the KHO core completely
decoupled from individual component ABIs, avoiding the need to bloat the
base KHO FDT with subsystem-specific versions.

> > 5. Adds a KUnit test suite to verify that the composite compatibility
> >    strings of different subsystems remain unique and sorted in
> >    alphabetical order, guaranteeing a consistent and predictable
> >    representation across configurations.
> 
> Without "composite compatibility strings" we don't need to care about
> them "remaining unique and sorted in alphabetical order".

These are not strict runtime requirements; they are simply there to enforce
code cleanliness and prevent human errors like accidental duplicates or
mismatched orders.

Even with a simple strncmp(), it works perfectly fine as long as the
strings match exactly. If the uniqueness or sorting constraints are too
strict, they can easily be removed.

In the future, we can transition to a more sophisticated version checker
that parses the composite string into individual subsystem version tokens
and verifies them one-by-one, rather than relying on a strict literal
strcmp() string comparison.

> The need for this test alone is already a red flag ;-)

I will remove test ;-)
