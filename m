Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A261749AA4A
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178145; cv=pass; b=IPnvfZlqltZ2fZnezYh5lAQ6PG6LeMxr298wLA9vZTTo6K5DZ6W90i0BN8sJljRHV7fnAbDwtQtAgcUOvZBaWUkIX6ucRKgVSA9m6w9Wtt5pc0BmeP3EI1FdBwuJfpGMJPgv4HID/1kJdYnSrUR6MFuZxfEaDJ/WiezNIlE96OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178145; c=relaxed/simple;
	bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg0GgU3vMCmY+Mc6PYwmLcXN0YI4/TqCb1Yr1IWNYX6ScMYdesy5+OX996l83mFr259FFylxE4ehoWiB3kgLyA/ONVgCLh8oA4DJOm2PVzEqO7zpPQ/1VAmA8sKt2F0ctJogLQlmknbS4lFat2L1n5eNRWSI2JtXK27gh5ZK0zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFiisLdp; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFiisLdp"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-86fbc2f4425so912037b3.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178142; cv=none;
        d=google.com; s=arc-20260327;
        b=WV7UjJ0X1ee2vtx2p7BQ/XLTZ8pUChI+F4RDqJBbZM0q1VHREzLtWEP2b4VOpO6iRU
         AtlgHnvWIvqBLxcP4rZzJNujyy7xNzUacT6JAgY89od4fhL2MLKTt3A0LPQdaLLItqE2
         jTKTaf0hnqPLiG0EBeBs73jOSE0tskYX0dKC3oRG2Mz6OPXN3mL5tUikp8vxTWVtf2Ds
         x1G17qivZOBp2/44fYIft+mmhYfV7Ai+H9zX/b4r59Vaik4LD91eUkYJih55hf4Izw8w
         VeH+p0xilQUDNYUw6Wz3ehWS9kNzj0kqLf91wRZJfBAgJafc5oGgfRy61jmmxK6OHp35
         z3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
        fh=NjsU6NrcQvHrfBJnVg7bi2BQi3Wrqd90VATsRpu/HgQ=;
        b=hExQVcsfe+Ms8/1OUYxjjbaM4fP0Cm4gvexeWbBQvzkY/s/9v3Xf+ItE/4PKAMFDQk
         pDoa2owk2Ru/Iy+u4tnPHJ+pK/nubAHIb8NV3RQdyuOJPOfz6iZYfHh/HM6GTi+q/LgS
         gqY25UQjOuCVPYwOlgfuBXQrxHn+L5ZOfOiBbx0vuYAm8QldExavnxJ2vkmRgtDnmhIT
         EqfUhcPpvkwV6l2VwIlozyWiP/j6Ee4e5HCL2wfTx1DRdhw3V/srA2U919Bt4EsFO+3s
         uwiOiv5Ba13btkKUiJjgI5jvuvvN2F/RwEBpaOOrfQVWlz5haCWtGXkfTS8Tfl1BIvB+
         MGDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178142; x=1790782942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
        b=jFiisLdpvmNxxMvHF0EZLP4sxkMoVzw7heAplP2Gzj8jbE/LEATLs0bWWUqt5GeS1a
         0dpZDfCGfPf1BviihdsPrgQNyPJxAKY6EtmjhyP9SSEOKr5T3vLycMM/5jbJArxPRJwn
         unJZHyyu2w3tXF7ocwKsNVuUH0IuJ0nzvUM81+EH7RhVkAOQhnSxazIjyvxyppCtk0Tm
         4s1aI30xrkm7hijaCHSn4HHXyfJN7Xcxe/wJr/3idxM6D6nCRWzhRasDXyLKPlS18pDn
         q9WxQuBeZksmM/K+6IcrNtPhTGDTvz73GYmBKb3HlJ+NEk5IjKGRKqFh3ttPwlF1EIj5
         A3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178142; x=1790782942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
        b=rQoEXv5wRK1YRK5IBtnlSkSTW4vfpwPXG8GpqB4cVDYCakw3HTRxAzdembAH16Az8B
         3TeBDjUT2a8lKdaxMikuyJMfnoJ7e8xpCs/CrALXrAVJJcS5C+h8jKaCKZ+Fxr6FyTjn
         KkoUDh1ITJ2Ipq4B4mf4TqsmYusmmXI7ntm9OpIgSYwrXa36jzPTB8moyrraWWbIaKxP
         Hxv59G0RQQbxZZdNHYF5RCajuj1uQFkNIdILXEDAyFQOAQBSwghAZv82cCaa/dPoyZAp
         BORFAUGvQAHXart6Dk3sUuHGpuXFF4So6+bVPtRzT5J4mA862lpxwxvJdySKBjNgPtoJ
         8jLw==
