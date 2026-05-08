Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F033D6F9
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264566; cv=none; b=KDRjJ+n05uEjv5jqt1jC2/mphoihaIoeq5dOcRQypVXaaItKHIuANPtMRQsPHB/heXpWnGqs7QYw+4d4js2BAMnFb6Ew/ZJ8GyYLZZn2dmWq0rJUZ2nI9bNMZlvfCPeIJFxH0qWOgclDOgdRp34T85/WEULbTP+OZPAe5R8dCZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264566; c=relaxed/simple;
	bh=wneLulXupL8XeXTNYeZPwuc4NZZIaaH7M62Lx5jdL8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFe+r3g/kNI5HXixktDkiYAU52Ab4+tHv5kfsEYviEofnw8X3mtO4dP2f0TrzatDjUR5oAiGcY/7vjKOMgX1XPSKojtlw5vd5/x/mxElpYjfJNLq3wJMP+8DhFX5Q2Vive8zfdxmvGsn3dalNrXMHIlZVTKmqXgNpa9u8m0OFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pIgbwFFe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pIgbwFFe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1567wLgcWwhaW/ksGAvGq1qWNhKhan595OO6OdhsyWQ=; b=pIgbwFFeaq0r/CRz28UrtI9MDK
	MlJgiMh4J1SsbU55eRQUvMlVZ9QZJB/C5cVafdawaWp9uVI2s8qiVPWrKtx2HAmJvjNFFyPUTpq/7
	uQozFs2lr6tSuSVXUE4VEIXvhDqxKRxoykPmTGKN55tcnpV6IJt0n3J8G5rGCjksAPBWLFFMfdABd
	DXfLiETzfATSTYxohnVBtOWyeNBGY9Vnxm4VlqGC1FW+6pvu4HMNobWdQqtyPKyfdyjyMMMVwK9G8
	AAvYMfL8Ul/cOBSUxDum0xBbx5z/SJj2K2kXXOXZzCmDji2bM2wg+gx9uTgjTIkhUywpWr4j/PMGZ
	Jrjdb/EA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPqW-00000007FW4-1htp;
	Fri, 08 May 2026 18:22:44 +0000
Message-ID: <8b57be01-2811-414b-a18b-d5bf619e5ad1@infradead.org>
Date: Fri, 8 May 2026 11:22:43 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Documentation/gpu: use === for Intel display section
 heading underlines
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Cc: rodrigo.vivi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
References: <cover.1778235406.git.jani.nikula@intel.com>
 <f49968792220ca3ff24efde813550850340d092e.1778235406.git.jani.nikula@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f49968792220ca3ff24efde813550850340d092e.1778235406.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/26 3:20 AM, Jani Nikula wrote:
> Prefer to use === instead of --- for top level section heading
> underlines to allow using the latter for sub-headings later.
> 
> While at it, fix the underline lenghts where needed.

                                 lengths

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

 
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
