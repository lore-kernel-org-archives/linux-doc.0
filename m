Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2BE5025D
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BkptlubX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AB2C433C9;
	Fri,  8 Dec 2023 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702065503;
	bh=l/xdBEqejIBDBfyrbxLDZm1aCPxAUkB5gCdqIhDScoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BkptlubX345IW5aVCldqDNKuHbxUB1kJVmDDFs12+3s9hWGiS4nOhdxbnwGFTlL4c
	 b0MUodgMFZkx7kX/z9mbw7HPggvGOg3lZ2gaXzro0cX9o4wPtmHcZVqdFb25kH6p+r
	 XGr6FVQkDaYsRIcMTIPKTN/TE3YPPVeYWHuEroow=
Date: Fri, 8 Dec 2023 11:58:21 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: tj@kernel.org, lizefan.x@bytedance.com, hannes@cmpxchg.org,
 cerasuolodomenico@gmail.com, yosryahmed@google.com, sjenning@redhat.com,
 ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org,
 roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev,
 hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com,
 senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org,
 kernel-team@meta.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, david@ixit.cz, chrisl@kernel.org
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback
 disabling
Message-Id: <20231208115821.402176c9e37ab11470a8656d@linux-foundation.org>
In-Reply-To: <CAKEwX=O7uovg611oyXFKTJdQ3y+Fi42RAXVheT904RcDOXwtjg@mail.gmail.com>
References: <20231207192406.3809579-1-nphamcs@gmail.com>
	<20231207141142.307745be167d044b0eec1b42@linux-foundation.org>
	<CAKEwX=Oa4hKCvhhR7D9kbQ-gi2LaKBjeC3GNB3b91doVB07vEA@mail.gmail.com>
	<CAKEwX=O7uovg611oyXFKTJdQ3y+Fi42RAXVheT904RcDOXwtjg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 Dec 2023 17:14:22 -0800 Nhat Pham <nphamcs@gmail.com> wrote:

> > I don't have any concrete numbers though - any numbers I can pull out
> > are from highly artificial tasks that only serve to test the
> > correctness aspect of the implementation. zswap.writeback disablement
> > would of course be faster in these situations (up to 33%!!!!) - but
> > that's basically just saying HDD is slow. Which is not very
> > informative or surprising, so I did not include it in the changelog.
> 
> For instance, on a server with HDD, I allocate memories and populate
> them with random values (so that zswap store will always fail), and
> specify memory.high low enough to trigger reclaim. The time it takes
> to allocate the memories and just read through it a couple of times
> (doing silly things like computing the values' average etc.):
> 
> zswap.writeback disabled:
> real 0m30.537s
> user 0m23.687s
> sys 0m6.637s
> 0 pages swapped in
> 0 pages swapped out
> 
> zswap.writeback enabled:
> real 0m45.061s
> user 0m24.310s
> sys 0m8.892s
> 712686 pages swapped in
> 461093 pages swapped out
> 
> (the last two lines are from vmstat -s).

I pasted that also.
