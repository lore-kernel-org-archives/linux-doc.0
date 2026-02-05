Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E728371
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770254124; cv=none; b=WBQQ9t6gVJ2twtcMWIaBIjLbIyYs1WvazeUR/rLP9AxtdWJBrVjNuot6cF8vVYGRIKtqQwQHspCTcLHeAZt6VYfPOG9aykdg8uPzmfX5SErEaTefUN0sQKn3r4Xq4cLxj46uai81rLOBVHJcWstP9pW8tY0wuJW1ad4WMDGENBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770254124; c=relaxed/simple;
	bh=9ZSFYM9VZ4oK1hQjLtZB+I9MVYbAaxxvSNJByCby+rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L15VCtHbDA7k+3y3LVgDjdRJLCb9OECldn5/Uw1tefJHOjihl6i1GW87PZfPjD5fhUTMjy7WgswgIcbMYwQzCsP0fEOFhHFFF5mP58NZgx/2UQVIm1aiwroZYhRP89Y11HEeBCiHktQP1e+UMyxwjBsEDcCWm9oMXWJNBGWpu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pQ/xTFyF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pQ/xTFyF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fzciBs6GhQsu/Vz0cvaYGhXbCWVxclkIIErpiKMxU7E=; b=pQ/xTFyFb1xYXouvFw7RM1k05M
	lKUEZQF6bZP429cDDJMJd/H/GgAuYFr3g6HA4JGigJqliRXKZCvOQfIKa+Tw2mTjVHLQFlQYqQIH4
	qCH/xtew7lfg11ERPzOFEHkDu9KyoJC0eq2Cqku8DBuQ5QDUw/mIvEDlN+/cr4SM25tnj1FZCuzKM
	cWQzGr1Q4KVByIoYdYsLsCYXf/ju351g4QM4R8mOF5qqN5barBJO8NxZ6lhqRdcG9M8n6BiQxZAzb
	45hIDZn9ew8+tcngeLNSKGZIVJMy1kp5rptWLPTdqvowgCXeTrSlyrPo2Z4DmMpZ4whlOjgEL0fII
	2oMH7gzg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnxp-00000009Ft5-3NJs;
	Thu, 05 Feb 2026 01:15:21 +0000
Message-ID: <761e2297-3481-4df6-9ec0-7fc6fd919797@infradead.org>
Date: Wed, 4 Feb 2026 17:15:20 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] docs: pt_BR: Add initial Portuguese translation
To: Daniel Pereira <danielmaraboo@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20260204113210.185221-1-danielmaraboo@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260204113210.185221-1-danielmaraboo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/4/26 3:32 AM, Daniel Pereira wrote:
> Introduce the initial Portuguese (Brazilian) translation
> for the Linux kernel documentation (HOWTO document). It establishes
> the directory structure for the pt_BR locale and adds the official
> entry for the pt_BR maintainer in the MAINTAINERS file.
> 
> Additionally, this version adds pt_BR support to the documentation
> build script (Documentation/sphinx/translations.py) to ensure proper
> rendering and fixes the documentation hierarchy to avoid orphan file
> warnings.
> 
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> 
> ---

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
