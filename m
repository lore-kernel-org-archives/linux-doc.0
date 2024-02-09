Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B9571B3A
	for <linux-doc@vger.kernel.org>; Fri,  9 Feb 2024 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707493371; cv=none; b=UuIVpgU51eEJnRW9+eUyv3rK1hajL5nAJwYc7mNBsYMsFfwGV2Msc2iy67vdwpo3DNHU0Dsx0yrwYG3VZMosns7UQ6r578X2RCbeweXzoMigp+mfmcITAfcjda1HVS8IXJeVurAP3f80tBTbdUCI12KUDxtowEYzss6NS1sPvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707493371; c=relaxed/simple;
	bh=aoRyqAiMEdX1LMy4NGsmx8nuHCXJJko1zkj0XYhs6Is=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ox6maHMxANOn97Mxa0KGNYhVHazhOZib7mfJFRaZbRhznzrxtkkBJnw9YcCFV46ERVmk2ZcTnY5iP3kpPe1aQ3RYlOKXpx2FHkN/sQ9CqDnEmnsk2ldNfWP8Q26nkwppuLeRHGXR594BoFa39kx/ui4kAkhDgiBHHETsBQabsCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E2oXLVzx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E2oXLVzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707493368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoRyqAiMEdX1LMy4NGsmx8nuHCXJJko1zkj0XYhs6Is=;
	b=E2oXLVzxiU0GJs3+yrjSZTdGvVDqv8mEjDQf0SXZGgYCQwHdIdVG6udygrystJxGOgTdm8
	Ua7PfFSO4khDImEGnMDiQ+xPOyBGPnxqHoWmX/4TRbyUl132Ro5OLB2jCgofxmXDT6ESCt
	qC4yjSF8CCUUXKzmNPeOBGieHspqnfE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-CPpJpQzQMzWUmnx8g5sNsA-1; Fri, 09 Feb 2024 10:42:46 -0500
X-MC-Unique: CPpJpQzQMzWUmnx8g5sNsA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2f71c9f5d2so73305366b.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Feb 2024 07:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707493365; x=1708098165;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoRyqAiMEdX1LMy4NGsmx8nuHCXJJko1zkj0XYhs6Is=;
        b=QlKaw1zxvpPCTFC/KIxiYlOK/roQz9PLD8ADad56utGzBRAV6V7+6fr4qRvlI1Rj0e
         zeRcSMV+0J2VQ5FN08lei++XT4/0ixJoGo0EAqeQJ02mIv76YH/oATv6dfTWcoOvNynU
         wRM1RGWMZ07ARN86QDP3qy/Td+v0DUkjN0Hs+dzfNLS2UlqhVT6w8eCHdzJZxRi5PtAi
         4OwONrUUYqDPCXOqVCRYGfPdQGnf9rzqCEKix+tq9huYvgfqjqUHMm+lxxf284faXgPG
         FfWAryVFId7O0TDTSfL+LSiTzAxcgK4e61zBCNB9q8Pj3DQb5i+4IefD6Mym6wqvKJy4
         bzIg==
X-Gm-Message-State: AOJu0YyFM+76caUfDM4xeB9X0oj/17DWLSwDYXvmtvSTW0racLXZFFOV
	HykKivrfAXPmGlUZh78fHdNvif7H4+apWzCuRMHGnkb73DtB7i+4KpfOl6Rr3DVJcW42SXd1d/g
	dJ5lvIfeXrjtaTnbCJD0LNCktpULKLVFZRwx2R6sANq7Z54yIEpZ+PtV0nQ==
X-Received: by 2002:a17:906:4954:b0:a39:1702:ea2a with SMTP id f20-20020a170906495400b00a391702ea2amr1650102ejt.46.1707493365227;
        Fri, 09 Feb 2024 07:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUC3LMg6bNhb5Jtq/RWphSd2cR+K8TsfkQXiLcxaI8Rw5dcHhUKQcqOc/in0/EOpwOMYYXdA==
X-Received: by 2002:a17:906:4954:b0:a39:1702:ea2a with SMTP id f20-20020a170906495400b00a391702ea2amr1650081ejt.46.1707493364829;
        Fri, 09 Feb 2024 07:42:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvmDDoMIBdI3NR6zTFpUsocl+Btpm2VcsF4PUKjCLcGNtqWEuwdDwxOrWZZdJ7KwWTBbzst/OV5pixVmNbxccl3kmeq0MYeHJQAe1RPNP08aPvJCsbw9URN83eiYF9YWmqT0knzDu9ASzZCa4k/Ui08b19VxZdOwj8r6/J1bAaDCG8Rh4ZhqLXJH5U7CV6FoZzHsAPaYtPgvYCQBcROrdSfzftRwmuxpPBVe3HuMdjhccVR7T/aYnLn7YQWk/RbP4q/X70Xcm9YKFzF1xi5kdhLjNGPWiFwW4hocPbofGN3FF2RIYEMXWINe501hDqVfYcc9kEYmEbiC/1F3YNCEhw3s003DseqDpa2pDjUONxgcr+yAPmyZr5P5qtN5gzeByuZ8MDSEsJfEuLJrtXn2qQnTtrIKbumPl0RZ1BYfhCvjhHgv6L1zPjJ0fDVn6hQRTJQ4X5g8jSxYK8VqrKitC9z9Vz61p8W3lRxJEUxPGIVqWVQJqVEU8w9FWOaeRWyqE2UJMkwrup1qu9JNwQrsED1V8ARsrYuIZzgcqrAZgQ7VAPznSNa2q19AcOLYR6BmGUSb0QivlzsVuAVTARlsyYArD2y5cafzgWsVlVMVshbSSB9x3n4H5sn+eM97JFXfN8yxUSJB7L
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709060ec100b00a37116e2885sm867386eji.84.2024.02.09.07.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 07:42:44 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 321FC10F5038; Fri,  9 Feb 2024 16:42:44 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
 <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH RFC bpf-next 0/9] allow HID-BPF to do device IOs
In-Reply-To: <20240209-hid-bpf-sleepable-v1-0-4cc895b5adbd@kernel.org>
References: <20240209-hid-bpf-sleepable-v1-0-4cc895b5adbd@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 09 Feb 2024 16:42:44 +0100
Message-ID: <87bk8pve2z.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benjamin Tissoires <bentiss@kernel.org> writes:

> [Putting this as a RFC because I'm pretty sure I'm not doing the things
> correctly at the BPF level.]
> [Also using bpf-next as the base tree as there will be conflicting
> changes otherwise]
>
> Ideally I'd like to have something similar to bpf_timers, but not
> in soft IRQ context. So I'm emulating this with a sleepable
> bpf_tail_call() (see "HID: bpf: allow to defer work in a delayed
> workqueue").

Why implement a new mechanism? Sounds like what you need is essentially
the bpf_timer functionality, just running in a different context, right?
So why not just add a flag to the timer setup that controls the callback
context? I've been toying with something similar for restarting XDP TX
for my queueing patch series (though I'm not sure if this will actually
end up being needed in the end):

https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/commit/?h=xdp-queueing-08&id=54bc201a358d1ac6ebfe900099315bbd0a76e862

-Toke

