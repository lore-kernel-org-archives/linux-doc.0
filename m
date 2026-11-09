Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185064;
	b=pUMnIM38N3Y/Cg43zJtCy+mj28p1Yec/fUHEx3sIigUQdnd5rbYswXe9rj9gfpmsqVYu
	 5VEz0xb8AApLZShCw/TyU33Qz4AEN9kC+o7hZBj+67tMwe8qv7pnscHWCfC9WUh7Xn9Ei
	 mVOmxkcdCFXhQ1IAOc7aaHhN+pbOre5Sz9R7RVd77CHIQjDZC7+9oDlkaGRI7Uii7J5UT
	 FYirHMUC0YVgXU6unb1UW75IBtzgjk75RO4jxn+y98Hxzi3tWlLRBizebyAbqgvdFSBNC
	 E7dVIBbVvVcpwfBlo1P5mzJQ4m0NR+/wi6xMnUBDo10kq0ddrujqQNAK/YIza5dm4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185064;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WVK9754AbhaserE7pDTK8lkgwdfKH+RPdCklp4kneDY=;
	b=Rkv9/VPqWRl/SoVOgcnetAQXtT8Fi9kpsXL6Xg+jqr0fpMY32JCJBoe1a8p1ifeqZn3N
	 KmOEpDipuCbsmhGb5MMqz70P4s7IKhT3tLDybdAKJqPmU6MzoM5o5nf/TwYAc8fkF2ZF0
	 m3PsaLXu8Bhgssa/MRWuUGibTNsKIhpizEIGWioqOYtoekY9l1c1FUU7VXDOVm0TsgAZv
	 gGLtM/v3TYfir9LA0X8PTi4agIkHn39CuJy5amSXHljgGTiin6D/D/E/rw6arkU8JqTnr
	 m+47Tpv9u8dEcq1vvtL7FdyVqKRBpnetnRWoXv+llVE8X1bTTJFQltM/kpZFALoFIWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=rPIPj2Rp;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002AD606A320
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 00:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 002AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=rPIPj2Rp
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Iw62ApeDmEE/KzKDeztGmiVXNKB2w6E2fDgNhkDlzUs=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794185054; v=1; x=1794789854;
 b=rPIPj2RpELViS5mCCRWc7ht3wCIOMKmwBDBgzM/0teT2lCFY0EytB8XbBRT4/2d0P0wnbNCH
 RlPuG5oOCskR/xoXbDm4Wodp5ve6FPkfpq+sFcOCrQz1vzTTZ2i+OoZQropGfO5AXPUFSxn92zK
 HZg1YkoqdQoQ8MbtZQE9kCzjZ7/vFRp5uDzTg9q+vCCglBkCmWBdMZ7Nqvx3y8AmDSf9Bjj1mnx
 +CQyOl25TQ8kBpXvpWDh9h++IlXBCmCGdiueaOM+fAh/GrDK4/P7DvSTl8nSeaijskTdcu9N/Qo
 LZWrtsjxd1J7Sbb50koea9LgPqgMeNNwhTvGLPq9rO+Gg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15d0d0b0133836ed;
	Mon, 09 Nov 2026 00:44:13 +0000
X-Mizu-Trace-ID: 15d0d0b0133836ed
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 08:44:10 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] docs/zh_CN: translate AI-related process guides
Message-ID: <avEXWkPrGugQSQX-@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794153793.git.dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Add Chinese translations of the process guides for coding assistants,
> generated content, and the kernel threat model. The final patch updates
> the coding-assistants guide to link to the new translations.
> 
> Dongliang Mu (4):
>   docs/zh_CN: translate coding-assistants.rst
>   docs/zh_CN: translate generated-content.rst
>   docs/zh_CN: translate threat-model.rst
>   docs/zh_CN: link AI guide to translated documents

The last three patches seem to be missing.

Thanks.
