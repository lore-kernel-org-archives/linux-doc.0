Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20796111BF
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749066775; cv=none; b=LVnJpGxIEQAgJSwyxrwEEtc5TLK3goYE17OvjGb1OE9EWDCctkybXj7KZ9qIvh6ZFVMeTESWDenCj06ASbaGd+svnkbErOvboEqRtX2F9db71RSn5y7Mjm7q0U4YB7qIeqwvGPusnje4uJ3Qowu2nGQ7vZWpPAU0VT0fYnPF9HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749066775; c=relaxed/simple;
	bh=ij0J7npjDkSgDm/h4odv4H1o2b0zOcv3u82N+80/s8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELM87fkCHD4nBBA8PccHvSoZDmUdrjORH5Y05nOWz0rOmJi+wBojF7NLocsc/YSaVraC+3RCSl9xwtueCTQGL5WcpdFE/S7xzcJknRuRiFi4WcFo5hwNv3e1DV0/uwKPkzs3Yso9PLsoJqmaFLf5CKxaPfBUjabnpmPzyLnjYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CW1xW4rQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CW1xW4rQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ij0J7npjDkSgDm/h4odv4H1o2b0zOcv3u82N+80/s8E=; b=CW1xW4rQSB7pX2QOiGNl8G9nrA
	bJN0is/EZ7teRn286JW0IUblwk/ibZzpMUpGipj2XTQgT4uxf56FmtzB4Lw9iBaBpvGv2ums/XRh9
	mgLxLDPb8XMsZTW1lDd71RDuOeT4bDLPx2i0XnD2xwTeGdpFlf8TfAS6wNmLsvZQ+zYbfOSa5VHQB
	Rby7Ib0z711GFt7v+VHz2AlD21C7Q/keJsGYRM+dkg3PFqMnVKtL7PmzvRnL4dSrGl3GD+wI0lw3a
	fX6+BdBkvU9xw7ysC3og6p6a/5aqzXJeYDIJ20vvJ/T3s/l4KZPYUEEfCPWcCivcRtpoUm0kX0OYW
	izF9S5bg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuAK-00000003S2K-0rgE;
	Wed, 04 Jun 2025 19:52:48 +0000
Date: Wed, 4 Jun 2025 20:52:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-doc@vger.kernel.org
Subject: htm.rst not included in toctree
Message-ID: <aECkEJm6sl5cvcw6@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

commit ab1456c5aa7a introduced a new warning to the documentation build:

linux/Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree

You probably just want to include 'htm' on a line in arch/powerpc/index.rst
but you'd know better than I would where to put it.

