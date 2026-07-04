Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88C37107E
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178454; cv=none; b=F/pitBy9MM+VEahSzT4hQW/EeEKwyFgYIBJ7u8H/f04XJ3TmKIPe6K7ZrkHZjz7SheYSwP+soC78BMvRE9WYLNllVNT/CvH3W4fJxfsCjVaJHS7yzcsxHoDI+xIjzhbgZWBaJScQyQy4/0E1derHxcbwErtw3HCWXvySJChyvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178454; c=relaxed/simple;
	bh=Y6OjLgwf1hD05luU0nG9KnzaLwYq4nvYmDa16dD8Thc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rNfR+N46o4BAG0frF/MMAKuHf7vazcphAUl/JyDqKIQSUpDlRyvE6NviQ0mQxkJzy8zJZBUaW496Tgw8wektXPHmptsGhLUmN/qeOjRsY3nedVWg1dQRWkdrtPn0u2fACHYaFBzYh/42kSgSje6Ts8uVuiEbChZTvNUQpvmXsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ph6SSIIc; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ph6SSIIc"
Date: Sat, 4 Jul 2026 23:20:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783178444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=Y6OjLgwf1hD05luU0nG9KnzaLwYq4nvYmDa16dD8Thc=;
	b=ph6SSIIcNTkkN2sPqfEiFamn+YuBbcgQDC5f5/6WwIXVOGJQz0KfS4KcBnmq1N+nfyHRu8
	fYiaEBxkmjxcQMPbXw+aj3TjyhoeUpH3BH8/UrhW4fRgc1CYei31ZPinX2cE3tKnJouIeN
	ALkTFZ2Qx0ES9qelQnfAI7u4HumkvmTYFJsUquV1iRT4rDMLhsoGwC8v5w8QTxnzlncS7t
	4tfC+Y7CPTI1qUwz0GQ+xy0f29hnPIouaD/EZtKJeLUTs/MYvWNWfhJeo2CAoaU4y0vVnI
	gVWUAsUGHdqcCfT5sLWEw7dQrsXCpLYW+jtIFGyj/ax/OPmDfGDDPDe74tt3vg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Yan Zhu <zhuyan2015@qq.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, mic@digikod.net,
	dzm91@hust.edu.cn, skhan@linuxfoundation.org, gnoack@google.com,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 01/10] docs/zh_CN: add LSM/index Chinese translation
Message-ID: <akkkxFku6Jzx6Cjf@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781105672.git.zhuyan2015@qq.com>
X-Migadu-Flow: FLOW_OUT

Hi Zhu Yan,

By the way, I could not find the cover letter (the mail I am replying
to) on lore.kernel.org. It seems to be missing there.
