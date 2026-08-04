Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07347CA84;
	Tue,  4 Aug 2026 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862215; cv=none; b=BhEPPe52/VnlES1mdRBn3nNO+4q8dWbKscNPo/68BpURrNnpoeHjxjsHjOt68+thWFnujaT2G2XQar9TxnrJ28arVoVYCTaF+6fmkXaTlA/IuiywI3hmTW+81KcaeDxpYkTAYjGa8nWX0GzOh47Dhy8am7/zvTstUxVyhmC/ynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862215; c=relaxed/simple;
	bh=v0dG6GYIuN8u22HBFoZbG1QP5gzcOxvoKH2rytc0kzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mt/haGxBXI+VRX+/TYKcSSmv4ibJE9+fx1FB0/A6WmvaygGZOe84DMJiG3DTTVVlujAclk6l8+7qsYeMT2VyzMXDylq2+/h6to9WLTx4aft4KfOrJQ6TxDU7e/vtV7qtIkud/iup0rRwsBS0ddnIbs+2GfO30NBAay1PKQqgbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MvsRakF6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MvsRakF6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ETxWQZ+GTlsQuBa40dgoEs7snlvBtuYQffGnxlg4HZg=; b=MvsRakF6OJMLq5U5ieVEXZjAdC
	JQrR0vliHc1PTGUtaFDdSCT9hhhQZEyXzMuFkQ36tl2kCFCWr5j5/ka7e7ZPMEmtsRXkTdh7OT3A0
	HuDGq2CAYI9KiEEKxk24M2EbvHISs0lgyXkf21KPkL/jgNVdGmDEX95q9JVRu7iNgit5P30nDJSNr
	hbBSOdR/6ILCn5Y4giVzUejkKY0tXP+7bkS94cD12AhtkgMI+Tu1oFo+evzYG98HpJ4T8CtUpIHCw
	h+q0WJce4ZYtx9FM2h9czf3i6Wz8o5bvf3j0JJ17vaTjurcbWldODNHfEQ3zuo9ka/8MltF1RZZcO
	y1VlDv8A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIKz-00000002OGX-1YUz;
	Tue, 04 Aug 2026 16:49:57 +0000
Message-ID: <20630af7-0c3e-4229-a697-7c33c9cbc65e@infradead.org>
Date: Tue, 4 Aug 2026 09:49:56 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Documentation: html: adjust sidebar section titles
 styling
To: Antonin Godard <antonin.godard@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
 <20260804-show-sections-in-sidebar-v2-2-a68d23bbc79d@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260804-show-sections-in-sidebar-v2-2-a68d23bbc79d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/4/26 8:59 AM, Antonin Godard wrote:
> Now that section titles are displayed in the sidebar, make them bold to
> have them stand out compared to the subsection titles, and decrease
> their bottom margin to group them with their subsections.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

LGTM.  Thanks.
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/sphinx-static/custom.css | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 0576d4fcb2a3..40e4ced963dc 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -81,6 +81,12 @@ div.kerneltoc li.current ul { background-color: white; }
>   */
>  section#the-linux-kernel-documentation p.caption { display: none; }
>  
> +/*
> + * Make section titles bold in the sidebar, and decrease their bottom margin to
> + * group them with their subsections.
> + */
> +div.sphinxsidebar p.caption { font-weight: bold; margin-bottom: -10px; }
> +
>  /*
>   * The CSS magic to toggle the contents on small screens.
>   */
> 

-- 
~Randy
