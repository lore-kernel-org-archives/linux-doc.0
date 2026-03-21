Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D6D267714;
	Sat, 21 Mar 2026 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774137598; cv=none; b=TfRscXfGKb+2EZZZCD8vqx1Qv2Bt0zIvyNOE1+ENe4nnTUPudwIlIHHWYk5WxY+AnRu/woxb2OaiH7qyDjxb3+Si3OrgVQScYhDKRxxBRiZbYpibWZa8+N8Czpxti4YDdIszbAQjqcnk+GPkJDyoWbXMoAMj3XXPcreMXcOapqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774137598; c=relaxed/simple;
	bh=EYACMA4HqI81wrMo5h2FmYJZml7ibwDQg5GvFIlYR7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a80WPhLCN4IGsKDRIt+KVGTU01F7w5kOaJtCLVfLYF0pgafuesyh331tIB+OVY0JfwEUa2YqVIbzpzrbGSiFZkE+gDu1643iYTgPRnUL/EXU/2o3K0+VGHxSMndX5DVtls5FUuNI3dnaokVfzPu/G6teseXM848yT+t++xDWiUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RQtYzt2+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RQtYzt2+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=g8jk1iQ21koQvfBvXecCSJXtldfQ4k17gRRSWB9u4FI=; b=RQtYzt2+JQ4+r7q8Ykd+DzwOc5
	py+YYEW0rWQWZPzf/8QcFANr0DwfV6G3Ug7sWT3c3l3cGMo0xKrBy1ryuVhVCuTDZLG2+ehkvt4eR
	hRQOwtw6xpgP+IWnc1rHda3AbgPce7IP14CKSwL6gjxqqLns5Q7OnTwnbseEE/PhwMg5KaZLxgu9g
	+t/tCl7wAMmJBLUzzCgPdaO79vFcKxACfT8oXcuvvqcDrbrPmGrEK0JPes+A9Rk5cYyEurrsW1O+d
	tq4+qo/kZfg8+ibo0S2aievux/tStouQgRNQKuCfsnaPhIhyHOmNwVkOp2b5RQcx4h/50PpuDoQ+x
	+35da1RQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w46ET-0000000EtkP-2Tls;
	Sat, 21 Mar 2026 23:59:53 +0000
Message-ID: <6cbf9940-0146-4b4d-bf74-4142b18602df@infradead.org>
Date: Sat, 21 Mar 2026 16:59:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321181511.11706-1-rito@ritovision.com>
 <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
 <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/21/26 4:15 PM, Rito Rhymes wrote:
> That is not expected.
> 
> On my side, searching for "futex" with the default advanced-search
> settings returns exactly 232 results.
> 
> I just tested out reproducing the steps you described on
> Chrome, Edge and Firefox desktop on Windows and the results were
> identical across each.
> 
> Let's debug here:
> 
> Which browser/version are you using? What OS?
> 

I tested with chromium-browser and opera.
Chromium: Version 146.0.7680.80 (Official Build) stable@@ (64-bit)
opera: version 121.0.5600.50

Linux v6.19.5 on x86_64.

> Are you running with JavaScript enabled?
> 

Yes.

> Did the browser console show any JavaScript errors?

No.

> How did you build the docs? In particular, was this from a fresh
> rebuild after applying the patch? A stale generated asset or a JS
> parse/runtime failure could match the behavior you describe.

I removed my previous DOCS build output directory and then did
$ make O=DOCS htmldocs


-- 
~Randy

