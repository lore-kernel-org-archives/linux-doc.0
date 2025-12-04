Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87472EFDA6
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764868498; cv=none; b=OBuPBZPSLx2YnMJcLUwpkV/hKY9vXAy6AIPuL+wswsK5wBW/27IfgorglhKJxwyKOJbkjrFzN2bF0dOzJ8d3iotg2mVicpq0C7dd9lKd8QY8tutKwMDaCdAf9cAjmqHZGeeq+PVuWBGKqQwztvAJBFPQNi8cLN2XHTwmg70qJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764868498; c=relaxed/simple;
	bh=WJU0ECi7LOp2xB0F8Jj2AkwukvhHfSlAKRt8xPStkd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLabj/69wB+sLdXeN+gi0BvZ0/0wNUMaETHCzDFpFbH8+ovRIkFlKMhU39aBUFGLE21sq0aMely/2moV0GNQ2YytO4isZMFooRbaki/ok1YSv76G+veRdJoog4rNPJR1mfNSoAdry1hHr2uuk3nuCIOVJaoEXVE/BR5wfPyYGtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CAMtjAGv; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CAMtjAGv"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8845498be17so12508336d6.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 09:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764868496; x=1765473296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ofjwqiOcg1c3d6qFlj4mCLrxvUQwOrLehDW+ZXphizQ=;
        b=CAMtjAGvVflywixxmkyKRaZtixVlZYAbdsFVbJoxZUHT/tf5iAO25Qf11bBwThXAdU
         DkEj6bVSTYA/aGkc+69Xetb0oG/TCXgse/GC4GqVDMqigdxPsiLRDXUV/rngjxFvCYcc
         qu3pitEUp2GTQN9IE281QcSTwNjzQahPeo0GxtgOs+Oc3vIAhXirpXOgAplFAVEGISSU
         Zkv/lsgqP0VdJ4zrjxZx1uwmgh0vKkyonwkm97HYHLKy+oVf3SrVJKG0zJivcxezcr88
         yKVeqh9xwWbqiEsp3P7E3RfyLFCju1R2qpdttgUszP1qJGvcsPH2tUH/nKKpbVU6M24/
         YcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764868496; x=1765473296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofjwqiOcg1c3d6qFlj4mCLrxvUQwOrLehDW+ZXphizQ=;
        b=mEHn6alTqRcF9icRylk+cPsGrGSyEd7JcNzyaNqy0wMbbIFn8sDZX77linTvwreHY7
         wc3eLtQ/I/FgE+ZnVqGPpT87tSoPsUvJ2FtRg4gN6n/ZCwqzeGBGzk3rQq6q2qhSiyR7
         f75Slp1orAO6yNFyKRV6YFWR3DLrd56QtMm4ZUKx8LndZ0fFgrRu7GJwcv4MHiFLi/qC
         XMqJ7CZflRR2DprCL5SbPiy/Ew8VArbqYb0hpM8P8y0KkBHgYrbb9OhFFCASROgQCnpd
         sJwOCzdjH0216XMU3gZgCxBuEge1cAXfbYZDuk/b8H6ATu1tlImXIkgZOKbwNstmMYaV
         eXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmnR3MVIiiU1O+lYOGUXIOPNzV6BkeGCueNIECKu43U5YTImWl4CHSsTATmAV9LZPnTGUOEOe/SwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3n37vckak62yUbI/dXzG7y/6L1prF8lTEOT7ILL59qkVlM3u
	s0+INJzZjYS+aWatiEoOs3QGGoRZrIbEo1ErJ2lhXEDlaZFi1pCctD5Z+wslJmJJaIBX8zRpLDB
	dggR+
X-Gm-Gg: ASbGncu5FvuN80pfJp/bdC8o+bsIPYnMgZZFfPz0L13AsF/5nAwOavmSVN4ZjNVdnKb
	ELz1+bGgCd59Ku6GU70KPXEBPV7Wrxnc5YV1qT4VirkTaLQVvDRyGpT/6FHkVFyUEGP3T+meeAu
	0D+b07e4mCJjQ/+TiGxQPoDMiOhjKQk35DM7BPxWt4SE/9d5qWQBwWXPcFiDgwgLMxqKX7mq+wM
	99x5Ib/DJf734dcKUVW377hVzdGZ/L62yIhZfToDPxcMm5dzKLv0VZPHKLaQyL22Vo3Qq/Yb+xR
	omto9OrOUsEbvIZunDDjN/p4wGS4DsNyvEPN8/CM9kJwtE5fkqS7HdVoTRxY9y3MJTGjo2tEH2y
	VOMqOWvmND3OnTMcBGqjFX4TpgdO1OJSwdu45LS8BjWJBdzVq1RMgOmPHSgtKVp/W9+mDX1a+Xp
	UnZC9s2q+l42dPv3iwwq8v8we4/8DBdNBJukuDa2vdo1iG7Npc2Rwqt6iNMyCThasHd0UbLg==
