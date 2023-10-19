Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625730F82
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IldT7onL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07CFC433C7;
	Thu, 19 Oct 2023 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1697735525;
	bh=iCAlzJOz5As2YBNfu33bAM6oWeWAG5tVTYiluUL9E/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IldT7onLI/yGS+hbpdK1tfaZCkJkGq1In9vATKNbQXBmzmudox1TAV7DxrLBPQxac
	 Nmw6D383OryGicrO28YWMkTEP0gA+YtR3Sa3oC+EPE3UlseYpiMd2iCX+FdDuzU5sB
	 Lvq4VUUQQlB6pSMITesivcWcnRWM0aD0Al+BtNhg=
Date: Thu, 19 Oct 2023 10:12:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: hannes@cmpxchg.org, cerasuolodomenico@gmail.com, yosryahmed@google.com,
 sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com,
 mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com,
 muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v3 0/5] workload-specific and memory pressure-driven
 zswap writeback
Message-Id: <20231019101204.179a9a1d2c7a05b604dad182@linux-foundation.org>
In-Reply-To: <20231017232152.2605440-1-nphamcs@gmail.com>
References: <20231017232152.2605440-1-nphamcs@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Oct 2023 16:21:47 -0700 Nhat Pham <nphamcs@gmail.com> wrote:

> Subject: [PATCH v3 0/5] workload-specific and memory pressure-driven zswap writeback

We're at -rc6 and I'd prefer to drop this series from mm.git, have
another go during the next cycle.

However Hugh's v2 series "mempolicy: cleanups leading to NUMA mpol
without vma" has syntactic dependencies on this series and will need
rework, so I'd like to make that decision soon.

Do we feel that this series can be made into a mergeable state within
the next few days?

Thanks.
