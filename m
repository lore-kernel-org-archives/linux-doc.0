Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDA78F5D
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762923573; cv=none; b=PNiSpRHZ6EH0Wp7yIDH1Ie3bKdMO067eoBITU84xZ4r82C6AYP2XucD75+noDE8891b1DgXzp/pRVQQFjANzCHhbT6QBYuIggEMcS+ZmeNUDQX5hEO9pRnCQGo7qP2qH4GwiwOItPH2KmffUWsuuJCylmxl3FFrodXopwRPBm9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762923573; c=relaxed/simple;
	bh=DtiRPsNY/l5VYgy0C5Ku2kUfjD51bi0e+oKhWji3YPo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=lyrh7kEd1H4mkMyPtqGHi5nGwStSB2kSgZCVtGEs1YxHFNvUximWyyTU1hPzdv2JGp3j8Th5JRUaw8nozdd5KVUptfuTUgCsU8jbTP0nduJzz5SHGZdNBfupLKUPVX0BeZWICmAk2FgPj43cYWZDZerWV16HmnsN1sQ4Wg26tpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BxYLJAkI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BxYLJAkI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZGbVea+zrEUsfdkGlkeUf/VwLYf3XmZ0A4wq972tLPo=; b=BxYLJAkIf1WYX58Bfbkz3yiPuV
	gzIs5O5WAw6+Ggyifzj97mkC6WQqzTEAX9LkQDR3wzGvd8SbBEGylCJ6V+Jz4QKSxx2b03VpdAiOM
	v19YWxEHT6oKD0Aw7QZRn+XiHgN8bNxN6BRbdJBlx9NqeDv7gCotm0wd0Pztj7o/RlBl/Kx35eF3a
	0eBrXlr/WtMpHH3gztxuEQzdDt225mlp4v0tF1Nj+LVq5iXwOqpTrb3H/i8KHvSR2vRFA6Fto9W/k
	5/YVhCeA33nerYpP9drqE35/xQq5tdJUZK6WcEltjIw5C4Y1WgZrzL+86OAFS+7Um/WmV9O0GnJgC
	Wlm/H3/g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ2x3-000000088vU-3XZI
	for linux-doc@vger.kernel.org;
	Wed, 12 Nov 2025 04:59:25 +0000
Message-ID: <0fa53fbb-8505-4107-8f1f-4082123fdde6@infradead.org>
Date: Tue, 11 Nov 2025 20:59:25 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: confusing ReST/html
To: Linux Documentation <linux-doc@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm comparing Documentation/core-api/index.{rst,html} and
Documentation/driver-api/index.{rst,html}.

Lots (but not all) .rst files end with something like

.. only:: subproject and html

   Indices
   =======

   * :ref:`genindex`

Both of the core-api & driver-api index.rst files do...
with the difference being that core-api/index.rst has
one space following ".. only::" while driver-api/index.rst
has 2 spaces following ".. only::".

Does that make a difference?

When looking at the end/bottom of core-api/index.html,
there is *NO* heading "Indices" and *NO* link "Index" as there
is in driver-api/index.html.
Why? 

There are other cases like this one:

$ cd Documentation; git grep "^\.\. only:: [^ ]"

RCU/index.rst:.. only:: subproject and html
core-api/index.rst:.. only:: subproject and html
rust/index.rst:.. only:: rustdoc and html
rust/index.rst:.. only:: not rustdoc and html
trace/index.rst:.. only:: subproject and html
virt/index.rst:.. only:: html and subproject
wmi/devices/index.rst:.. only:: subproject and html


thanks.
-- 
~Randy

