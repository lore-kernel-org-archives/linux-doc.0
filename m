Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3185311952
	for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 03:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769828477; cv=pass; b=sLPemEJ7mo+13YsbM8aHsnstOeE0Pcnn84oZSi1lFzTcSfiuWyPEWe09e5vBSBbwgDLT3lC7/aNoipJn1GASgAQdXxkrQBiCHmVBxm7deRHsk0YkJVKXo8ZnTdxrtgRWyScoOTAVE0AMuTP/Z2631bfTmVVeHsrGDIVIrADqvig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769828477; c=relaxed/simple;
	bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XB501tc5oOi6LD3FTRpDPIuGSpwnyqDXuGsU3rDbBtCWzB4FMZUt1xA24f+JwyS7D13bBW1xmCwpC+fa04EKPALqCvJocpphBRWmt17iw4UyCABMXJDd5f1bQG/rZW5L4ZeySjIJ9SkQ/dINs2kr/snAFF7PV44GaGW0VrgBez8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPz0hibx; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPz0hibx"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89473dca8aaso30754206d6.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 19:01:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769828470; cv=none;
        d=google.com; s=arc-20240605;
        b=Lu6+j9XelK446BoigNKhGWGpuL4ssUY/xDl1O1VbggWTfTKEF1TCZdIrwhHKXNEFCH
         YlEPgt/Xx371zXZrCBqhR6M4fGb9LUM5nYoIXeADm43271W/kwEUAiE2b42Ldy2BWgi9
         V9DFyW2UlUpc83g7ZBKE5IDABV5Nxp3h4j3FNV/PZodJf2qXw1T5itMouQ3Ah+R3vsBX
         YeqkPiJI0xdzRKHRiQmUZ2vedj+dJF9ldj92nSVrsv2En6gGk/Zq/BVhzdv5UXaVrNMO
         pCxCgjSHAlEXsZScQv92MuKc9sl7I/u3xpiUUTB8eA95GqmgJwxWaPr/vlDEgNqnO9eL
         z+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
        fh=MzxGN1JGVpp6689yS6zM5BuF0AdR0iQ1+8qKREw140I=;
        b=BLp3Oy5VdQGNu0fSnvZUwMV9DN/hHeApAm1XLgjDAFDF9S6UEtBnBLSja+xXMUi7yy
         eY5geWyG9u54oeDcrQlPVXyMvbE94cDU2K5fWQ5aznZOGyNg4x3PhoHsFth53HXJUVHZ
         dQI6SFteMrxjjDuck9Ufcp9yTSp3fk/8fQFxNzGXlVi25BRbUhcFhr9Ow8Jq/+GJiWsG
         RduvLac2m6rXOdfKSMNH+aNwOK8d9VL7/8B3RmyAOC+q5+3R2AJEpjVjKQYNbSZazKU8
         nWhxIJcI5ouZoKa+qbloR65bTH/JdRYQn1iXqq4AuozYPwZ6wbmUrGw7EmkLTI31vacy
         D/7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769828470; x=1770433270; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
        b=WPz0hibx6GdNkusUtWCaf2UaHgvYNZqQ1U/vmDYmAFqzLTEnXLMcBhWQuBNLXuZiIX
         otUnCrtku2ISMwbZY9lc5qsisr6iq45nhbRx3YntkuAiCzcqYDa4niCSPVQ1nF7sqeas
         lVL7ZCTAqfcSM19/UIhc9mSXnawMpzBIyKVZVoRh5AulgRhPKfm9vHecDK0kYfhrrHeb
         2HeWLp3RtnUbWHBXaiWBrhCPCf5gAhJpByB/SFxKH3hnHFy837PLHfWJdvMNdpLvVWGH
         N7JTj7v7qRFeJQPKGmr6dwOsfgXqyFf+zNN8bHokW8n2xwAmM1XoJPacjCg5n4Ez+ctu
         tnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769828470; x=1770433270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
        b=kvNex9kPVilfmaQC9NB9gUgtN8P9OF51ZvUwdPZ8P1XV7IrRAit2HP/t/rItsCLCfG
         rCIJaDUtEaB/rnOZsZn18w8I7XlsZ792jlcD/a7bvLzaWXtvj+axz4LVJK+rcoEKMQym
         iNBqSudmcx+EfWFSMEuIagUhnQWgFEQ/PWJf2ackgVSUfi2S3oubfeOYxNRt2K99kPXi
         MhNUVuwgN2JMamJ0++dKmlzrtTH9ZyhEywBarf0L42aLadGzsTKRMSfAwy8VRwtgSAVh
         hAUESRqUTf8ocS3nFMp3BURnRrZWAvtC8yMhPe0n3kN3/Je/9Y0cheYom7iR7pbQ0J73
         S80g==
X-Forwarded-Encrypted: i=1; AJvYcCXqnufFjNLittaTP2/ZZcmtT6teZvbT4oxbVRNm67jSdhcVAMP0sCMYEqbREtfdFGzzD4JM0K5yFxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4VQ+Z1zLHXchbO88IOfxP0qoY2sqwsVtT6A6iYf241USIBD9
	3auGtBYZpt3XTEU7jgeGl64fzdK1z05s625e1SFNTOhtQux/qX91wlT1FaaiCjiwXxOVEHqZ/0/
	AwGMW0LHbV7nK33SKedOohzeRtgg/VTY=
