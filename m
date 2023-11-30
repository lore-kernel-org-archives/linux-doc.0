Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a27xugt2"
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259E810D0;
	Thu, 30 Nov 2023 10:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qQKU50vKbXATuSXglJgEj5fFzmKu+YBO07b8qJOOdtA=; b=a27xugt2s7VCRZavZTnsN7HQZG
	49KGSFnP/lAr4dvK7i3HDJ4RMmY5/nj+Q/JtVwbX2EuSbtBP1TjOeJMiHUf17uTVAJdLo1VZZ8F7w
	f71Vg7/+DA5n6sUIJ030PbPVYq4bFV/2Q2Ch0CQ0wUYSClwjbvJxHySEDNe+p12tTfX4vqeMoQWG/
	RhpFELpiLJn1M+ZCQSbXXoxilSLcvbQDkXyKOLFhzt6YooPUXC46hvY+yy3pK5WjJBP/Ib1g29m8f
	ILI8SIpHjF0/ndrR5p2Q8uZNWd++lBHHKEPQf23MjpSx3hP2l9JhKT9Be1BvgumVRJd2JPK/YsJ32
	OHAR/qMA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r8lss-00Ek8D-29; Thu, 30 Nov 2023 18:35:34 +0000
Date: Thu, 30 Nov 2023 18:35:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Wenbo Hong <wenbo.hong@vivo.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] f2fs: add support for an i_version counter
Message-ID: <ZWjV9obu2mvBfXbk@casper.infradead.org>
References: <20231130090413.1291703-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130090413.1291703-1-frank.li@vivo.com>

On Thu, Nov 30, 2023 at 02:04:09AM -0700, Yangtao Li wrote:
> NFSv4 mandates a change attribute to avoid problems with timestamp
> granularity, which Linux implements using the i_version counter. This is
> particularly important when the underlying filesystem is fast.
> 
> BTW introduce a new mount option to enable the iversion functionality,
> and disabling it by default.

Why do you want to replicate the mistake made in ext4 and undone by
commit 1ff20307393e ?