X-Forwarded-Encrypted: i=1; AKwUvBw+g+uNCMeDJ+EX3rQV6HIDauPisVCHHuo1UA41FTtfDJCbwAHlj3o1F6iiodmLuu8nD/eOCsma9mY=@vger.kernel.org
X-Gm-Message-State: AFuF++lZI8LJp7QZCHUJojblZn6N7xKcq98eATsVAS6OdZXXfea5GXAD
	TD45IjR1tg69crKCN5QeuL5ev9Liihz3IKfBoxOayPPYS+aGN0hsqCg2RsdaqdWpLHhW4cLgfTA
	0Xraaf2LAoWkz1IkuW5I7x9v/84p/LkE=
X-Gm-Gg: AYBFou2XyhBoOPVUfKey7ndfwMxBVMl2Lqyw1j+2zHr5hdLoktv2+8Z9eRW40nkafa0
	uFAV8FW1cfJCyJaBvhTRpwCq0+d41QLz61ks3FmnlkjPOPnFLOa2EKMqRt+O7IZWgU3rz1F5nwf
	BSnIUJ+E+1eB+k9abhO5DZ77CQ6ZIoNEY294q9N2O90XFFS1K9mJSLzV36w25yxrvNyvKE6/L5U
	Evwp9BzHnV/lUxPjXwGs7DlxSB3zcigMkUo3+RLR8pq49YVO7MJkIVIJIx61/ZSxQ5iMxmZPXHO
	mgcv68Qz0HJlsHpag8KbYsWNYwxim0Qtm2ldYjIOwEn+SnbXFwlG1nQH
X-Received: by 2002:a05:690c:6709:b0:85e:3071:f103 with SMTP id
 00721157ae682-8a4574a521emr31049147b3.1.1790178142273; Wed, 23 Sep 2026
 08:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922120330.127262-1-itai.handler@gmail.com>
 <20260922213457.GA3536981@google.com> <CAFpOueSjekxhjEosQGiZ9BiDh5tFOqBPX5w_2PVsrcN6pO+dHw@mail.gmail.com>
 <9a6c20da-4da9-4a8d-a6d4-f18900228bf6@redhat.com> <20260923113903.901245-1-itai.handler@gmail.com>
 <20260923162846.0d198104@pumpkin>
In-Reply-To: <20260923162846.0d198104@pumpkin>
From: Itai Handler <itai.handler@gmail.com>
Date: Wed, 23 Sep 2026 18:42:11 +0300
X-Gm-Features: AclHuK9w5roNsxyARXB-UwcciSSDhgydoszkxBjNj6J6hb6GTuZZRPklA1vjXqU
Message-ID: <CAFpOueRECZx=9XOniAAKQNDJGJ_s1FXLAOA+FeMhBNJK=aJzmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
To: David Laight <david.laight.linux@gmail.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Eric Biggers <ebiggers@kernel.org>, 
	Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	dm-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 6:28=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:

> And you really better do 4k aligned 4k writes.
> Otherwise performance and device lifetime are likely to suffer badly.

Agreed. My point about the 512-byte logical/atomic unit was only about
what the device guarantees, not about what I/O size should normally be
used.

In particular, I don't think the fact that a device reports 512-byte
logical blocks is a reason to use 512-byte I/O. Filesystems and
applications should still normally issue appropriately aligned 4K (or
larger) I/O where that matches the device's characteristics.

The distinction I was trying to make is between the device's I/O
granularity/performance characteristics and its guaranteed atomic write
unit. The former may well be 4K or larger even when the latter is only
512 bytes (or is not advertised at all).

So I agree with your point, but I don't think it changes the argument
about the dm-crypt sector-size limit: a 4096-byte dm-crypt encryption
sector can already span multiple device-level atomic units, and the
proposed change only increases the maximum size when explicitly
requested.

Thanks,
Itai
