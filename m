Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D6262A6
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 23:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781307274; cv=none; b=Sk/ymmICn1Wr3S6/oY6YOkSwMKdRi+6AcGis9sImdvF53N/3UAnPszAq7I71cL8Ex3QYjnO4PB/dRXS+jOI6ci25cRj22IfUf8q9xONLLv5LTxpuqXsQp1KROwcKkDxrV703ksfDnuGyxoJu42jYPfAZG6Vbn8fQoyikPWZL7x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781307274; c=relaxed/simple;
	bh=YH9WfeIuCUtS171g8VzwDzlZkb7RNOZ1n5JaMNDoH0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maLxkbqYUVQ9an/n1Vy/jN2+2Uh2lNXbrN8RugpdE311Toyd2s3a+Jt6Fy+e6AyMGWrUxP3pe3UajqREIgpU6urwfRBnwIZbcB8/9Stf/ulJ6+JQiKB6Cb6VX/zRg7tVExo+HqIMrVsKu5aEe7xj2GILN+h8/c8yxYPZjzq/xJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N5a7M3j7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N5a7M3j7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jPer+Mbx310H041oVdkkI+/IqWEc6K36RNwWTPh0eNE=; b=N5a7M3j7Qnz0vF1abXjW5jC4En
	C4gpzfETavd1hGDl8ryh/o5os0AcNFpxnTGN1jL0ztHsExwSL2fmnZKkzjLkzirC859mvE4kX4wQP
	mqWF7eWMSIJi9C62HgFiUH+xlFiehF0ZrjIVvG/3A72uC+e44Fie7kzB1doeTg+WoCnFguT+SnO99
	DkyJoh6H5SV0fX8e6qabHnuOOZMFR1rOplEuZStVWCX1tzWLaKWcmBAbfG9/IYl9EH8ZhR/pAa/TY
	OZ4/CId/Rz8jtN5CDLYdt2/mNnKE6b7X1qBv8UQ9TqX0cGJR4gHxNIQvAHW6VFX0lwmj/nB2cXbyI
	pDf40sUw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBOO-0000000Ble6-3GEh;
	Fri, 12 Jun 2026 23:34:28 +0000
Message-ID: <d6d0b833-cfef-4d82-9da6-e2c128b9f9c1@infradead.org>
Date: Fri, 12 Jun 2026 16:34:21 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kdoc: xforms: ignore special static/inline macros
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20260602031214.2817411-1-rdunlap@infradead.org>
 <87ldcj5z9i.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ldcj5z9i.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/12/26 12:34 PM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c contains 7 (for
>> now) functions that use STATIC_IFN_KUNIT or INLINE_IFN_KUNIT macros for
>> function qualifiers (static or not, inline or not).
>>
>> These cause parse warnings from kernel-doc:
>> Invalid C declaration: Expected identifier in nested name, got keyword:
>>   struct [error at 29]
>> STATIC_IFN_KUNIT const struct drm_color_lut * __extract_blob_lut (const
>>   struct drm_property_blob *blob, uint32_t *size)
>>
>> Handle these in kernel-doc to prevent multiple warnings.
>>
>> Fixes: 647d1fd04652 ("drm/amd/display: Add KUnit test for color helpers")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Ivan Lipski <ivan.lipski@amd.com>
>> Cc: Dan Wheeler <daniel.wheeler@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>>
>>  tools/lib/python/kdoc/xforms_lists.py |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- linux-next-20260601.orig/tools/lib/python/kdoc/xforms_lists.py
>> +++ linux-next-20260601/tools/lib/python/kdoc/xforms_lists.py
>> @@ -104,6 +104,8 @@ class CTransforms:
>>          (CMatch("__context_unsafe"), ""),
>>          (CMatch("__attribute_const__"), ""),
>>          (CMatch("__attribute__"), ""),
>> +        (CMatch("STATIC_IFN_KUNIT"), ""),
>> +        (CMatch("INLINE_IFN_KUNIT"), ""),
> 
> So I can't get this one to apply; which tree did you patch here?

Ah. My quilt patches. There is one there that I haven't submitted.
I'll drop it and resubmit the patch.

thanks.
-- 
~Randy

