Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A83537DE
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775688278; cv=none; b=S5R5jm5TTrAWh4Gai2H/9nRFhV42Bu/v+Hq2QAHRS7IAq3TS8YzlrQo4IOX9Gokg03+qAFpIa312w4f67Eco63xunIlbKRmKZgT/G6YqToLqFx6+J7RoQdToiN7NNc9gDNDRXY2BtdspLwjhO08d6SbrZZxat45NMtx51bFXL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775688278; c=relaxed/simple;
	bh=O0Vhwh0f21BMyaexAhOqAjO+PUrBKO8qO31TeKxtrFc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bJTA5ZdXCOZmkdnFLle8cH7dwTlxxI8ubwlALZ42RZ3oqiWwHoHxTyKrNrxQ9sInML1ln2ruCtwBnkw1OqLpZBKozed4eYNSfwq/nOd+CdRjXGl0Adzxy8y22ku3ZGqxH2a+xKeZ8EU63zfrNlWjtXDoPzFXAfHxiy7T6q2vZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I1ia6xKr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I1ia6xKr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=QgsZcfc61eqPYSCYKUUYrjjcfQKZOxUaadhjIVbsuw8=; b=I1ia6xKrjvNCJRZftTtw6raC3V
	puiOnu+yoLLeG1AgCl+uSeF/kECN6DDvvEhRlOiYR8S4rNc5j4CT27ymoYNju2heUI9RTbVT7TTfG
	G4iOuRONSPFPKebQwM8SToD8XLIpbOD9esHcRO02vKZV/jQ04frseodZnXdOv4q8iqptVCT/fAEdW
	f1fr3NeOmEujVmN+aKr5n4E2gKgj6P6WzE03tnUIKZ/m9+QCrYfKXTUOjsBrggyRe7tkE0381WpGE
	Uv/pd9E1h/t8mSZsT7F/ur3Vi3Qo+DGF4RgWMCoPVMWa8vvtZSl2EsdVJd6jl0KQjDt956KWZC8Df
	68C6lOPw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbdQ-00000009Uvb-3ffb;
	Wed, 08 Apr 2026 22:44:32 +0000
Message-ID: <b0d30125-80eb-40a3-9bac-d147e0f772a0@infradead.org>
Date: Wed, 8 Apr 2026 15:44:32 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: allowing '-' instead of ':' in kernel-doc descriptions
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Linux Documentation <linux-doc@vger.kernel.org>
References: <20251113125537.0d08e5ce@canb.auug.org.au>
 <20251113031422-mutt-send-email-mst@kernel.org>
 <dskdc44um6l6sw43uazfpzmsv4tkesog7sro22qkvzxyflvurt@pwhb3rs44ga7>
Content-Language: en-US
In-Reply-To: <dskdc44um6l6sw43uazfpzmsv4tkesog7sro22qkvzxyflvurt@pwhb3rs44ga7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
[modified Subject & recipients]

On 11/13/25 2:32 AM, Mauro Carvalho Chehab wrote:
> On Thu, Nov 13, 2025 at 03:49:27AM -0500, Michael S. Tsirkin wrote:
>> On Thu, Nov 13, 2025 at 12:55:37PM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next build (htmldocs) produced these warnings:
>>>
>>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 duplicate section name 'Return'
>>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 duplicate section name 'Return'
>>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 duplicate section name 'Return'
>>>
>>> Introduced by commit
>>>
>>>   bee8c7c24b73 ("virtio: introduce map ops in virtio core")
>>>
>>> but is probably a bug in our scripts as those lines above have "Returns:"
>>> in them, not "Return:".
>>>
>>> These have turned up now since a bug was fixed that was repressing a
>>> lot of warnings.
>>
>> Indeed. But the rest of header says Returns ... without : so I will just
>> fix this one to do the same. I also fixed other issues in the comments
>> in this header while I was at it. Will post shortly.
> 
> That's the best approach. We could instead change the new section detection
> regex to accept just one space at most:
> 
>     diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
>     index f7dbb0868367..bab0ec3abe31 100644
>     --- a/scripts/lib/kdoc/kdoc_parser.py
>     +++ b/scripts/lib/kdoc/kdoc_parser.py
>     @@ -46,7 +46,7 @@ doc_decl = doc_com + KernRe(r'(\w+)', cache=False)
>      known_section_names = 'description|context|returns?|notes?|examples?'
>      known_sections = KernRe(known_section_names, flags = re.I)
>      doc_sect = doc_com + \
>     -    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
>     +    KernRe(r'\s?(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
>                 flags=re.I, cache=False)
>  
>      doc_content = doc_com_body + KernRe(r'(.*)', cache=False)
> 
> (patch not tested)
> 
> But, if we do so, someone has to check if this won't cause regressions
> elsewhere. I'm almost sure a change like that will break something...

Following up:

I've been testing this patch for about 3 months now.
The only problems that I have seen with it are these:
(in linux-next-20260408)


WARNING: ../drivers/pci/msi/api.c:102 duplicate section name 'Return'
WARNING: ../mm/damon/core.c:1472 duplicate section name 'Return'
WARNING: ../mm/damon/core.c:1472 duplicate section name 'Return'
WARNING: ../include/uapi/drm/i915_drm.h:2403 duplicate section name 'Return'
WARNING: ../include/uapi/drm/i915_drm.h:2403 duplicate section name 'Return'
WARNING: ../include/uapi/drm/i915_drm.h:2403 duplicate section name 'Return'
WARNING: ../drivers/gpu/drm/drm_atomic_helper.c:3546 duplicate section name 'Return'
WARNING: ../drivers/gpu/drm/drm_atomic_helper.c:3710 duplicate section name 'Return'
WARNING: ../drivers/gpu/drm/drm_of.c:382 duplicate section name 'Return'
WARNING: ../drivers/gpu/drm/drm_of.c:432 duplicate section name 'Return'
WARNING: ../drivers/gpu/drm/drm_gem.c:900 duplicate section name 'Return'
WARNING: ../include/linux/w1.h:115 duplicate section name 'Return'
WARNING: ../include/linux/w1.h:115 duplicate section name 'Return'


-- 
~Randy

