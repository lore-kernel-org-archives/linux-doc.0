Received: from mail-m15578.qiye.163.com (mail-m15578.qiye.163.com [101.71.155.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED42253E4
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145860; cv=none; b=IxjBiRjpD6nJBQIigFkQJsDrjuEqg4jLk9nugUzyiyR8ODurU8zD+zz/Wi2cY/fW5yzuaSjr+PWbShKNdp/5tXGhGByZBAMGCq/kMxxY+oceCK7f4dohpXWYsSoEPw6yXVTsZoTIHw0eLwZHndooQXuxynxeVhDiuhi/t0uOmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145860; c=relaxed/simple;
	bh=AFfZ/mI+WQyyot+6W6lj3jtJdoT8A5cIO/GBwpZc4LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ua4OTYQB2y2p9bant4+VU7jwjlUExbKNKiKswpjmW/upETpBlvvHCqI7yJgkAPvF1eOk8unda+88CFh9dEzN9jeP4IDTLbtplgZy28TSlQSgq6Mzczd2Ll3mESUaTuvgSAVjUWkCBMu/Ms+A/6CUgMDTmWiSrvWoDZLtJBjoihc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=okUkbXjs; arc=none smtp.client-ip=101.71.155.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="okUkbXjs"
Received: from localhost (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2af55782b;
	Wed, 26 Nov 2025 16:25:39 +0800 (GMT+08:00)
Date: Wed, 26 Nov 2025 16:25:38 +0800
From: BaiKefan <baikefan@leap-io-kernel.com>
To: Alex Shi <seakeel@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org, si.yanteng@linux.dev
Subject: Re: [PATCH v2 01/25] docs/zh_CN: Add index.rst translation
Message-ID: <20251126160550.00001ed8@leap-io-kernel.com>
In-Reply-To: <9618202d-880d-4286-a817-f88d965ecc31@gmail.com>
References: <874iqksqs2.fsf@trenco.lwn.net>
 <20251124132548.36836-1-baikefan@leap-io-kernel.com>
 <9618202d-880d-4286-a817-f88d965ecc31@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9abf44a86f09d5kunmc5de06514d1d61
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUtPVhlCSh8fSkgYT0wZQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=okUkbXjsuHXC0FxSIl1/Jf1IeehPOsYD26OpX3nun4s/sv/TqZ3mhmN0ZUaVRddpsPrgtFR7+P2xeVkOmd5yBaP9KtV4uVQgipED4SmOq0mm/Tvf/iLT1BvzJoesg2bHnoLeYXVv9HEtFe+EXSV8ODcAvbriU9+E1O+miTDsxrwYTkhErIXXKUks9DbsQfXVSHfGT1C7dDkKlcBE+HbCWJidL5eqyVZ5bDilWG27wAiJZmf6uCPVS37MaiVa53TopgyLmhqiGL0XuBIZUucHfAZmGucbW0+jNY0vOYeN8QDc0BM+c5U6tZSsSA6AYUMc5BoG3gzJpsGjigFQ+n6YlQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=8LkhKbA0hr0jCmEilHOkJ/jpoe2+wT1QwayK0G/XtyY=;
	h=date:mime-version:subject:message-id:from;

Hi Alex, thank you for your feedback.

On Wed, 26 Nov 2025 13:38:12 +0800
Alex Shi <seakeel@gmail.com> wrote:

> 
> 
> On 2025/11/24 21:25, Kefan Bai wrote:
> > Hi Jonathan,
> > 
> > Thanks for your review.
> > 
> > I've updated the signoff to include my full legal name.
> > 
> > All translations were done manually.
> > To improve submission and review efficiency, the number of
> > translation documents in this series has been reduced to 8 in v3
> > patch series.
> > 
> > Thanks,
> > BaiKefan
> > 
> > On Sun, Nov 23, 2025 at 08:38:21AM -0700, Jonathan Corbet wrote:
> >> macrofun<baikefan@leap-io-kernel.com> writes:
> 
> It would be better if you use your real name to replace 'macrofun'

I have replaced 'macrofun' with my real name in the v3 patch
series as requested.

> 
> 
> >>
> >>> Translate .../usb/index.rst into Chinese and update
> >>> subsystem-apis.rst
> >>>
> >>> Update the translation through commit c26cee817f8b
> >>> ("usb: gadget: f_fs: add capability for dfu functional
> >>> descriptor")
> >>>
> >>> Signed-off-by: macrofun<baikefan@leap-io-kernel.com>
> >> Please use your real, legal name in the signoff line.
> >>
> >> Out of curiosity, are these translations machine-generated?
> >>
> >> Thanks,
> 
> 
> 

Thanks again for your guidance. 
Please let me know if any more changes are needed.

Thanks,
BaiKefan
