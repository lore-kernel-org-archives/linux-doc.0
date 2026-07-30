Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869D7262E;
	Thu, 30 Jul 2026 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415427; cv=none; b=DbcAOg3zOJPnFaAVmkyWgfYgzTLRDmLFB4sZCY2+Fipl8Gw3OSNcIcf+2w7txiq9vh8RiY35Ovc3kNoycCoxOJV10ghJ3CaecCRhDVr8XqsiIq+plPY/k6uHHPgiEXP+1s/qV2WImGXTPEy17sM+TCe1578W5SZKF/vTbD1bgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415427; c=relaxed/simple;
	bh=denYXxuZUIjJ7qR+ENW+Wes0wn305emtnulRUupokHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1lf+BXz70azfa3nEaBvCU06MRyv1+GDOHzzxCMV4S3NjkhOImNtN6DfmM+auilP2Yzhaii8QOcHu/2FIgc66NhMw5+dCFzU030pkPL4lDx6ttLg/UZOjcdBlVmBzH9SjhfhE0Niyv1acJHQ1o/stVjGSZJyCSmhu7jeipkOOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xn9CZZ8q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xn9CZZ8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5C61F000E9;
	Thu, 30 Jul 2026 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785415425;
	bh=tv01v+1vmyL2V9Dx2V8kfjj44VgJjpaRsjpUKiXaIwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xn9CZZ8q4fyaTzyVghjcX4coSwOOVxWYub2DQbQTTQ/7S+qjSTdRqwH7KxQN8sA4G
	 KbeBl23oUkUtQxmG5FJgjXHQ5qvuwcrbqSNryM965phjrb42pbs17xhPT9Cipdn1sE
	 sG79Xp1VqF+sUGHLL4At+wPzmS6nTcw5zF8i2/BOpJmfOCZZcjmCiiBsM1reMlMYnw
	 cHp9h8IV3A5IENrcouFOw7G1c4VmJ04YWp6EXWzBFgMUQOqYkIy34herfhc4bamJVv
	 9i9uRpeu8Jw6sbmqXg04pzmRpAyFUZWoVzNkLhy3yKLRil3Izxoux3cLdlE9Qf9GzT
	 uq6CE9TWqI4nQ==
Date: Thu, 30 Jul 2026 13:43:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Pratyush Mallick <pratmal@google.com>, akpm@linux-foundation.org, 
	vbabka@kernel.org, sj@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	anshuman.khandual@arm.com, gthelen@google.com, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
Message-ID: <amtGydvlb2omM4WU@lucifer>
References: <20260727230545.262579-1-pratmal@google.com>
 <amiN82J8p5z9l_Rm@lucifer>
 <91b61f02-c533-41b9-b680-7de52a5c6918@kernel.org>
 <CALHaPKeOs25YNRg60+NxfS3E5RYLt5hJqFNX02ZCEBrjcDua0Q@mail.gmail.com>
 <amsYVFfJmOs-Hy90@lucifer>
 <1acb7ba0-6aff-4d30-9554-283ac8fbc93f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1acb7ba0-6aff-4d30-9554-283ac8fbc93f@kernel.org>

On Thu, Jul 30, 2026 at 02:39:51PM +0200, David Hildenbrand (Arm) wrote:
> >>> With 2s, we wait 2s before we start reporting immediately by kicking the
> >>> workqueue immediately.
> >>>
> >>> So "0" does not mean "report all the time", rather "start reporting immediately
> >>> as we are notified about a pageblock to report".
> >
> > No, it's whenever pageblock_order is specified, defaulting to a pageblock.
> >
> > But I guess in practice fine.
> >
> > There's fun like this in virtio_balloon.c btw:
> >
> > 		/*
> > 		 * The default page reporting order is @pageblock_order, which
> > 		 * corresponds to 512MB in size on ARM64 when 64KB base page
> > 		 * size is used. The page reporting won't be triggered if the
> > 		 * freeing page can't come up with a free area like that huge.
> > 		 * So we specify the page reporting order to 5, corresponding
> > 		 * to 2MB. It helps to avoid THP splitting if 4KB base page
> > 		 * size is used by host.
> > 		 *
> > 		 * Ideally, the page reporting order is selected based on the
> > 		 * host's base page size. However, it needs more work to report
> > 		 * that value. The hard-coded order would be fine currently.
> > 		 */
> > #if defined(CONFIG_ARM64) && defined(CONFIG_ARM64_64K_PAGES)
> > 		vb->pr_dev_info.order = 5;
> > #endif
>
> Yes, it's really about "a large chunk of memory was freed". On 64k " a large
> chunk" is unfortunately order 5 == 2MiB (so the same as on 4k where a pageblock
> is 2M).

Yup :)

Yeah in general I'm fine then with the timeout being 0, the fact it's batched
like this makes that rather moot!

>
> --
> Cheers,
>
> David

Cheers, Lorenzo
