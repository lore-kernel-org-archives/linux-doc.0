Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB24B04AF
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321290; cv=none; b=YslNC5QN8Szax2lFJACxW/wZYsTnpzc/ZzxFKFHScF6ei0/oJk46EE2UvU8A77qfk0Tl24nB92MpoKSko9ND60IXHDQhVgweoHI8AucdQTF8j4fGbDSsMyp+eAJbGreLgplwdHs34CKGEAT1oUni520ZQ4+cCDTVo2wuFeTIawM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321290; c=relaxed/simple;
	bh=k+/kQlnetvSfqOP5trOBmET8Ib2hhDhSJBN7K/IVOx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bb/qqoVGBYBkx9gGrAQZwIAktbWzl2Pt120k3zA9kGdKw5RoBOoPLl4SuSDK2iNpizXxvElQKqf+F60lGaSN8Oj4iSWqYaLxJH2XmpElT/lbBz+CEHq+ufZ1rGnJFT+ISOcFAN6jqR05rRDuMi4smb1SpQeTXvqVzF+kCGPOcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ACVAHtQa; arc=none smtp.client-ip=95.215.58.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ACVAHtQa"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k+/kQlnetvSfqOP5trOBmET8Ib2hhDhSJBN7K/IVOx8=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787321286; v=1; x=1787926086;
 b=ACVAHtQaR3K2fH5mj2WzRe3wgj3aHSf7MfXL7woj8xOv0Rh1YfIwpF8aycEUP3CLFkQyJmJY
 bvcX3j8jGLDCQQ7hgFKEt+cRLMS1scdGmF3pT6Ohs9mTDa1N8fzCEML+LphfOzcEVGbBJTmzDF/
 tP6m3ZCUriXXbU+wwJWPfzdWiMG1ittnQR2fm0pJQYR2V2q7GfMDKz9dIXFj/NTtmi55Sa+zC8r
 Z5O1mI9cUapx19B9xRNgesdfWbNsbSMZm3/1dKhdK1QkcJYbIzpM2PcmL8ZsGMoPaXPcrE6pGRm
 R9yz1RUXb/aJfp/VfQa9iHYIWISpXxI5XmtEv+k39h6Aw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 60b579309e1cdb74;
	Fri, 21 Aug 2026 14:08:06 +0000
X-Mizu-Trace-ID: 60b579309e1cdb74
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 22:07:59 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Siwei Chen <businiaoanka@anka1.top>
Subject: Re: [PATCH v4 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese
 translation
Message-ID: <aohbv4ebUW-yKmyz@wyuan.org>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-6-anka@stu.cdut.edu.cn>
 <b45c6389-a048-4a94-8649-ab0c5a80fac2@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b45c6389-a048-4a94-8649-ab0c5a80fac2@hust.edu.cn>

On Fri, Aug 21, 2026 at 09:29:06PM +0800, Dongliang Mu wrote:
> 
> On 8/17/26 10:13 AM, Siwei Chen wrote:
> > From: Siwei Chen <businiaoanka@anka1.top>
> > 
> > Translate .../networking/secid.rst into Chinese.
> > 
> > Update the translation through commit de1fd4a7b0f2
> > ("docs: networking: convert secid.txt to ReST")
> 
> Two small issues in this patch:
> 
> 1. revise the commit title: SeLinux -> SELinux. You may miss one of my email
> -
> https://lore.kernel.org/all/e98bd534-4496-433f-9847-2c5040ecd315@hust.edu.cn/
> 
> 2. I observed one small inconsistency: flowi structure and flow structure.
> After searching, the flow structure may refer to flowi, flowi4, flowi6, or
> simple typo, no matter what it is, let us translate it into "flowi 结构体"

I found some of the translations here ambiguous, so I was only giving an
ack. (I'm not that familiar with these, too.) So I predict that you or
others will have some comments here. ;-)

Thanks.
