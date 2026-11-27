Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786631;
	b=444CNhSzB5yN83LaW6ycXXSMcVoKYnscbEqF98W1SYvij7Gy4QG8cy+AB5SHDL8VzY8b
	 bTkzqnCSdSXJuI8ganKMTNph82dxN+DlmRokkorW7PZEwmzey2NBxVWkxNgV8wSJUBqGA
	 gKpL6xJU1u+MV1Q3rERs4ruvdlkAfGqmz6Jo0mj6jpogbYLfJO3DwxkmkCTdPT0/LmHLu
	 IsvmCnOR6Cd/tigLEfCihETXY6ndqoD3fqUvhtQ6ZTCDOQet9EJk8VwWJpO7B+rZfRvkU
	 SVgGhf4D12njK9CIAnPP88lGjHPcuW8WUG/apATQ/NPBNRL2YCLRgHYR/cwhRTbVGQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786631;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=eyD3C/QUx/QEIXN3P1YhWhbA1u17b55oxMh6iN9XM+s=;
	b=yjdc5lajOD9EDEnsTpzx4w9HVIX0odh66If8rOr9okAzNFv60Q5GXOFxelmy+jgpKnVz
	 wNjwubXF0YwZb8yGtlR3fkEbvBdy24va53Jq1xYlH9BPF2JwlcVVUb0c98KVE62wQJ8cP
	 IqP0qVVubNcmWp9eAajFZmZm5JX/DJpR2Aj1c7ipeyJtiUWG2DbE1yQ8D/Jyb8zCTm01m
	 DG0LYI5JoytgRN1H/lYj8TgenWBmsPhiM5J0ryGFPYWEP0RwQo9Yzw8xFacE9Foe1iEgv
	 se8MK2W+cW7pfsrwlbsw4zMg89Ig8rIRJPa0A8XmmbTK77M70bkOprEs8ZXMWna2ABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Br7YNrwq;
	arc=none smtp.remote-ip=95.215.58.51
Received: from mta1.migadu.com (out-51.mta1.migadu.com [95.215.58.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66510606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 13:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66510606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Br7YNrwq
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rKwdOcOTYSAO3HhBRrj+mQuEWbqE2+hE/uapM7+M8/g=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795786626; v=1; x=1796391426;
 b=Br7YNrwqFenMVCcvgPYm7idctWD+wmhdy+tbRe4bcKj6Qpvx1CUw1PDXgwIOorgYQP1xljx7
 vhcDD1lRd4EMZnnRkzvKTUuoIRr/iLovycgir2JDhlq0sXURXkw66HBUOv2Bq3WBfilmEk8mTYz
 slGvdTLUTg2u/BmEkWNzNrsWNjX1QkYcUokaROQK1rBNkV+DVloeXhnveWZnmVimfiXlE9B3lua
 Ug/qIPzySUbAYzJFUudzNvn+KSqBVHFm0UwbQ1ppy5UPTyLa0AIxOcWD/RGUWAokvArVSLQjuvY
 Dg8umR5FfSgpHSYNx4vWqMApaRVuNfc/f++w78gS/cE9A==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6978855d14d4823a;
	Fri, 27 Nov 2026 13:37:06 +0000
X-Mizu-Trace-ID: 6978855d14d4823a
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 21:36:42 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yao Yiqi <yyaqia@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
	dzm91@hust.edu.cn, skhan@linuxfoundation.org, rdunlap@infradead.org,
	yaoyiqi3@huawei.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: fix typos in admin-guide/README
Message-ID: <awmHagnWky2UKEKk@wyuan.org>
References: <20261022135949.361566-1-yyaqia@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022135949.361566-1-yyaqia@gmail.com>

On Thu, Oct 22, 2026 at 09:59:49PM +0800, Yao Yiqi wrote:
> From: Yao Yiqi <yaoyiqi3@huawei.com>
> 
> "内个" -> "每个" and "愿意" -> "原因", matching the English
> version: "the reason for the rebuild of each target".
> 
> Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
> ---
>  Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
> index ee6dd3782f4a..32bda8f3e088 100644
> --- a/Documentation/translations/zh_CN/admin-guide/README.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
> @@ -244,7 +244,7 @@ Linux内核6.x版本 <http://kernel.org/>
>  
>       make V=1 all
>  
> -   如需构建系统也给出内个目标重建的愿意，请使用 ``V=2`` 。默认为 ``V=0`` 。
> +   如需构建系统也给出每个目标重建的原因，请使用 ``V=2`` 。默认为 ``V=0`` 。
>  
>   - 准备一个备份内核以防出错。对于开发版本尤其如此，因为每个新版本都包含
>     尚未调试的新代码。也要确保保留与该内核对应的模块的备份。如果要安装
> -- 
> 2.56.0

Forward Alex's comment to this series in what's cooking (Nov 2026, #05)

| Too small typo fix may cause conflicts with other patches. So, not worth 
| to apply.

Thanks.
