Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219431C4EFC
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724770121; cv=none; b=s0dEXATJLpYa1YErn/ClxJS9EeWC8sRstrKG50shUk8t3dUp0/sbth2X+yRwad/SHz6hkhbIEtnWlnyh51Vkk8SKHFGlyFEsoCn5pBehWSJdKpZA9BJQwITd3ZSR82QSBUPeKMXF2uX/u6GNxW+9hyAEcRHZlJUAe0+4RXgT8JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724770121; c=relaxed/simple;
	bh=JQ2i6+ZE+C3OArn0Etu15ICcBIyuw4N4jsuWq3wPmAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifG4E9KqcGF8cIjmjW0wZMDla9nq8aLs3SYRratfLAm8gdMd6M7nqXB1Xy/LOnnX0rgxy9V8Ux6q/+cVIRkgF7a/b5LIkulYZF/zs1Nf3/0/ZOhMm8F93a/CP9TAdS+9V2rcgCS2Zm6B8QDdKx/BJA2L8Vh5JmSAzWidIAiWg0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sAgNHgg2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sAgNHgg2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JpeUfhJ066NoVjAtiWEc4jpX0LD7bgV5ptOgJ6sSru8=; b=sAgNHgg25g8hP9eHC+2cZepzHX
	hhxVefH9LcKmDrsYU8GN9u0O7nw2ScDMeLJ2PcUtz8ou4WIiWo6Aynq9WPj8i9ZL++NbHEw+gUl3e
	GeoTK/QQF+AJwjl1akA/bDdPPqYnaaPiNGwq7fTMf0C14PdOJHpu+MVHlWnmpH/jLg2XlEipkc0f1
	LY1KaHxRWUYL1A+h/WqJ3oPk1WyKgvAoS7D3wfjLr31JwV23eCOMb9QYR9UCK6As0EaK6QgD5jSQB
	dbKxfhu79h0V/u2FMHiT7ilq0NcwJY0Ng0iIQjI1uaDLjhmngCPX2Lymt4KjVmCD1IP6DQFzu9AYA
	5119UqWg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sixUq-0000000GxBj-177e;
	Tue, 27 Aug 2024 14:48:36 +0000
Date: Tue, 27 Aug 2024 15:48:35 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Marek Vasut <marex@denx.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-doc@vger.kernel.org
Subject: nvmem: Fix misspelling
Message-ID: <Zs3nQxwycafk75MX@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is no function called kstrbool().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index aa89adf18bc5..0ae8cb074acf 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -11,7 +11,7 @@ Description:
 		Read returns '0' or '1' for read-write or read-only modes
 		respectively.
 		Write parses one of 'YyTt1NnFf0', or [oO][NnFf] for "on"
-		and "off", i.e. what kstrbool() supports.
+		and "off", i.e. what kstrtobool() supports.
 		Note: This file is only present if CONFIG_NVMEM_SYSFS
 		is enabled.
 
