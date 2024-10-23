Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4754A4A3E
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729660636; cv=none; b=dR/uhSIBi/uQq6fJZVViGUTkABhXlR2jdFxsalEVrgd9NDciCN8mdA3cNkuut5224yOmwryctSlrFzh4ByhBnASXWoxFicDq/aDlWwp0sl678n2y0Sa8PVu6EGcUVkghWM9dbS39XZHrLvZ4IRateOGzxNPzpVTQjbTlr0gsaJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729660636; c=relaxed/simple;
	bh=LyZKFsZKaKpyS28LXRKmXFZE0mduE0p6FZPIxBCyiO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=NzcJkwqIHYvnizeA3d0wWzo+hgBL4HLW6D5WRw9Y283F1ZFe4DU+2bU5Lm2VV+dzes8D0TczVlh9a5CgESkOO2Bs6TOvw6n1B64bB/KMtywNUNUDBqxs1WVZrS4gUUlfsY4M+YQMQsXTub507IDbGEc7lKC+Y+QK0lGIeV7545k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gt/aw4gd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gt/aw4gd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5KIN8YBn22KKyW6iHMSntadaUvCDG3X7BSsUZQ6vqGA=; b=gt/aw4gdPaqWpPpWi00cljZPmG
	kaCwL82k2fMAOr/Ff3ZwMxsAgQkvxmSX0+xvRpIIORB+WWNGlziZU4/uFHsnuFL3GeAnk6yZ+7aUG
	mxQhowQrxBhd6zVyJrL3JFl4N2V1s6IdPMOtOAACarIxu2pIzijfSaSfO44HmuTmFsQx8HcMcMERi
	SQAZv88wULiZXnPzSAARHO5+6DEom3885mGDNWwaNspFpPEsbLIpQXj4jqgeV/TL/vEegRJ+sifJa
	E2cuXe469A9S4gbCoIVimC0733F5JiseXK4pOK1xRgCc3H2drID24mztfCHBJEVhDMak6AOZKVLCj
	vOxPn1IQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Tk0-00000002Scn-2Tvy;
	Wed, 23 Oct 2024 05:17:05 +0000
Message-ID: <b5f4583a-eaea-4117-b759-ab68d1ce351b@infradead.org>
Date: Tue, 22 Oct 2024 22:16:57 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Translation order of documents
To: Dongliang Mu <mudongliangabcd@gmail.com>, Alex Shi <alexs@kernel.org>,
 YanTeng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>
References: <CAD-N9QUgp+W3Us2QFNF9Emde1Yb98_Mco3a-gbrfuMssVVbJLQ@mail.gmail.com>
Content-Language: en-US
Cc: Nick Desaulniers <ndesaulniers@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAD-N9QUgp+W3Us2QFNF9Emde1Yb98_Mco3a-gbrfuMssVVbJLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[adding Nick D. as author]

On 10/17/24 10:32 PM, Dongliang Mu wrote:
> Hi guys,
> 
> when I translate kbuild/llvm.rst, I find this document seems depends
> on the reproducible-build.html. The depenency means, A will refer to

                      builds

> B, like the following contents.
> 
> ``ccache`` 可以与 ``clang`` 一起使用，以改善后续构建（尽管在不同构建之间
> KBUILD_BUILD_TIMESTAMP_ 应设置为同一确定值，以避免 100% 的缓存未命中，
> 详见 Reproducible_builds_ 获取更多信息）::
> 
> KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
> 
> .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
> .. _Reproducible_builds: reproducible-builds.html#timestamps
> 
> I have several questions in mind:
> 
> 1. Should we show this dependency graph for translators? This may help
> improve translation. Otherwise, it may occur that A has been
> translated, but it depends on B. And B needs translated so that the
> translation of A can be merged.
> 

Yes. (IMHO)

> 2. Would there exist the loop? A depends on B and B depends on A
> directly or indirectly.
> 
> If we only need to keep the documents in the mainline ready for
> reading, it seems not a problem.
> 
> P.S., it seems current docs building cannot detect invalid URL in the
> documentation tree.

Hm, I thought that there was a script in scripts/ for that but I don't see it...


-- 
~Randy

