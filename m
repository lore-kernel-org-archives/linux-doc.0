Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93678191484;
	Tue, 25 Nov 2025 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764032782; cv=none; b=Q1MuZ6Dsti4vOY+xaj1D5jm8S3TDgHDpYOoLbX7vuBBhwdQppactjaw4iVyGF7FMeNh8YVJY7D1tplLCbQRok6dKgCRGGI1Ad2LacyU5vZJc9Si6fhfj/ZvXaKbzGWRJU4N+QTo5XZ0xwyN4j3eKGK8u3vy9gCv3le4ZJicbN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764032782; c=relaxed/simple;
	bh=HpCYOHAKY1D46luqgejbzAz/UK486uk+fj5JBj8rCD4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=txFk07Jsrw8NQiPjgBnHiOuew8yEjYuBlxd7Q43680FgyJJ8G8lQcqKmcSu3mCWzkXYcjLFkPbW2yg7SLsl0DkZrvPO30eBHXeqDYLAQ2EOXE4HVeEHCgBwBhivnezMyy7MfUHw4T87FycDy/OWrKlT1+2dDCxj0fhccqzu3PjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eljLhds9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eljLhds9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF44C4CEF1;
	Tue, 25 Nov 2025 01:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764032782;
	bh=HpCYOHAKY1D46luqgejbzAz/UK486uk+fj5JBj8rCD4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=eljLhds9Re9GT95oTcxSUL9AkX/rlkmBbtzlbW06DQ9244ARiHx7j+RwCQJjiIoNn
	 bkAvUwilBoQmm1ePRkYfP7y9qnb0+v2TyxKXaDMcTtMMvXLrV5aLAdXPlUOYotI3zw
	 1+OCSMrcB69YJZGez5ELAY9iJUYqlFlYGCgxw9PNSEdPCIiWHqAr0xRv0OTIZVGi/y
	 kKe5xA7EHW0cyi7JhZ71SA4ZDtT548qo01oDUYuTUJqW6zt7RyQgh7NfZGui34eMbt
	 K59zcionW1IDMlh5UjECNbdHaydHBKvrVow6pBpfpXe1d+jpK0dlEDNo3mc7aTSbNm
	 E3p8su06cX53w==
Message-ID: <0d413923-3c27-429c-8fda-40ed8a324bf2@kernel.org>
Date: Tue, 25 Nov 2025 09:06:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, corbet@lwn.net, linux-f2fs-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bagasdotme@gmail.com, akiyks@gmail.com
Subject: Re: [PATCH v5] docs: f2fs: wrap ASCII tables in literal blocks to fix
 LaTeX build
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org
References: <20251117122754.297742-1-nogunix@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20251117122754.297742-1-nogunix@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2025 8:27 PM, Masaharu Noguchi wrote:
> Sphinx's LaTeX builder fails when converting the nested ASCII tables in
> f2fs.rst, producing the following error:
> 
>    "Markup is unsupported in LaTeX: longtable does not support nesting a table."
> 
> Wrap the affected ASCII tables in literal code blocks to force Sphinx to
> render them verbatim. This prevents nested longtables and fixes the PDF
> build failure on Sphinx 8.2.x.
> 
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
