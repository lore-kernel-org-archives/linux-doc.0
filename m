Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70053F5BFC
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 05:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787289285; cv=none; b=IgkiEx9XQE2jTCMDdm2xUCaQ4a91p16J2edKXvHcsHsIxXdVYqDFDZ+T7KYfFaH96T9j2VgSvmYuyxbdnUtcJVTFDeICTLbluT96RQg31P6toZ/V0QSN8YMOCUEDOozeKfktMBtokbvZV5D8+ck0nqWv8sNXAnSQPdBNNF/UOm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787289285; c=relaxed/simple;
	bh=ZdIVTiAPPGap70+PAtndcDGQmOloRy0ibtd4qqZzMFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U26CncDX9CL70Cz6NOEA+whIaow8F+kYmadxk15rHJ1rmfsWRWHnFA7YlY3Zoe3UFK6lZC80is67Rv65oJpdcLR7G6PaSci3YItxEVnYJob74gAR8HmB1Hg06h/8SRBZvxD9bkNoP/nnb06gFjmJR/tqPr7Ui4Q7n04M8rqGZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=rBi85fX0; arc=none smtp.client-ip=95.215.58.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="rBi85fX0"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZdIVTiAPPGap70+PAtndcDGQmOloRy0ibtd4qqZzMFU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787289280; v=1; x=1787894080;
 b=rBi85fX0T+TciOLuzR/rfIwyUmvgN6uAjU/DAf6rGqTuWhkJL0Mx8qUKkGWD+KW51Bj8Q0xn
 f4nz7sBHNn7h7RQLhu5x8HYEF/kJN6LqsTMFpQehC47MGiaq8mQZGkYDB76q66/9eTwIHim0mFU
 Xqzf4Us6glovqpwmlvk1+r8rh7atcMqMqhDQ1+KK61dHEw88Eb+HFRF2QY+o/qc8z97nuPSybbL
 tY1fvqSp4phqEz3Wa9CkOCpyPYM4cuOhPuuOaQYqhXY9xBs9aoZJxBv4/+6jiQ4Yzt8dANY6zAx
 UFWA+4a6UUmf7gGZZ8J1oV3hb1SvjWxR4c6aFPVRuwKJA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id f4212cdc921eb7e4;
	Fri, 21 Aug 2026 05:14:30 +0000
X-Mizu-Trace-ID: f4212cdc921eb7e4
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 13:14:24 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] docs/zh_CN: add kernel.org trust repository reference
Message-ID: <aofesCGTRa3KDYa6@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <20260821-maintainer-pgp-guide-v1-4-08e5e3602c04@wyuan.org>
 <aoc7l-n861pdN71_@wyuan.org>
 <821f84c5-9344-473d-91e4-998f183f96f3@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <821f84c5-9344-473d-91e4-998f183f96f3@hust.edu.cn>

On Fri, Aug 21, 2026 at 12:14:57PM +0800, Dongliang Mu wrote:
> 
> On 8/21/26 1:38 AM, Weijie Yuan wrote:
> > On Fri, Aug 21, 2026 at 01:13:23AM +0800, Weijie Yuan wrote:
> > > Add the kernel.org trust repository reference to the Chinese
> > > translation.
> > > 
> > > Update the translation through commit 54857c52452a
> > > ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> > > 
> > > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > > ---
> > >   Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > > index 12b3e8030364..f6e8ac2d11de 100644
> > > --- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > > +++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > > @@ -767,6 +767,8 @@ SSH 的信任方法”。使用 SSH，第一次连接到远程系统时，其密
> > >       trust-model tofu+pgp
> > > +.. _kernel_org_trust_repository:
> > It should be cn_kernel_org... My bad. Sorry.
> 
> No worry, fix it in the next revision.

Thanks. I'll wait 24 hours to see if there are other issues. Then I'll
re-roll. But later I'll check it again myself for sure.

Thanks!
