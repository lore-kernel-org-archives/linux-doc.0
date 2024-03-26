Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F1F1B28D
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711476260; cv=none; b=TvS3rLW7upTH7imEqGWaE4jCgca9+Ih4pWzeDUMv2Wf+gP9FgBiCRDoIyBGKx+9sIvMBGQuazpA0tUgYCkD9O+VdOvTX+16paMj7i4pubtuKHxUJSTwRDt1fk6d/rtLihCM6uNUdl5oMiLH3QH435yrZLLOIn4JKnhhDVOG/VzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711476260; c=relaxed/simple;
	bh=HPuMqErNPjvdZT8JzTC9+yJ0U1L0jQUkQCvJW/BfpUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUV/AZJbnTjP3aYSorVFTV9n9uTAf8gnaqhkZkk5Dcg4GWHEaDC7cM/YaeLaC8lSnEeKYOjA/Rc2qOuPUMP679N5DUVvDnkXp1nygjigT4CT8/Jt12/BGbRlzgc7nxRwL+On1IHCqeFpq+huxHj4BWG4Etas1rsQhOsngs6FcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SWPFc/sz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SWPFc/sz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OL2IlzkTLyDDVjABKJuc/8MmWtjd7bzBTI0QqxKR7aI=; b=SWPFc/szImRV1QfKV+7aUZyUjQ
	+Y5UBtZxRMwxLY/u1OUASGyS9sRSmyzNXHVvDwg2AB0s9jEapsS89LGDEN9/q51nXGqhfzDNbACXJ
	yE+Rhhhz7TjrBtBxbZonITrzmSsuapsSiYbLJXTN6/ZWS6u5fYDjnWSKmTvusvynVKdBUzyDwWhXJ
	sGjS3Xldry3q46oF6zM/8QwkAmIgnfEozb5bXqN7bVoOk6F1q4Rg5s21JHgM+g/9aytWdgnR4Kk/Q
	MDHrIDSXEX3Lihdt2M1M7qC8FRtF9qYKhe44En5snMASC4Pv5bUuScjogtalkRo8DlFO0HKLMvbT3
	Ue8Tl1ZQ==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpB9l-00000005qxo-2zWO;
	Tue, 26 Mar 2024 18:04:17 +0000
Message-ID: <defc9bb6-aeef-4ee1-bed3-14cf100a789f@infradead.org>
Date: Tue, 26 Mar 2024 11:04:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH docs-next v1] docs: Fix bitfield handling in kernel-doc
Content-Language: en-US
To: Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: donald.hunter@redhat.com
References: <20240326173825.99190-1-donald.hunter@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240326173825.99190-1-donald.hunter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/26/24 10:38, Donald Hunter wrote:
> kernel-doc doesn't handle bitfields that are specified with symbolic
> name, e.g. u32 cs_index_mask : SPI_CS_CNT_MAX
> 
> This results in the following warnings when running `make htmldocs`:
> 
> include/linux/spi/spi.h:246: warning: Function parameter or struct member 'cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
> include/linux/spi/spi.h:246: warning: Excess struct member 'cs_index_mask' description in 'spi_device'
> 
> Update the regexp for bitfields to accept all word chars, not just
> digits.
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

That takes care of item #2 on my kernel-doc issues list:
  https://lore.kernel.org/linux-doc/3a6a7dd0-72f1-44c6-b0bc-b1ce76fca76a@infradead.org/


> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 967f1abb0edb..cb1be22afc65 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1541,7 +1541,7 @@ sub create_parameterlist($$$$) {
>                      save_struct_actual($2);
>  
>                      push_parameter($2, "$type $1", $arg, $file, $declaration_name);
> -                } elsif ($param =~ m/(.*?):(\d+)/) {
> +                } elsif ($param =~ m/(.*?):(\w+)/) {
>                      if ($type ne "") { # skip unnamed bit-fields
>                          save_struct_actual($1);
>                          push_parameter($1, "$type:$2", $arg, $file, $declaration_name)

-- 
#Randy
