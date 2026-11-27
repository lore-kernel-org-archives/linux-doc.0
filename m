Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780989;
	b=kbYLf6oo41LBmoxZ/O2cfO4sudJh1zGV3ksR7Ecm/t9HBXYA273wRTIt0BrLG1QOtEuN
	 tKf0NxwdqhzBjqZHHa51UZGzHYsshNfqSTCRlFbFpxtb5nhC2/KMkuRx7dRkv+GYOOqkP
	 S5H3PI3CAq9qRpU2JKELBGa98VmGUBQRkHPQ7BTxCQmUXV8eOVOG123V80wy2A+SRYxss
	 DhRib5JoTlwrJ3AIwXesmT0uPQuHJWfLNsQpH3xc30HX0mUSUTU1E+ZaxFCvj+3FVgVa0
	 GdKc95jy1da4VngsRuV1fQLzOAaM5iZSUj7kmfWGiavdUw8y8aMwy5L8J1ng8hw244g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780989;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Ltn0sWcC31++aXj+/6DDfsAZivYOHoeNN2HX52yNXmQ=;
	b=k573AKkEM6wenjR+FOR3kFPrjKzekwykHuNmy7RZaH4vY4NNVc96xJYeOuc2khhzwq+l
	 9xn7MoZDd0xq9aiX6rAjXdOlvfEtubjNxY7RviJ2DefWkSD3tDlydeTb5znAc42rYksRJ
	 NK5a2FP36lzBVV+2mDww+dPjQrgitJhODPttmT8KXApS5e1X3HGO9STLt3N5sRUEnFwt/
	 wQP9W7kg4xBlA0g1njpROD857FpkfmCGTKgfrk8Dg/FrJCYi22kIjIJTTcMeuE8FV4hli
	 K98XY83x0f5zwiJ4h1mhU9PkOoRjj62tnkDB2Eo0cZwarvMhaxebY+vMhRYZo06smTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=j5zfimuv;
	arc=none smtp.remote-ip=91.218.175.203
Received: from mta0.migadu.com (out-203.mta0.migadu.com [91.218.175.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E4C606A326
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 12:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=j5zfimuv
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/+UMH6lFYFERII58KJZZQxQ9aip1/x3WSyqE2VnKulg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795780986; v=1; x=1796385786;
 b=j5zfimuvax7k99jyP/kyy8+1JdN6LeIhaLYj1JlUqaKEXvblivDamCeRSeGKY9/TgDOHsDNC
 hapSY7vJLmusbO5NwrwhLWTCpz3t3ip2w2zKeCQBKvDC48iB6fM1HoEdHp3/ECxM0dRb7haTLON
 mtbVewI+gaDkTcVzBl2r6/BT0wRTHJtQWUwVJxFHY3tmvvFSWiC4W3dAfYWa2CsRVPrd4OxS5UM
 ca1R+6DXF95URlWuaQXiBnTENSPBXFo0eULn7Q7Ivk/q8SS8mKn8lVGH1mYxl3trbTrlMNM1b4S
 I77YO2E25wfhA+QbyfsH59eqJk0QfevVFXV50JRQA1vPw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f3a72c7ffadc0813;
	Fri, 27 Nov 2026 12:03:05 +0000
X-Mizu-Trace-ID: f3a72c7ffadc0813
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 20:02:53 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chucheng Luo <luochucheng@vivo.com>
Subject: Re: [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
Message-ID: <awlxbcfzMM0GdpA4@wyuan.org>
References: <cover.1792745468.git.wy@wyuan.org>
 <57bf0bce03cb0257532dc6c44dbba4b77e4f2b25.1792745468.git.wy@wyuan.org>
 <f7e6aa9d-e47a-4480-a003-038f1c57631a@hust.edu.cn>
 <at2WxoK-VN-Zfhkb@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <at2WxoK-VN-Zfhkb@wyuan.org>

On Sun, Oct 25, 2026 at 01:42:39PM +0800, Weijie Yuan wrote:
> 
> +cc Chucheng Luo <luochucheng@vivo.com>
> 
> Dongliang Mu <dzm91@hust.edu.cn> writes:
> 
> > 
> > On 10/23/26 4:58 PM, Weijie Yuan wrote:
> > > The headers related to translators and proofreaders appear multiple
> > > times in our directory. Their information is duplicated with that in the
> > > commit logs, making it difficult to maintain over an extended period
> > > of time, as there have been multiple instances of requests to update the
> > > email address.
> > > 
> > > Remove the translator and proofreader credit fields from the headers.
> > > 
> > > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > > ---
> 
> [...]
> 
> > > diff --git a/Documentation/translations/zh_CN/filesystems/debugfs.rst b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> > > index 4981a82dd651..e74fabca3bc2 100644
> > > --- a/Documentation/translations/zh_CN/filesystems/debugfs.rst
> > > +++ b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> > > @@ -8,17 +8,6 @@
> > >   Debugfs
> > >   =======
> > > -译者
> > > -::
> > > -
> > > -	中文版维护者： 罗楚成 Chucheng Luo <luochucheng@vivo.com>
> > > -	中文版翻译者： 罗楚成 Chucheng Luo <luochucheng@vivo.com>
> > > -	中文版校译者:  罗楚成 Chucheng Luo <luochucheng@vivo.com>
> > > -
> > > -
> > > -
> > > -版权所有2020 罗楚成 <luochucheng@vivo.com>
> > 
> > 
> > 版权所有2020 罗楚成 <luochucheng@vivo.com> in debugfs.rst
> > (Documentation/translations/zh_CN/filesystems/debugfs.rst:20)
> > 
> > I am wondering if it is suitable to directly delete these copyright
> > information. @Jon, how do you think about this part?
> > 
> > Dongliang Mu
> 
> Ah so sorry, I do have some memory here, but I forgot to mention it
> later.
> 
> Excerpt from the content of GPLv2:
> 
> ... 1. You may copy and distribute verbatim copies of the Program's
> source code as you receive it, in any medium, provided that you
> conspicuously and appropriately publish on each copy an appropriate
> copyright notice and disclaimer of warranty; keep intact all the notices
> that refer to this License and to the absence of any warranty; and give
> any other recipients of the Program a copy of this License along with
> the Program.
> 
> So maybe better not to delete this line? I dunno..
> 
> Thanks for pointing this out!

I'm going to rebase this series on top of Chinese-docs-7.5 tag for Alex
to apply, so if we do not know whether it is suitable to delete that
"Copyright Chucheng Luo 2022..", I might tend to be more cautious and
prefer to keep this text intact to avoid any potential disputes, pending
further clarification.

Any ideas? I'll wait until next week and reroll.

Thanks.
