Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06DC25A2C7;
	Tue,  8 Jul 2025 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752014313; cv=none; b=QQRyqwfC13k1+h/mzkEKDzrFJFjArbHh8XoE2ltiX/leUQxz9CvO1Hs0SOuufJUAHJxtp2s86U6doI9xPrk93bM4BhQPqGyZsynFYUJG8Y4Bd5A/uplO1tZaOLT9LNNnL3dcEREer9YwecfMsirrctmboaTubCln+AnvleCuyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752014313; c=relaxed/simple;
	bh=b/bpZ4jiN2eI/evT0PdtTX6kVDWn+BHpXCe8h0PxdgM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VJn83Tzg9Lr6b+8smxHE396iWy0Cqg5jcdDzya+MyF9f98FTBA2x2NHRUK9rIeUF+SGub+qXK8acwe8CiWW8sOZVMe3zdbIVFlVySHzu5BKUV1uN58Xr/f1uHEYRnSXkiyR2XaorL3/1DeGxu54LgAJ7+l5X/2E7MIfRX/LoFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=kIZr84Et; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="kIZr84Et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1752014304;
	bh=b/bpZ4jiN2eI/evT0PdtTX6kVDWn+BHpXCe8h0PxdgM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kIZr84EtqIlqAWOg41EkH0VhQDU4Senpb8jvgftUNp1J/YEWDiCkeqdbJr/Fm610c
	 6AOctFBvraojAJPGLuAHHDxzgqS8dOTeyx6ZWRkE2g/iCrGZr+xOFRYBgXAaTNNWM1
	 2vJxNIVWLJ3Jlf7xuCbDurUMZfsi2JtPpNPQttyA=
Received: by gentwo.org (Postfix, from userid 1003)
	id BCD5E401F4; Tue,  8 Jul 2025 15:38:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id BBC13401E4;
	Tue,  8 Jul 2025 15:38:24 -0700 (PDT)
Date: Tue, 8 Jul 2025 15:38:24 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: David Rientjes <rientjes@google.com>
cc: Kent Overstreet <kent.overstreet@linux.dev>, 
    Casey Chen <cachen@purestorage.com>, 
    Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, 
    corbet@lwn.net, dennis@kernel.org, tj@kernel.org, 
    Vlastimil Babka <vbabka@suse.cz>, mhocko@suse.com, jackmanb@google.com, 
    hannes@cmpxchg.org, ziy@nvidia.com, roman.gushchin@linux.dev, 
    harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, yzhong@purestorage.com, 
    Sourav Panda <souravpanda@google.com>
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
In-Reply-To: <3c9b5773-83ed-4f13-11a8-fcc162c8c483@google.com>
Message-ID: <7a9fc525-7ed5-367c-6504-5ce9ab4520b7@gentwo.org>
References: <20250610233053.973796-1-cachen@purestorage.com> <cvrr3u7n424dhroqi7essjm53kqrqjomatly2b7us4b6rymcox@3ttbatss6ypy> <3c9b5773-83ed-4f13-11a8-fcc162c8c483@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Jul 2025, David Rientjes wrote:

> Right, per-node memory attribution, or per zone, is very useful.

I thought that was already possible using cgroups? That way you have the
numbers for an application which may be much more useful.

