Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568BE40D588;
	Sun, 21 Jun 2026 00:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782000411; cv=none; b=fQ0uUxFZy0kuyGs8hjO1SuEU9PgeVIPZN66f4EnhdOCJHIfdryqorj6x382yB3uvV4Qxz3ylP+FArAKL7ALJNEpVkB38r6YB1sFPD9t5tDaKEil2AMfgW3qIsqR5auLkWt8TJQuayGwL2ixDGrU5ZW0e2LQ7fDsQEay29qICzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782000411; c=relaxed/simple;
	bh=nxHsOfNvgDDrkIqCzxnRR5An6Vp0dP2oMifRiUO4LjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTeCCaHzKEss3vzVsUcu8g2nwErBihCR9YNgugtlyymn6KfoximekGvj/BQsiuwx0U4kHQajKGgg+GIzISDvSY4oCsF18juKRFTUhTOJBQvGqYutD6wDScx1DEL0/s8EKdcDirUZWDPjVuJh3SCE6aeZAMNobg1KzYrBlaJYUeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XSZemsJw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XSZemsJw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nt//4b9HvMKZXrBjRYnXvcqaO8zaeCMh8zEgavgMWI8=; b=XSZemsJwNpnX7FPTxyvsuKnGuP
	aD8KDcaA3Lly1mEXBSTbjE3BHXoacfSBWTIDdd/TIjXzseIIDKbfpMSQGT7KUy5r0Y50CRltH0NhH
	q1+6USywiR5HiuEhwQGEJWwBXCPtgjNEmTquCxqrxjlq+q6AYsiZQFpvwxqhSAE9W+MHnmsbV4rd9
	fES5a2uG7EzNK88FgihDI0Zjp5DHRJik4sFUrna1p4U1tAP6J/WrG7srqHmObxxNqmW5q5Ay2AjWb
	uABxCkLQKZuwyySHHR2xBsx1I8dvTxNoxGcCZtkuVQabWToNRzhvpzKeb+aw6CCJTGXv/NHf3zJRK
	WSet8VeQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb5i3-00000003eCC-1t7F;
	Sun, 21 Jun 2026 00:06:47 +0000
Message-ID: <66999bde-cc8f-4f7b-a87f-d448efaee8fc@infradead.org>
Date: Sat, 20 Jun 2026 17:06:47 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ipmi: Fix path of the "hotmod" module parameter
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corey@minyard.net, corbet@lwn.net,
 skhan@linuxfoundation.org
References: <20260620122747.7902-1-zenghui.yu@linux.dev>
 <626477f6-8bda-4cac-8341-c720fd279ba3@infradead.org>
 <54430fa8-00ac-47b7-a8e1-b2843581ffc5@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <54430fa8-00ac-47b7-a8e1-b2843581ffc5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/20/26 4:06 PM, Zenghui Yu wrote:
> On 6/21/26 2:40 AM, Randy Dunlap wrote:
>>
>>
>> On 6/20/26 5:27 AM, Zenghui Yu wrote:
>>> The correct path of the "hotmod" module parameter should be
>>> /sys/module/ipmi_si/parameters/hotmod. Fix it.
>>>
>>> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
>>> ---
>>>  Documentation/driver-api/ipmi.rst | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> There are several other places that use /sys/modules/ instead of
>> /sys/module/.
> 
> Yup. There are:
> 
> Documentation/driver-api/ipmi.rst:This is done using /sys/modules/ipmi_si/parameters/hotmod, which is a
> Documentation/process/debugging/kgdb.rst:config string to ``/sys/module/<driver>/parameter/<option>``. The driver
> Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst:参数，或者在 ``/sys/modules/damon_lru_sort/parameters/<parameter>`` 写入正确的
> Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst:    # cd /sys/modules/damon_lru_sort/parameters
> Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst:參數，或者在 ``/sys/modules/damon_lru_sort/parameters/<parameter>`` 寫入正確的
> Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst:    # cd /sys/modules/damon_lru_sort/parameters
> drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/debug_layer
> drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/debug_level
> drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_method_name
> drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_state
> drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_debug_layer
> drivers/acpi/sysfs.c: * /sys/modules/acpi/parameters/trace_debug_level
> drivers/acpi/sysfs.c:/* /sys/modules/acpi/parameters/aml_debug_output */
> drivers/base/module.c:          /* Lookup or create built-in module entry in /sys/modules */
> drivers/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: *         On the fly: echo {0,1,2} > /sys/modules/lpvo_usb_gpib/parameters/debug
> fs/btrfs/sysfs.c:/* Set perms to 0, disable /sys/module/btrfs/parameter/read_policy interface. */
> fs/cachefiles/Kconfig:    enabled by setting bits in /sys/modules/cachefiles/parameter/debug or
> kernel/params.c:/* sysfs output in /sys/modules/XYZ/parameters/ */
> 
>>
>> Would you care to fix those also?
> 
> I plan to fix them by subsystem like:
> 
> https://lore.kernel.org/20260611142518.77343-1-zenghui.yu@linux.dev

Great. Thanks.

-- 
~Randy

