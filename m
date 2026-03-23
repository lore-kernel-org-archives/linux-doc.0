Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9293BADB2;
	Mon, 23 Mar 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284724; cv=none; b=HYzTVZPS40Tukee1KN4O1/4MlXESKi+9TXxtXJ/SKSxFWzSnPIVV8oImqZi0wdA5FDnc13aKIqaO9b1ytArGSGSKbH6P8CZxoVqcJ8mlaTGr1qo/kkPNyF4LTkhQxu9LAc4g16AxAM37FiLOhMn33eYeZgz5yjMbwH/J3PsO0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284724; c=relaxed/simple;
	bh=RWbkdTJSoIUSPpri8l6gNHEff1Dz8wVuzblC+YTXA8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkfQ+/FXXIoMRpsfAS3/2cF1aCUwf+6fgHR5riozpNErpflhAsZDWr8dkyNGq0mKPMFcdBZ+WpgJG9PtTmc20lRlrqR3JDUR73VXbH9ms9PYYlQpPnwlt6UOhqBO1vf5E2Hn7dO3JNEpeDRFSRWs1hSUR6yke3PDHSQMYqneKbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=o4TsikL4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o4TsikL4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+AOu/lG5FJLGR8YlmX7KFaeM98ayrUFnh1YxZgcIYfA=; b=o4TsikL4Tk4to7UNeChQjhrIk4
	UaAWPkpAcNQaRA5LiNanDkI5k9+64CyVaXuTN91PX/4vEqwLfxBg3MB6kKBu6W0/5ssfLEeoytrF0
	cxmSERhOkvXetbBF45GC8g8iQRD7Uw4Eo/gFVAAuIM72M0Va+zWvC3AeRN42r/55GZiZ/ExKtgKZ9
	QXIHDCP+x1779VxDx4nckOO1Y/yFyt7bXtkZQ8wtPHl3QHt2WE4hvFDpWHVkbJvSBK3+Bp5sUBxyi
	VRPpkyVHMnSacF7Ln5Pxvu/QU982cH095ufLI7ax0mI709Wi6DCBH63X3b/CBYHY2V0XHsYAjxjKD
	dNaYLiWQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iVR-0000000HAh8-0DHU;
	Mon, 23 Mar 2026 16:51:57 +0000
Message-ID: <e046d0a8-b10b-405f-b3dd-94b7f4450313@infradead.org>
Date: Mon, 23 Mar 2026 09:51:55 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
To: Breno Leitao <leitao@debian.org>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
 <20260323-ecc_panic-v1-2-72a1921726c5@debian.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260323-ecc_panic-v1-2-72a1921726c5@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/23/26 8:29 AM, Breno Leitao wrote:
> Document the new vm.panic_on_unrecoverable_memory_failure sysctl in the
> admin guide, following the same format as panic_on_unrecovered_nmi.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 97e12359775c9..3310fb8272fb9 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst


> +
> += ===================================================================
> +0 Try to continue operation (default).
> +1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
> +  machine will be rebooted.
> += ===================================================================

The table begin and end lines must be at least as long as the text (may be
longer). Please extend the =========== lines by a few characters.

-- 
~Randy

