Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C2322C6E
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532222; cv=none; b=Rdj643Z5Pxo2OmtdQHzBKlRmZKX83tLGx1Lqw1hUxYwcrYRjfXp1o75P1KQTM3JG8SWZUvxfWQWU4xxLjZCkVfeOOo2Dmcm+eVKx1OwtrrEcs88gBPr3gmqL0JgZWaDxFXuXuBEumniIpt20Z1NeFQ7xq0TJv5R29OZ6LYxMPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532222; c=relaxed/simple;
	bh=TG/w80KxC5LEq8NbqFxphKbLwuVjO5otVCEbIll/TWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMrfNNT43h9q/t959xYvq4UHs8ti4fJ87q1vbSRD9Yc6NUhQcw04otamNHrVEVRrJco9MyS2dTxq1wYEFBD+VdyKqTJqw1dVaLNNkZihLun+eS3PbJt0a6O10Uq71fLpCDcYMuqVB3W3jwKCJapuaAkksTMdjNVHJfw/aKWNCL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MSrHuRUv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MSrHuRUv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=L4iJdsGJ/6faqS1q8q803Yt4X9FQdiT0+NpuZrEh8Ss=; b=MSrHuRUvDWz3JqFAjGDQflXL9Z
	UZH75XUdDiBAhi7+UacKTOKLMOF48Km86WmzegVNHARYb35pOHB1OblhKYrnyl9XIBQNrZno+7sbV
	/ohYApkagLfrUsvCVKmTCmS1flyrFurk6BPT2oS397xDbCrjFJeZ1ddqXsCY5msDbVIZHB9JuaYmL
	ZNArv8qBgoM3HjVOPodBiRRwea58wycRe+LhmH+tqrpusUDlQIJhVWRfkTMSFWXAqtnlPKO5milCI
	iyD9PEUJliO18RITA3Uf+Er1b7zQy2Ocz5tbb8pdSsMR3ymGXcIqfQPrgHJmHDx81nEnunC6CXSDx
	k81z4O7g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo27j-00000007xNA-1sXS;
	Mon, 18 Aug 2025 15:50:15 +0000
Message-ID: <f051d9b9-8344-4de4-99c8-918c107e37ee@infradead.org>
Date: Mon, 18 Aug 2025 08:50:14 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-parameters.rst: fix document warnings v2
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

1) "v2" in the Subject: line should be like this: [PATCH v2]


On 8/18/25 1:26 AM, Bartlomiej Kubik wrote:
> 
> Fixed missing definite article "states that the parameter" as suggested.
> 
> 
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 445248787e77..7bf8cc7df6b5 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
>  There are also arch-specific kernel-parameters not documented here.
>  
>  Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
> -a trailing = on the name of any parameter states that parameter will
> +a trailing = on the name of any parameter states that the parameter will

2) This diff should be against the source file that contains "that that parameter".
It looks like you did the diff against your previous patch (unless I missed that
previous patch being merged somewhere).

>  be entered as an environment variable, whereas its absence indicates that
>  it will appear as a kernel argument readable via /proc/cmdline by programs
>  running once the system is up.
thanks.
-- 
~Randy

