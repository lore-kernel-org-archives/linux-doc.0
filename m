Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E701F9ECB
	for <linux-doc@vger.kernel.org>; Mon, 16 Feb 2026 01:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771206432; cv=none; b=G8ZrVunDqPcCEUbXDJpMA0/qbNMAIXrvMqzswSH/dj/SwbjlQ/b4GXmbZpMyiU0sqN3XOiixcaVG699QpryClE93ljWaVCVgefo/X+ZlZp85QwOIa4WnC0dcHB5EtuqYtIzrw2vHdo6bUlJ6auA6Xlic/cjqQpKu7EyWRlssjwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771206432; c=relaxed/simple;
	bh=fCS7ADNlKDN4aSsEiuypi8RH1iuNpnMjldvF4u5oWZY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=BDHGEqlFOSd+yo6xRLnreK4kBohYPxioQBV+fjZm5PMh3dyclb1kdWVbQ0dlljMCJ1qca493ZhGZ9offn0Oj7DPWSZSuz/VKB0IDpoxWPQuXXK5qgLuJirzWc+WFSWosQbjQSiwqIpWM+SCo3krtqUwKndiAoesqmE7lMcJXPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CXx8W3nl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CXx8W3nl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+4JBxTT8hbS4Z36DTerQBmCWlO3RN27BtJPwgjxhseQ=; b=CXx8W3nlyBOVm54WoeyeFYDJZH
	AL80kPEuOfBvpV+GNlHE8Jh/UxtuC5tOxGkGsHSIQBfFe/kAzN/Iktiqu8sxgtrbC3QBs9h7uNGwn
	aXnfWelzwGIfNXW/ZKCS+hYLTbuxo5D7hjdPsSK6+2BgNf8FfxZ6v1ZnHRJG25u1Dx2TUZsHru/6q
	Q3jKFknSTK5cxSYaWWFWmn0RiWFaDXUlfRYvlXc7Y9d4zkL8zPLe9A+0e2WSD9UMVUuXPDayh5mKl
	hGWDjpKErKRiEVbLZXJiHWJt+uTJCVThymvxEQrnK7YahQZIJfwMkIZtIvcnEmA3Ee/dICmLgvUiS
	m38OiXCw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrnhb-00000005rJc-48F5;
	Mon, 16 Feb 2026 01:47:08 +0000
Message-ID: <1c1eb223-8fb6-464e-9d32-4abfd15afec3@infradead.org>
Date: Sun, 15 Feb 2026 17:47:07 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: kernel-doc for nested structs/unions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I have run into some confusing discrepancies (differences) in how
kernel-doc handles some nested unions and structs.

Examples:
in include/linux/property.h, struct property_entry, there is this
nested union:

	union {
		const void *pointer;
		union {
			u8 u8_data[sizeof(u64) / sizeof(u8)];
			u16 u16_data[sizeof(u64) / sizeof(u16)];
			u32 u32_data[sizeof(u64) / sizeof(u32)];
			u64 u64_data[sizeof(u64) / sizeof(u64)];
			const char *str[sizeof(u64) / sizeof(char *)];
		} value;
	};

Running kernel-doc -none on this file reports:

Warning: include/linux/property.h:406 struct member 'u8_data' not described in 'property_entry'
Warning: include/linux/property.h:406 struct member 'u16_data' not described in 'property_entry'
Warning: include/linux/property.h:406 struct member 'u32_data' not described in 'property_entry'
Warning: include/linux/property.h:406 struct member 'u64_data' not described in 'property_entry'
Warning: include/linux/property.h:406 struct member 'str' not described in 'property_entry'

If I follow the instructions in Documentation/doc-guide/kernel-doc.rst
for using kernel-doc with nested structs/unions, I should add @value.u8_data
etc. for these 5 missing kernel-doc entries.
However, that still fails with the same warnings as above.
Adding only @u8_data: etc. for these file struct members satisfies
kernel-doc.
Conclusion: don't use the nested union member name (contrary to
the kernel-doc documentation).

~~~~~
Now if we look at include/linux/soc/ti/knav_dma.h, there is a struct:

struct knav_dma_cfg {
	enum dma_transfer_direction direction;
	union {
		struct knav_dma_tx_cfg	tx;
		struct knav_dma_rx_cfg	rx;
	} u;
};

Running kernel-doc -none reports:
Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'direction' not described in 'knav_dma_cfg'
Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'u' not described in 'knav_dma_cfg'

After adding comments for @direction and @u, kernel-doc -none reports:
no problems with this struct, where the struct kernel-doc looks like:

/**
 * struct knav_dma_cfg:	Pktdma channel configuration
 * @direction:		DMA transfer information
 * @u:			@tx or @rx configuration
 * @tx:			Tx channel configuration
 * @rx:			Rx flow configuration
 */

so kernel-doc is happy with @tx and @rx without having the union name prepended.
Well, this is again: Don't use the nested member union name.
OTOH, if I do add the "u." to the @tx and @rx members,
kernel-doc is still happy (no warnings here).

~~~~~
Looking at include/asm-generic/msi.h, kernel-doc reports:

Warning: include/asm-generic/msi.h:31 struct member 'flags' not described in 'msi_alloc_info'

Easy to fix. Add that and kernel-doc is happy. Now we have:

/**
 * struct msi_alloc_info - Default structure for MSI interrupt allocation.
 * @desc:	Pointer to msi descriptor
 * @hwirq:	Associated hw interrupt number in the domain
 * @flags:	Bits from MSI_ALLOC_FLAGS_...
 * @scratchpad:	Storage for implementation specific scratch data
 *
 * Architectures can provide their own implementation by not including
 * asm-generic/msi.h into their arch specific header file.
 */
typedef struct msi_alloc_info {
	struct msi_desc			*desc;
	irq_hw_number_t			hwirq;
	unsigned long			flags;
	union {
		unsigned long		ul;
		void			*ptr;
	} scratchpad[NUM_MSI_ALLOC_SCRATCHPAD_REGS];
} msi_alloc_info_t;


Two questions here:
(1) Why are @ul and @ptr not causing kernel-doc warnings?
(1b) Should they be @scratchpad.ul and @scratchpad.ptr?
(2) Is the typedef confusing things here?

~~~~~
For include/soc/fsl/dpaa2-fd.h, kernel-doc reports:
Warning: include/soc/fsl/dpaa2-fd.h:51 struct member 'simple' not described in 'dpaa2_fd'

Adding a @simple entry satisfies kernel-doc, but isn't kernel-doc required
for @simple's struct member fields also?

Well, feels like I am rambling. I thought that I had a case of
the enclosing struct or union name being _required_, but so far all
that I have shown is that it's not required (in these cases).

-- 
~Randy
