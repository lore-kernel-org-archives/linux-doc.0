Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473373C660C;
	Mon,  3 Aug 2026 23:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800901; cv=none; b=Cy0Ll0wYuwqEIY6yjwF20gO8gE4Q2OkULyRI6JWf+KD9tAaIMDq2UInRPx7tUl723qrZVH7NkuDLDJDBfVsV0wrvJcO+OP0TpvSg/t0ov2qWfwzXHOEwOQLcht3WixO54e+yXtGz4R0IykdXjrdSy+cRSjqWArCedOjiDaeZmB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800901; c=relaxed/simple;
	bh=ATHDkwUD1Dl7QXskALgihJcuOsT9ylbHyhARDhOobcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDFV4sPc7HDoCyVnSd55SM4XG2T061UkwTCoCO0xJnoSqjodPazglk0t0ysHIQK7ooD9algthievPODWrSvQZsO12lUsbv8+XvTT0r0vTF2LjlRqMnGqJy4dCjyANX3JLAuzJ35oUp/uFIFFVspLSU/uz09i5SNzMnC3+uM1jbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kljLRns0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kljLRns0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/papcsqZQOeJl3xEDd43H8tXX2w/WM3BtGr5NpmWOZQ=; b=kljLRns0797izlrBMKSqGkTpdv
	gYKnebZIpAq6HQirtNBSMR+wJK+5TW9xjSlxUHkkDCMMHqB5d214GG74B3k54RExDH1bJ/fB/ZgEh
	FS38PfHx0alzE76Q7XM1ALsjSF9oUxWW9CnPa8ODfCylVLt8/UBFVDlRMvzch876VO1FQuCisYoeX
	R4eG1aezN/tQxEOhWQJfN+MpNSIQUFeuitNZxlDmKGaumA0DQYO+mLihErbnKEan64OA8tfma1XkX
	kuubnB9K4UsiOFJJEE6icyT9cFoBq7e4ma2qCjrIiDqjds3fS0bl5oEXheXXjHRXmf7uOA25yUatA
	Qrb7F+Dg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr2O5-00000000ivv-3s42;
	Mon, 03 Aug 2026 23:48:05 +0000
Message-ID: <6928a83e-b268-4905-80e8-7b65048dd040@infradead.org>
Date: Mon, 3 Aug 2026 16:48:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Documentation: html: show sections in the sidebar
To: Jonathan Corbet <corbet@lwn.net>,
 Antonin Godard <antonin.godard@bootlin.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
 <87cxvzxbin.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87cxvzxbin.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/3/26 12:13 PM, Jonathan Corbet wrote:
> Antonin Godard <antonin.godard@bootlin.com> writes:
> 
>> The current sidebar in the HTML version of the documentation does not
>> display the section titles because the toctree directives in the
>> top-level index.rst document do not contain ":caption:" properties.
>> Replacing the current section titles by ":caption:" properties would not
>> allow having text between those and the table of contents.
>>
>> To workaround this issue, add the ":caption:" properties in the toctree
>> calls which makes them show up in the sidenbar, but hide them from the
>> index page with a custom CSS addition.
>>
>> Additionally, make the section titles in the sidebar bold to make them
>> stand-out.
>>
>> This makes the overall structure of the documentation clearer from the
>> sidebar directly.
>>
>> PS: This is how I've implemented this in the Yocto Project
>> documentation[1] where I faced the same issue. See also the index.rst
>> file[2] (which was by the way inspired by the kernel's own index.rst)
>> and CSS addition[3].
>>
>> [1]: https://docs.yoctoproject.org/dev/
>> [2]: https://git.yoctoproject.org/yocto-docs/tree/documentation/index.rst
>> [3]: https://git.yoctoproject.org/yocto-docs/tree/documentation/sphinx-static/theme_overrides.css#n106
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Antonin Godard (2):
>>       Documentation: html: show sections in the sidebar
>>       Documentation: html: make sidebar section titles bold
>>
>>  Documentation/index.rst                |  8 ++++++++
>>  Documentation/sphinx-static/custom.css | 11 +++++++++++
>>  2 files changed, 19 insertions(+)
> 
> This looks like it could be a nice improvement, but I have a couple of
> thoughts...
> 
> - Did you check the PDF build to be sure that the captions don't intrude
>   in some sort of obnoxious ways?
> 

I only checked html and epub output. I can't see that epub is affected.

On another note, it would be good to have the kernel version listed in
the epub book (output).

> - I'd tweak the CSS to remove the white space below the section
>   headings, just to bind them to their subsections properly.


-- 
~Randy

