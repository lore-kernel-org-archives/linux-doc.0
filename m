Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BBE41C8E
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="srFtzH7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8848FC433C7;
	Fri,  8 Dec 2023 19:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702065451;
	bh=t99NEmpj1FuaIiuCbAEn4oZ3Z7HmMn2zlDkQmUMlo68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=srFtzH7bBResBMSJzOLKtKeNVfecDDDsflVsoADT8dc4QsaV+hDy6JYa0fDT3rdw/
	 /+qA5icI2kfJuHuRz5ObGU1BkO3SSZ/8uf04gOr1HhrVSNw56ay0NTKyE4P4LhYrmL
	 r7yl0odutcZCfTxsazBgPYAlK91jHn3altwqgw78=
Date: Fri, 8 Dec 2023 11:57:29 -0800
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
Message-Id: <20231208115729.acb78677883c13c2c62a29d3@linux-foundation.org>
In-Reply-To: <CAKEwX=Oa4hKCvhhR7D9kbQ-gi2LaKBjeC3GNB3b91doVB07vEA@mail.gmail.com>
References: <20231207192406.3809579-1-nphamcs@gmail.com>
	<20231207141142.307745be167d044b0eec1b42@linux-foundation.org>
	<CAKEwX=Oa4hKCvhhR7D9kbQ-gi2LaKBjeC3GNB3b91doVB07vEA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 Dec 2023 16:42:59 -0800 Nhat Pham <nphamcs@gmail.com> wrote:

> >
> > Also, it would be quite helpful of the changelog were to give us some
> > idea of how important this tunable is.  What sort of throughput
> > differences might it cause and under what circumstances?
> 
> For the most part, this feature is motivated by internal parties who
> have already established their opinions regarding swapping - the
> workloads that are highly sensitive to IO, and especially those who
> are using servers with really slow disk performance (for instance,
> massive but slow HDDs). For these folks, it's impossible to convince
> them to even entertain zswap if swapping also comes as a packaged
> deal. Writeback disabling is quite a useful feature in these
> situations - on a mixed workloads deployment, they can disable
> writeback for the more IO-sensitive workloads, and enable writeback
> for other background workloads.
> 
> (Maybe we should include the paragraph above as part of the changelog?)

I pasted it in, thanks.
