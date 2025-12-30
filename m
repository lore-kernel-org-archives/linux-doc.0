Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F5922301;
	Tue, 30 Dec 2025 21:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130753; cv=none; b=kFUynYtpLjlOkbH67qSj4SaRwJqnlF8iFQGUFIG3dTB8lvKbZNVWpfjrtN2HlSTv/eOV/8f/VeSk8daOnbtRj7x0qrfdrMHLdf/4hL+W64Q2rV8W30lknmaXokLE+JYsyDUgWweti1ZrDe0sy8QQtMcfSbxVGNOCIqnwl7UMg7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130753; c=relaxed/simple;
	bh=YtquKurop/OvwxN4Eq8Ltk7Y+OOoKVyFZ6MJUUIWI0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fv/IkBGLjqDq55a78jPT8568Je7saxZKnnp9tYpWd5IcNagYa9KQtN2/i2MNmYP96aNRsV+BxERm0N31ewDOWhh42HrUs0UeoL93HyzxMhhySxA+p+lRzaoPWVETfgwl7VG1nW3PsPvLz2XYplpB0TI16ot+RtU44r3XLEy2Ap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TteOwrKo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TteOwrKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E81C4CEFB;
	Tue, 30 Dec 2025 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767130753;
	bh=YtquKurop/OvwxN4Eq8Ltk7Y+OOoKVyFZ6MJUUIWI0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TteOwrKoS5IxeqeKPFtXFsRfZP3vPb7PkPehFZL6R4m3JY81atVBoIlphCBU3vVi5
	 5p0nN76pXtqc4E6/CtCPjHLH8Q0lPyPMiwIEUMnEBJ1F9fKrRk4b03cxzhSSPzYcSN
	 qzimu6v3errdDrfRQ0Biww2RVGOFI6rGrPqbrsO1abAvFDsvLxlBuntyZHNkhwaXee
	 UXBbHzT7mbhDa7F8q/QGpCCbyVPo8e1XGcNo0QZIyCbq2OoT79q6DOFw6wpaiFXk8V
	 8hOq678GkZ0lO6BitPZEJPlub11soUQif+vZeB6QqfTqQIrz5CeeeeVKlctHzcB6R9
	 WKRpjsI/obZ4g==
Message-ID: <b0e8f746-3170-4101-9ceb-54af06ff8e16@kernel.org>
Date: Tue, 30 Dec 2025 22:39:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next v2 0/2] THP COW support for private executable file
 mmap
To: Zhang Qilong <zhangqilong3@huawei.com>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, corbet@lwn.net
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, willy@infradead.org,
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lianux.mm@gmail.com
References: <20251226100337.4171191-1-zhangqilong3@huawei.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251226100337.4171191-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 11:03, Zhang Qilong wrote:
> This patch series implementate THP COW for private executable file mmap.
> It's major designed to improve the performance of hotpatch programs, and
> reusing 'vma->vm_flags' hints to determine whether to trigger the exec
> THP COW.
> 
> The MySQL (Ver 8.0.25) test results on AMD are as follows:
> 
> -------------------------------------------------------------------
>                   | Exec mmap Rss(kB)  | Measured tpmC (NewOrders) |
> -----------------|--------------------|---------------------------|
>   base(page COW)  |       32868        |        339686             |
> -----------------|--------------------|---------------------------|
>   exec THP COW    |       43516        |        371324             |
> -------------------------------------------------------------------
> 
> The MySQL using exec THP COW consumes an additional 10648 kB of memory
> but achieves 9.3% performance improvement in the scenario of hotpatch.
> Additionally, another our internal program achieves approximately a 5%
> performance improvement as well.
> 
> As result, using exec THP COW will consume additional memory. The
> additional memory consumption may be negligible for the current system.
> It's necessary to balance the memory consumption with the performance
> impact.

I agree with Willy that "negligible" is the wrong word. Assume you're 
using uprobes and end up firing up the same executable in many 
processes. Each process will suddenly consume 2M vs. 4k just for 
installing a single uprobe. Of course, VM_HUGEPAGE mitigates this.

But really, this is the first time that we are using large anon folios 
in MAP_PRIVATE file mappings IIRC.

Take a look at kernel/events/uprobes.c:__uprobe_write(), which I 
prepared to deal with large folios.

But the removal logic for zapping pages when removing uprobes will not 
be able to reclaim the memory in case we over-allocated memory during 
the COW fault. We'll be zapping a single PTE only and *not* restoring 
the original file THP PMD.

Zapping more is rather complicated (doable, but complicated), and I'm 
not particularly keen about adding that complexity there.

Long story short: this is the first time we allocate anon THPs in such 
areas and I wouldn't be surprised if there are more problems lurking 
somewhere.

-- 
Cheers

David
