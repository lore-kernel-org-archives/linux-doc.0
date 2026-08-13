Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C742AFBC;
	Thu, 13 Aug 2026 20:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654441; cv=none; b=ZB3UUBKjOln8BJrAD+ORhAufVLFdprBEbv8GiVQyE+ZyCqqUIZxifuFu3kap6DjLm21zicyZqoDBKv7578iNHgpG6hJkfjX5A6JO16w0XxI1h/i8gdTGljw9JNueqQOa+MPNzJW4AvoDwTaxHUWVLwmmNBTTYNEu8ol/OoL0tnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654441; c=relaxed/simple;
	bh=3m4uL3LdlOQwj5QAD6CDbcZRVlAIZp65ukZLbfyrqac=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VOnI/pZdF62Z+XANcQHfBz3LoULnjYReafnEfMXtJzCxZVsyBfz7gekEs6qkgdlcdIFF0ze8YBBXz/3hrjFuYueVDw/GW46S7GWxTEzAik5DFVSVI6IzO4/jkzLAlhkqSYhgHby9al3K4y8xddbNyZHuZPXdjPZ4W4EzrQH0vi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GwKLM8Ah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GwKLM8Ah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371391F000E9;
	Thu, 13 Aug 2026 20:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786654439;
	bh=Kv+D0N5s4pcZMvVyMfXVvuezcVPbWcTi4pVO4nUOFyw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GwKLM8Ahu9/jbn7Mg/CQfv4UCp2ocuusNZqw+AsW1lNmNRtwW5sS9VzYhIB3gWXjz
	 v+bDy4Vi/jF+CmeUQQW3tEJ1GS3U3xyHiNwmNQgop5YeN5w90nQOFh7mhkyUWAMKcz
	 ydlqNtgfHQHDsa851VQZcqDyOeHQLLXV78K0NmG8=
Date: Thu, 13 Aug 2026 13:53:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Lorenzo Stoakes
 <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 5/7] mm/khugepaged: Refactor the PTE state checks
 into a helper
Message-Id: <20260813135358.89ae1bddf29e5e380b5a61dc@linux-foundation.org>
In-Reply-To: <2666af48-1e95-4f68-8978-90dc3f4832db@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
	<20260811-khugepaged_pte_refactor-v4-5-ddac39d61c4a@linux.dev>
	<f1371b4d-6e98-4699-8c1b-7612f6d70f02@kernel.org>
	<20260812123959.d4e31d68e8db85b9fd3981eb@linux-foundation.org>
	<3dd59ad8-2f00-4332-91f8-7871e8d60b02@kernel.org>
	<2666af48-1e95-4f68-8978-90dc3f4832db@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Aug 2026 20:12:56 -0600 "Nico Pache (Red Hat)" <nico.pache@linux.dev> wrote:

> >> This has been floating around since July 6, so it's never been
> >> fast-tracked!
> > 
> > That's not what I mean. Stuff must be reviewed. Review capacity is limited. Some
> > stuff gets de-prioritized and reviewed later.
> > 
> > I managed to review it now, but concluded that it needs more work.
> > 
> > Instead of reworking the patch now to squeeze it in just before the merge
> > window, better to resend this single patch for the next cycle.
> 
> I would be ok with pushing the 6 patches that are ready and leave this one for
> the next cycle!
> 
> @Andrew,
> 
> Can you please just drop this patch from the series. I will resubmit once i
> handle the feedback provided here.

Gone.
