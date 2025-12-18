Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FE1E4BE;
	Thu, 18 Dec 2025 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766092047; cv=none; b=LwjLIUBqHGgFxhPgV8MbpopMyPwxYRGObBbkFq8tob2px105Scsvx6iMt0QrihKq/jvcw/nf2eTpefw8NqVNKAtNGMwn+dKm178rbb6W8Y870aB3r6gslHj1h76z3DVh+BF3INQgdOELn5Nkx0rf7bEYiUqsj2Onh/wA1RrmZLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766092047; c=relaxed/simple;
	bh=czZ/4vR5yvVxsVNPYVzpm5JY4ARL2xkcDHo47mxPjZM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KhZwuwXao/ygyJ5K+75M5EIgDLc7SDoSEhBeOl5PSCE9xjNN/oN9pipcmekAAPzVoq2pqWplSi4A6fILJw48YVbd5zBDeKaZaF+4lElIf0zbr8UH4MzbA+T36Hf68CPqKgWoHZYiwmcr+HdEPTNfDMJJ7nTPnFSWM19ZNife1lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wfiMB7xm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wfiMB7xm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A131AC4CEFB;
	Thu, 18 Dec 2025 21:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766092046;
	bh=czZ/4vR5yvVxsVNPYVzpm5JY4ARL2xkcDHo47mxPjZM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wfiMB7xmtRtOQexVNJka1t2G/nwRTH5NVIRGgpABK3ZzyeLNcy8xYzX0LVv5VUzuO
	 2OVwhOg4nKXGNmUlGn3YExsKzxRbufMfrxbY7VOVe0RUQuzGx0puJetjv2okTSRp65
	 dUWebdFSJeD6X3JqnyVlwkyv21aXFiCx22BWaBD8=
Date: Thu, 18 Dec 2025 13:07:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, rppt@kernel.org, dmatlack@google.com,
 skhawaja@google.com, rientjes@google.com, corbet@lwn.net, kees@kernel.org,
 davidgow@google.com, pmladek@suse.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, nicolas.frattaroli@collabora.com,
 linux-doc@vger.kernel.org, tamird@gmail.com, raemoar63@gmail.com,
 graf@amazon.com
Subject: Re: [PATCH v2 0/5] list private v2 & luo flb v9
Message-Id: <20251218130725.1b93a521c039ce121de62472@linux-foundation.org>
In-Reply-To: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 10:57:47 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> This series includes two separate workstreams. This is because FLB
> should be applied on top of list_private, as it uses some of its
> interfaces.
> 
> 1. List private v2 (first 3 patches) Previous version:
> https://lore.kernel.org/all/20251126185725.4164769-1-pasha.tatashin@soleen.com
> For details, please read the cover letter from the previous submission.
> 
> v2 Changelog:
> - Added a Reviewed-by from David Gow.
> 
> 2. LUO FLB v9 (last 2 patches) Previous version:
> https://lore.kernel.org/all/20251125225006.3722394-2-pasha.tatashin@soleen.com

Please, no.

This patch series is intended for the Linux kernel.  Your grandchildren
will read the above wondering "what did granddad do".  It's just lazy
for us to expect readers to have to chase down links to earlier
versions and then to figure out what changed and why we changed it,
etc, etc.

Let's give our audience a nice, self-contained and complete description
of the proposed changes which doesn't refer them to the minute details
of the ongoing development process.  A process which is utterly
uninteresting three years from now.

IOW, can we please have a complete and standalone description of *this
patchset* which doesn't refer to earlier obsolete stuff?

Thanks.
