Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487374BE1
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765177376; cv=none; b=KpfR19tIa7x06/Qhsaeh4DVdRhiBYptiqXFr9qqIPGLZa8bMuf1wno/s/0WzOWiC54IUxr17ODK2WZf3CBy2Tcii3X3YP492OBdL5H7vGTsM2rVzdOg4I3SpDDwQjqxeYHUMOGZ7ZC2rPQQw++pJguNjL5fLlI73JKf6bHgi16I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765177376; c=relaxed/simple;
	bh=u6lXOF9IFgL6Dzq0lVDwbMJTA2kdo4W30WJ0J44pd5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfMo0Xb9bMRlPYVIH/jLthgJ5pH5R6cbBYLXUGyAUTd/QpfYOv/zKqXRk+O3MvvzqEEbK1yfyUqOte7o8YO8v43C8Fz+R5cUagPsiO9TmYpGM1On+i5eqs4DdQtJDIOPfmFSlCG+NoTlXONQni3rr53FgrPHuO6m0Bbc3mF7z8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ic4LVn8A; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ic4LVn8A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=UIiW8sPFjKqhVus3PKeqG6i90DqHK7Ra8NL9UiY4+d0=; b=ic4LVn8AdLjefeyyYKafuZhAfg
	zleADJiR9Yi6WQPjelFapJxq0yv6Wau4aQ7O1iarJW5bUeF7EqhXkyAgQUFT7l3lJHt+SUvMzkRYu
	sC21we4STUdpEnZdpZrtLVmzDiQeQ9UX7V/uBGhZsNisXa6P1oghkaRDqpbgdPWooKymMqCGvJu6I
	wuCjJC8Bv16NXppmLVcDPKtHohnfWImxZp+dMbG3u9+JpT1iUFIV+4yrfCVRBNyKuyolfmbXhI6q1
	6E2y/Rt6PyX3iXjHS51sRzgIXuNwoO4f7U3PNm0qua/ZKvC1to1tQVJVVOA3Bac7053zQbtRVWWJk
	lhG4ea5g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVGn-0000000CjBK-36hY;
	Mon, 08 Dec 2025 07:02:53 +0000
Message-ID: <41f5b115-1725-46d1-a959-db3a5703458d@infradead.org>
Date: Sun, 7 Dec 2025 23:02:51 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fix typo in clang-format documentation
To: Addison English <addison.englishw@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20251208065136.9092-1-addison.englishw@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251208065136.9092-1-addison.englishw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/7/25 10:51 PM, Addison English wrote:
> The clang-format documentation contains a minor spelling issue where
> "intended" is used instead of "indented" when describing deeply nested
> code. This patch corrects the typo to improve the clarity and consistency.
> 
> Signed-off-by: Addison English <addison.englishw@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
(again)


> ---
>  Documentation/dev-tools/clang-format.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/clang-format.rst b/Documentation/dev-tools/clang-format.rst
> index 1d089a847c1b..6c8a0df5a00c 100644
> --- a/Documentation/dev-tools/clang-format.rst
> +++ b/Documentation/dev-tools/clang-format.rst
> @@ -88,7 +88,7 @@ Reformatting blocks of code
>  
>  By using an integration with your text editor, you can reformat arbitrary
>  blocks (selections) of code with a single keystroke. This is specially
> -useful when moving code around, for complex code that is deeply intended,
> +useful when moving code around, for complex code that is deeply indented,
>  for multi-line macros (and aligning their backslashes), etc.
>  
>  Remember that you can always tweak the changes afterwards in those cases

-- 
~Randy
