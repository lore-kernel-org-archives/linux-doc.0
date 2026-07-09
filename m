Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8354DB546;
	Thu,  9 Jul 2026 18:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621206; cv=none; b=Pq2L7KpqqP1DdiwGVa3jTbDL415OzRT0h3mu+fEapz6iz95qG9zekBBQOP0cM+YoqUW2jRusseznAoeSUyOltk4ia+8ufmg9WzUUXuOAPB+g7NP43t3eqC1VBKIBvwqXr+3oHhIZ+EtlDSL2AK7hONM1e7jxPc/ktgnIPJA4D/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621206; c=relaxed/simple;
	bh=WOTHvX8HVKHBrnVzDI6m6DmmaJH4rCSvpi8V4DWltkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jroq8fEdm9aJ4cAL6MiAx9bunN1E3uBI8vo6t0UQf4LtFDnlR5jhT3D6ATmb9nw4OPTIHYGhdt8l9g6RDWhMjhjS+x/VGTdQ73tQJyJ9549HUqZHKzM6RMbtt4dS8JmbvV6U5UADRXWFVuP4S/jThs4HvJsCNjxVO+uCK52uPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W/TX3aZK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W/TX3aZK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rbkyBnPiEryZ9qR0u5BUXmgJ0GGVM/YJCWcDrkkU/ew=; b=W/TX3aZKEJS95q4jY8wc9uDU/G
	2JuKPd9LlV4IwYZMqh0GhCFrY2F/Bhf3NrcM73AM89EKs4BjaABVez3JCf+G0HJ6eio/C23bAvlMf
	x+kPzkIZ5PCJMUu53828BSnfHnLNmcH3ShYkEXrunSm23avnMtXF9mVdkVahMZTirJ5plTWKhR8PD
	mKAbHLuNPcWlX2SWago1s0hQUGk49pz2djvA9TIRDTHLQL7gjbjvUjQ9/tEFyUg5R+74EPYnZ/llv
	g6TQxshvZMCmDz1ioOstYIM5lvJlisuiDabuCNUbdYjjO8ipezhAoFGpEkMgs61fIRoNuyshCltGx
	M+Qb66uQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtLt-00000003DSD-1tNB;
	Thu, 09 Jul 2026 18:20:01 +0000
Message-ID: <21dd6ac5-eb54-4560-82e6-9b4dd0cd0426@infradead.org>
Date: Thu, 9 Jul 2026 11:20:01 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs: list: Fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260709115008.387869-3-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260709115008.387869-3-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/26 4:50 AM, Manuel Ebner wrote:
> Add missing ')' to sentence.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/list.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
> index 479aa91cc395..df8b078bb366 100644
> --- a/Documentation/core-api/list.rst
> +++ b/Documentation/core-api/list.rst
> @@ -458,7 +458,7 @@ The list_move() and list_move_tail() functions can be used to move an entry
>  from one list to another, to either the start or end respectively.
>  
>  In the following example, we'll assume we start with two lists ("clowns" and
> -"sidewalk" in the following initial state "State 0"::
> +"sidewalk") in the following initial state "State 0"::
>  
>           .----------------------------------------------------------------.
>           v                                                                |

-- 
~Randy
