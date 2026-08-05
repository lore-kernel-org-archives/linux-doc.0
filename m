Received: from confino.investici.org (confino.investici.org [93.190.126.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768393F39C2;
	Wed,  5 Aug 2026 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.190.126.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965413; cv=none; b=FppHlnTfbKaal6flt46+PlxPM2xTozCJcB2Dw1lPzxZ76HoPRcbVQcYdXwpM5ZEL8Gb6y13jZM+1V00mXz/MbzmPFWl1OdOAnMjYmB8K3uQHNwR01WtppWGRqo+O8eP8Z6+Nj95XxJwMg36w5nGFWQ2dcmaDoNRFl6YxMiim1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965413; c=relaxed/simple;
	bh=l/95nk9Y8pSiFdWEEk/Q7uM9uAtqvY18LUHhueX9sDY=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=aDLhz8y5W4WIZV17dpgcUA4aofquuRmOILsNs3t5/oZ28yy6JC0jqsqg9vburhrh5J82i6W08Z1oZenZOT8as4kM1hHEdp1JGGGJKvNLyt8125iKH0hCU6NhNi3T3XGRurYdSlw6kHGIq7P/5XLQYL5vRn2wodjUvtVnQmel5X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=grrlz.net; dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b=L+rzNUyV; arc=none smtp.client-ip=93.190.126.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grrlz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b="L+rzNUyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1785965406;
	bh=l/95nk9Y8pSiFdWEEk/Q7uM9uAtqvY18LUHhueX9sDY=;
	h=Date:From:To:CC:Subject:In-Reply-To:From;
	b=L+rzNUyVKV+6eVHUUtB/k1sjmYuxmZJb6MdsBCJK05p3WFPptil1194P2W6buQGCm
	 FrKUHsH14O8DUgPcnVF3tMqvLr+ZelEoQ8l4QfjE8itz+b9HwWzUzTUDqiu/fjEE7q
	 N9fgeO182hvwgUgX/NCf8hucFPIUFJM68oJ4HZ1M=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4hFk8Z5GWsz125j;
	Wed, 05 Aug 2026 21:30:06 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4hFk8Z2CQKz125h;
	Wed, 05 Aug 2026 21:30:06 +0000 (UTC)
Date: Wed, 05 Aug 2026 22:30:07 +0100
From: Bradley Morgan <include@grrlz.net>
To: gpiccoli@igalia.com
CC: andriy.shevchenko@linux.intel.com, corbet@lwn.net,
 feng.tang@linux.alibaba.com, kees@kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, skhan@linuxfoundation.org,
 tony.luck@intel.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_docs=3A_panic=3A_Disclaimer_about_conso?=
 =?US-ASCII?Q?le_verbosity_when_using_panic=5Fprint_with_pstore?=
In-Reply-To: <20260805205026.1699568-1-gpiccoli@igalia.com>
Message-ID: <12A4F258-78C5-4238-8728-D41CB5B60D1C@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

I like this..

Reviewed-by: Bradley Morgan <include@grrlz.net>


Thanks!
