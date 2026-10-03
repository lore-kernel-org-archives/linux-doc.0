Received: from mta1.migadu.com (out-31.mta1.migadu.com [95.215.58.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E422D4E9
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002284; cv=none; b=QCf1eXAJ0GCVA1uSCu42Pa9EHT5gqasfpMxwEvpDtkdDLWvc7bC0E+IGUcpAwqV+tPxsN3057w4Bk8q12b2UfNiEpG0NbhnmoJ1+VUnmQLY+o26oUydagbHIOJRsRh+gEZ/VrWwdScJYWxgOLgUceHQ5vT2jqZdQzRaw/t3lGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002284; c=relaxed/simple;
	bh=OddsCyB1+NlHOb+iAMix+w+nZ2FgLtttMfKfX5HO2bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onAyS0q9Ns6ryfC1EgV/UTQVEi581KiceAyYq5HFSTSYmAg4HcQxYdOiJ1uYPwlBKGsBYM6lSbx7uFTkXgoLHtP8yfBgrBcEi/n6spMdnaHAxtRux6ps6dEThfDANWu+bYdd8U2B2T3hbdFWHaTGCREYPXXsMBNRvrmCpyNHfIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=C3r2srPS; arc=none smtp.client-ip=95.215.58.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="C3r2srPS"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OddsCyB1+NlHOb+iAMix+w+nZ2FgLtttMfKfX5HO2bw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791002280; v=1; x=1791607080;
 b=C3r2srPSZjD1DACYCQWX90zQvBjcmLe3Q3XBY8BJFzXuJQr39BFDgo8X+NykJ17lwsJ4Xe5B
 vdQG/hDhcsaHr8dOwoU3xdmIfoTvi3i0F8knGVKmLXx9chFOYKLb8/Uzf6c2zwkYXDUx85bjPC/
 sORIZMQeg0EzIlC0sdTVwqrV2wLS0Ej/S17S06aM5cf5larrVjFp/HjVOgt/jbqQviefjpI4X9r
 Qbeeo8ey6HJmJsaPwYItF3tZmUobZmDXfw6Xfq81kDE6MTzkXorgdTi4Zgiwd/rFvPt1zfdfimx
 g5j5qs7Rml+u7xLT+oRABmnV7IvFuCWyUEkBj2CXs/1Yg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 91a53acc4ac8f721;
	Sat, 03 Oct 2026 04:37:59 +0000
X-Mizu-Trace-ID: 91a53acc4ac8f721
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:37:49 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] docs/zh_TW: mark translations that are not kept in
 sync
Message-ID: <asCGnSMAh_XFnWMD@wyuan.org>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929131142.266819-1-chenyou910331@gmail.com>

On 2026-09-29 21:11:37 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> As agreed in the zh_TW scope discussion [1], process/ is the part of
> zh_TW that is kept current; everything else now says in the file
> itself that nobody keeps it in sync, and points readers at the English
> original.  The rule is per file: the two documents that moved into
> process/ with the relocation series are marked until someone updates
> them.
> 
>   1/3 adds the notice and applies it to those two files
>   2/3 applies it to the other 58 translations (one line each)
>   3/3 links filesystems/ and cpu-freq/, which nothing linked before, via
>       a translated subsystem-apis.rst, as the English tree does
> 
> The notice deliberately has no :orphan: marker: included after
> disclaimer-zh_TW.rst, a second one renders as an empty "orphan" field.
> (Two existing pages already show that field, because something precedes
> the disclaimer include: a stray byte-order mark in
> process/kernel-enforcement-statement.rst and a highlight directive in
> gdb-kernel-debugging.rst.  Not fixed here.)
> 
> One consequence worth knowing: checktransupdate.py reads the "update to
> commit" line of a translation's latest commit only, so any tree-wide
> patch like 2/3 makes it report every touched file as current.  The
> contact-block cleanup already had that effect on most of the tree.
> Fixing it belongs in the tool, not in the translations.

Agreed.

> This applies on top of the relocation series sent alongside it,
> "[PATCH 0/4] docs/zh_TW: relocate translations to follow the English
> layout".

I figured out the applying sequence by myself and then came across this
sentence... :-| ;-)

Thanks.
