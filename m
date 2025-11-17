Received: from mail-m49243.qiye.163.com (mail-m49243.qiye.163.com [45.254.49.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258830F7F0
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362654; cv=none; b=uBpJGFb49iE/2E9CNNmf4OKZbRmHy/XRtArf1G7Hw5xIrQ6X91OFfo6gR6WnyQ0R+W9N5ZDBNSUPQSpxfuEw2n6lEHo68UrifDVimbbnh0uRkjhldfZkPMpI6oAxNztv9A3ioJq9QjMe5d8p+hRaTjCM+yMyyQx35NQCpFI60zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362654; c=relaxed/simple;
	bh=V9i+6KSydyVZjj638SVQXuQy74OH0881Vmq01I0ALZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mO8TNzxoSykML37oI9MvVseHdKAu6sbXnY6s45paj5M0bSgWQHpPORIQpH3Oy5H+RxQ31hd0Qt9PqCPZ3DuTlJjdd1YzictlXUBHtaLjlnaHHwiveoSOv2nMFFe3UixVVUifDsK3poTfkHOtwhHgczR1a7sb2HMTzKxvHfBNU0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=ao7HMC9T; arc=none smtp.client-ip=45.254.49.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="ao7HMC9T"
Received: from [10.0.66.19] (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29cf6e1dc;
	Mon, 17 Nov 2025 14:52:14 +0800 (GMT+08:00)
Message-ID: <1b0c0a4c-4b54-433e-b370-a1aaf1ce2116@leap-io-kernel.com>
Date: Mon, 17 Nov 2025 14:52:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add chinese translation for block
To: WangYuli <wangyuli@aosc.io>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763350407.git.kezijie@leap-io-kernel.com>
 <147f82f3-99dc-41a2-8c4d-9cd77b471f08@aosc.io>
From: ke zj <kezijie@leap-io-kernel.com>
In-Reply-To: <147f82f3-99dc-41a2-8c4d-9cd77b471f08@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9095e5ed09d8kunm7b5578ec3e343e2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTRpMVkIaQ0hCGUxISxhLTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ao7HMC9Tj8FewXyjl2kdCrcJXb9C6T/azv2B0HOMlVAyUYqXUgxQIpJZXQhEUyAnY8JhDc+CdUtV7rud0/ai2/jOaGhCVbogXJdEzwiAx6FaBAcrsysH2hHDU9MI6CmrCrwZpNBsYqyaGZ1bkYIj5oTigToFcJ9PusOED6IIy5ZlcaxncxglQn5oyB0pbGjr7gwZutFGsrpQ559G+GUAHlsDU0v8yk2AkRmi0zoeFyfDyYJgF/g90XUG7jKLfxaopWMOB9h51N/VwHyyZAVWupOfR2Hau9FYJt09ea9mZ6IofdXqns+DdBWxzFSz/hmBdUKC2oO4AhPwDlDIQS2Qig==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=gPrtAXb/lv0B1VNGEOlOShqMFqxHKRWRD2jRYeHji9g=;
	h=date:mime-version:subject:message-id:from;

在 2025/11/17 13:45, WangYuli 写道:
> Hi,
> 
> 
> The entire patchset looks good.
> 
> Please feel free to add the following tag to each patch: Reviewed-by: 
> WangYuli <wangyl5933@chinaunicom.cn>
> 
> 
> 
Hi Yuli,

Thank you for reviewing the patchset.

I will add your Reviewed-by tag to all patches in the next revision.

Regards,
ke zijie
