Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFD2BD04
	for <linux-doc@vger.kernel.org>; Wed,  9 Jul 2025 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752024718; cv=none; b=gybwEDIyyyfYnEVChGrwUTPSjnH5GE2gqA3mH3NEowzuieOlU/xir7gFszdCEeCC1pxPZEjLfBZYr5b8cWyriRoPLTRBOV7KQ8rBzD5V+ld5wYZUzpyhyNViFtTfXI+bd8s80dWGDmJThmU+mHYs4twu1RtMZsQe2wUFeBrPCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752024718; c=relaxed/simple;
	bh=KFl26dn74xcPzqVnC+TacdMw4jlgqTvGdVWqyNFdEKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiAcO6GvFRFYtEQ9y+MpTxL8Cn3wK/YVkTRtjikX0VmTLZani1Szj5dcZbc4E8lOyfrcnFVsOKynl9TCuKQCeNM6AfhBYiMeU/Cyx1Y6A6z/zVBC04Q4itylQY001yVecgWmN8zpHtmZ/ts78siMVG1KpCPDpEgA7bnb4n6XXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T37n72ZP; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T37n72ZP"
Message-ID: <54ecbf0f-43aa-48d3-a9f4-cdb5a91df43f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752024713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JldG3Vx/qc/Jp3g/vzqezwFRQUbZUNNohDOd+AuYyj8=;
	b=T37n72ZPfWCOC8pbAeuQUfIaQxEsxb8WSlp0oSFcORzLY0UZKnfbQD/LUeL7L4vJ08/HXY
	TB7uw/mhugBei1N95F0hud8kpZ8sPLaDpHKcTS2u3KAlShFipXSFbHBbFjxqtl//BiLS8a
	pamLeWGmlrU9pQ9wFpyMnDF54V3//Gs=
Date: Wed, 9 Jul 2025 09:31:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] docs/zh_CN: add chinese translation for scsi
To: haodongdong <doubled@leap-io.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250708024139.848025-1-doubled@leap-io.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250708024139.848025-1-doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 7/8/25 10:41 AM, haodongdong 写道:
> This patch set adds Chinese translations for the SCSI documentation.
>
> haodongdong (7):
>    docs/zh_CN: update subsystem-apis.rst translation
>    docs/zh_CN: add scsi.rst translation
>    docs/zh_CN: add link_power_management_policy.rst translation
>    docs/zh_CN: add scsi-parameters.rst translation
>    docs/zh_CN: add scsi_mid_low_api.rst translation
>    docs/zh_CN: add scsi_eh.rst translation
>    docs/zh_CN: add sd-parameters.rst translation

Your patch set is not in a thread, and it should have been v2. Please fix these issues in v3.


Thanks,

Yanteng

