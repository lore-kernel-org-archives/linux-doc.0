Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B6F3BB5A;
	Mon, 24 Nov 2025 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981244; cv=none; b=SieBVKGyGz0182WR6mDbsDUkUsimhCQREPOQawgq1xIU1chMNfw4a/gMHbvM6e2/zTjvfwBjo1qtGtFCQYkcs72TJYmmEIZK6usnIgQt/eelfbJQs2I7UQAkqDdwkc+et/AyQWaHfLLNafLcZmeOFPnk/GcimZa04229AjO/nsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981244; c=relaxed/simple;
	bh=6nxKEIZkVhailrIiW3XSVoQ+gWVPu3eKDnFphZtX1us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOkpLOHJoIxjiTNkSwUNLqybTwEpB24uD4U+nUIFmUm5LLKqMLtn1ipSUCOkHtVl11rgDzYtQMMh+VcRO9ux84FifHPSUP7Bq428N3DVecxSmVdUPblG8mbGUcZ9z8jzcyI2O+Z/qzpciKpkOwJDVTmCuSbTbw5DfjxmDzGhUoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2ko+iEi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2ko+iEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C77C4CEF1;
	Mon, 24 Nov 2025 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763981244;
	bh=6nxKEIZkVhailrIiW3XSVoQ+gWVPu3eKDnFphZtX1us=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B2ko+iEidiYGhvL3YmKCCuGt/1FAZGeXdFxjG6LTjNuCRFsjNc6VR40iFUsFsFuf7
	 vtXLMwfFBgw8gTF2AgGo/NlhU9LF8iHWcC5axSVGFSapMdg+VC/Lg7kjnRF6zOhyua
	 s3Se6r+3s4koBGppGnlbPoGOENiYWAykiE6wrK7Sw4v5RgWG3mZysysonlHbvnq3tU
	 B10Cn5j99q6ZRrVpMhK6d+le2etUfRyWojoe33smrqjQQD9IbwBDexOfGr1xudZvcX
	 lxa0fdPSP6KQQeMcDRYWzwL2ioy1UWsVhwtM2JPMipUCQQEdHYoqzJ/17iw6I7NZ8g
	 y+ptXYfDRaCSg==
Message-ID: <1a2329ef-50ff-4e48-87b4-3adc70ee8833@kernel.org>
Date: Mon, 24 Nov 2025 11:47:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pagemap: Update BUDDY flag documentation
To: Richard Weinberger <richard@nod.at>, linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
 mhocko@suse.com, surenb@google.com, rppt@kernel.org, vbabka@suse.cz,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, Vladimir Davydov <vdavydov@virtuozzo.com>,
 Konstantin Khlebnikov <koct9i@gmail.com>,
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20251122211920.3410371-1-richard@nod.at>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251122211920.3410371-1-richard@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/25 22:19, Richard Weinberger wrote:
> Since v4.6 the BUDDY flag is set for _all_ pages in the block
> and no longer just for the first one.
> This change was introduced by:
> commit 832fc1de01ae ("/proc/kpageflags: return KPF_BUDDY for "tail" buddy pages")
> 
> Strictly speaking, this was an ABI change, but as nobody has noticed
> since 2016, let's just update the documentation.
> 
> Cc: Vladimir Davydov <vdavydov@virtuozzo.com>>
> Cc: Konstantin Khlebnikov <koct9i@gmail.com>
> Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David
