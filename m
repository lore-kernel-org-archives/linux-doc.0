Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E7F3B7A8;
	Sun, 16 Nov 2025 20:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763323463; cv=none; b=kE+Yi57gzQYNL8z4UbMagGEE3txdZCk20gHVqQvIgGrSo4e1ZsNd1cQvn5/FZtuGatjgXz9xAp/TRBNQQ03t12zHuD24xg8WyzxYOP5geKe3Kaw9y9AO2ByOUPKUeo6XAghnegyQcYF7liJOnxbb1Pl0Y3F+CjPUh4CqGGPfCPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763323463; c=relaxed/simple;
	bh=8riMvA9CkGiFZK0wpyLnM1l4CduvRZOWctt0upI8Gbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7DAAGbiIL6shj+XfqJl8zxCfa97MtH3aaDXuSoNXYgJsbIq2/OtmHeJqY2D5neICTtGp93Z4OrNhRyesSWKuweIGjpoNuYIGEfoqJtak6vXJeP/j3JylfYUAnZkNjFQeagvouUxhl9gaG54T2/39ypIBzgyWy910Cpwi+Z1YuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j5K4t/Nd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j5K4t/Nd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=23FaUjWVKAA4AxK8Tkhin7F2twR9NI9mO3eeOJZ0rig=; b=j5K4t/Ndvfc8TNMAx/Cm1lv9lb
	4exUE61aSIRcmS1LZx6girjAkA+2vIc43H6uISj2DW9Kq+ZT+b/1gC5wrs+ZZ6Inm03+whYATMmKc
	rtUcmTA004F/nliSiUCnmotjKAF9R/WgfYxyRQFI02znwxFeqq6sFXGLgDTdZoaF5XTC9meNfIH5b
	uXMtdImTtiolipKqlHdctCCOxq/7/oHdlaUeBbyvvd1XO8de6zdrq+m7RQYKM1wJKk8TQAe+aruOo
	CvsbaJBB3e+cqfpbspFx5fOBKRY+iSisr6XkVuHXwXd5F4rwwdvJjZAqQAv+kqDTYAJvvOld0R+kd
	ltYQ+bug==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKihk-0000000F4lh-22uu;
	Sun, 16 Nov 2025 19:46:32 +0000
Message-ID: <2c74f92f-69da-4d7d-b4fc-5e595efbaad1@infradead.org>
Date: Sun, 16 Nov 2025 11:46:31 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-doc: add support for handling global variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <80f85eacc306e62de8c9c68712c653ba290c2ff2.1757262141.git.mchehab+huawei@kernel.org>
 <d85e3f24-dbcd-4f28-b31f-a77661fc66fb@infradead.org>
 <20250909215824.1968220c@foz.lan>
 <5dc41508-43e8-4e80-b4e0-149af7bbdf19@infradead.org>
 <20250910010903.5388bffc@foz.lan>
 <0d190bf0-b9d4-4d5c-a1cc-6d5d79be3886@infradead.org>
 <656591ff-fa7d-4763-8759-0a0af3a4039a@infradead.org>
 <c195c68f-e815-4428-9134-8746198a4611@infradead.org>
 <20250910062323.059bb078@foz.lan>
 <14133b75-a984-4244-a18d-f02f0b81d1b7@infradead.org>
 <c5262290-38e3-4c48-af00-b91f03a065a8@infradead.org>
 <20250910105454.6a6c57e6@foz.lan>
 <21b98e7a-93ae-451c-b7a1-e1468e8da0ca@infradead.org>
 <20251116112857.157acd6d@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251116112857.157acd6d@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/16/25 2:28 AM, Mauro Carvalho Chehab wrote:
> Em Fri, 14 Nov 2025 16:50:57 -0800
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> The v2 patch certainly is better with the new regexes to ignore.
>> I have a few minor changes that I would like to add (in a trivial patch below).
> 
> See my comments below.
> 
>> And there are still a few cases that are not handled correctly.
>> (see my kdoc-globals-test.patch from 9/9/2025)
> 
> Where is it?
> 

in this message:
https://lore.kernel.org/linux-doc/d85e3f24-dbcd-4f28-b31f-a77661fc66fb@infradead.org/


-- 
~Randy

