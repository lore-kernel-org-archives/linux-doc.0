Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9995210183
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012498; cv=none; b=beLuJ0M0zF4xTuNhzmXKWUcTga6xmlFBvvxdLSFXxoku1HHNP6tcL3XUiI56/jxaLtvBRTtTkwGtvwx0HjiAOtxzQv9bScEciSy5LeAmm0GMOz91IH9/GJEfwG19Wee6UmaPMlMoKg8CabtaLg2IbOjkWzRa8B39AAaty0cHSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012498; c=relaxed/simple;
	bh=O4yn0mWktQiRuWEotEE+hxIyFubkgmcKDdP+uYATkss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcIPBCdB5XJgDUTYMyOFaPeIEnhNgEATmYEvJM4Hl5XHcvtIYgeNeB1DdavHxOBWFqeKYenXU/80wm8RI+fVb9DxfB8e8JzIucUhKM+KwmTsdgAGT78GzJT3d5gubAw5mF1ys6QyPo77Q55usZZVeVYZOPhBTC10uRyIImr2caA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IO0XFTXJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IO0XFTXJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=32IbT8gsvLnvQ/AQQIeLdH4usfAdKM4fVkLSmo18VeI=; b=IO0XFTXJfEG650qp1VcGUzjczn
	rxK/ohneU5T2AglsWJD/ZBA7ig29wCkJ1D6uMi/bqpGZLc9drNKSk6MDtAQrYRwH7AV0YRonIbQqF
	HNTMC9ojSpEp27wBQ49yAHhVfpFw0JmXDtuFbywPk0dW+h4uiYrsrEjGViumk7JnxwpLVb/FG/Df+
	IFien1vgJL106oBJNmG9U3XbZF3uVdcWyx+JpHEaaFSm50xbKJo6t1DS8Z+TSmZ9x9RDJwjNqaWU/
	GarcYaUSqpJXWmzMq/CZt0g7+vvYTxvAfRx7txliboLIHUA/al9fm8UfCAROpYtyMHm7wRlj9sYZ1
	dmLpXsWA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l88-00000005LXK-3Myk;
	Tue, 15 Oct 2024 17:14:45 +0000
Message-ID: <ba5fe544-df7f-4a94-8790-17aa3d616ab6@infradead.org>
Date: Tue, 15 Oct 2024 10:14:35 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kernel-doc: allow object-like macros in ReST output
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Horia Geanta <horia.geanta@freescale.com>,
 Vlastimil Babka <vbabka@suse.cz>
References: <20241014051333.462847-1-rdunlap@infradead.org>
 <87cyk2u1lu.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87cyk2u1lu.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/24 8:48 AM, Jonathan Corbet wrote:
>> /stuff/k/git/kernel/Documentation/gpu/imagination/uapi:169:
>> ./drivers/gpu/drm/imagination/pvr_device.h:686: ERROR: Unknown target name:
>> "static_expr".
> ...that I haven't been able to track down yet.

I have found/fixed this one.
Doing more testing.

-- 
~Randy
