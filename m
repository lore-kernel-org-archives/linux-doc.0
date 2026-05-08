Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FBFCA45
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265430; cv=none; b=K3Pz7oWLKbWxzVv5FL90F8fxoLOd+X5rO3DPc8gO/MYX7h9AAZiQqB/XsWVupGNUg/tDWhBzKDKVc8rWTxFP53+2phmeDGBUS9gcABUQWUBaquvzUYgF6/zHYNoFHxeLfCY/MmL66C2VAY/sW1EkZS0QnesKsBsYLcgbHGyZrBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265430; c=relaxed/simple;
	bh=S7nbyk0XYF73ipxA55RsvhxT9n1Hdij76j2mR/QT0Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RzeLpPL/FfDb4odMWlYyexfI/rRgc7ErsPsZIV6As9TNEGf3qdf8ygcjcifc4DYfo7Cb0pSoaNp4/SFIvmGXWKVDp71LpmdjCkLdgRXdO1zz9Zt+BJAkQysqlE+RJFcmwz+FCXd6zMAWVxWabCv08rCe0st5v0sYT6LqLtNqy9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nz1Uvqxx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nz1Uvqxx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=nOnxCniMGpEQSI9yI2OLJhk/NMk10A2VEFF4N/EAb3Y=; b=nz1UvqxxGxTJGl/K3ewqyJJwQX
	RS2qgQCki0jw1uLfSTFK1mUabUro1rwLVKe5whpYjwp/6we/yA+a152R+c5Jd/uKYvKEDIVa8GLix
	F0dRq+MqHhbJXZ6QwUBapsCDpQ7VuQoI4kluZC/MNlVdWGjQheZF/dkXGqVUzY0Qm/m1tFSz338vj
	WHxQTAfe4wLa1M/Wx88KY+EY2g/HTpWA0NV+4y3uPqcRVgVOddWImEgNU26yqRWu3HAY9L8cdAn++
	VqkomR0csPsGsaLXQh2hwb0Qrydk+lhwqAirK3w09lVJB51hHeqg8259HReWUX/fdjvuw2JuAeZYM
	GvrUifCg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ4T-00000007H44-0wCS;
	Fri, 08 May 2026 18:37:09 +0000
Message-ID: <8b9dc16b-ddb1-4da8-9c96-1f269b474cdc@infradead.org>
Date: Fri, 8 May 2026 11:37:09 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Documentation/gpu: limit main toctree depth to 2
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <cover.1778238671.git.jani.nikula@intel.com>
 <cddd2d11c104132801510e3ab4e4b9ef3ea9cb6d.1778238671.git.jani.nikula@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cddd2d11c104132801510e3ab4e4b9ef3ea9cb6d.1778238671.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/26 4:12 AM, Jani Nikula wrote:
> The main GPU documentation toctree has no limit to the toctree depth,
> which means the main GPU index page recursively includes all the
> headings in all of GPU documentation in the single table of
> contents. This makes getting any kind of overview of the documentation
> really difficult.
> 
> Limit the main toctree depth to 2 i.e. show at most two levels of
> headings.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/gpu/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index 5d708a106b3f..65bf3b26e4f4 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -3,6 +3,7 @@ GPU Driver Developer's Guide
>  ============================
>  
>  .. toctree::
> +   :maxdepth: 2
>  
>     introduction
>     drm-internals

-- 
~Randy
