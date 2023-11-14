Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602BA26AC0
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OgjCzaqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2640BC433C8;
	Tue, 14 Nov 2023 22:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1700002241;
	bh=N6HqswbYFj8oQ63GBlegHfbRdhg4wqQxWCHvJV54ZCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OgjCzaqRU3NzDSlEFgW7HdJNRVstmszAwYAAfqtQckuts3E8nrAh/KTpW2xN5fDpk
	 XkNoq9Y2rZRYlNNYruTF6vaFT8MVWYVqoHJZocMgZe25E23lsYxylIFRI6hbq/HwKv
	 q1JYLJZt302R3wXVMELnHyUXbYXf9Gxj6NDNccBc=
Date: Tue, 14 Nov 2023 14:50:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, tj@kernel.org, lizefan.x@bytedance.com,
 Johannes Weiner <hannes@cmpxchg.org>, Domenico Cerasuolo
 <cerasuolodomenico@gmail.com>, Yosry Ahmed <yosryahmed@google.com>, Seth
 Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>, Vitaly
 Wool <vitaly.wool@konsulko.com>, mhocko@kernel.org,
 roman.gushchin@linux.dev, Shakeel Butt <shakeelb@google.com>,
 muchun.song@linux.dev, Hugh Dickins <hughd@google.com>, corbet@lwn.net,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org,
 rppt@kernel.org, linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, LKML
 <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v4] zswap: memcontrol: implement zswap writeback
 disabling
Message-Id: <20231114145040.4b90d49d4ace1621c87f9c79@linux-foundation.org>
In-Reply-To: <CAKEwX=PT=5nvLhUyMmi=hq0_2H-4kmO9tOdqFvHEtaWF+e8M1Q@mail.gmail.com>
References: <20231106231158.380730-1-nphamcs@gmail.com>
	<CAF8kJuPXBLpG2d4sje6ntrA+U-AnLzu3sNpJK02YxNcg04YNng@mail.gmail.com>
	<CAKEwX=OgN_xQWrp_OYkK1BRq3DFW4he9OSycdjBm0BNy+vpPAg@mail.gmail.com>
	<CAF8kJuN--EUY95O1jpV39yv5FDu0OYanY6SZeBPk5ng4kRyrjA@mail.gmail.com>
	<CAKEwX=PT=5nvLhUyMmi=hq0_2H-4kmO9tOdqFvHEtaWF+e8M1Q@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Nov 2023 16:06:58 -0800 Nhat Pham <nphamcs@gmail.com> wrote:

> It's a bit of a micro-optimization indeed. But if for some reason I need
> to send v5 or a fixlet, I'll keep this in mind!

I'm seeing a lot of rejects against current mainline, so yes please.
