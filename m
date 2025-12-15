Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131C29BD94;
	Mon, 15 Dec 2025 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808792; cv=none; b=gpm9DQuV6zImIRUUpanUa6oXlvJ+4xaMXfzvL7eu84TjrxHNvwBfOr1pbp24LJuZ7k5ugyLYq3hcZLBzO65YDszrAv4gZlZpSfzwu6QU7bp0pLRy7ZL5AM/u9QzeJBg5HJn1nOPIY6BbMItNIPD+D4lJDSQA3irg4D+Uzyx/2NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808792; c=relaxed/simple;
	bh=vfRvfzjxtdoOanlAjTkNDBQHuuTEoetvAyA6tMfwKtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShDAuiy3n0r1Fxb63RkrI4+CranwjBRH/XxENRkgT3mJ4ERylTxnZgH/Jb4j+iKyK+l0SOctiDPUHGUNkLGHeLjpDjUdB3K8aCXmsdHbZMr0+M6ezEmL8t2Mb/U4pG9n3ETofwtYJwiflH3+quZ9udu/EvCzjcwEeK6OMVgqqXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9CBxFoF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9CBxFoF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7090C4CEFB;
	Mon, 15 Dec 2025 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765808792;
	bh=vfRvfzjxtdoOanlAjTkNDBQHuuTEoetvAyA6tMfwKtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d9CBxFoF5yUM3zCJXEqAPWgC+jUV6COMMyPJU9KeU1hWsVQceZhkoOiyZTg+6hDXC
	 hcHVnRfo10YzjQECcx5Tu1/turO+zG8GQ6iKeiqvwUPsW6sJCrdzTgOzhr8difjPoe
	 J53dYsWhEV2U9TSb5QOkaKuAVz5ZuP855qv7tOQUFR3vu3OwYrfppG1AQYpVFcvs6q
	 4NF/25TiNogYlhFPYZ9GIAAhlJfM6uOxN+TPoMWXlHG5iPQ+9VvJ1hNNSud3eMY3Yd
	 r1lsojsPUcf9RsUK/jI703+9jkgGzJP19m1AxQsaBJLUZAas8/y0buTSJx8eYO+Woi
	 oAkrG+bwoYGTA==
Message-ID: <5088b710-cfc5-417e-b629-c01d1eccb9b1@kernel.org>
Date: Mon, 15 Dec 2025 15:26:25 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next 0/2] THP COW support for private executable file mmap
To: Matthew Wilcox <willy@infradead.org>,
 Zhang Qilong <zhangqilong3@huawei.com>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, corbet@lwn.net,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, wangkefeng.wang@huawei.com,
 sunnanyong@huawei.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251215123407.380813-1-zhangqilong3@huawei.com>
 <aUAUd_XJPVsl_CZL@casper.infradead.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aUAUd_XJPVsl_CZL@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/25 15:00, Matthew Wilcox wrote:
> On Mon, Dec 15, 2025 at 08:34:05PM +0800, Zhang Qilong wrote:
>> This patch series implementate THP COW for private executable file
>> mmap. It's major designed to increase the iTLB cache hit rate for
>> hot patching application, and we add a new sysfs knob to disable or
>> enable it.
> 
> You're going to have to provide data to get this patch in.  We've
> deliberately not done this in the past due to memory consumption overhead.
> So you need to prove that's now the wrong decision to make.
> 
> Microbenchmarks would be a bare minimum, but what are really needed are
> numbers from actual workloads.

In addition, the sysfs toggle is rather horrible. It's rather clear that 
this is not a system-wide setting to be made, as you likely only want 
that behavior (if at all ...) for a handful of special processes I assume?

-- 
Cheers

David
