Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793276005;
	b=J1oHi/SwvXzz9/rL5glO+wIWlq67RXj1WCrNpYdb8Gbe9wV/PZtoKoiuSy0Cd4A4O5EO
	 WGaPsAOBXyDxejyu9tMeNhjESCxRBbo6iYg2lUd2QCadSBvGBiUrbdIDuv0J/HXAyDNt7
	 bGwg0GIWJWXMcVAv8lVokJzzb19o9S76W3xe+ZJefPKThky7scYML6OMRCuBlpkRZlFow
	 EpMsxr4dC6rqxp/xCVhywgFDVCpZ1T+Znzm3oXH/Pg393FxQoTKxZre38QxekGTn9Ut06
	 doIm35poWHucVNc1ylc+7WTA5WnLAH50HOKQMVY79ZryY62Wu4l2FKYNOOjpqzGjThg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276005;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rIVud4UuTXwaJymgMwu25tZqTVrucoyXXgO15+dCGHc=;
	b=u1pydfqWSA7jU/ZTMWBJfucUtUClEPk8jYnTpt/+scWpgAlxFekCRxw1e/Dh/beDPKni
	 ggJ2zY6HTz4K6Dd+YDLBtHAaxN43hGRG3wP/6NSPitfaELulzpwVaz2MUBDVMkWiikw8o
	 uuplr1fe70y7P1PrJ7MXPivbBKD8gOfloGgyf/GMXEPKiTNMj/hYRVBQSm61g7VMc/BVk
	 YukMGwpy5jVA2T6F0PkBjs76sYzVVcOSZIT4iorkpM279pZNc5tHiG8myj5QMJAD2WKvA
	 ynKAd5lqCPvqxKcz9HlOuy1iw9kDfn2RXPbu5mqW9ol0DH0+u5xHKYd3vqkVCnHWZMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=rd1uMCDJ;
	arc=none smtp.remote-ip=91.218.175.11
Received: from mta0.migadu.com (out-11.mta0.migadu.com [91.218.175.11])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DA3606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 12:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=rd1uMCDJ
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mM6hATP2x8prCm1lXy5bQ/iNE6rTw96Qw9dC2y6v/3I=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793276001; v=1; x=1793880801;
 b=rd1uMCDJqGJJgSRc59bqtr/Yn4eQs4bzgVYtSV9uu2d40+EirL7tOdoXUJXi2aFyAPET6Xl/
 PbOrv1E2n4vAMqdBcCTruSZl697ZccjmwEqGfQJqym2RFUcodahoGomUb2omKUItq5U5XnwNR+D
 9WSIfUhCLC0GBi3a+lMZ5xtIgGqYq5FhQ0UBSHiJLnVYUczxI3HZnCkgAvJm1eKiYQXdwbnxyK9
 Cmk4qGREkd4DiuFcRjGCusuHyqpywqrk6PkjlZ2QHUhsID2uXeIDWZvwtCMYTKZmYyvdDw+QrUi
 HxXmc/rA9wt3uH37LudhKBc0UlUvdla/y3pOy7NwkW34w==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7f0e7009cb4013fe;
	Thu, 29 Oct 2026 12:13:21 +0000
X-Mizu-Trace-ID: 7f0e7009cb4013fe
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 20:13:16 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_TW: remove top-level labels from process/
Message-ID: <auM4XND4sgE9kko_@wyuan.org>
References: <f851e36f0ca9db7a0f71200964fe97a2efa85c13.1793265072.git.wy@wyuan.org>
 <d32825a1-8da4-41f3-964b-8854618890d5@hust.edu.cn>
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
In-Reply-To: <d32825a1-8da4-41f3-964b-8854618890d5@hust.edu.cn>

On Thu, Oct 29, 2026 at 07:50:43PM +0800, Dongliang Mu wrote:
> 
> On 10/29/26 5:26 PM, Weijie Yuan wrote:
> > I happened to notice that there was actually an embarrassing label on
> > this page [*] that had been rendered in HTML.
> > 
> >   * https://docs.kernel.org/translations/zh_TW/process/kernel-enforcement-statement.html
> > 
> > Therefore let me drop these labels in process dir but leave the cleanup
> > job later.
> > 
> > --- >8 ---
> > From: Weijie Yuan <wy@wyuan.org>
> > 
> > We can link to these documents by path, so the top-level labels
> > do not buy us anything.
> > 
> > Drop these redundant labels from the Traditional Chinese process
> > documents.
> 
> Hi Weijie,
> 
> Removing these labels breaks existing zh_TW cross-references. The patch
> deletes 25 labels, but 17 of them are still targets of 25 :ref: uses.
> 
> Dongliang Mu

Thanks for your quick check! Indeed, there are many of them being used.
I'm doing this stupidly, sorry.

Then I'm wondering why 'make htmldocs' did not complain about this..

[compiled again..] OK, that's because my machine stuck for a moment.
Sphinx did complain about this, ouch.

Anyway, the actual reason of this patch is here:

> > diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> > index d54d20529294..45bb50fd1e6a 100644
> > --- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> > +++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> > @@ -1,7 +1,5 @@
> >   .. SPDX-License-Identifier: GPL-2.0
> > -﻿.. _tw_process_statement_kernel:
> > -
> >   .. include:: ../disclaimer-zh_TW.rst
> >   :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`

There is an invisible U+FEFF character before '.. _tw_process_statement_kernel:'
prevents it from being recognized as a label, causing it to be rendered
as plain text in the HTML output.

Will handle these issues soon.

Thanks!
