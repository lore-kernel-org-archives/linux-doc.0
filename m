Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207981;
	b=gt1U8CNX7dqmgVE3BqNMjSTS5AQMSb8AZ5AnMrWZDLLSvW3pf/YAJ3FvmIskTLjkHo9X
	 lfrrbM6M/+OUGbtzzYGitQTwtyl/TZE6krIJ4zCodabWDC6v5rrBtX4KixuRK1XfMxxNI
	 RICuKfO98Mm97bIl4Hd2SU9YvMZjKpi1cIfhwg5ixm5+BenUlultCYIxQ4tCjiAUQpvYX
	 oEvqydN3kf9qETmTMeFYaqXyufAhweIhwleOTkWJzyCJgBVXW5gFVVfz8J5yEsS+cck1e
	 C7g+yMbPSd8gSYg2Dt3zrqtk71XFsRbC/hMuhso/FtqCOmAnXT9ktt1Lf9MdfXzrrZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lAWulrjtYt7mxpMPX+OHNKu4/oFhSzNqEFCQHqnzkJI=;
	b=ZQuCv4Wv8qAO4E3zdZE7/fcqcX5VGfGPgP4J0Bz+OancUpuXBC5AZ5I9wG02N5cOL2RX
	 S8U+B10onewkcrQgQjf777Po62wt/5nLF56ISIykwCn250JSGZz+nCTUVDijPWWF1axQ0
	 LzrJNO9JllbamvIjyR99g/tVHy8qb5+VRBXOKMCcPrP7rsJaszUVeIUa2208oXxCfkHxU
	 vPlg74KlEay/e24FJgAba+Wj4vAcXjOyr6d1/cMBFCq7g5B51mN/2fDJ+9rHsus/9BNl0
	 hJr/cySo8IwTJPMcJTTRXXH3r4WrylmOBJ34ulPcIqISjTB/ypKwmqCjwXUNICERMFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QiJeCnIE;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C9606A31E
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 17:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QiJeCnIE
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2761c69fbso2848692c88.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793207979; x=1793812779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lAWulrjtYt7mxpMPX+OHNKu4/oFhSzNqEFCQHqnzkJI=;
        b=QiJeCnIEkvTsz1dMLNll2jCBX1FloSjtzFMmwoNze9PuLefK0/khYJQiKGATDK5GpH
         +xf/JzDZWB9Ohk8VNkWWd/qxlACDRGpWM7Ln/oG/41lrjtbBTvpDqNAwB5S5YPKFKq0o
         +0iCEHlPlwhfj3J8tHOijpVV0fhl+VnhU1D0a3cVe6qOgnan55CwkqRt+zSJWaF++3ju
         bXoIbzzpBfZ3dA9bSuQ6mnAAKEwZWVZvHKBqn9bonmQ1m/A6k6rA9wgnxLdc2BIWCK9l
         auELyD2R1ND2X+Nphu/6cSQTvPgUW+B2U7CxLoKZxyjEURs8l7/Flshwmpy9EhTx1QtE
         0AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207979; x=1793812779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAWulrjtYt7mxpMPX+OHNKu4/oFhSzNqEFCQHqnzkJI=;
        b=ARESZHDBeZa1ECi01BDVNZTE0JGycj6WURwomGyVFklb5eNOzaCyY824ZPPI04t27i
         +do2agYt+hpMxkfSfpWhH0UUuSMa45SKNdSxQ4/BJWiWaKaWvka0W+HSQYLJspTFaZZE
         ZPrX87JnrvtF4P1ma8KKm/afTO5YYAiUUuuJCSOK0kLmDvu1egvsMEkj6djfL2wTGchE
         tph0FwiD2cOepW3VrgXCg56HndUASaHhWabtar8hjJCWp0j4QE23yDTc7mdfff4vMFue
         FFvkp4RUaefo5EyuN51ADPrQmWUKLtzn59nJ85ew4Kl6Od7A3TFjzOwIZ2RdKYojFCFW
         hzbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEirJbe5rHY+36rBqu2x9I5odMAW3yQXWwkSvX4W/5JcCzxXeuGxpecCabnrUg8UTeqjVLzQR2SHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmWY4Jaj27lhC5skdUXqPMb9NkMrKnH1QlTOuNEyOIb3MDFjbw
	GF+ViuvIDNJ9KuSLSd/fXN8YNAnksy/NZ9Yx24HiZUiskXcyqRaMk/tlD1zwBH+eRbs=
