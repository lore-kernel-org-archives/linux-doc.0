Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC462F2E
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 05:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739166568; cv=none; b=kbs43tCViQYXPsxZBh+HGVWVh+xWK/pAoJnO5o+IX1XgobZV+l8aa2p7E0lGTv2XloOwzuOBw3ibXCSA4YWEYK9uaaq02THTtBXeARAM8EFK0CBOJTWKqVvTLanPCFvVnZVcdOwMY/9ELkCxWLZIBRMxPQOojEDd5FDk1uGCJUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739166568; c=relaxed/simple;
	bh=okp4iGCbBaVIw09q0bTKVUF37D2rZF5xu5HsDQnnPSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mppK1wunrZ2y6sH6q2dhUT7vXURP2R1Knrku1NLigIf0eLsX6llFVfNYrJt5u4VDScfLDTgIRXVmpo5kAloIar6J408hWYdtTlw++Zdu0iBpcskmxvwFzZiENPgULYJQmzdHUsDx8uHuWhUoPHB/5Nrb7ZUvxFbyc+8M2rfcoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=snSZHDct; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="snSZHDct"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LKNWyhqjvF4B9c8YkHcwLtXN2IA4PlgurEoAGQi8oh4=; b=snSZHDcthjD7MOyCeUkM+cqV5M
	Ahe9cd/kfvxqM1HVbAeM8K0V6jHQb91Fno4sLNwql4NxoAKPQNlZCYHQop6BtLpCLIxE7NXb6TzRR
	2Ly7jlkNctNtdark/ef3ebv6VFBJOKCFFlh3lWjz1WmHqMi99CagYYcKr4/vRMwGTnAIIBbNt8Kpv
	HC/7scfLq3CPKyeDWj/mMpi4kSXGMAtl8TbXlJ7qM096ElzQiiyxVNcoZIWZ047BMUdQ13gmvUXCL
	Ao2XRvIElociyB7d0IvShWMMzTms52BhefMVtQkoGv+UnG0sRj47/4Ijts5Le90NFhq4lRpNCfiQg
	60yQa4eA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thMfa-0000000EkuA-02Ht;
	Mon, 10 Feb 2025 05:49:22 +0000
Message-ID: <d85760e3-433e-429d-a6e0-458bee382d84@infradead.org>
Date: Sun, 9 Feb 2025 21:49:14 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
To: ritvikfoss@gmail.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250210043937.30952-1-ritvikfoss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/9/25 8:39 PM, ritvikfoss@gmail.com wrote:
> From: Ritvik Gupta <ritvikfoss@gmail.com>
> 
> Corrected the following spelling mistakes,
> based on the suggestions by codespell:
> 
> 1. Optionaly   -> Optionally
> 2. prefereable -> preferable
> 3. peformance  -> performance
> 4. ontext      -> context
> 5. failuer     -> failure
> 6. poiners     -> pointers
> 7. realtively  -> relatively
> 8. uptream     -> upstream
> 
> Thanks for your time!
> Regards Ritvik

The 2 lines above should not be part of the commit description.
You can put them below the "---" line just below your Signed-off-by:
if you want to include them.

> 
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
>  Documentation/filesystems/9p.rst                              | 2 +-
>  Documentation/filesystems/bcachefs/SubmittingPatches.rst      | 4 ++--
>  Documentation/filesystems/coda.rst                            | 2 +-
>  Documentation/filesystems/debugfs.rst                         | 2 +-
>  Documentation/filesystems/netfs_library.rst                   | 2 +-
>  Documentation/filesystems/xfs/xfs-delayed-logging-design.rst  | 2 +-
>  .../filesystems/xfs/xfs-maintainer-entry-profile.rst          | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
