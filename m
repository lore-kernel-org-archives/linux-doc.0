Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F493570AD
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783266735; cv=none; b=O8UBnGKnZGkAS4G9EpqaBP6B2Z+yVSGABvpCnq6Y3JgW6Pv/Zm+LuSKeotTHIdtsPtZJ1W93UKfZ/9sQiOAqdJnf8lvTZrYOPio/uKPXLC2bJl+BJpMfmXUZ9j6bjJgRYslGPDhMjYSP7+1RJh34OfeygQwcVFGTAaZs4kQAZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783266735; c=relaxed/simple;
	bh=KbbfmQRILq1lPvg8E7yNAZ2q6fUnWWh4wnDYC8ou+i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkD7ZrGXMRacnMjyj4nLvVjwBZFGMke/SGO63pmM4oou8aeZ5RAAn6BLBEVE8z7FHuy3x601i2kmN/e6u9ArfG1eBjnCs+BQv9W3hDS6aTI8wRg0x3fy31HELIebWA+JTG7BXudvHwpS2DqlJVsUOkA79Ljl3pvyXi1Ee89QqSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=v1m5V3LA; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="v1m5V3LA"
Date: Sun, 5 Jul 2026 23:51:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783266722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDcY8BGMypTsYu/RjWOAVYiHFaKeE6Fmh8vwI7pgUt4=;
	b=v1m5V3LAWxjuYLip2YWHf2gArotiulFMgBBWSUG1SPl2Ej5YJw7GghA/QWsgmLax1m3A1l
	BIfKz8nGhlhq1UEP/rEtMWbpjw48JVi74qWM6ayP7PC572U/pU7sHNdZxwQZRJCgzEHzQK
	Ar652Pvy1YsG7oE/gWo5SZ64UHn5jpQov0+gBaJIJ2QVr81gd6KuPj8iYq0SO+N5hfRybw
	w7lsiIB6MzgaJAt3R10MCMkV6fN3JjoNyFsBGPUoYJlVOamgqoa+uTEOBiUT0uVR/nZDGV
	eSTqpn/dDgwBNL5K1SeqUv+vU9sPC6VoECPuPQRKMRuf2SynRh+iM+gzCFL9xg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jiandong Qiu <qiujiandong1998@gmail.com>
Cc: Alexs Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs/zh_CN: update translations for
 process/changes.rst and sphinx.rst
Message-ID: <akp9kzW3bG_pYLW8@wyuan.org>
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
 <akn4oYmihmNHFOY7@wyuan.org>
 <akpxuLXKrbN7qB9o@archlinux>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akpxuLXKrbN7qB9o@archlinux>
X-Migadu-Flow: FLOW_OUT

On Sun, Jul 05, 2026 at 11:20:30PM +0800, Jiandong Qiu wrote:
> Thanks for the Weijie's careful review and the readability suggestion.
> 
> ```rst
> ====================== ===============  ====================
>         程序               最低版本         版本检查命令
> ====================== ===============  ====================
> bc                     1.06.95          bc --version
> bindgen（可选）        0.65.1           bindgen --version
> binutils               2.30             ld -v
> ```
> 
> Like the code above, the line with "可选" is misaligned in lore archive.
> I agree that in plain .rst source, mixing CJK text with ASCII table markup
> can look misaligned without a proper 2:1 width monospace font. However,
> a few clarifications:
> 
> 1. The rendered HTML documentation displays these as standard bordered
> tables, so there's no issue there.
> 
> 2. The real problem is the lore archive's rendering, which apparently
> doesn't use a CJK-aware monospace font for source display.
> 
> 3. In my local environment, I use Maple Mono NF CN (a font with perfect
> 2:1 CJK/ASCII width ratio), so everything aligns correctly.

Definitely. I was surfing on lore, and found it's misaligned. But after
pulling them down with b4, I found it's aligned correctly.

> IMO, this is a minor issue that doesn't affect actual patch review,

For sure ;-)

> as reviewers can pull the patch locally and view it with a proper font.
> A fundamental fix, if needed, would be improving lore archive's rendering
> rather than adjusting individual tables.

I guess the devs of public-inbox didn't consider supporting languages
other than English at the very beginning :-)

So my first impreesion was to keep "optional" as is, instead of
translating it. But that's a nitpick, though.

```rst
====================== ===============  ====================
        程序               最低版本         版本检查命令
====================== ===============  ====================
bc                     1.06.95          bc --version
bindgen (optional)     0.65.1           bindgen --version
binutils               2.30             ld -v
```

So, avoiding the appearance of both Chinese and English in the same row
like above can solve this problem, but again, it's not a big issue.

Perhaps keep "optional" as is would be a simpler solution, because
apparently it is the only Chinese in the table, and the word "optional"
itself is not a difficult word for kernel developers ;-) By the way,
isn't it better to make this table display perfectly in all cases?

But for this two:

+.. table:: HTML 中数学渲染器的选择
+
+    ============ ================= ============
+    数学渲染器   所需命令          图像格式
+    ============ ================= ============
+    imgmath      latex, dvipng     PNG（栅格）
+    mathjax
+    ============ ================= ============
+
+也可以通过设置环境变量 ``SPHINX_IMGMATH`` 来覆盖该选择，如下所示：
+
+.. table:: 设置 ``SPHINX_IMGMATH`` 的效果
+
+    ====================== ==========
+    设置                   渲染器
+    ====================== ==========
+    ``SPHINX_IMGMATH=yes`` imgmath
+    ``SPHINX_IMGMATH=no``  mathjax
+    ====================== ==========

It seems that there is no way that can satisfy everyone.

Anyway, I agree to any of the solutions.

Thanks,
Weijie Yuan