X-Gm-Gg: AYBFou2VRugQV8KSHf7ZgBQwgOHQfNuhjWJGd+GlMU5jWgGzdpAChBj6SBe3g63ALDr
	MmXmW3evbWy/qhsyDhaafODBFLEbJdJQ1c3wCeayseMZ8GzeJHYMtf+NuFwi2uTSRZkcZ/bNGo2
	hmD7oE28zwmSBIjCOu42Twl+A+5qK5J7kGhRS9Ex5BkAIegSZvHC03fqh0Sl2XsvsCciuZYtaws
	dMu4k7eulwXlDVVK5/FCG0gSmNKgh2+QJUP1wFn8h0WqyzRPGAqDr7AkfWXfLYNrEQNMt/8HbHw
	kh75tPOLz33+iWR3FS0htyISS7SfyWs90huP1z+jFFu6RACsNJwAto28slOIRHO9IEG3mpN8RQp
	9Dl5dNXTASeJmjF8qwt4YAvK9aiKYQTgJX38PMVhRAjTiNN5+FD3uY8GlStrzyJlkhWNq3Bb7sw
	qHdB2TsvpGxDzYAt6N1GymHeZgBEPvRTMjHxNPZx4I+XSqLWBjK4aP/d3zZ3JMqDyLFNJJr88QQ
	DxyMlsdKAB+bpW0qWCF0SSdjr1ziUI6jrfCvI4vFy3Bk/tDLapgttAZLXfMjDVtSMSYucItUh+R
	AxfNf3xhf6+kp7b1x1NQuk7gSMvNPwwz6DDcStg8Er77HMpuYkzasoYC4mFnzc1N0ULToc8=
X-Received: by 2002:a05:7022:7f0e:b0:144:c127:dd1b with SMTP id a92af1059eb24-1a6cef7a4d4mr4060949c88.39.1793207978208;
        Wed, 28 Oct 2026 10:19:38 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm12731604c88.14.2026.10.28.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:19:37 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:19:36 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Haris Iqbal <haris.iqbal@linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [v3 for-next 0/3] block: delay support for error injection
Message-ID: <20261028171936.GA122209-mkhalfella@purestorage.com>
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
 <20261022202326.GB2931-mkhalfella@purestorage.com>
 <7efb1e79-f4a3-48a1-a08c-20eeb6369bbd@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7efb1e79-f4a3-48a1-a08c-20eeb6369bbd@linux.dev>

On Wed 2026-10-28 15:51:38 +0100, Haris Iqbal wrote:
> 
> 
> On 10/22/26 22:23, Mohamed Khalfella wrote:
> > Hello,
> > 
> > I wanted to use the delay injection for a test case that I am currently
> > working on [1]. Are you still working on these changes?
> 
> Hello,
> 
> Yes. But currently I am moving houses and hence did not get a chance to 
> look at the comments. I plan to send a v4 with changes based on the 
> comments next week.

Great, thank you. 

> 
> > 
> > 1- https://lore.kernel.org/all/20261022185920.GA2931-mkhalfella@purestorage.com/
> > 
> > 
> > On Tue 2026-09-29 00:16:31 +0200, Md Haris Iqbal wrote:
> >> Error injection can only fail a bio today.  This adds a delay_us option so
> >> that a rule can hold a bio back first, to model a slow device.  The delay
> >> happens above the driver, so it tests the code waiting above the block
> >> layer, not the blk-mq timeout handler.
> >>
> >> A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
> >> are not applied to it again, even after a split.  Christoph asked on v2
> >> to avoid the flag by allowing a delay only together with an error.  I kept
> >> delay-only rules, as a slow device that succeeds is the more useful case,
> >> so the flag question is still open.
> >>
> >> Holding a bio back reorders it against bios submitted later, which breaks
> >> sequential write ordering on zoned devices.
> >>
> >> Patch 1 is a prep cleanup.  It moves the rejection of an unknown status
> >> tag into the parser, because patch 2 makes a rule without a status valid.
> >>
> >> Tested in a VM.
> >>
> >> v1: https://lore.kernel.org/linux-block/20260827000115.128093-1-haris.iqbal@linux.dev/
> >> v2: https://lore.kernel.org/linux-block/20260830012002.80275-1-haris.iqbal@linux.dev/
> >>
> >> Changes since v2:
> >>
> >>   - Patch 1: return bool, rewrite the commit message.
> >>
> >>   - Patch 2: drop __submit_bio_noacct_nocheck(); the flag alone stops the
> >>     rules being applied again.  Log the error when a delayed bio is failed.
> >>
> >>   - Patch 3: trim the documentation.
> >>
> >> Changes since v1:
> >>
> >>   - Add the BIO_ERROR_INJECTED bio flag.  v1 only resubmitted a delayed bio
> >>     below the injection hook, which left the remainder of a split going
> >>     through the hook and matching the same rule again, so a bio was held
> >>     once per split instead of once.
> >>
> >>   - Patch 1: tag_to_blk_status() returns an error and passes the status back
> >>     through a pointer, instead of returning BLK_STS_OK for both the "OK" tag
> >>     and an unknown one.  A delay-only rule has no status, so the two have to
> >>     be told apart.
> >>
> >>   - Documentation: a delayed bio is held once rather than once per split.
> >>
> >> Md Haris Iqbal (3):
> >>    block: Reject unknown status tags in error injection rules
> >>    block: allow error injection rules to delay bios
> >>    Documentation: block: document error injection delay feature
> >>
> >>   Documentation/block/error-injection.rst |  39 +++++-
> >>   block/blk-core.c                        |  14 +-
> >>   block/blk.h                             |   2 +-
> >>   block/error-injection.c                 | 167 +++++++++++++++++++++---
> >>   block/error-injection.h                 |   1 +
> >>   include/linux/blk_types.h               |   1 +
> >>   6 files changed, 192 insertions(+), 32 deletions(-)
> >>
> >> -- 
> >> 2.53.0
> >>
> 
