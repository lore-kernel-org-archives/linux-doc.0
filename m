Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FC6199252
	for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739719644; cv=none; b=fNqFh4kLlPGbIR24FqXE+F+wcJrZ5UTurw7jtB2pCg0bqWogAIEV6E87Y9KRCajtJT40cZkxTFnuOm/XGd8rGAFoZFcRExYK4eydMZP43a7DSt6VGSENXdV5rCsGiORdn4a+/IfFK2rnizGTPYR1Ofpk1qY5zZodnmENu+X6lvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739719644; c=relaxed/simple;
	bh=QE/UEPFlHtbjvsE6N0aEBI6BZhUFr3VNdyoTWbJ/i+A=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ui6Cs53xfvmN7LcKsNMgF5/2YGtO5bgciD6mDhn+y1GIeMM6v/TBbvNnWDbN9ORmCExwV1ZZEWAW4EUI08e+eAz2sXvjRSc/fXE7mtGION5+OrfebnAoId8HZs+EWL3e7rChokqagRKIPxnMboDL4XCe2ZzsC7bLl4mdhwK9kBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JFOa36sU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JFOa36sU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4584148EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739719636; bh=j/ZwgWbMYz1o8QfdpLdKUlgHhkfyz8s25uFJNU9CraY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=JFOa36sUud+apIv9kI2ASV/kw7qLIgE7SvUOq8jEJPYZ59tTKgcDt27FF0ibe7JcD
	 kUqK44/zwPUI8N/BTwd4Ck3ulgs0toOgZLrx3Zg9+QKlU3tihIXD4w5N9LKc44wtJi
	 DRl4+8AdP0HYa3uFy+dTXaz9RvGf+XU6DQWOLymlf41zK6UZFhbTYCJEUOqSxfNj8i
	 3hplaH1my/Ps5QDsruHF0GfYR8WD7yWYoheq2rC7Y9cqJwhSXi46+61Aoodis4vT7Z
	 Xlo6nCqmLpdMMrLlK/Ersu6txdM87LEdaBe+0JCq00K81DTVp2NUdwJWeu5AxGXs6h
	 jCX8dwTqV6cAA==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4584148EBC;
	Sun, 16 Feb 2025 15:27:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Seyediman Seyedarab <imandevel@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] drm/doc: fix minor grammatical issues
In-Reply-To: <435n35tqqhg63u362uyttit2kqx6qfr6cny6ap5rxigyvg7sx4@ewumuzncwczq>
References: <20250203234046.5114-1-ImanDevel@gmail.com>
 <435n35tqqhg63u362uyttit2kqx6qfr6cny6ap5rxigyvg7sx4@ewumuzncwczq>
Date: Sun, 16 Feb 2025 08:27:15 -0700
Message-ID: <87cyfhvrjg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Seyediman Seyedarab <imandevel@gmail.com> writes:

> On 25/02/03 06:40PM, Seyediman Seyedarab wrote:
>> The following grammatical issues have been fixed:
>> - Corrected subject-verb agreement
>> - Replaced incorrect noun "setup" with the correct verb form "set up."
>> 
>> Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
>> ---
>>  Documentation/gpu/drm-kms.rst | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
>> index abfe220764e1..6a3ae069c829 100644
>> --- a/Documentation/gpu/drm-kms.rst
>> +++ b/Documentation/gpu/drm-kms.rst
>> @@ -6,7 +6,7 @@ Drivers must initialize the mode setting core by calling
>>  drmm_mode_config_init() on the DRM device. The function
>>  initializes the :c:type:`struct drm_device <drm_device>`
>>  mode_config field and never fails. Once done, mode configuration must
>> -be setup by initializing the following fields.
>> +be set up by initializing the following fields.
>>  
>>  -  int min_width, min_height; int max_width, max_height;
>>     Minimum and maximum width and height of the frame buffers in pixel
>> @@ -253,7 +253,7 @@ rollback:
>>    should not interfere, and not get stalled due to output routing changing on
>>    different CRTCs.
>>  
>> -Taken all together there's two consequences for the atomic design:
>> +Taken all together there are two consequences for the atomic design:
>>  
>>  - The overall state is split up into per-object state structures:
>>    :c:type:`struct drm_plane_state <drm_plane_state>` for planes, :c:type:`struct
>> -- 
>> 2.48.1
>> 
>
> Just following up on this patch I sent on 25/02/03. It's a small
> typo fix in the drm-kms documentation, nothing major, but I just
> wanted to make sure it hasn't slipped through the cracks.
> Appreciate any feedback when you get a chance. Thanks!

Please resend that patch after using scripts/get_maintainer.pl to get
the proper recipient list.  The DRM folks handle their own documentation
patches, so I can't apply this one.

Thanks,

jon
