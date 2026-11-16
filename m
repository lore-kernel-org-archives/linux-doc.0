Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792392;
	b=N6evf/ChLmatn1KPZaQS7vHZ76VMio/HkR8K5GkazHZ3rzIIXoXSTtqUexqb4o66fTX2
	 6MW7te+0D7ziEFqepgNUceJ14/DBlnmB+ZdHKTDzVCCPTfP/xOH91shgBYnx91OuvzLPX
	 2Mid2GXxn61UzFukHqbhb7NPVTcKJUY4t3H5XopSSYFc1ELNaMnFhasl5AADaGbsQUv0y
	 9VQQC0V271sFlTuGCURPWcR6m40NXz+ApHmrdr9YZHJbfQ1aDg80IYRx+4TI4uydNwhKO
	 HPNmnk5O50+zVFXJWrVg1OzkV2o4sJg6xStTSrFe1ReK84ftizwE9bK6h91sdp77H8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792392;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=McGfXmMsJaggyhVO48JgpkG8UhfhlryUQ1Qrm70nqEU=;
	b=HM0rHYUR7bStpqLakFN2D+zzmqugqTE8E/3E0mI/QfpOHRiqcJbkpVH5cAGI+vT6ZfjE
	 q7fAyievBw4vfWggwcDbjdDCfhQopUuPnop971j561AstL+otB2M1I4yY7H/DkjADmHyO
	 0yXx4eoxEWOYhbXizetB4X/pZJzdqwYzP7l8Oz+3ryWlmtV5ognOi5zOvwkGq9m+03ZEK
	 ZZzm71dFkibnjAqCl7PFZx+kpEIC0I7/WRfA/2pSSl6IG2KWBVFkEkXQw6k3QWrpYYGjZ
	 XWI6149qD2/ZsjY4FURZEj7FS8PZJM3L+R961N2+vaggsVD0Cy69dxnQK/stOIZMHLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=U1bb65Y+;
	arc=none smtp.remote-ip=91.218.175.69
Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A1606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 01:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=U1bb65Y+
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Je6nTw8zi192wQHqVmmlQ+aCYBg3ySVT0Qp8WfigOvg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794792387; v=1; x=1795397187;
 b=U1bb65Y+AzGGBEwUOOE9/JeMFVsNGdlDUeXc2cFYUU1Tly3MWQ9jlnZlghDh0+gFecHyTXjY
 /XzW2jd9GZK8umZZ9Ah+V9Q/UXgS8ej2E8Mib9tPrP3ncG4VedG/wkfbnos/vDEwmNI9Z5Wh8GV
 VlD1VRlcR48O0q26JfvwzKYeunNUqRgrGZ9qTh+kYggcx2GbDBLZ7zdHclHTDNdOVIwwNz5BNeY
 nKhEE1Gzp2SvHDdatHZNg3FrQhgmoAmd7ohVKh2XFgsySiPiaOQiKk8Dc2JF0OwUueMEnSN+Kyq
 b8pJ2mXre8SeaeAO9NuegVaaru8jtkpEBRJMsYG7y0Zlw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 329f468c44690c3b;
	Mon, 16 Nov 2026 01:26:27 +0000
X-Mizu-Trace-ID: 329f468c44690c3b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 09:26:17 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yan Zhu <zhuyan2015@qq.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, mic@digikod.net,
	dzm91@hust.edu.cn, skhan@linuxfoundation.org, gnoack@google.com,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
Message-ID: <avpbuYL51UHpbAA_@wyuan.org>
References: <tencent_5E314704B7770A972FCB82AC81BB91A39307@qq.com>
 <avpSNfL7FCDVyTK4@wyuan.org>
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
In-Reply-To: <avpSNfL7FCDVyTK4@wyuan.org>

On Mon, Nov 16, 2026 at 08:45:51AM +0800, Weijie Yuan wrote:
> On Sun, Nov 15, 2026 at 11:19:56PM +0800, Yan Zhu wrote:
> > This patch series adds the Chinese translation for the Linux Security Module
> > (LSM) admin-guide documentation, including the main index and all ten
> > sub-pages: apparmor, LoadPin, SELinux, Smack, tomoyo, Yama, SafeSetID,
> > ipe, and landlock.  The admin-guide toctree is also updated to list the
> > newly translated LSM/index.
> > 
> > The original English documentation was restructured into reStructuredText
> > by Kees Cook in commit 504f231cda56 ("doc: ReSTify and split LSM.txt"),
> > and each sub-page has been kept up-to-date with subsequent mainline changes.
> > 
> > base: https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next
> > 
> > Yan Zhu (10):
> >   docs/zh_CN: add LSM/index Chinese translation
> >   docs/zh_CN: add LSM/apparmor Chinese translation
> >   docs/zh_CN: add LSM/LoadPin Chinese translation
> >   docs/zh_CN: add LSM/SELinux Chinese translation
> >   docs/zh_CN: add LSM/Smack Chinese translation
> >   docs/zh_CN: add LSM/tomoyo Chinese translation
> >   docs/zh_CN: add LSM/Yama Chinese translation
> >   docs/zh_CN: add LSM/SafeSetID Chinese translation
> >   docs/zh_CN: add LSM/ipe Chinese translation
> >   docs/zh_CN: add LSM/landlock Chinese translation
> 
> They are still confusingly threaded, and you forgot to name them v2. ;)
> But anyway..

Ah, sorry, not v2. If no changes since v1, then name it
[PATCH RESEND mm/nn] or similar.

> By the way, the 'Assisted-by' trailer is no longer needed, but the
> disclosure is very much appreciated.

If you want to remove the 'Assisted-by' line next, then it could be v2
as well. ;-)

Thanks.
