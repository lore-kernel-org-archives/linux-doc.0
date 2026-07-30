Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4608F3C73F7;
	Thu, 30 Jul 2026 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415199; cv=none; b=VK4tSoWw7Egc4RiMRRFxMd4zvdi34P6Ldkyt0De7ZM7goy6yw5+ggOeOhM5zEHDonhqP7Mtlw1d6A1aDl4VYX0RnXBRe1SRhZLs/TawycaZqLDTixygEWTLtui/mJC0o1DjuYFVJiJ+L1SOu07VanvzesFVC4zjYL4KoOHBD22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415199; c=relaxed/simple;
	bh=+DOGoQo9Jue42lb1rwBSLX9vhDY9ntgxYJroTDsXlHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEEgqb3m3LegVhdTu4risv5leX0ZzKC6qyO1F7+x82HyvwGN+u+u5nR+qNO6wS81P8bTJ4NUvOWYaRRjASC2Qc2IzyfdM5LAkcS8FVJTVLLGIIP4Lxdda7i9Ul/W24ftI/C4LKaWute/UFIe8nJyXjUP2TG7b6fHg+dUYOYMeWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjGo0+ef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjGo0+ef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBADA1F00A3D;
	Thu, 30 Jul 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785415198;
	bh=EWd1k8EXIqwmRQHt1JMH5oDb5WZp1Mtdat7Fpqf7Ea8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JjGo0+ef6V7aGBLPT5F6flIjmLAIVBu7nXTqOXTO5IewpJ5zjLsOqQ/jeDmpRppDP
	 Ck1UcyOGvG5OFSJ0FyGlNR/jiDcssR0+7uWYI1i+j0CU4dtCu0z/ZOwtsLuhShuBPz
	 yHCpJdgyzBbx0nsAc9QgZW87nAn1jEDg4d/Wo42hDqUWr8+yvtCMPhULD3+BZG2Oie
	 ElkNXvxNs1I0BZm67/yZwDr7Rv6ti/MAblPee+0lf8KbmIWxBhEflKuFxSrqB37l82
	 CGA/kgO5cW6hAsk5dTLTrXHeqwIRcuk8btez7hGCF8WntkdR0BjjvUF/QjOtdBdPSd
	 AXWHuBGrqqRfw==
Message-ID: <1acb7ba0-6aff-4d30-9554-283ac8fbc93f@kernel.org>
Date: Thu, 30 Jul 2026 14:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Pratyush Mallick <pratmal@google.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, sj@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, anshuman.khandual@arm.com,
 gthelen@google.com, surenb@google.com, mhocko@suse.com, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, rppt@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260727230545.262579-1-pratmal@google.com>
 <amiN82J8p5z9l_Rm@lucifer> <91b61f02-c533-41b9-b680-7de52a5c6918@kernel.org>
 <CALHaPKeOs25YNRg60+NxfS3E5RYLt5hJqFNX02ZCEBrjcDua0Q@mail.gmail.com>
 <amsYVFfJmOs-Hy90@lucifer>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <amsYVFfJmOs-Hy90@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> With 2s, we wait 2s before we start reporting immediately by kicking the
>>> workqueue immediately.
>>>
>>> So "0" does not mean "report all the time", rather "start reporting immediately
>>> as we are notified about a pageblock to report".
> 
> No, it's whenever pageblock_order is specified, defaulting to a pageblock.
> 
> But I guess in practice fine.
> 
> There's fun like this in virtio_balloon.c btw:
> 
> 		/*
> 		 * The default page reporting order is @pageblock_order, which
> 		 * corresponds to 512MB in size on ARM64 when 64KB base page
> 		 * size is used. The page reporting won't be triggered if the
> 		 * freeing page can't come up with a free area like that huge.
> 		 * So we specify the page reporting order to 5, corresponding
> 		 * to 2MB. It helps to avoid THP splitting if 4KB base page
> 		 * size is used by host.
> 		 *
> 		 * Ideally, the page reporting order is selected based on the
> 		 * host's base page size. However, it needs more work to report
> 		 * that value. The hard-coded order would be fine currently.
> 		 */
> #if defined(CONFIG_ARM64) && defined(CONFIG_ARM64_64K_PAGES)
> 		vb->pr_dev_info.order = 5;
> #endif

Yes, it's really about "a large chunk of memory was freed". On 64k " a large
chunk" is unfortunately order 5 == 2MiB (so the same as on 4k where a pageblock
is 2M).

-- 
Cheers,

David
