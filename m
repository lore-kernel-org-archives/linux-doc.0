Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E814BF97
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 23:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231729; cv=none; b=oP3cFmuXUG447S8iKpwAaQbmmJ7KUz5542CY8+4/WsZtJU7Nuv0Byck5SxDEmaQ/auZNfN8hM1Ok6vYVf9TtXYD0BwgRHlDdQCQEf8u6XvHiOBiQCalMpRTEsISJQwos38UNazG8K/LW41n4uxV5oOp1/6TgNCXVRKs6SIOWlek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231729; c=relaxed/simple;
	bh=Ilyjo85f7onx9tWBXt9rZLT8CZ9Jv+yA82mXup4APq0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sT8ijoSGKQQMfnUh4M0duE3eQp4nvKcZR76gvwTnBxlshjPwBd7yEm2Tc/hNjyDk2PN+g296RHvfmrtjPnj0lSpMT665aRVl9dXkEBgpj3V8GxiJqUASsK/ue+STT+SJvd4K8QEgnkJFrQZ0+5TZHjb+njAnIcQR0/Mr0qxuCZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=241JEdOa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="241JEdOa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yCaJiNeKrBO3Fq9N5fef8FC4MUG5tRPdi7pGTI861U4=; b=241JEdOa4eOwMQQ5pOyhrPJ0ru
	vZNRH2wYOeXR/S5jjsNwCnL2NmqbjxZiI0I15PjSqcQBwQkTyKsHm67HF/HjlhPowZa65qqr5+uew
	tGZI66anfo6jtuvxamekOxAXfL3u5isOyE222OWWoAXk9L1G/M8b6Ezw2qD6tdsLvYSZ/zEn0HHVQ
	LPCuLpMiYseZ2jhx5+gDnaYhiiXtpkqGsXpF+Qkk3DumAOc24hfZClQzWj2fwT/Y/1y/TyIna89yb
	E8/pgqnVq/lDKmQYdP5psmh2fsrYgSHu8Xb8qyqDk6DrkGqIIFIjQvXGav/34hg/9YImogRw6WHzq
	Lx51vtuA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPTRu-000000031Xy-0wvm;
	Tue, 19 May 2026 23:02:06 +0000
Message-ID: <0cf8ea5f-418f-45f0-907c-3d1ed4f03e9f@infradead.org>
Date: Tue, 19 May 2026 16:02:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Shuicheng Lin <shuicheng.lin@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [regression] kernel-doc: on struct_group_tagged
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shuicheng Lin.

I have hit a problem on linux-next-2026051[89].

I bisected it and the bad commit is your recent patch
commit 46d9c16115cf (HEAD)
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu May 7 02:32:32 2026 +0000
    scripts/kernel-doc: Detect mismatched inline member documentation tags

which I tested, but apparently not well enough.

Both "make htmldocs" and running
  scripts/kernel-doc -none -Wall include/net/page_pool/types.h

give these warnings: [*]
Warning: include/net/page_pool/types.h:105 Excess struct member 'fast' description in 'page_pool_params'
Warning: include/net/page_pool/types.h:105 Excess struct member 'slow' description in 'page_pool_params'

due to the use of struct_group_tagged in that struct.
There are no warnings from this header file after I revert commit 46d9c16115cf.

Please look into this.


*: Both of these warnings are duplicated in kernel-doc logging, but that's a
different issue.

thanks.
-- 
~Randy

