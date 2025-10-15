Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE2527CB02
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760564973; cv=none; b=AqAxT50ATk/HxA92LXjkfXKSdVGDH8/r6/4Wqm27kalqNA8UWshcKiBaRwOzsG/DBF+pe3dIB5ik9XSiH5xUNdWRW7mYBZeppUs0LxvPz10Q8zaZIW4gvfey3KUJJO8sxbW1ks+n6eseVfwQPSZ3ATpWRlXJocbtI9tjeUIpJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760564973; c=relaxed/simple;
	bh=EoRCe6Pyyen/Io3ZvFoH2+JX9xUKteYOTSQZqp5w3Ao=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=eh7unIo5JeYpwocM/bywHoNf77fqifVF+DLqhiBVrjpOb0dS1BDr90AUnGotyA8NfIxUzfFKE6e1RFZpNkJ0OpFfnlJBEVwW7by6SeX3oisBmqkfpwShOMa3GhfjqH/E+alKZ+2iblzG96FxSst3SvY2O9Vo1x4i5YJIA0vfqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T2nWEB+i; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T2nWEB+i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=l0jB+QOXXu75H05VJW6TBjS7jgk0jja83EECFCrFHqk=; b=T2nWEB+iKvXbfFVzfVq6CwYiIR
	lM+RyRgdVKER0LlWF4yXtnlIEiPqQ6eYh5FdSDgeMdSv4r7LTD3TJrUjPTcP3m3zHror1Vpxaasj6
	jCIijxtsxULcDwm7QQqp2+ZoNtzaSR/VJYAOg6pCyjS0Gf5YiRn2EGTqHwwsZ51mEpgQfh/kA4Xkt
	9tC0dzxXZk7DraTNDCkweG6ydFZPtQXSCovJEoN6BOAJlExxMXrtYav748R3bJTm93UGDrhazWoQS
	dI+PkQ+ST7ZkFOsmLpgLlfV8h/QCZQPzN3x56sJrTHfnJdXGIsKMgQkfnGXvpx1GytytM8N2Treir
	DXrDSE2Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99ND-00000002yMY-2zFc
	for linux-doc@vger.kernel.org;
	Wed, 15 Oct 2025 21:49:31 +0000
Message-ID: <9391a0f0-7c92-42aa-8190-28255b22e131@infradead.org>
Date: Wed, 15 Oct 2025 14:49:31 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: parse_headers.pl ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Documentation/doc-guide/parse-headers.rst talks about some
parse_headers.pl file but I cannot find such a file.

Is there a replacement for this documentation?
What should it be?

thanks.
-- 
~Randy

