Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640BBCA6F
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783835141; cv=none; b=a0kVNPsWad1xDk1Dnc1YDzSobhcn9wI9Y+UnTBHN+1gG+8D46hda18gCoFLlJaRorwJRQSt5H6MRfIs2a5A7fLnM3uGiRvXJBG4MRMFbTzq8F7g2y//lzDMVe++ByDauX0FUX8w7S7uXTPQTrbYweSAsjLnlhTTa6GDFlV/xzN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783835141; c=relaxed/simple;
	bh=f3imobuxecPntOskYKW+07LDVQS5MhSmTcFJLgTLF7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z24ReyiN9vlBYCT4adYunga0KGr4KYAkpYFXsCPn1jxlu72/0kYne36RLQc1U9P4aEtxnA6sWTMO0mJE0pwJXZrLIhfwp5PFTsOMwZ+7KdOMCOiR7Cy7Ks9Fu34uaLHkG9kun04PlMHrjhjg5xzN1xY6wIz1bfazg/rIE9koTRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=iHWERh+z; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="iHWERh+z"
Date: Sun, 12 Jul 2026 13:45:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783835136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I9dTYXUnpoj/XSX45EfRjBDhz6VbAO4KbHdF8Sk3a7I=;
	b=iHWERh+zXrqdhbOl8+4XejKrXkhCKpPtKCIaAKWooBtHlJe8H+f2qvQd0SiVLCoujw0afw
	Nggth71q3yEux5maQ8h26qThRtesjVasV+P+F2SXJppMARvwbOyCWhd/QaxDVKpWqnccgM
	8XEtrowa6IxM1k102AhWGvJP5+L7OzrqZV2GX3YXbuhZqVyeHKMcgV4JyJz2fckDe2WsT9
	hCQ6v0ci7QM4zdBf723dKhYZhPabW5wWivFymMYFVC9+P2+UZpIjvn4OUKRb1zk+bCPlo+
	oHWWyKuXbLlp6WYO4OgOvTbaBWaWsMfUDXTFjBqyt6GUENQD4vorFbHHMXT7EQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
Message-ID: <alMp5-UPJks0xEvS@wyuan.org>
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
 <alD1b7O6KaIMqWpa@wyuan.org>
 <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
 <alD6UJw1Y2VNK3x1@wyuan.org>
 <91ea31b9-4154-4769-a620-43fea87cb949@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91ea31b9-4154-4769-a620-43fea87cb949@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Sun, Jul 12, 2026 at 12:47:16PM +0800, Dongliang Mu wrote:
> Hi Weijie,
> Could you please try cloning
> https://mirror.nju.edu.cn/git/kernel-doc-zh.git/ <https://link.wtturl.cn/?target=https%3A%2F%2Fmirror.nju.edu.cn%2Fgit%2Fkernel-doc-zh.git%2F&scene=im&aid=582478&lang=zh>
> and verify whether this mirror is stable?

OK, I just did a quick test on my debian 13 (local physical server):

$ git clone https://mirror.nju.edu.cn/git/kernel-doc-zh.git/
Cloning into 'kernel-doc-zh'...
remote: Enumerating objects: 11675982, done.
remote: Counting objects: 100% (11675982/11675982), done.
remote: Compressing objects: 100% (2008049/2008049), done.
error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
error: 7397 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output

then again:

GIT_TRACE=1 \
GIT_TRACE_CURL=1 \
GIT_CURL_VERBOSE=1 \
git clone https://mirror.nju.edu.cn/git/kernel-doc-zh.git/

[...many verbose outputs]
remote: Enumerating objects: 11675982, done.
remote: Counting objects: 100% (11675982/11675982), done.
remote: Compressing objects: 100% (2008049/2008049), done.
13:24:10.505880 http.c:994              == Info: HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
13:24:10.505973 http.c:994              == Info: Connection #0 to host mirror.nju.edu.cn left intact
error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
error: 6191 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output

From the output, it seems that there was an error in the mirror of NJU's
nginx, the Git HTTP backend behind nginx, or the upstream connection
between them, but I'm not 100% sure.

I will conduct several more tests immediately to troubleshoot the
problem, to see where exactly the problem lies.

In addition, cloning with a cloud server in Hong Kong:

Cloning into 'kernel-doc-zh'...
remote: Enumerating objects: 11675982, done.
remote: Counting objects: 100% (11675982/11675982), done.
remote: Compressing objects: 100% (2008049/2008049), done.
error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
error: 3965 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output

> TUNA has limited storage capacity and has asked the NJU mirror site to host
> this Git repository.

Fully understand, easy to notice that TUNA is under big preesure these days.
Thanks, NJU!

> We are currently diagnosing network issues on our mirror site. The classic
> architecture - Nginx (serving static frontend, HTTPS, and caching) -> Apache
> (reverse proxy + CGI execution) -> cgit / git-http-backend - appears to be
> functional in principle.
> The clone failures with large Git repositories are likely caused by
> insufficient or inappropriate parameter configurations rather than the
> architecture itself.

Agreed, it is very likely that the transmission problem is caused by the
large size of the warehouse.

> P.S., I am the mentor of HUST OpenAtom Club, and our club is maintaining the
> hust mirror site.

Thanks very much.
