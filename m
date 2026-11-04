Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793774828;
	b=r+iFJ9mH9CPzog07gvqFIoG0Vepyy3u7WYGVH9ba0DiBM9+6Rx4YK4UKzsQbnbCdLh0k
	 Qj9OMNKzlHJIV3ZGsIVaLCkmAV0wMKg5hZdES/IsLgva8sAOVx3wZqRHzpSALaMbTa98O
	 HNVr4JGcslHmKnABju6s7dXOaP6aR6PuQnfxG8SchN24tbfiBs3+MXFYDwws7j0he/3hx
	 2PSFNkdKFBCraxB0cD0PxlQq3PooTZTwQKWKtYCVRMaIt2QoUvj0B31TqJdvBHXXI3DTE
	 9XBneH7dh2ttO1H+ZqvCXuasmFlf1pltZgYXn8LlSUZA40LcYag61o6MOIiC7khpeTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774828;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=cRnbjvHfK9LYqTZp83x+UeXrk7VZ80f+rdvCm66u/iw=;
	b=rlK+u89Hi5ahU/6SWz2/hZBd6RvLjFQytAWGi3PLSG8mbQDvaNav0iFllTla53nyHL+v
	 eG7YI4294Js57EZ334wnD5WN9WHznT+TnWJ5XikFXnCzzUUb30/WX3fB+mHua/geVnAAX
	 IoMSYs6dmQnyKOiKJLnKTpdmW4NlNpCLMB69+PHF1Wnz4Bf8FO6KSHD3dKDkJJYut9gDC
	 BWTLxBV+tYGmu8TfZyr4z3FZrsK6EOxLXELPKJFUoGDhB+XLifLRCQwcF4FpYS6Xfyp8s
	 59NiRx5U9iHiRkkjvqz0ltH1j4okjZhM3OwbtZ1fk1B0Swow/JO+2qFj3UtGDT7jQYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=BvZYBAW8;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA8606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 06:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=BvZYBAW8
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9AgtBZbGIFcS/iIhlYfvmGS4cRiZ/o1rNzLBv1dfHvg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793774824; v=1; x=1794379624;
 b=BvZYBAW8pYwmsd8D5E2p7iiBT0VDH1c7RGZaRjKWdzkweFVrIA9/APRwi2VeSe9869KbnTNz
 J9Z9UEBHX3mUTECVqQS4OuTavOQbK7pHtBPsziT39jFCRQmEGvORqthWdX/hdvR4SYeNYUP3C03
 bAq6MsfMHWACQHSAczu4PH59kz4q4BaP+iUQm1MW7EPmTFtYaAn8nPXUQnGFMjtl9Y8PrPH+UlF
 jXljcLFuv8oFRlas7MugxkTlSoTW1eNkxGbLO1m7xDOOE6TszJ+LNBwihY5t3JtvbnsTgrx4xas
 W2LzPhZL4FvtVUrwzIx12JAMBJzITu/wrXCTwrlkm/urg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05fef8336810e28c;
	Wed, 04 Nov 2026 06:47:04 +0000
X-Mizu-Trace-ID: 05fef8336810e28c
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 14:46:58 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: How to attempt to gradually eliminate the compilation output?
Message-ID: <aurU4uKyIUBl9-CJ@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 21, 2026 at 07:18:56PM +0800, Dongliang Mu wrote:
> On 8/21/26 3:22 PM, Weijie Yuan wrote:
> > On Fri, Aug 21, 2026 at 02:54:59PM +0800, Dongliang Mu wrote:
> > > On 8/21/26 1:13 AM, Weijie Yuan wrote:
> > > > The script says:
> > > > 
> > > > $ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > > > [1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > > > [1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> > > > [1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
> > > > [1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
> > > > [1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
> > > > [1787244823.779522] 4 commits needs resolving in total
> > > > 
> > > > So I updated this document in chronological order, created four patches
> > > > based on these four outdated commits to make it easier for you to
> > > > review. Hence, you can freely squash them when applying them.
> > > > 
> > > > Tested with make htmldocs, no warning or error made by these patches.
> > > Hi Weijie,
> > > 
> > > Please make sure you execute "  make cleandocs & make htmldocs". Some
> > > warnings may be ignored by further compilation.
> > Hi!
> > 
> > Thanks for emphasizing this. While I do remember I used "make cleandocs
> > && make htmldocs", and checked among those long lines of red warning
> > output to find anything caused by my commit, I indeed didn't notice this
> > warning appearing at the early stage of the compilation.
> > 
> > It seems that I need to have my eyes checked soon. ;-)
> > 
> > Apologize for my recklessness.
> > 
> > Even so, do we have any way to distinguish these long-standing warnings
> > from the new warnings that appear during compilation? In fact, every
> > time I was worried that I might not have noticed the newly appeared
> > warning. Unfortunately, this time it really happened. (For example,
> > setting a new color? for new warnings?) Do you have a better idea or
> > tips for this?
> 
> My suggestion is to keep the log in each file, and you can easily observe
> the diff. Otherwise, even I can ignore some warnings.
> 
> And many contributors are coming together to fix those warnings. If they are
> done, all new warnings are easily captured. Let us do more contribution to
> help this.

Recently I've sent several patches to fix warnings.  But since I am not
familiar with the actual codes of theirs, I'm not confident enough to
touch some parts, but only the most obvious ones.

Since this is a goal that Jon has spent years for, I'm wondering if it's
possible to periodically send out some email notifications, which will
use the file paths from the compiled output to find the recipients and
kindly ask them to to deal with these annoying outputs? Perhaps we could
use a script to do this.?

Thanks.
