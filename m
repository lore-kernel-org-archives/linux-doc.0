Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733F226CFD;
	Tue, 18 Nov 2025 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449166; cv=none; b=X5IRFdLNQOtZkjJzA/6ksrAxaZLPz/mrSkYpQQktXqflzmelJCNXqTb0tFVBtlNYDX+FRk/HrsxQpZXc7M5K0d+0ummSCD2pgEbs2uBuf/JUXPvkR8S+0jujZByJ7Bw4xyE3NdDcXyGHk75SgX0l7lvbcJ9xZWWdYYDTCQrjuog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449166; c=relaxed/simple;
	bh=iS8o+Ir2kULh3M6DMd186nTx8TdhV05ekioasHlYLcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLJ1paTUu812ccAkIXSMtClWwXQpNVSwHuOl2lcAZ1VfAtQhDFzWKamgzON4QB3RIlxP5fX1IXQhZg7HgZnb9OHRxejiHoPsCjz6Knmr8aYEx10GnmhZnnjhrs9GUO8KdHFZAXKrT8kSi3FWHT6rXwBCrk1c73UiXYm5p2ZVYZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=c+91rc0I; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c+91rc0I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=CeWmkJXF4CtXJBExedT86Qi/Zhs5vavhf/iy+indqYM=; b=c+91rc0IPp33oDc8R46Cjq2swY
	gWj+TvP5rRq5TWBUtIenf4gGVtY1BQoaeYTX+yOT6ik8YR7AidPD3P0Rsmft8lCi2FOdunEKAWtbL
	NjfVHyzSP6W9F4QpFp5raio64cYMpyeZ0Caw3M49S9spRKX5ocsFg7NSqSvGaNsjVXY/d9xfGkSZR
	B+T1SN9R+/poRNMtDOHr/K0hAVOGv8nYvZfIrbv95B2Bt15oswCBN7o66yPe4IyiZfSTkag9dH5Uh
	9e9w5iIEA1OyJ6dwUGoQ8LrnEPviUVDakCWcrGNG1/MoSmxgVGJ+O1VcXdlcH9LT7xxV5k3Yqmtnf
	7DbuGraw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFgS-0000000HWjF-2Mr0;
	Tue, 18 Nov 2025 06:59:24 +0000
Message-ID: <3a27a1ff-7277-43d5-b1f2-4b26ef5595ec@infradead.org>
Date: Mon, 17 Nov 2025 22:59:24 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kernel-doc: add support for handling global
 variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
 <2d3108a03afc4e48de85835667f5875af97b6a38.1763291890.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2d3108a03afc4e48de85835667f5875af97b6a38.1763291890.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/16/25 3:23 AM, Mauro Carvalho Chehab wrote:
> Specially on kAPI, sometimes it is desirable to be able to
> describe global variables that are part of kAPI.
> 
> Documenting vars with Sphinx is simple, as we don't need
> to parse a data struct. All we need is the variable
> declaration and use natice C domain ::c:var: to format it
> for us.
> 
> Add support for it.
> 
> Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
>  scripts/lib/kdoc/kdoc_parser.py | 56 ++++++++++++++++++++++++++++++++-
>  2 files changed, 100 insertions(+), 1 deletion(-)

Thanks for the update. It's looking much better.
I have a few comments/questions, all about typedefs.


type vs typedef in output (html)

typedefs are usually output as "type":
Example 1:

	type func_desc_t

although thp_order_fn_t is output as:
Example 2:

	thp_order_fn_t
	Typedef: Get the suggested THP orders from a BPF program for allocation
+ more syntax and description.

Is the difference in the 2 examples above just that the first one has
no additional description or parameters?

3. typedef struct msi_alloc_info isn't output as a typedef at all,
but instead as a struct. But the kernel-doc for this typedef is
messed up (as taken from include/asm-generic/msi.h):

/**
 * struct msi_alloc_info - Default structure for MSI interrupt allocation.
 * @desc:	Pointer to msi descriptor
 * @hwirq:	Associated hw interrupt number in the domain
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

a. It's a typedef, not a struct -- but we may want to print the struct (?).
b. The first line of the comment should be:
 * typedef msi_alloc_info_t - Default structure for MSI interrupt allocation.

Hopefully a warning can be printed for this.





-- 
~Randy