X-Google-Smtp-Source: AGHT+IFLxNiDK9rQo9yZICzkfx5ZdHibc8P8WJL1rCPgVT0okFH3vVSL8J1wXE0uJ8ACsbEHHX4ZRw==
X-Received: by 2002:a05:6214:2461:b0:87f:bb8e:410b with SMTP id 6a1803df08f44-888194c5987mr105661836d6.3.1764868495500;
        Thu, 04 Dec 2025 09:14:55 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm14832226d6.6.2025.12.04.09.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 09:14:54 -0800 (PST)
Date: Thu, 4 Dec 2025 12:14:53 -0500
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, osalvador@suse.de,
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	muchun.song@linux.dev, Mel Gorman <mgorman@suse.de>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm, hugetlb: implement movable_gigantic_pages sysctl
Message-ID: <aTHBjU5-Fio6CrwD@gourry-fedora-PF4VCD3F>
References: <20251203063836.187016-1-gourry@gourry.net>
 <305328e0-3011-409c-a040-76fc478d541a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <305328e0-3011-409c-a040-76fc478d541a@kernel.org>

On Wed, Dec 03, 2025 at 10:26:20AM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/3/25 07:38, Gregory Price wrote:
> > This reintroduces a concept removed by:
> > commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")
> > 
> > This sysctl provides flexibility between ZONE_MOVABLE use cases:
> > 1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
> > 2) onlining memory in ZONE_MOVABLE to make hugepage allocate reliable
> > 
> > When ZONE_MOVABLE is used to make huge page allocation more reliable,
> > disallowing gigantic pages memory in this region is pointless.  If
> > hotplug is not a requirement, we can loosen the restrictions to allow
> > 1GB gigantic pages in ZONE_MOVABLE.
> > 
> > Since 1GB can be difficult to migrate / has impacts on compaction /
> > defragmentation, we don't enable this by default. Notably, 1GB pages
> > can only be migrated if another 1GB page is available - so hot-unplug
> > will fail if such a page cannot be found.
> 
> In light of the other discussion: will it fail or will it simplt retry
> forever, until there is a free 1g page?
> 

It retries until a 1GB page is available.

Example test:

echo 0 > node0/hugepages/..-1GB/nr_hugepages (dram node)
echo 1 > node1/hugepages/..-1GB/nr_hugepages (zone_movable node)
./alloc_huge &                               (allocate the page)
./node1_offline  &                           (offline > memory*/state)
sleep 5                                      (give offline time)
echo 1 > node0/hugepages/..-1GB/nr_hugepages (dram node)

This node1_offline generates migration failures until the last step
occurs, at which point migration and node1_offline complete as expected.

The migration failures produce the following:

[  707.443105] migrating pfn c080000 failed ret:-12
[  707.453353] page: refcount:2 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xc080000
[  707.471315] head: order:18 mapcount:1 entire_mapcount:1 nr_pages_mapped:0 pincount:0
[  707.488504] anon flags: 0x17ffff0000000848(uptodate|owner_2|head|node=1|zone=3|lastcpupid=0x1ffff)
[  707.508393] page_type: f4(hugetlb)
[  707.515940] raw: 17ffff0000000848 ffa000007d873cc0 ffa000007d873cc0 ff1100082366c6e9
[  707.533126] raw: 0000000000000000 0000000000000010 00000002f4000000 0000000000000000
[  707.550317] head: 17ffff0000000848 ffa000007d873cc0 ffa000007d873cc0 ff1100082366c6e9
[  707.567699] head: 0000000000000000 0000000000000010 00000002f4000000 0000000000000000
[  707.585085] head: 17ffff0000000012 ffd4000302000001 0000000000000000 0000000000000000
[  707.602469] head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000040000
[  707.619851] page dumped because: migration failure


I can add this to the changelog if you prefer

~Gregory
