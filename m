Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2893BEC9;
	Wed,  6 Dec 2023 02:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bX2eZiVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC5DC433C8;
	Wed,  6 Dec 2023 02:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701830175;
	bh=jl8ZgGJcA+2u2wRfb7gRBaYrQkwzkFENKH/0Cgo3FZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bX2eZiVpgXQ2pNi7+lhIJhnsL8/i3CVmd9OAdZAcCaDfvL/BtLey7fmRifKPSg7Bg
	 2hUAWGrF7H+dDWBTNLONt5j2YJbvUifsT+6kpK+DF7W0K9ktJU7yfkhiaQLPGRz0iV
	 hhmoaQ4gLUI821DvgDIAiSRVCc1tEhKyy+sSjmOw=
Date: Wed, 6 Dec 2023 11:36:10 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Sourav Panda <souravpanda@google.com>
Cc: corbet@lwn.net, rafael@kernel.org, akpm@linux-foundation.org,
	mike.kravetz@oracle.com, muchun.song@linux.dev, rppt@kernel.org,
	david@redhat.com, rdunlap@infradead.org, chenlinxuan@uniontech.com,
	yang.yang29@zte.com.cn, tomas.mudrunka@gmail.com,
	bhelgaas@google.com, ivan@cloudflare.com, pasha.tatashin@soleen.com,
	yosryahmed@google.com, hannes@cmpxchg.org, shakeelb@google.com,
	kirill.shutemov@linux.intel.com, wangkefeng.wang@huawei.com,
	adobriyan@gmail.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
	surenb@google.com, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, willy@infradead.org, weixugc@google.com
Subject: Re: [PATCH v6 0/1] mm: report per-page metadata information
Message-ID: <2023120648-droplet-slit-0e31@gregkh>
References: <20231205223118.3575485-1-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205223118.3575485-1-souravpanda@google.com>

On Tue, Dec 05, 2023 at 02:31:17PM -0800, Sourav Panda wrote:
> Changelog:
> v6:
> 	- Interface changes
> 	  	- Added per-node nr_page_metadata and
> 		  nr_page_metadata_boot fields that are exported
> 		  in /sys/devices/system/node/nodeN/vmstat

Again, please do not add any new fields to existing sysfs files, that's
not going to work well.  You can add a new sysfs file, that's file, but
do not continue the abuse of the sysfs api in this file.

thanks,

greg k-h
