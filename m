Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A8B210F;
	Thu,  2 Nov 2023 05:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mEu8dVVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76153C433C8;
	Thu,  2 Nov 2023 05:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698903730;
	bh=pJZ36zEO3yx6FWfDREAzB7mL2MkuS88AsB3/3YMtXUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEu8dVVI4DwCyVt4aFPqCSPKbEZ/7D2f4ksKUcfRIiCsEs3NpG64sgdDFEtCNtFjA
	 CnBsrSXA849nN0Ej7vCGe1zEo5Z2lvHhXTvOLp9kwvtLvVS7E/e/+UQjNbxmazPrlL
	 396y6PB0Gb0SjwTZxr2RnUZTJ1/E7Ujff3pAjXpE=
Date: Thu, 2 Nov 2023 06:42:06 +0100
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
Subject: Re: [PATCH v5 1/1] mm: report per-page metadata information
Message-ID: <2023110205-enquirer-sponge-4f35@gregkh>
References: <20231101230816.1459373-1-souravpanda@google.com>
 <20231101230816.1459373-2-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101230816.1459373-2-souravpanda@google.com>

On Wed, Nov 01, 2023 at 04:08:16PM -0700, Sourav Panda wrote:
> Adds a new per-node PageMetadata field to
> /sys/devices/system/node/nodeN/meminfo

No, this file is already an abuse of sysfs and we need to get rid of it
(it has multiple values in one file.)  Please do not add to the
nightmare by adding new values.

Also, even if you did want to do this, you didn't document it properly
in Documentation/ABI/ :(

thanks,

greg k-h
