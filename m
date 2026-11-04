Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803293;
	b=Hfx9IdkmG7q8gDOGX+9xG01J7RtzIfnTzE+hycgEPtqiGXybVgSqwRDvd019rXGlsO3G
	 c8OpF6N7oGEfnmKazDyysmCdla1SWSNr/OsK74330ESwTnx+Ls6ZjyuvYk5JSUu8Xl8Wd
	 yj+t9EDiACfqRNKSYMuCL6cmh6E82EHUvFN6g1Ls6jwoK+1J/AQWpuIcPaVEhP5irflDx
	 9VeqTsauHHvnbIkMvTkbjL50Tfv0C5CT3NMtfu/tYp5KAt196fYsKPZoWqPq7DyXhXaBZ
	 X/pAOZ/rVzg916pdfWtnr+OVBe47RCYqe4MwjpOrUReasejNjI3y898OY31cSkRO9dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803293;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=hRxev9xX3k38qFhuqn9DfPqjt/pu5FOdJR+RzgR+mtA=;
	b=HCgXILjf+n3km7N0NtGKV4y9eTUeDIPJ3wXZJG87HBwkP2oAmBQLCr8B3mHQ0v5q+vi+
	 AQmISQarD7ikQXWMVCx8hY++2+XlP0jXktXSgEuXe2S/BgKrqMaaHSAvkiEhRJeLQioCI
	 Iafsvc3eCGl3fk7/0wcWjeWTn3N2zznX1wTqUVOma1sG1oY67+UoAUSR6uG7nezdKK80K
	 gktlQffpsC8XP0nPE6lWiJLkSzIFsPaYBvN6/M6nf7ilEeUsfyqfaSFnx8y8Qk7PVgVJ8
	 JIxbdFHfjyHLnDert7ADFKCWso/ZUaaCO2c6XvSD86L52TQ6BZYjH2vbOKNLtVt9zPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47716606A32E
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 14:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47716606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QiorddpL/2jAm0XZLedFDDB1B+wFcsgZAZu90qBVX9s=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793803289; v=1; x=1794408089;
 b=C8qM9YImRDRkrwcvm86h7UOs3MLx66eZMUEsvf0qnZqzikU5nvyh0ihAfu/FPjn0D0Tcm01C
 FjFrSQm9qqBGdctJ8mBeob5nAOlJJD8Ztp2hHt+NaBWsYGXY4wKjPjccq5NngLgAt84K3l1gm5j
 ovBLYd1I4TQW/gZfzGbBkZUYXXHu5xp5eiIM2TLrRrJ+zhaSy6wiREFUsYaQmbkfU0MrmyO4yLR
 mJwopfNSlwGiaX7erC1TA5Pf6HTMfY+4TV7eUSesY+8Jc/4OvaW+b5v2oOn7bthFgJLGRPYaGT6
 9/TFmC8cLQAsFILHo9BICET7vlg7Cw/yqHuqcTQsoSVxA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d1a2aba573d0e9ed;
	Wed, 04 Nov 2026 14:41:29 +0000
X-Mizu-Trace-ID: d1a2aba573d0e9ed
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 22:41:24 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: =?iso-8859-1?Q?R=E9nich_Bon_=B4Ciri=B4c?= <renich@evalinux.com>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in
 xfrm_proc.rst
Message-ID: <autEFEW15g5I0oVT@wyuan.org>
References: <20260920073144.546566-1-renich@evalinux.com>
 <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn>
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
In-Reply-To: <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn>

On Wed, Nov 04, 2026 at 10:32:43PM +0800, Dongliang Mu wrote:
> 
> On 9/20/26 3:31 PM, Rénich Bon ´Ciri´c wrote:
> > Commit 03e23b18c720 ("net: Move XFRM documentation into its own
> > subdirectory") relocated Documentation/networking/xfrm_proc.rst to
> > Documentation/networking/xfrm/xfrm_proc.rst.
> > 
> > The Simplified Chinese translation was not updated accordingly,
> > leaving its :Original: tag pointing to a nonexistent file and causing
> > tools/docs/documentation-file-ref-check to report an invalid reference.
> > 
> > Update the :Original: path to point to the new location.
> > 
> > Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
> > Signed-off-by: Rénich Bon ´Ciri´c <renich@evalinux.com>
> 
> Hi Rénich Bon ´Ciri,
> 
> I have proposed a patchset to revise all the inconsistency between the path
> of Chinese translation and English documentation and these invalid original
> fields.
> 
> Please refer to this patch - [PATCH v3 8/9] docs/zh_CN: update
> networking/xfrm/xfrm_proc.rst translation
> 
> https://lore.kernel.org/all/c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev/

Ah, I haven't had a chance to look carefully at your series yet. Then
this patch can be discarded in what's-cooking.

Thanks, both.
