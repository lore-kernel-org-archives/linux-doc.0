Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56243B1EE2
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208230; cv=none; b=f7OGJYwyHXcxOyySSaL/PdLQYNbk8mFJs9qspbVrSx7YD+LbkEDv+tkwNsfrHZHTXV3akdeW/KJJiNPrIGXirXLK1ExRsFgw+2Ylmu5w2luh18Kf5iYXyPeUu9TOzOXeRiBf4FXcnZ9vGwT5xLvMmc2g7PhqNB39FziKxd0BnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208230; c=relaxed/simple;
	bh=Mzr9j+8X18fkAUpmJe4La87mWiwJHCl9eXzOK4b0vxw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bNT2+fEz+7KwG/+B83xtNrb38ayFgh8vMndx8KjuXbuMiNhbK3qjG+/4qRidggg1zzfMRQK4sou+ZceCpcnDG9WlOfOOABPv/uuyd1M6cW0R2LyLeeZjxQVv7Lj6kY6txWSQ8+lX1NjM9dY9cqMNFBNfBd62dZYeDNYLiXSvvU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=tU+pltY9; arc=none smtp.client-ip=95.215.58.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="tU+pltY9"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mzr9j+8X18fkAUpmJe4La87mWiwJHCl9eXzOK4b0vxw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787208226; v=1; x=1787813026;
 b=tU+pltY9LPTAK52PNVMtZ9gIzfKtZF4sE3B8zSlWl2kBGQvwhsYkpN+WwV7VuSzCNGFIDPpM
 bmaMK39K6Zp3PQyUNi6tcR4Opl1ttY6etUqCCYWofUgJJabsnM2e2wKEAm4x0S2H8EFZ7+hDRm7
 dnoDv1mro+6IRAIej4jxc3+7wVndfYVYjaX86fc+7+XeYpOoU1pqVguPxgb+2kh8UyIQ9IQ0F12
 euG/fP6Gpxx73nj+r2fPUUdkEMv+Bp6WDAE3Uum00udRbXK8G8aw3Ekk+GlnaLJ0LmAd7IAKW7F
 Ys1SLlv2XBD2TQRbHeAzZDQdaPduKx8XtAMCeCzXLSzXw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id fe3da893c8ff5ef1;
	Thu, 20 Aug 2026 06:43:36 +0000
X-Mizu-Trace-ID: fe3da893c8ff5ef1
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/5] docs/zh_CN: Add networking team documentation
 Chinese translation
From: Weijie Yuan <wy@wyuan.org>
To: Siwei Chen <anka@stu.cdut.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wy@wyuan.org, 
 Siwei Chen <businiaoanka@anka1.top>
In-Reply-To: <20260817021340.17318-2-anka@stu.cdut.edu.cn>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-2-anka@stu.cdut.edu.cn>
Date: Thu, 20 Aug 2026 14:43:27 +0800
Message-Id: <178720820738.15514.375136753647232336.b4-review@b4>
X-Mailer: b4 0.17-dev

On Mon, 17 Aug 2026 10:13:35 +0800, Siwei Chen <anka@stu.cdut.edu.cn> wrote:
> Translate .../networking/team.rst into Chinese.
> 
> Update the translation through commit aa8a6ee3e3fc
> ("docs: networking: convert team.txt to ReST")

Reviewed-by: Weijie Yuan <wy@wyuan.org>

-- 
Weijie Yuan

