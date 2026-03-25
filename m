Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA81FC7C5;
	Wed, 25 Mar 2026 00:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399862; cv=none; b=LmwoQxKttLKc7xlsKQ1lc42LMDxKKYJy5h7F8iAjEKyTfwZ2OkOgr7vb98TgegUOKbNZFwoo28FkgGHxCfl3dlrsN6IceeBLr2+xfacj+d8Gp9xDVtl5PipAA+t0voNpgVqIGWfHsf5SsCVnPJcciM1uGD+ixAqgKxuwvQ/p0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399862; c=relaxed/simple;
	bh=Jaid/zGe70u6fJqMsBOyqNfjp1TnESLl65AlY/1aRvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROq0e01iS6dGXk6CQR+5HEe/9dxYnfiHho/HrtpWkrHBxjHgA0KVX4ET5sxoA/BabxY47hhTCI3F9a91dwrSLNx4sL9hhl1kRDJY64i2AEO3Vu2sj+RhMvd0xz/9LKU4TPjHvGjBlS+TLVms2VrkBo29rc/2nnryFFKIPQVgxao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1qNtMMeM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1qNtMMeM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=CHa+qB77v8wObW1H+FZqLep8MrRtsUKYj+gNTUzFWXw=; b=1qNtMMeM2OUr5ii0FxJw9iV7Ja
	rujE3As8ucTFuzlmCV9j2NMcY/p2NnXK1eURxl9EUchEY5RsD2FWdoqKuSKiX5D4BFNYrB+MPSH/T
	Dd3kbgFTAFNPgWYkxiot0KFuPlbDDY3czLiEOKhfWpXjWmVU+VTJTgbkgqTJQFl4p8sxGQarTpF9O
	eD8/ThwSiNt001Ja509QlHTivNCZL986y1Rc8LwbauhvhUKv6r+ze84VcCJcVkhaNtU6RebWnYB8h
	ozABQXgl1px7BWyqmJeacbmNEMo/vsXS5CkYlHzlxa6Q+kZNxc81NSLnMXx9EXdJV1hEAZ9akSWYE
	cpksilig==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CSU-00000002QKj-0iTD;
	Wed, 25 Mar 2026 00:50:54 +0000
Message-ID: <9c6f2530-a8c0-4652-962a-526eca5b0f8a@infradead.org>
Date: Tue, 24 Mar 2026 17:50:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] docs: allow long table reference links to wrap and
 prevent overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321180841.10166-1-rito@ritovision.com>
 <20260323152428.30483-1-rito@ritovision.com>
 <20260323152428.30483-2-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260323152428.30483-2-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/23/26 8:24 AM, Rito Rhymes wrote:
> Some documentation pages contain docutils tables with reference links
> that use long unbroken strings. Those strings can expand the table
> width beyond the content column and cause page-wide horizontal
> overflow.
> 
> Allow reference links in docutils tables in the main document body to
> wrap when needed so the table stays within the content column and does
> not break page layout.
> 
> Examples:
>   https://docs.kernel.org/6.15/arch/openrisc/openrisc_port.html
>   https://docs.kernel.org/6.15/filesystems/ext2.html
> 
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> ---
> v3: add latest public versioned URL examples to the patchlog
> 
>  Documentation/sphinx-static/custom.css | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 4ec617d40..b41c54c71 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -154,6 +154,11 @@ a {
>      overflow-wrap: anywhere;
>  }
>  
> +/* Let rendered reference links in tables wrap when needed. */
> +div.body table.docutils a.reference {
> +    overflow-wrap: anywhere;
> +}
> +
>  /* Make xrefs more universally visible */
>  a.reference, a.reference:hover {
>      border-bottom: none;

-- 
~Randy
