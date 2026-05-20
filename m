Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1872D7DC4
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284357; cv=none; b=c9c14yDhSXzr0LhEkwlxEgI11+GLDGCFIrdMp2hGb9dBTI7/DlBW/RhKumyQ0Pz1RIaO9tFUEpUg6TS3KnjTsbS6bfud4WMRF2fs2aeKa4keGCSIJv7+TttECoDiOomsib62D8ILp6lES9V7cI2fDhh1rzoS3vXzalDLDqzwlBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284357; c=relaxed/simple;
	bh=oaFdq8z1elXJ2kvvKaYfJ7RYMi53L4i1xZbiNUaix60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ3sgxecRwSbJkUcTqgOYg00a6URfYIV+16qMROdiFy7POx34Pkpd5368Vwl18CGcd2O2sKpNJTvqmkMU5dv8KebEzpZ3ucvFMRe7HFvt2EwvkkdDoGEAvpinxspa6zmO/t4xE/XXtDU/xIOnnPOd0vNMnsZgYIoND8wNvAIB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcA1+J23; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcA1+J23"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-303f2fb7225so3040359eec.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284356; x=1779889156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=;
        b=LcA1+J23VlhZIvCQK/z/UPJhLlLioKWNlYnB0G8F/sOzOvAE5gZyNeQrPHBQEDJGbN
         Kd5DaUcfnVSUvehSXP+qWmfLz2C0Krom4oFIzxJGXDeIpp0PRM8PwZ6Ym/wFwQBzycYd
         Pbwt1RXpGNj95YSbr8jh93T8KLDhfdhsU91HGiRmQY6oIR89y7clxLKm/Y1v1HmjUyhj
         QA7yw5FUW5kVVc4+zlRYX4ZQDHf+nVkJfnVO0Zlf/T9InwoGGl+4RX9t4BKZqRkDyGH4
         /8JyDbXPXWAosHeUANAx6xvzrKYN8RLDOhqpymdciQZjCOmwepfYkI+ra+yxlAirvM3Q
         tPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284356; x=1779889156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=;
        b=LYAZ+bTSECasxUdzbuZzcvKNAsw3OXtl9a8rqYBZT2HVF4/O+MorZQU2KVjWhvMIdh
         AHOGyxshvAxb0a+q9QNZ1BVjX1XcsYXQkd5kqWFRU1rEKneJ6l04pzmd9Vl2sNKKFaNY
         Lxw6g1uhA4iy480o6FyaDyCbmXhRSjmbBEjjUqucbTL+ZCyxsML0wKzsV9hKj/Ujuuy0
         MXcGtYJhRVOBX/rQ3t8DBYa2Sq1WE/3UwrC0z8pggdHlwCaHcyvAVFEBRLrIXjZx/TjF
         wtdX6VP6KlHdaXTKhh1JN3zVCwe1nF5/Uzp5In9fB1bWzctj/7EYozbmPezAqlUW3Sa0
         FP3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/sD5+NLMi2vKEcGRttOTokI227vEP4y1BO3VVc5P4lB8Ax2vXClbxY90H0TN6TKVUiVv6bm6MbiNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIcrV1xdJXMeeRpUwWm08KGA10a6xNKMsT0dD1BiPmNYy+fLHQ
	nZ95tmW9wIiuuZ8w8qwtLcMWIgmWF7BsBI/3tIBL7zeKWGDchM0Ei0yG
X-Gm-Gg: Acq92OHmw09wKwlGe8bIV6f0DwgIyCBDh7ctJYXDyR1b3QrtarL2hu1ifBB/s3qtSEe
	G9FtUPWPKyHZJvZWTjzPt9yva41rdxTS9lEA1X4FPSGYhTrSWhYnthHIJDwuZY1UiTWtKOSd4oD
	Bm4mBLuyKdIUAH7C4UnPeU5g0oea3D6p90E8vCB7/OImxk4/HKGXdOF65pGi3D8bkv1kfwlHUBK
	oz+JDtiK2XnrjfnHN0zJbeZJbAH/orMBxUOZnzSwJKCdZwsL1S3E5tJx8BPjHaQY5MvJPFPjSPD
	PlfRtgEIZ+OTnsgG+g6o4Yh0muTUSXD481JN3GPkVz4Txuk3A8Y1p9VAhTVHGDqx7lqQGff5a03
	FwZ5Ty4AaoXLLGIykSq7i2yPM7N1wLRfxZi86rlQDOFVkY3053l6cbLvUwPPn3ouF2zE9AI6gny
	dCo/fdrWvSsGfQUHn0tcCOFEOF8BSq6xPz5fCw
X-Received: by 2002:a05:7300:a907:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-3039818eec3mr9988056eec.2.1779284355819;
        Wed, 20 May 2026 06:39:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978ad18asm18456851eec.26.2026.05.20.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:39:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 06:39:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: raspberrypi: Fix delayed-work teardown race
Message-ID: <f1b970b8-1785-4f96-ac79-d3bb79c53101@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-4-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-4-chakrabortyshubham66@gmail.com>

On Sun, May 17, 2026 at 01:34:45PM +0530, Shubham Chakraborty wrote:
> The delayed polling work rearms itself from the work function, so use
> explicit delayed-work setup and cleanup instead of
> devm_delayed_work_autocancel().
> 
> Initialize the delayed work with INIT_DELAYED_WORK() and register a
> devres cleanup action that calls disable_delayed_work_sync() during
> teardown.
> 
> This addresses the concern raised during review about the polling work
> being able to requeue itself while the driver is being removed.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied.

Thanks,
Guenter
