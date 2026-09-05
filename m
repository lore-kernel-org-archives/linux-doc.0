Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD71363C64
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788629818; cv=none; b=eP0p90jcRlIYT73P6EEW+M2Yi0QgWfT1kaQYhyL0VgsCzDvn2e9VRUs7rAjkBwBvCqpwAykJkUzTPagB3Vp/7iZP3q+uZcg5DwlNMTFs6r3YCyRkR5ufNo6AJua1oxWIDWwsB7uofOZmNT9JXDC+nF2R1O04KGN/+HC8of/cbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788629818; c=relaxed/simple;
	bh=2p7Ofdtq/jnVS9UQC5A/EFkjOdHSkKSp90Yhn5LpdZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyB1jm2YaVycyjD/KZeJjd+M/X4jLJ8oDYtdAgPulq0/sbq2E+62jsGl+FHh9H3XBdCJQSTf62dvb+yguZrTplDldnMRYcBZxmjEFfX15W5oo4Zd2BmEAfsAeG5gC35zMhZREUV9WP1atWFTGxQDwyZclwvf6zuhBdfHneE0U1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XMNLdWJP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XMNLdWJP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PIqPxs7eb4gTjHdnlSe3CwUKszgqStjxZDSTejcnjgg=; b=XMNLdWJPVHFto2VS3phDmLEn4z
	IlGgFzXVRQY6XZU8pO1lz0cHXT2GSPjvNlKYVdSdkGooea03uDRPUXoyn38rk9Z00qIRcDmOy/pd0
	L4m3QxyNoeF9rSCJcFOz8IfTA6VgoXCBirYbqdlw34ytLFRzNXFARdNgrEwYL9PAVX0HYwllfDH4E
	QdLlKYilhyq52H9qdjjzMV5yRqGnIhpjcAxlEa5gamDvntwl7DCwpa+n3fRK44j5mdggoo5VoU+Gi
	CurOXX/rRGvfjPWy76PtRVrv9nHXzLbMaQjwVQPkQIk/cUxP1a81DbI4IMDz78Dx+gG/S8B68GrQu
	moeFvWPA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2uJy-00000004IKJ-237q;
	Sat, 05 Sep 2026 17:36:54 +0000
Message-ID: <491168f4-64f4-4781-b0f7-4eda2e899dc4@infradead.org>
Date: Sat, 5 Sep 2026 10:36:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: powerpc: vas-api: Use the uapi structure name in
 the example
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Haren Myneni <haren@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260905104313.43620-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905104313.43620-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 3:43 AM, Karl Mehltretter wrote:
> struct vas_setup_attr does not exist; the name is struct
> vas_tx_win_open_attr.
> 
> Use struct vas_tx_win_open_attr.
> 
> Fixes: c12e38b1d52e ("Documentation/powerpc: VAS API")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/arch/powerpc/vas-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/powerpc/vas-api.rst b/Documentation/arch/powerpc/vas-api.rst
> index 1d0d055356e3..00d98cfd95c9 100644
> --- a/Documentation/arch/powerpc/vas-api.rst
> +++ b/Documentation/arch/powerpc/vas-api.rst
> @@ -265,7 +265,7 @@ Simple example
>  		{
>  			int rc, fd;
>  			void *addr;
> -			struct vas_setup_attr txattr;
> +			struct vas_tx_win_open_attr txattr;
>  
>  			fd = open("/dev/crypto/nx-gzip", O_RDWR);
>  			if (fd < 0) {

-- 
~Randy
