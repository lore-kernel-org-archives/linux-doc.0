Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B3929BDA3;
	Thu, 27 Nov 2025 01:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764206858; cv=none; b=kgDvJvhs1xcAZbL0pygwJn5IYwHZIKHl7olxZ+kthzik7IoUKfxqauWsl3Zafl1ZoU5a5eP3pBm3cbusCvnZGYQz3G9+EvgcjRKVeHQJ3IMBMv8tK2PD680sPQgYCWNzvPKYGqG5VuSg6yfNBwAse1LhA/CCU+77Hd4TFM+VLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764206858; c=relaxed/simple;
	bh=QUG6b/oEUIkafGfeyg7P0slRMLU9+ohYMcWqfAH/1t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qc3fyQeKK6UxPR3VD0fPqFl7NdRzAY9QSZAOL4dQLdHxQ45JHSfmMfnbOEp+5UI6GEEZf3robaWvPS6lzlEySdYaDUGMx9luxpWiJ/s2FQ9XKg5C1CQf54vde5XjC9QYTPtJ107TKuhpV3Hxi0mFPDypyrttYEpQ4Te+wJiEPLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hfIpV2H/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hfIpV2H/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=usvD8mHuGz16OSWdMkQVp7u4ZD3hxFQRYOZfFfImuyk=; b=hfIpV2H/ufMPxogacOZS1Dyivr
	gEJ/OWAandoCIKwVFEvgRgXpIFVjrXVc+HZqO22nY9FlSUQG2vovQhzojsMj8dfYHmWd3uIxGIfIN
	Mxw6A52AIAzwTsF87oJ9EhFyc9g83bfvOgxKxsFqPFSuwc2eSAsUA+imscTiF8FGu2YdenFhQBzER
	YIyb/8OX8vjI8cZMtr66nkktIdhEoK1zB716KfpgJfNicvdeG0CRmGMCCJi2FmRB3t8znSk2FxEwm
	64vOkbFxUyt2/u3kUFSic6uF1rJ8im5a1zMT3D3xlb7EXfZyG6PEYIvR3VcuIt9ur5/6ZKKa1oV+j
	7rljSNmg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQnG-0000000Fr0G-2gyP;
	Thu, 27 Nov 2025 01:27:34 +0000
Message-ID: <e1dad7e4-a0ca-4be6-a33c-97b75175c12f@infradead.org>
Date: Wed, 26 Nov 2025 17:27:34 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] kernel-doc: add support to handle DEFINE_
 variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
 <a64ce3b4bda7d3010beaa889347ea32af4fd9ee2.1763978209.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <a64ce3b4bda7d3010beaa889347ea32af4fd9ee2.1763978209.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 11/24/25 1:57 AM, Mauro Carvalho Chehab wrote:
> Improve the parser and output plugin to work with macros,
> adding support for the common pattern of using DEFINE_*
> to create variables.
> 

I can't get this one to work: it is completely ignored AFAICT:

from the init/kdoc-globals-test.c file that I provided earlier:

/**
 * var rtnl_mutex - historical global lock for networking control operations.
 *
 * @rtnl_mutex is used to serialize rtnetlink requests
 * and protect all kernel internal data structures related to networking.
 *
 * See Documentation/networking/netdevices.rst for details.
 * Often known as the rtnl_lock, although rtnl_lock is a kernel function.
 */
static DEFINE_MUTEX(rtnl_mutex);

If I remove the beginning "static " and change its name to test_mutex, kdoc reports:

WARNING: ../init/kdoc-globals-test.c:100 DEFINE_MUTEX(test_mutex);: can't parse variable

I have both of these mutexes in my test file now. Here is the second one:

/**
 * var test_mutex - historical global lock for networking control operations.
 *
 * @test_mutex is used to serialize rtnetlink requests
 * and protect all kernel internal data structures related to networking.
 *
 * See Documentation/networking/netdevices.rst for details.
 * Often known as the test_lock, although test_lock is a kernel function.
 */
DEFINE_MUTEX(test_mutex);


-- 
~Randy

