Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E165192;
	Thu, 23 Jul 2026 00:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764864; cv=none; b=Ez53wLGle1LAqaG0pGLjwe8MzeUChuk4lfWXr8+sOOuVUEBUrlr05fLgXwmfxRjltEUgFkZWFxy2X4xzJR9DZReHwiqzdCq57Peo1V6pVJZHJ4end3f7OJUL1b7AGYWqv8YakCeiFqkQZCZbDQOmNdB1YCoNpVw2/tWykEDxUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764864; c=relaxed/simple;
	bh=TVSi/AScPbKv1kWv0NWx8mcfm8Qu9+H9C7zzdWzSW5k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Erxcd3S49IyLXQeThJ4bw2jwfcWB8M3eLed57k5EC2DkeNqkxp5pOsQXPRh5g/WcX1WeOFjxssDQfMUgEIALlnpUq6aZc4uPWxN8JPU2ABOaM4ElZ7Hf+ooHTfQghSPidIKSgjiUHpJrQMXEEaDBTXLWVmWKT50D0eKPpPrRKmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F7EwcYng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F7EwcYng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB23B1F00A3A;
	Thu, 23 Jul 2026 00:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784764863;
	bh=UhLfu+qb9+ZbVfQ4M/Qb3L+ARnj/pFSJ2wSRIvxFmUI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F7EwcYngtr2B551FXjgZaCrFDkakh+6w8n9mXrtSvD7s//zcF4ULJmxeqaPBFCs6o
	 8k0PoG2aQSzKbpy3U3KPpuxt/TGDkN2WO2zm8UmvmVJoNqO5/WiuNgK0gVyKfytK8T
	 Rl58QsjgPDd2NO0B27pJd3X3OOV5095ix9DJEWQo=
Date: Wed, 22 Jul 2026 17:01:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: Ye Liu <liuye@kylinos.cn>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] tools/mm/page_owner_sort: fix --sort, add module
 filter, improve usage
Message-Id: <20260722170102.43620a3d4bec61e738018a82@linux-foundation.org>
In-Reply-To: <20260722023726.600200-1-ye.liu@linux.dev>
References: <20260722023726.600200-1-ye.liu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 10:37:23 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> This series improves the page_owner_sort tool with a bug fix, a new
> module-name feature, and better usage text.
> 
> Patch 1 fixes a long-standing bug where --sort was silently ignored
> when used without a short option (-a, -m, -p, etc.).  The COMP_NO_FLAG
> case fell through to COMP_NUM and overwrote the sort conditions
> configured by parse_sort_args().
> 
> Patch 2 adds kernel module name support for sort, cull, and filter
> operations.  Page owner stack traces already contain module names in
> the [module] format produced by %pS, but page_owner_sort had no way
> to use them.  Records without module frames are assigned "vmlinux".
> 
>   # Aggregate page usage per module
>   ./page_owner_sort input.txt output.txt --cull=mod
> 
>   # Filter to records from xfs module only
>   ./page_owner_sort input.txt output.txt --module xfs
> 
>   # Sort by module name, then by pid descending
>   ./page_owner_sort input.txt output.txt --sort=mod,-pid
> 
> Patch 3 lists all available sort keys with abbreviations and examples
> directly in the --sort help section so users no longer need to read
> the source to discover valid keys.

Thanks, these sound like nice changes.

AI review mentioned a couple of things, at least one of which appears legit:
	https://sashiko.dev/#/patchset/20260722023726.600200-1-ye.liu@linux.dev

