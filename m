Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1C3A262;
	Tue, 19 Dec 2023 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PB47i43/"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E8C4949B;
	Tue, 19 Dec 2023 21:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8C4949B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1703020641; bh=/KuZo75STwYheZd6l4uYv8zZeBgyGOAaR8QKIT2qZx4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PB47i43/YteW94P5PwZJGj4WkuUXjEV1zIPX2EgnUNar2/wIAuyogrLePN3GprU7S
	 OvO0Wdv2TY6UGMH05+BzYAIeS+0S2ymHJkCMe1k6QJTJtRUszoe4HPOW0WvWxLPE5B
	 LqO0jcSvsH5x4sPevISKwBNw4Q9OCVp4HcVf+yELqcfovEmbJ+ccfHZZWZOq5zCd2f
	 +sST18NEiAy06a2TYIp7IDAK5W6mpo6Ez29ZQSk+s5IUMF869cUnBu6V3IITZtYMad
	 3vh0BOu0Tb5taAFrb1LlKJPglZH4f4mZ4SzvhD6HaxOX1wbgzaiOZk7ZucVKhCmX6g
	 Hhi8yLMSyAMCA==
From: Jonathan Corbet <corbet@lwn.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] kernel-doc: Aling quick help and the code
In-Reply-To: <ZXyMkk9oV3x40L08@smile.fi.intel.com>
References: <20231215150341.1996720-1-andriy.shevchenko@linux.intel.com>
 <03c0b3bd-5798-4066-964e-a884485fe1d3@infradead.org>
 <ZXyMkk9oV3x40L08@smile.fi.intel.com>
Date: Tue, 19 Dec 2023 14:17:20 -0700
Message-ID: <87plz1hoyn.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Fri, Dec 15, 2023 at 08:49:37AM -0800, Randy Dunlap wrote:
>> On 12/15/23 07:03, Andy Shevchenko wrote:
>> > The update to the quick help mentions -Wshort-description, but
>> > code never supported for that. Align that with the code by allowing
>> > both: -Wshort-description and -Wshort-desc.
>> > 
>> > Fixes: 56b0f453db74 ("kernel-doc: don't let V=1 change outcome")
>> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> 
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thank you!
>
>> (Note: in Subject, s/Aling/Align/)
>
> Indeed, Jonathan, can you fix when applying?

Done.

Thanks,

jon
