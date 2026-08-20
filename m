Received: from mta1.migadu.com (out-190.mta1.migadu.com [95.215.58.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DA8307492
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247535; cv=none; b=QXkhh4ipg8DiB3Yahel7QrLgELVNZE2dbIeQP3+tKK1Xux1j3/LZLqQrLVJ3OKogGZITpy/9lAV6SIC3jHdvZmVUDvIH7hDao9pVhsx+2VWGoCb/t7rpgzr+pmlwXOHqDcjj7UU74j8nQERpMDQcz7mrw0OoRIo6TiHDe0uWPtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247535; c=relaxed/simple;
	bh=w8FPYmlmnWINty50F0Qtu0o1O8AVvGsMbkL+2OthxIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3PkeeufQc+km2UkQP2cZ/kBMVKChlONhmn97BWXcbjRoUscOs0DzAA7yNDn2F9jB/7/HPT4v5p8kRdPCDHnwBXZCisOfB338cYoFatzxF3cBDUZjJfGV29NqnASc1GdLZ4mWLtSVPp2Dc7Iji36q2yMGmnjLTkQ2MjeX/kbM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=TvRtdHnc; arc=none smtp.client-ip=95.215.58.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="TvRtdHnc"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w8FPYmlmnWINty50F0Qtu0o1O8AVvGsMbkL+2OthxIo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787247529; v=1; x=1787852329;
 b=TvRtdHncTk3tPeTmn4EuZNcc9h+39A4k4bzpcf/KWKoxvqp4lxE3X2EtfrHE+9W0dbgXUn4O
 sfAe9LOMTa8kyeeuA0ci1J2GyZ61ZCpvJDGw6BbhIaUp1afxkcqqd/yBlTo1p5ctbZE8svlnkVk
 5r/zU6dE/ZJ2mpvYVOWvMKPdpW+6dDXACGFfhHX5Zdlfv8VTal3amdZKeMgfY2I/lSbFbhOjpNG
 rn+h11J6rjuTI82re3l50HbPLVzYohB77K+1kpPmSCRVy1zVeG4LWlAwMOAQYRbbJV/wgEp+NwG
 Q6jzXDtJ5mW9KI5KDpWCR5fKOHVt8QmVzrMRwpD31zgBg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id a1ef7f18f9ee8729;
	Thu, 20 Aug 2026 17:38:39 +0000
X-Mizu-Trace-ID: a1ef7f18f9ee8729
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 01:38:31 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] docs/zh_CN: add kernel.org trust repository reference
Message-ID: <aoc7l-n861pdN71_@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <20260821-maintainer-pgp-guide-v1-4-08e5e3602c04@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821-maintainer-pgp-guide-v1-4-08e5e3602c04@wyuan.org>

On Fri, Aug 21, 2026 at 01:13:23AM +0800, Weijie Yuan wrote:
> Add the kernel.org trust repository reference to the Chinese
> translation.
> 
> Update the translation through commit 54857c52452a
> ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> 
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
>  Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> index 12b3e8030364..f6e8ac2d11de 100644
> --- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> +++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> @@ -767,6 +767,8 @@ SSH 的信任方法”。使用 SSH，第一次连接到远程系统时，其密
>  
>      trust-model tofu+pgp
>  
> +.. _kernel_org_trust_repository:

It should be cn_kernel_org... My bad. Sorry.
