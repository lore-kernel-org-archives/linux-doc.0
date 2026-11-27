Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785903;
	b=FHTVTUNpui8ObjESU+auw30cjXzoiyzdn5S/JhkP5+96ZO++REGSVPE5BJgUMeB1RIgK
	 /dalmTXkVSkvPN2AwARlNZyNGz6Eeh7YnYHGHgUhfXhNJeXBVyk2b+FYoMABCVh3wTx0H
	 1+iWeOJJFKrtlSag2DTLTjc1apQY4tqKBZhpoTlgupXgYsVXVEQyGdHbWLWYarb0Ta7/H
	 0+SC1eWrRa1Yzgq/O4mDFPDTVDT8X1tLwpH5xNzxyvv3EUFz3pbj30hfSuGwGyd02CZZb
	 JCh4Nb2MSHklguqR+//+rmNIveYso0fbkszAEOEd5mVcNDcdHXQca2/YZ+xGJM68bOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785903;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=szfGN/dgC/JLyBFU1VQYVkraiko0/qhujWRZpDszyZE=;
	b=tJAt87ao+TDZqL1/dSASAuPH0TE7DBvfYAXsRBxBf+oCeUL1cggNULQHd2xsWD7R+vU6
	 mcJLxEtBg2ZykCEyrtVSt/MXr9J3sg9YhNhjTbdkE7xgFc5z9NvT4c3M+d1amqXOI94r0
	 QA7YMeP1RFO59lEzcWeJ9QopPrUSoIz0XRi1P/JsuBaiZu8phxbzHgOkqWcz3uncKO7nB
	 7+ROn8wfL7TDava0xvBofCyLR8vAXgRpL6Xs9/66VmjwVeluOB5oAOPSuWGGwJoDHxRWc
	 yoDdFJDEK9WKRdMwcbMjhOOX9xYni2UQ/LoM/zsZrXTQIufOLApKLQ6/vpxpx9uL9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=K+d8pQWv;
	arc=none smtp.remote-ip=91.218.175.197
Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF1606A335
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 13:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08AF1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=K+d8pQWv
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jUWIbjRKrhloOv0XHKi9nPNyc6F8oiWX7SWfLE34nxE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795785900; v=1; x=1796390700;
 b=K+d8pQWvVXZhZVPjVcAJZl3dN/Pa+jtxcXkLz7fGXUcPf5SXzGuGlIxKbEZx666YSe9EKmcJ
 qT2oAni9LSWGO+PV28oxyVudOxh0S2GP5wDtmMJCrXBrY7yjrGC0ZOkMVYyAQif1DvDLfj+66ST
 xFo4U7i+uRny2HhyultXmeQD2pEqSLyyFipik3Xj7i8/HeQk78fe6qNaDrXrNIor1JVTWujwXC9
 0w907Mk00NI6DaGQX6A9sEx0DRAII5PmkdFDpBVIwO0Mkxpdi96dw0JIXNlfhaZdK7e+atW6jgM
 dc1XBjJVQMb/neIdLLllc2Irxdx5p/EdOp1lTOoh8RPjw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2c5e8a08dd82050f;
	Fri, 27 Nov 2026 13:25:00 +0000
X-Mizu-Trace-ID: 2c5e8a08dd82050f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 21:24:56 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] docs/zh_CN: align translation paths and update
 guides
Message-ID: <awmEqJSOd8wKUPTM@wyuan.org>
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
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
In-Reply-To: <20261029124429.294868-1-dzm91@hust.edu.cn>

On Thu, Oct 29, 2026 at 08:44:20PM +0800, Dongliang Mu wrote:
> Several Chinese translations are no longer at the same relative paths as
> their English originals, and some Original fields are stale. This series
> moves the translations to matching paths, adjusts their indexes, and
> removes stale Original fields. It also updates selected translations to
> newer English commits.
> 
> v2->v3:
> - Remove unused top-level labels from the translated V4L driver index,
>   process index, and magic-number guide.
> - Update the zh_TW admin-guide README reference to the relocated zh_CN
>   GDB debugging guide.
> 
> v1->v2:
> - Drop the unused top-level readme_zh label from the translated
>   admin-guide README.
> 
> Dongliang Mu (9):
>   docs/zh_CN: update admin-guide/index.rst translation
>   docs/zh_CN: update admin-guide/README.rst translation
>   docs/zh_CN: add media administrator guide translations
>   docs/zh_CN: reorganize process debugging guides
>   docs/zh_CN: update magic-number to match upstream
>   docs/zh_CN: reorganize media driver API translations
>   docs/zh_CN: move GFS2 translations into filesystems/gfs2
>   docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
>   docs/zh_CN: remove stale Original fields from SCSI and IPE
>     translations

Forward Alex's comment to this series in what's cooking (Nov 2026, #05)

| Some of patches are conflict with latest documents, please sync up and
| resend. Thanks!

Thanks.
