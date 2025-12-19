Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C928358D01
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159367; cv=none; b=M6hO/OsHxAa6a1CoS6lBvnbbn7Wn4+YqZWmsMKgJlhVQP2qrXeErHLETNEL7akdo4pPFiQyZ8pg5o+Rq5MYnB7ZZwAIkG312ZZFhtT1pLyHGGb0cF3C6JAPVJj2Zel02fDxyN1mPC4qwlNTW9HmhHyOeD2u0+5gmH3jqNKGJmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159367; c=relaxed/simple;
	bh=+7oCiPxEpxgpjGp9B2HpcW2PYpTKP8zxWa9G79vw5QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kghp7pngtkFqjuH6+L/folAmWF2bhzRPBy+mvsUwgMJG0Wmy7t3a5cG/Ufz4OFCxnqeIJ52T9pntpfBOj55HcgtejwxzyOcXrXLrTfDgdhFL3crlYDo1XXuew8a8Yz01TSWOWJgcCJbG07rUF3uPUMwyFkR6C5veyEnq7vVNsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Uk/HX4Ft; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Uk/HX4Ft"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FD5A1A22F8;
	Fri, 19 Dec 2025 15:49:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D9526071D;
	Fri, 19 Dec 2025 15:49:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D079810AA94CD;
	Fri, 19 Dec 2025 16:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766159354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=URghJ64E0DTMxIoz0+TPwPZPwbCbXHJhyhUlhOosb5U=;
	b=Uk/HX4FtAJKOyXxo+i89ig0y20+vnnEAlGnLb6mkvGJ86CNs+nTZH806AIi4HQoB7JX5Hj
	1coKH2VZ9mc+Tt2fTLsQdiDWyjflw2vS0eHe7NQgkil5vXqQFSLV3mRiIDUY//zB3AxmtQ
	s9+d1yOm56fapKov51DBkC9tvyCxOzncRZQB4HCG+wRNHQ4Vs8mDa0kXOwRah0/5RPtPhP
	MjDw2K+M7gxDjrLZ6zTtjmh66DPEpcKdHceFLrrbNV0yVmWWq7REG2S4fYsrIYJvKYydFF
	qhrHaAPsIrQfMuKlpUXwNYE6Qo6cGQxMKSfSYPfhm5tVVeRl7LZiPLu8Zy/ZmQ==
Message-ID: <a72e9fea-b19e-4bbf-ab72-e853a1e9d4e8@bootlin.com>
Date: Fri, 19 Dec 2025 16:49:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 06/32] drm/vkms: Introduce configfs for plane
 name
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>
 <aRXpeE2fCRj4uyBY@fedora> <f2ee5ce4-418a-4170-9b0f-26bac570e72e@bootlin.com>
 <DF1JD8XIPQ89.2GGSIHVBHB2ZP@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF1JD8XIPQ89.2GGSIHVBHB2ZP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 12/18/25 18:58, Luca Ceresoli wrote:
> On Mon Nov 17, 2025 at 10:56 AM CET, Louis Chauvet wrote:
>>
>>
>> On 11/13/25 14:21, José Expósito wrote:
>>> On Wed, Oct 29, 2025 at 03:36:43PM +0100, Louis Chauvet wrote:
>>>> Planes can have name, create a plane attribute to configure it. Currently
>>>> plane name is mainly used in logs.
>>>>
>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>> ---
>>>>    Documentation/gpu/vkms.rst           |  3 ++-
>>>>    drivers/gpu/drm/vkms/vkms_configfs.c | 32 ++++++++++++++++++++++++++++++++
>>>>    2 files changed, 34 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>>>> index 3574e01b928d..1fe6e420c963 100644
>>>> --- a/Documentation/gpu/vkms.rst
>>>> +++ b/Documentation/gpu/vkms.rst
>>>> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>>>>
>>>>      sudo mkdir /config/vkms/my-vkms/planes/plane0
>>>>
>>>> -Planes have 1 configurable attribute:
>>>> +Planes have 2 configurable attributes:
>>>>
>>>>    - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>>>>      exposed by the "type" property of a plane)
>>>> +- name: Name of the plane
>>>
>>> I'd like to mention again my comment on limiting the name to a set of
>>> well-known characters [1].
>>>
>>> The reason is that, in libinput, we had a format string vulnerability
>>> due to the kernel exposing devices with names containing strings like
>>> "%s" in the name (CVE-2022-1215):
>>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/752
>>>
>>> In my opinion, we should avoid surprising user-space too much and allow
>>> only a set of "safe" characters.
>>>
>>> Maybe I'm too cautious, as this is valid code, but I'd like to bring up
>>> the discussion again to see if someone else agrees or disagrees.
>>>
>>> [1] https://lore.kernel.org/all/aPtgCUX5kixTh2ua@fedora/
>>
>> Sorry, I completely forgot to send my mail drafts for your comments...
>> It was mainly "Will do for v2" except here:
>>
>>
>> For me this should not be a kernel concern, when the userspace read a
>> file/folder name, it can be anything, so the userspace should do the
>> proper sanitization.
>>
>> For libinput it was "easy" to exploit because unauthenticated users can
>> create any device name, but for VKMS, you must already be a
>> "privilegied" user (can write to configfs). I don't see the added value
>> for a kernel-side limitation, it will be more code for almost no
>> security improvement.
>>
>> If you really think this is important, do you know if the kernel have a
>> helper to do this kind of checks? I did not found anything in strings.h
>> and I don't want to implement it in VKMS.
> 
> I tend to agree with José here, being strict on accepted input is good.
> 
> I guess you can stick to [A-Za-z0-9_-], then if there is a good reason to
> relax the constraint it can be done later.

I don't have very strong opinion, I will add this!

> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

