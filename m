Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD4A3385B6
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296958; cv=none; b=XaJnJJJ/+oJUPFDAEf1ljWrwIxf3S673+FIYqbTCzFLJpxEj2XNaCBKun4QKDvNwUaeQFB7xBwsvfKE+r1dBQ0LiR8wKALFjhrjKfRGp9tvppBXHkBUXaWcuOEhqjC4PZEi28InMetTYoL2o5NZj1Hu9Lnt7QJgyehy1EipTcoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296958; c=relaxed/simple;
	bh=KjlRVPDqtjUyA5rAuL2ivJVx9YaikKm0C569aIw8l1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMBcCqj8hriBvybF4D7+krEdJI0dKfcUrfECUx7u2CXEI0+qUdEI0wWMqSeQXQ7Q9wp8Ai0OXAETPzQ3pjVmWjI66V2/9FnjSW+CW4SkSLgqFrB1zKFQ6pkZxMamH43NczfiocrMCNxbt6mkjMpMD3hOU3COy3LNUvitIJ2Q+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=I6R5URhG; arc=none smtp.client-ip=91.218.175.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="I6R5URhG"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KjlRVPDqtjUyA5rAuL2ivJVx9YaikKm0C569aIw8l1s=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787296954; v=1; x=1787901754;
 b=I6R5URhGFT6LrQrfR2QdwdtsYvzo89Xq8gPk1v0nI+o4jNEPpSDL5UUkjYrAVvmgrBO9T6w3
 rZvbIQxLqpHP1dNmF3Mp4z911AhkngNSMh2k1N0YFFPJd8FGoyvQOmnZawaeLBF5kI3IrIjEmDJ
 dacTJo86Z+l/zinuGD6fucx22uIf6nRQg2QlEFGkIrhFb6qh7vK1n5GaDWRL84s3VNpO0j+5/Ej
 LEaOShbA4BG33DEX9h37ME5hq4uQVmxSVq8n9EWm6r7/zpx4MgY1SFaE7oVCmo8FtRplKKoRkz1
 MIJRfumizaDq4dK10IK7uHST0SgGPpthMGErxYUBRaBHQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id e08da10549d74188;
	Fri, 21 Aug 2026 07:22:24 +0000
X-Mizu-Trace-ID: e08da10549d74188
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 15:22:20 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Update maintainer-pgp-guide.rst Chinese translation
Message-ID: <aof8rCuuwzHUNtka@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <5b107aad-2826-4bf6-97aa-14592131b6a8@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b107aad-2826-4bf6-97aa-14592131b6a8@hust.edu.cn>

On Fri, Aug 21, 2026 at 02:54:59PM +0800, Dongliang Mu wrote:
> 
> On 8/21/26 1:13 AM, Weijie Yuan wrote:
> > The script says:
> > 
> > $ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > [1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > [1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> > [1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
> > [1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
> > [1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
> > [1787244823.779522] 4 commits needs resolving in total
> > 
> > So I updated this document in chronological order, created four patches
> > based on these four outdated commits to make it easier for you to
> > review. Hence, you can freely squash them when applying them.
> > 
> > Tested with make htmldocs, no warning or error made by these patches.
> 
> Hi Weijie,
> 
> Please make sure you execute "  make cleandocs & make htmldocs". Some
> warnings may be ignored by further compilation.

Hi!

Thanks for emphasizing this. While I do remember I used "make cleandocs
&& make htmldocs", and checked among those long lines of red warning
output to find anything caused by my commit, I indeed didn't notice this
warning appearing at the early stage of the compilation.

It seems that I need to have my eyes checked soon. ;-)

Apologize for my recklessness.

Even so, do we have any way to distinguish these long-standing warnings
from the new warnings that appear during compilation? In fact, every
time I was worried that I might not have noticed the newly appeared
warning. Unfortunately, this time it really happened. (For example,
setting a new color? for new warnings?) Do you have a better idea or
tips for this?

Btw I've been trying to know more about Sphinx and kernel-docs, hope my
mistake won't happen again.

Thanks.

>   > WARNING: duplicate label kernel_org_trust_repository
>   >
>   > The same label is already defined in the English document. Please use a translation-specific label, for example:
>   >
>   > .. _zh_kernel_org_trust_repository:


>   > checkpatch.pl reports:
>   >
>   > WARNING: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
>   >
>   > Please replace Assisted-by: LLM with the actual agent, model version, and tools used.

And this one has been updated from Jon's PR last night, so I ignored
this output, left just a simple LLM.