X-Gm-Gg: AZuq6aK8G446HPeA2IF+d/lQJ4DYmEftlVP6foaBowC5Qrx08sfHCHGGt7/P6ClyWlL
	x1UKaeWglp4NDSNQvHanaFkv7RNNTg0duJ34Z7C6IwAw5pj0ZN1CLbASh8w6pSObCaQFzvVPsgZ
	qM35XR2HYNOS4lIqG5aapBAdU2JSiVjftRRftJbiuDWljZbdmPy7KscjUIcw5A0PnGtZDL0X/Vv
	p/402HAcy6hV1hv7aQsi9swSBDMbz7yPv4+2peKvaP7h9SaWVovwQcyQyTZAsOr4I6bJTmWwOgV
	sso15g9WPczFKVnPjOj3CgeznTwqDaU8HdJJk3FsXJZaZbajLDmHpjg=
X-Received: by 2002:a05:6214:260b:b0:880:51f0:5b93 with SMTP id
 6a1803df08f44-894e9fe6cbemr81159006d6.18.1769828470148; Fri, 30 Jan 2026
 19:01:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2> <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
In-Reply-To: <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 31 Jan 2026 13:00:58 +1000
X-Gm-Features: AZwV_QikuSqbC3QYogib7-81aPfnOToX57Ol8yNxSKEx4_hXbDFs8a3hQtETIYo
Message-ID: <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Jan 2026 at 07:14, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 1/29/2026 10:38 PM, John Hubbard wrote:
> > On 1/29/26 5:59 PM, Joel Fernandes wrote:
> >> On 1/29/26 8:12 PM, John Hubbard wrote:
> >>> On 1/29/26 4:26 PM, Joel Fernandes wrote:
> >>>> Based on the below discussion and research, I came up with some deadlock
> >>>> scenarios that we need to handle in the v6 series of these patches.
> >>>> [...]
> >>>> memory allocations under locks that we need in the dma-fence signaling
> >>>> critical path (when doing the virtual memory map/unmap)
> >>>
> >>> unmap? Are you seeing any allocations happening during unmap? I don't
> >>> immediately see any, but that sounds surprising.
> >>
> >> Not allocations but we are acquiring locks during unmap. My understanding
> >> is (at least some) unmaps have to also be done in the dma fence signaling
> >> critical path (the run stage), but Danilo/you can correct me if I am wrong
> >> on that. We cannot avoid all locking but those same locks cannot be held in
> >> any other paths which do a memory allocation (as mentioned in one of the
> >> deadlock scenarios), that is probably the main thing to check for unmap.
> >>
> >
> > Right, OK we are on the same page now: no allocations happening on unmap,
> > but it can still deadlock, because the driver is typically going to
> > use a single lock to protect calls both map and unmap-related calls
> > to the buddy allocator.
>
> Yes exactly!
>
> >
> > For the deadlock above, I think a good way to break that deadlock is
> > to not allow taking that lock in a fence signaling calling path.
> >
> > So during an unmap, instead of "lock, unmap/free, unlock" it should
> > move the item to a deferred-free list, which is processed separately.
> > Of course, this is a little complex, because the allocation and reclaim
> > has to be aware of such lists if they get large.
> Yes, also avoiding GFP_KERNEL allocations while holding any of these mm locks
> (whichever we take during map). The GPU buddy actually does GFP_KERNEL
> allocations internally which is problematic.
>
> Some solutions / next steps:
>
> 1. allocating (VRAM and system memory) outside mm locks just before acquiring them.
>
> 2. pre-allocating both VRAM and system memory needed, before the DMA fence
> critical paths (The issue is also to figure out how much memory to pre-allocate
> for the page table pages based on the VM_BIND request. I think we can analyze
> the page tables in the submit stage to make an estimate).
>
> 3. Unfortunately, I am using gpu-buddy when allocating a VA range in the Vmm
> (called virt_buddy), which itself does GFP_KERNEL memory allocations in the
> allocate path. I am not sure what do yet about this. ISTR the maple tree also
> has similar issues.
>
> 4. Using non-reclaimable memory allocations where pre-allocation or
> pre-allocated memory pools is not possible (I'd like to avoid this #4 so we
> don't fail allocations when memory is scarce).
>
> Will work on these issues for the v7. Thanks,

The way this works on nouveau at least (and I haven't yet read the
nova code in depth).

Is we have 4 stages of vmm page table mgmt.

ref - locked with a ref lock - can allocate/free memory - just makes
sure the page tables exist and are reference counted
map - locked with a map lock - cannot allocate memory - fill in the
PTEs in the page table
unmap - locked with a map lock - cannot allocate memory - removes
entries in PTEs
unref - locked with a ref lock - can allocate/free memory - just drops
references and frees (not sure if it ever merges).

So maps and unmaps can be in fence signalling paths, but unrefs are
done in free job from a workqueue.

Dave.
>
> --
> Joel Fernandes
>
