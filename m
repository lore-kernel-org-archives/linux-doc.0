Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA393033FE
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077989; cv=none; b=L/Kc098EFyhkOXmzY3FXZdMQC8qtD3Jd7FVVFCgsmrhjtF3161+HaG7R+/M4XsPSzFAM0p1EKakmVOdQhiaEjAE5XIoTokH7N6x7ITedUq+jIgcK6RvMmRdKNFsUSq68fhR+r25eeHNXFDFzQwwIBbBzE11Rz7b13MKNi5pEcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077989; c=relaxed/simple;
	bh=fWewF82pb6xG765qHgjfF8s0GvsPUS9ldGA1aMeSL/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/Ov0BqiG6baI2n00hqpye50gkMLj+78EPdxFPAgX8GwNJpUnphEcyhCh0Xh9KmpVmA5W908B9K28NfhROVM9ZtzJRvAcJtrLZuA+DeB6PUX+5T1tlaHh24MsAUCtMSOAmW+VC8nUajBMsl3pD4SiXeQkCrbxK7QZwLPuPLDi44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=oHFVzPYP; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="oHFVzPYP"
Date: Sun, 26 Jul 2026 22:59:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785077975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o9Rf46Zt+9jKWAn30PG3J8rLQwiufgYHNrH6kksEgb0=;
	b=oHFVzPYPcSxzi5KUrCKXa/5B0m6ECtz1Lw3SUjeY70YHpvVvYLHPMrnlqRlp8TgDTjr77E
	bhB+njDqjP7h5ciTV+R47NqzR6GG4LLJi2O2fYS1El0fpHmqw2aPqx5U2PbipCow8YrKtf
	3qMOjaj62VilzaZ2XWB+SU/ejhui7g8H9fX+tJk05r+9kIyks3uc0BhOjOKIDcox6znekX
	fbk78wv2a2wYUH6R463wVmJ7MDJsonpK2bX4ky5aGGzJ7yv8Be3VPe1HxcFuhu8nbkRFyN
	e+DZDWlNx+AALZoS6+b8O/ULeZ33dGz72WjJg2D9wFnbw/cmkmfxCYrpccOOLw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Siwei Chen <anka@stu.cdut.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Siwei Chen <businiaoanka@anka1.top>
Subject: Re: [PATCH 0/5] docs/zh_CN: Add Chinese translations for five
 networking documents
Message-ID: <amYgxGgd12VricV4@wyuan.org>
References: <cover.1784866896.git.businiaoanka@anka1.top>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784866896.git.businiaoanka@anka1.top>
X-Migadu-Flow: FLOW_OUT

Hi Siwei,

On Fri, Jul 24, 2026 at 01:13:36PM +0800, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
> 
> This series adds Simplified Chinese translations for five documents
> under Documentation/networking/:
> 
>   - team.rst:  Team devices driven from userspace via libteam
>   - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
>   - driver.rst: Softnet driver issues (probing, close/stop,
>     transmit path guidelines, and extack error reporting)
>   - ipv6.rst:  ipv6 module parameters (disable, autoconf,
>     disable_ipv6)
>   - secid.rst: LSM/SELinux secid usage in the flowi structure
> 
>  .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
>  .../translations/zh_CN/networking/ipv6.rst    |  76 ++++++++++
>  .../translations/zh_CN/networking/secid.rst   |  24 +++
>  .../translations/zh_CN/networking/sriov.rst   |  31 ++++
>  .../translations/zh_CN/networking/team.rst    |  16 ++
>  5 files changed, 285 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/team.rst

Since you have updated those files, you should also update the index
(toc):

  .../translations/zh_CN/networking/index.rst

Thanks.
