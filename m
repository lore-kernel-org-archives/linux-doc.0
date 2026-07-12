Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CBB18C332
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863813; cv=none; b=KSkold1n0WnXgsPldjbw7z4DZyqNHF2lw3xOC007e36epZLZeP6rDMuk8ibk8UpK76Hy1zAUCcim1koRjNOK/4rLFAmxbOAJPLSx6TzxvmsS3SZXugHrJWG7OlllK0VHOMRVa0pNw7k2vPZtut7MVpR9kZnZDC0+AaLBMagzIcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863813; c=relaxed/simple;
	bh=mLjONLlL2WO1u6BXCe73EzBQv2AILja1aITeXBN8cpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLp/91/DJeOx74+0cNRjVQzRgrC1rDfHUtTZFCa/5T7f963Hhn1j2BAWwV7XvBKWUhzbYkC+v3UgCSF3S4ldBWsN01gqu2NzQZoq5zALH+QYg4qpICFaOZiRy6FM8Na8oonZPnmPm6jAgKXCOsARz+9/NmDgajYkahfnmJcwBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=BjTR6Mze; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="BjTR6Mze"
Date: Sun, 12 Jul 2026 21:42:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783863803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IplQO1qfxi+wStGv2xvy/3yUAjVq/UgI+J9iyMLytQU=;
	b=BjTR6Mze0XpTqWBizRiktg5nj8TlkkElEBN4NyZ4IZ703csgwGuohbMBfHCd4i8Q0YDNcT
	7+AVkWKFSleRSGcqWttIV89qOPz2I6cXE6QNvBktW5AOyzdeKFpidYy89/cJHfVTBybtx7
	xX60XbwY7FG2WvNJ1k0IwIF4zRn1NnzFgpgtuYOAcu/A0HMXDHqsBeJTqybgAeEhreaiTP
	YNvbKpHLtLSHkBTQv10Z4o0RvFSvrZ9eCECp1qwnsjna8xaLyhS5Kf5oTsV8b62nt1Aisl
	8m7fb2JZkU2PgqO2sVmOslyqsccdco7mtxqBri4Hc15uJHjtaLmLTXThqj7zYw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
Message-ID: <alOZzy3Hk3CEN7ZX@wyuan.org>
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
 <alD1b7O6KaIMqWpa@wyuan.org>
 <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
 <alD6UJw1Y2VNK3x1@wyuan.org>
 <91ea31b9-4154-4769-a620-43fea87cb949@hust.edu.cn>
 <alMp5-UPJks0xEvS@wyuan.org>
 <8f01e453-6a4b-4f35-b533-55d89c1a9ae4@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f01e453-6a4b-4f35-b533-55d89c1a9ae4@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Sun, Jul 12, 2026 at 04:35:21PM +0800, Dongliang Mu wrote:
> > GIT_TRACE=1 \
> > GIT_TRACE_CURL=1 \
> > GIT_CURL_VERBOSE=1 \
> > git clone https://mirror.nju.edu.cn/git/kernel-doc-zh.git/
> > 
> > [...many verbose outputs]
> > remote: Enumerating objects: 11675982, done.
> > remote: Counting objects: 100% (11675982/11675982), done.
> > remote: Compressing objects: 100% (2008049/2008049), done.
> > 13:24:10.505880 http.c:994              == Info: HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
> > 13:24:10.505973 http.c:994              == Info: Connection #0 to host mirror.nju.edu.cn left intact
> > error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
> > error: 6191 bytes of body are still expected
> > fetch-pack: unexpected disconnect while reading sideband packet
> > fatal: early EOF
> > fatal: fetch-pack: invalid index-pack output
> 
> It seems like the same issue with our mirror site. I've forward this email
> thread to NJU mirror maintainers.

Very much appreciated. They might obtain more useful information from
their server logs.

> 
> 
> >  From the output, it seems that there was an error in the mirror of NJU's
> > nginx, the Git HTTP backend behind nginx, or the upstream connection
> > between them, but I'm not 100% sure.
> > 
> > I will conduct several more tests immediately to troubleshoot the
> > problem, to see where exactly the problem lies.
> > 
> > In addition, cloning with a cloud server in Hong Kong:
> > 
> > Cloning into 'kernel-doc-zh'...
> > remote: Enumerating objects: 11675982, done.
> > remote: Counting objects: 100% (11675982/11675982), done.
> > remote: Compressing objects: 100% (2008049/2008049), done.
> > error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
> > error: 3965 bytes of body are still expected
> > fetch-pack: unexpected disconnect while reading sideband packet
> > fatal: early EOF
> > fatal: fetch-pack: invalid index-pack output
> 
> 
> I tried the NJU mirror in my laptop, and successfully clone the repository
> from NJU mirror. There must exist some unknown reason to lead to this
> failure.

Ah, I'm starting to doubt on my side now...

Anyway, I'll check again.

Thanks!
