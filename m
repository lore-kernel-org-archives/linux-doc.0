Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95D3D34BB
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216098; cv=none; b=qIJZxYlwud7hqMebtpbzwoXbIdomgE+FbwZ+fBOuLUdsiwu0PzTaerJsXiUepw0T8OfLtTmsIfbHlMjB355H05MPNfIdW4u3AUKOWQbEeCfo8jzk9jgf2lEZp47Fx1P4GF6sl61Wf7H7tmLzc47q69OMfcrpDLRhoB3vCVEDG9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216098; c=relaxed/simple;
	bh=XDbIB9sdyk0Zt+lUxDz9AQjZBJ8ZMIaA+Es0IGYNG3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMRlDSeYLNdZ3W9TZWVYgnTdB9EFVYS8hHQFCm+j/EboUzSrOdgzCjD6rN/WPSwyL8riCqYOgdK4S1ngplqfqTiODPH6DbWnA2sZpgyo50rcPqWN5cv/dSMASf5ln0+DWJ26mAd8yPVfi+5EM297BiX59E7KZIO03dVN8aBohOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Ix3Ocjop; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Ix3Ocjop"
Date: Tue, 23 Jun 2026 20:01:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1782216088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3po7hLirsclZPfYpq4Dxj4+floQHPJ7jPxZDd94Q0hU=;
	b=Ix3Ocjoph9zvrWyq4pBxV/bwqCSzwseTXuEffGSYxBwuwAl8B/Wbrz/Szt8Xwtab5TKnKV
	XbInvb+4llfqNSfPxjYY8h1qC8/kHNJ3wjgR4EuFN2OkpxybKBg5Be28e6gfsw24zcsk0J
	RvTlx0BWLVSDujY2JZ5Sq4NeCD+SzM+vs4tUiEsRe9x5hdOTdo8blWqgNGWi9633cvzlne
	JIdFxzZes8zf/C2cbBST23x802pVhx4y73KQ8WbHccZCstSQTz3oHcnAfuVgx94ZmY56S3
	biIzDHkNMlnZdrjAVCVbT8MOXGqOF64Y9DUG/1wMZjS5aUUyvKn3QwpvwYuStg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Siwei Chen <businiaoanka@anka1.top>, linux-doc@vger.kernel.org,
	si.yanteng@linux.dev
Subject: Re: Issue cloning kernel-doc-zh from HUST mirror
Message-ID: <ajp1h-RdbmQ43yio@wyuan.org>
References: <4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1>
 <b03f244b-46b8-47e8-b7f5-d98d714ae15c@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b03f244b-46b8-47e8-b7f5-d98d714ae15c@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 23, 2026 at 04:51:20PM +0800, Dongliang Mu wrote:
> The curl 52 Empty reply from server error is not a Git or Ubuntu
> compatibility issue. It happens because the kernel-doc-zh repository is
> extremely large, and the HUST mirror server closes the HTTPS connection
> early due to timeout or proxy limits.
> 
> You can try the following commands:
> 
>      1. Shallow clone first (most reliable)
> 
>      git clone --depth 1
>      https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
> 
>      Then fetch full history:
> 
>      git fetch --unshallow
> 
> If still failing, increase Git buffer like:
> 
> git config --global http.postBuffer 1073741824
> 
>      Finally, I will contact maintainers of HUST mirror site and try
>      some attempts to resolve this issue.

Thanks, and yes, shallow clone could work:

user@debian:~$ git clone --depth 1 https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
Cloning into 'linux'...
remote: Enumerating objects: 93130, done.
remote: Counting objects: 100% (93130/93130), done.
remote: Compressing objects: 100% (90511/90511), done.
remote: Total 93130 (delta 7145), reused 20322 (delta 1615), pack-reused 0
Receiving objects: 100% (93130/93130), 259.15 MiB | 4.71 MiB/s, done.
Resolving deltas: 100% (7145/7145), done.
Updating files: 100% (87897/87897), done.

But:

user@debian:~$ cd linux
user@debian:~/linux$ git fetch --unshallow

(after ~10 minutes or so)

remote: Enumerating objects: 10638034, done.
remote: Counting objects: 100% (10638019/10638019), done.
remote: Compressing objects: 100% (1819658/1819658), done.
error: RPC failed; curl 56 GnuTLS recv error (-9): Error decoding the received TLS packet.
error: 5476 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output

and in a mac (26.5.1) Git 2.54, probably the same:

$ git clone https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
Cloning into 'linux'...
remote: Enumerating objects: 11406904, done.
error: RPC failed; curl 18 transfer closed with outstanding read data remaining
error: 7537 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output

after setting http.postBuffer 1073741824 on debian:

user@debian:~/linux$ git config --global http.postBuffer 1073741824
user@debian:~/linux$ git fetch --unshallow
(after ~10 minutes)
remote: Enumerating objects: 10638034, done.
remote: Counting objects: 100% (10638019/10638019), done.
remote: Compressing objects: 100% (1819658/1819658), done.
error: RPC failed; curl 56 GnuTLS recv error (-9): Error decoding the received TLS packet.
error: 5917 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output

Apparently the above is of limited value, as it is straightforward to
reproduce.

> Please use the first git repo:
>
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git

The average speed of cloning from git.kernel.org is less than 10 KiB/s
from Chengdu ;-)

But of course, a shallow clone is enough for translation work ;-)

Thanks!
