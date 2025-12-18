Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634B30F7F9;
	Thu, 18 Dec 2025 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080733; cv=none; b=MGu3CbkuKZs2bQ+Tj6x+odOnvuxvkeSeUrOEtAQ9rlP771mDqEYdIYqqSili8rbOVMkDFH7sBJd7s3pqUiNMlQyeNKvkQXmXYu/Da9vJPcRwgLKkeoN3Hj7A/2wsR0uigdt2QTC1PJm2mPrzuIZQdwSlZNFvYOYE5aBKnPEh5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080733; c=relaxed/simple;
	bh=H5g4db2mVLB9hibJMtV3D/9VAD4zVEbObZly7UwUl8o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=t0ifhzitUk/ipxRmjXApp/4L41r3lis48howpZ0BRxaY4doDZ9PPEimKF1ozCHNPMeN0Z6s0qzCMRQ8PHgnOhZLD9GLs8fR9al6Ls6ZIKvXE9mn8Pk2m6ZrqL/BqmYC3vAX0NnIOMOmOse3xynUkNcMmZvnZGGJFhqBg8TibHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EA4KnGiI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EA4KnGiI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E0C7C1A5B5;
	Thu, 18 Dec 2025 17:58:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0C6260715;
	Thu, 18 Dec 2025 17:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68475102F0B52;
	Thu, 18 Dec 2025 18:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1hbIBKdKugDdLcbog5liFmHbSOywKZqx97/+7LDteFk=;
	b=EA4KnGiIFVJ3wBud8Tlp2OgOcJYTJNDhttg20Pw9KXyAX3lX7Ah99/2EV25OYeD2e+LXTb
	ik4TchexSQvDWlthbt02ml4txsUTdGKBNuNjzAj1vrxwHYKPEg79ED/2TuYnngACBiV4Rd
	UtFGDTMbhMAaWmEExAeT0vzTkc2ECwX5huJL9bfIFHOszb3XQLTIMyaZ6mAUHjUtqdg3qa
	Dt3vzOlPqGKVBrTUHmnsqdzeuy40mMDA/fCRNCRMoO7L/7ofbkTBNjPFLSOBe9laP/KxRE
	kw6prxIe6Bi5nsq1XH7HKmeH987L5cj1dieio63CRnkB6NkiuLSR/BpESWzQOQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:58:45 +0100
Message-Id: <DF1JD8XIPQ89.2GGSIHVBHB2ZP@bootlin.com>
Subject: Re: [PATCH RESEND v2 06/32] drm/vkms: Introduce configfs for plane
 name
Cc: "Haneen Mohammed" <hamohammed.sa@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Melissa Wen" <melissa.srw@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>
 <aRXpeE2fCRj4uyBY@fedora>
 <f2ee5ce4-418a-4170-9b0f-26bac570e72e@bootlin.com>
In-Reply-To: <f2ee5ce4-418a-4170-9b0f-26bac570e72e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 17, 2025 at 10:56 AM CET, Louis Chauvet wrote:
>
>
> On 11/13/25 14:21, Jos=C3=A9 Exp=C3=B3sito wrote:
>> On Wed, Oct 29, 2025 at 03:36:43PM +0100, Louis Chauvet wrote:
>>> Planes can have name, create a plane attribute to configure it. Current=
ly
>>> plane name is mainly used in logs.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> ---
>>>   Documentation/gpu/vkms.rst           |  3 ++-
>>>   drivers/gpu/drm/vkms/vkms_configfs.c | 32 +++++++++++++++++++++++++++=
+++++
>>>   2 files changed, 34 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>>> index 3574e01b928d..1fe6e420c963 100644
>>> --- a/Documentation/gpu/vkms.rst
>>> +++ b/Documentation/gpu/vkms.rst
>>> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>>>
>>>     sudo mkdir /config/vkms/my-vkms/planes/plane0
>>>
>>> -Planes have 1 configurable attribute:
>>> +Planes have 2 configurable attributes:
>>>
>>>   - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as th=
ose
>>>     exposed by the "type" property of a plane)
>>> +- name: Name of the plane
>>
>> I'd like to mention again my comment on limiting the name to a set of
>> well-known characters [1].
>>
>> The reason is that, in libinput, we had a format string vulnerability
>> due to the kernel exposing devices with names containing strings like
>> "%s" in the name (CVE-2022-1215):
>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/752
>>
>> In my opinion, we should avoid surprising user-space too much and allow
>> only a set of "safe" characters.
>>
>> Maybe I'm too cautious, as this is valid code, but I'd like to bring up
>> the discussion again to see if someone else agrees or disagrees.
>>
>> [1] https://lore.kernel.org/all/aPtgCUX5kixTh2ua@fedora/
>
> Sorry, I completely forgot to send my mail drafts for your comments...
> It was mainly "Will do for v2" except here:
>
>
> For me this should not be a kernel concern, when the userspace read a
> file/folder name, it can be anything, so the userspace should do the
> proper sanitization.
>
> For libinput it was "easy" to exploit because unauthenticated users can
> create any device name, but for VKMS, you must already be a
> "privilegied" user (can write to configfs). I don't see the added value
> for a kernel-side limitation, it will be more code for almost no
> security improvement.
>
> If you really think this is important, do you know if the kernel have a
> helper to do this kind of checks? I did not found anything in strings.h
> and I don't want to implement it in VKMS.

I tend to agree with Jos=C3=A9 here, being strict on accepted input is good=
.

I guess you can stick to [A-Za-z0-9_-], then if there is a good reason to
relax the constraint it can be done later.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
