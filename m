Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FC379C3E;
	Wed, 13 May 2026 23:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714074; cv=none; b=oa2fUXKAECaBJRM2gA3VROSRdIf41UT4dhBs9yskyj2phtDsEZPrcww0wdbWsbS6gc3Kfnnx4Oo5j3oJB1nOpRooeLODnoGVwDIy83r/kgvoIW93CEnmNcnvUC7dsKAC4cX7osOQf8hipn541EOC2vGhfG5NI1s6BsPX+RS20/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714074; c=relaxed/simple;
	bh=a349y1WzC7yVGPMw8wZDzzWUl9mcuLcUa+RVC7GYcUQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=evV52w1RSuGo1EYL3/v0eRcGrEMC8lGVY5nv2mbeTsy6SX6cYEmkrnDvgRHJR0+/HKn8dI4gz5/s6T7Ri02nTb+102Ya3cEA1T0YNrRDr7invom0iK03xxoPTur4+FxH0ms6n83LtZdtW8ZYmwAeIqRQz3l7l4IEfZ+KFr9CbF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Hs8YFVC6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Hs8YFVC6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gd4PcRpZuIGIXKKdBIxITFqgrQ98fHevmirCIzDXH2E=; b=Hs8YFVC6HqKXSSrY1+LedrRCkv
	xKlF0oA0wVe7U4Di8MrjtD4Brix3gvRTQ6uaOvdgEZDCh4Rt41DAeuNso7A2AOX+PGTFUaFuhAT06
	vjDlSTLWQbC+oC1WFF0WLFRZtTDPHcV2QVPUEXl40r/6kdIGie3LuF7Er+qgCcl7wwl6WpejgC6kw
	8+yFSRNOG1F46SCGC5slk+bzC/KgRvxGiXXIy5sTG2vPOOCTQ1WqklEaChJCowYFyzgP9rh9algjF
	zw1X8KmsyTc7LjwBBr8na8D2fvkdhUc1vCAGZWXA7nyurvoVXo09kSF7/6fqsrPIN4aC2/+ZbJ1qK
	ATTOzRMw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIma-000000040Yl-02yM;
	Wed, 13 May 2026 23:14:28 +0000
Message-ID: <4827939a-2e8e-4ac7-981c-deb3b7296a66@infradead.org>
Date: Wed, 13 May 2026 16:14:26 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Docs: fix unmatched quote warning
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260406232304.1892528-1-rdunlap@infradead.org>
 <4914fc7a-607f-41bb-891e-89df83a0b292@infradead.org>
Content-Language: en-US
In-Reply-To: <4914fc7a-607f-41bb-891e-89df83a0b292@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
This docs build warning is now in mainline.
Should I ask Jon to merge the patch, given no activity on it?
Thanks.


On 5/5/26 12:58 PM, Randy Dunlap wrote:
> ping?
> 
> On 4/6/26 4:23 PM, Randy Dunlap wrote:
>> 'make htmldocs' complains about ``prctrl` -- so add a second '`' to
>> avoid the warning.
>>
>> Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string without end-string. [docutils]
>>
>> Fixes: 08ee1559052b ("prctl: cfi: change the branch landing pad prctl()s to be more descriptive")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Deepak Gupta <debug@rivosinc.com>
>> Cc: Paul Walmsley <pjw@kernel.org>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: Alexandre Ghiti <alex@ghiti.fr>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: linux-doc@vger.kernel.org
>>
>>  Documentation/arch/riscv/zicfilp.rst |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-next-20260406.orig/Documentation/arch/riscv/zicfilp.rst
>> +++ linux-next-20260406/Documentation/arch/riscv/zicfilp.rst
>> @@ -78,7 +78,7 @@ the program.
>>  
>>  Per-task indirect branch tracking state can be monitored and
>>  controlled via the :c:macro:`PR_GET_CFI` and :c:macro:`PR_SET_CFI`
>> -``prctl()` arguments (respectively), by supplying
>> +``prctl()`` arguments (respectively), by supplying
>>  :c:macro:`PR_CFI_BRANCH_LANDING_PADS` as the second argument.  These
>>  are architecture-agnostic, and will return -EINVAL if the underlying
>>  functionality is not supported.
>>
> 

-- 
~Randy

