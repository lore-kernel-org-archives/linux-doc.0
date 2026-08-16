Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB92D0614
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786900533; cv=none; b=QC2FMo5oQ4parsTqIZoKRLF03ID7m+YWDdbA9F5YuuHm6VV5KEimF2QdMDnDMJg1s0pdii3F/DLVoblZCHor0s1Uns31QCbLcz9COyzUJiKyveSwpIRoYOx2wMoUoWLycubaSa2CQG4zQlT03JczeOeFXMkKmi8qOtzjO3I2zeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786900533; c=relaxed/simple;
	bh=ze4os3XF9pp1SiWOBA81JRVltPOv58Do2G5AdxS8Fpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3ZO8gObji6bm1yzK3MyXs19sXWTnAZ0MJsEFQi4MRB5iHKuzjS0eqMvtAZXy9tMG+lGVK0XsqcYwIvvnewh9mCOQ4Qeb5uE505EFCYZ9KATqfPWjVfzND9Eu5p7TETeS8GJ7HqwtsQFk5WGGk6lgBTgWzjP5nQk9XNv5U1WRIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=cpK7FHvn; arc=none smtp.client-ip=91.218.175.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="cpK7FHvn"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ze4os3XF9pp1SiWOBA81JRVltPOv58Do2G5AdxS8Fpg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786900527; v=1; x=1787505327;
 b=cpK7FHvn44KCbw+TWEcgAw5ESyZUtMJn+B8g/Eo1I1scO2capzey9MU0aCRMzvOwwK5FWy8r
 81MtrE+7ltC6rrpn94vQQvhdFziG0B+K2/XGV47UokdYuHvIQ9jQqbUFAVXlMAJG/Pc8VNKOpX0
 c/87kHpR3YpL2u9u3zGmUV6Fcee2W53H7HkSc3CNgZYnQz7Y6uGLs7mIHJwC1rti0rEcTqo7LJS
 MeGCtzQKmAqE9aCCpFduYpabGBzNCf+yDB4nk+9B6dDgwMVQzwXcyuBFlt7enBkmh9poo/zZCiE
 s6sFXhEM3VG2XvRREsDgcggEaSrITiHKaWeutEo7KXn9A==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 5231fffba115c377;
	Sun, 16 Aug 2026 17:15:27 +0000
X-Migadu-Flow: FLOW_OUT
Date: Mon, 17 Aug 2026 01:15:19 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs/zh_CN: translate
 process/applying-patches.rst into Chinese
Message-ID: <aoHwJ75gG1CcAhNo@wyuan.org>
References: <20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org>
 <4f6ab067-ed85-4dff-acd8-16c4b4b61fe8@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f6ab067-ed85-4dff-acd8-16c4b4b61fe8@hust.edu.cn>

On Sun, Aug 16, 2026 at 10:49:44PM +0800, Dongliang Mu wrote:
> 
> On 8/15/26 1:59 PM, Weijie Yuan wrote:
> > Translate Documentation/process/applying-patches.rst into Chinese.
> > 
> > This series adds the Chinese translation to the zh_CN process
> > toctree and updates existing zh_CN references to link to it.
> > 
> > ---
> > Changes in v2:
> > - Merges first two patches into one.
> > - Removes self-ref (.. _cn.rst) and changes ref style from 'ref' to
> >    direct file name
> > - Link to v1: https://patch.msgid.link/cover.1784289654.git.wy@wyuan.org
> 
> Please resolve the following warnings in the compilation:
> 
> Documentation/translations/zh_CN/admin-guide/README.rst: WARNING: undefined
> label: 'cn_applying_patches' [ref.ref]
> Documentation/translations/zh_CN/process/howto.rst:145: WARNING: undefined
> label: 'cn_applying_patches' [ref.ref]

Extremely sorry for my negligence. I removed the top label but forgot
that these two places were still referencing that label.

However, things seem to be a little tricky when dealing with the refs..
So in the end I think it's better to leave the decision to you and more
experienced ones.

Thanks!
