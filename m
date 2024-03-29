Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9971EB2D
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711727975; cv=none; b=uEX1gkjm3hVwHrU+O5tTAoFqSw/zaj8atACyetwiqXfLFm9XDBw4KxO3dQI0ym+oocAt4qtIXg9/VDPh6Zy3i41B2A+MFJKm3LNwTudEwQF6petnKuUxMACS0k8J/UpaVVykK6t+aEwP3uHNTrTP+wZGpeCAguJc016n4RcqxZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711727975; c=relaxed/simple;
	bh=Ci0lmB/10DSKLkii5x5y0PFZw2+TFkPRy6S1JnliA3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfNZGkjmKrG55yE+5Dp+aGc/CVqLRdeR6Ik/9WNLqEIVEKyUgPIq18ns+NjBB5edMfhdjHrvKK1y0WTOr8y2PZybf2NCif1mBxARvC6yAioDEUl84VanqqbLtyQ5jy+SwKTFlWZp54ZonH0NBB/6Xh8E7UQxRWXqfdCailv6+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lvMtKqGN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lvMtKqGN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2NxBU6JZNOPlIw9j0Dbh+sip5syxK+gQdin/omQT/UM=; b=lvMtKqGNIgdywaeh1MMiqN0tC1
	j9DRPVA4ThbOr/0TOm87iBKtoCHy2XxZxqSCKoUfMNxEHVEG+2C/qc11DqJqoqld98WlJEzl8oX64
	F2OWkRTD4HcP3dtgsJqfiN0Aku3K/PhpWYjBFbCQeI3hqvsQWDXDZ8uyU6yrHHdOidI1no/C6qwGt
	GJqgVH9Zbirsxj9BXLc/IQmo04Bz76YcP9mAzs7mK5tWBYrijOK9P6BnS3aemsvoOsnlqjBUNBGh0
	TbC/DEctwIgJxLVmXWkwGMVicnFlNtGzMXtQlF93SWPTK767N0JyRkffcmpN3rVk18EU/7Avt0Fb3
	Xr3jsZ8A==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqEdg-00000001ENX-2Yvf;
	Fri, 29 Mar 2024 15:59:32 +0000
Message-ID: <83f6f9ae-c383-44a4-bdcb-7267f528a562@infradead.org>
Date: Fri, 29 Mar 2024 08:59:30 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH docs-next v1] docs: Fix bitfield handling in kernel-doc
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Donald Hunter
 <donald.hunter@gmail.com>, linux-doc@vger.kernel.org
Cc: donald.hunter@redhat.com
References: <20240326173825.99190-1-donald.hunter@gmail.com>
 <87frw95bxx.fsf@meer.lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87frw95bxx.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/29/24 07:50, Jonathan Corbet wrote:
> Donald Hunter <donald.hunter@gmail.com> writes:
> 
>> kernel-doc doesn't handle bitfields that are specified with symbolic
>> name, e.g. u32 cs_index_mask : SPI_CS_CNT_MAX
>>
>> This results in the following warnings when running `make htmldocs`:
>>
>> include/linux/spi/spi.h:246: warning: Function parameter or struct member 'cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
>> include/linux/spi/spi.h:246: warning: Excess struct member 'cs_index_mask' description in 'spi_device'
>>
>> Update the regexp for bitfields to accept all word chars, not just
>> digits.
>>
>> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
>> ---
>>  scripts/kernel-doc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>> index 967f1abb0edb..cb1be22afc65 100755
>> --- a/scripts/kernel-doc
>> +++ b/scripts/kernel-doc
>> @@ -1541,7 +1541,7 @@ sub create_parameterlist($$$$) {
>>                      save_struct_actual($2);
>>  
>>                      push_parameter($2, "$type $1", $arg, $file, $declaration_name);
>> -                } elsif ($param =~ m/(.*?):(\d+)/) {
>> +                } elsif ($param =~ m/(.*?):(\w+)/) {
>>                      if ($type ne "") { # skip unnamed bit-fields
> 
> This patch changes this warning:
> 
>   ./include/linux/spi/spi.h:778: warning: Function parameter or struct member 'last_cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_controller'
> 
> to:
> 
>   ./include/linux/spi/spi.h:778: warning: Function parameter or struct member 'last_cs_index_mask' not described in 'spi_controller'
> 
> We might get a grumble from Stephen on that, but so be it, it's a step
> in the right direction, anyway.

I have submitted a patch for that one (new warning).

-- 
#Randy
