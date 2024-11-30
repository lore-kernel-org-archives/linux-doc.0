Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA99B1C6A3
	for <linux-doc@vger.kernel.org>; Sat, 30 Nov 2024 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732954253; cv=none; b=NUz7FbhH565Iz9Q0x00kDFTVoxuY3HNZ+bCX1w0XTkKeh6bGbQBdgd/Gh/681Bkte/luHCD8cHHqgLkLlQZjbBYj3xQ+7odD6MT4J4JE4pZLjHuhrTRJa+D/4chonzYWDhO5R+1566j1bgTFgY2ggX+b0UfI+dJozrusFMdGQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732954253; c=relaxed/simple;
	bh=eJx+89nyBBSyds/6wvLWkCEiwIB0cvvqivz1chFJ82c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=rMnh9E9atVn6oCXRNkYOCtkPjOyulhbB4YAp9so7RSbzDBRFHoCNxerm6KtUtnVvss8qmfgSHQxBSmJm5RMzhdHqE0Wh6DhdjV1V8tw2VFnMzdg+H8rxTRkE8tvf+N/n0BZjxNce/fx+HQIoB87zB4ylg70nm0KJ++UTkWew8LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IWqINW2n; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IWqINW2n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ft2wPZfLjgiSoIHibMB1+drSBTUSblB0hXUiCD3yNec=; b=IWqINW2nM8vZ8zPADedpCCHvtS
	1CvOydaPBP5E0+kSEwCLsGBzjwMeS0j7BbbRrZNGzFAR0OTbbdEITva0hr+H0/Cnji8ga0kd/K7z9
	EmSDs44GRnc2O0uhG7zlmH94SFpOJpP59e87Us89I+QPBbi8cCkpL3+a21XPG39Swbpf6dyyuhaPN
	o/iXKriO2QXx0OSJ2QQY0dALexuWZgP1cHSKCwzfTvDA9BkL3rAw8gVHsHaHV40USrxGtgKN8D0IN
	LyuS+mUaB3OOJK/Y80le7ogoVTnm+bIAgFQMWkO1qnCSa3g77waclWOHZQ5/RVkwyhu11WP1+Jy6o
	2fFLz/NA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tHIYn-00000005GZT-218r;
	Sat, 30 Nov 2024 08:10:39 +0000
Message-ID: <a81c6e57-46ff-4347-9ddc-2cf566065b11@infradead.org>
Date: Sat, 30 Nov 2024 00:10:34 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: move kgdb.rst from dev-tools to process/debugging/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

It seems to me that documentation for kgdb should be in the new /debugging/
sub-directory [or that all of /debugging/ should be under dev-tools].

Same treatment for gdb-kernel-debugging.rst.

Any comments about those?

thanks.

-- 
~Randy

