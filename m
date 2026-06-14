Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E15430BF4E
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781478661; cv=pass; b=UJV0OdPHBXu0jJOWPMRFK6JJsyZSxPrQjpQIMlYLhfOGkIWAo3bBIOSxGJ6zDfvnAiNoWo9m0uCRaOT3n4sC/xXKILzy2pbbqO50xZ3ieSk+0nYAYox7V0SAcbylZYp/qIJJ4JqLdelPZ6LMO7yETy/yYepCAFy1aE8biSPdaGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781478661; c=relaxed/simple;
	bh=rjVDYWZQNGoDR3AfOz9WNdT9V1VkyrqPMS3E9BtwqeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDk1QQEMEmTOms/qPNVC5GiWrynBfZ40qY8DzrwXPfyxeIF9cIc12WZI3pH7CwMNhkYo2jpUWYWimE4RDUg5tfdlZ6c0ZCtzv1Ei2IIWDCIhULNT0YmjF+0EIOvZjjTFqjuiE349OSoDmGjhHj/HXNFAjxJnA1vW0UBCA5f5S+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/rQ9WUn; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/rQ9WUn"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7dbcb505578so26104977b3.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781478659; cv=none;
        d=google.com; s=arc-20240605;
        b=AiriFLJkrkaC1TSmvpxbPbQNpgEzLUI6YPy9pO2mi3S/FkICPBUOt7mupkxe0zeA7+
         rXlcGqL4KM9J1A+jXoKnnDzb2V5I+AT0r+9q6En864XGkgw2r/3TO/Kjk+y3Qqg5g3cA
         3nZ6S/ejEs65DHW5DkwxfkP9dQWK6DYwyScrtefKyA9iE1g2SUM4XAHDCxX/KFzUbRKd
         ejKVyxgyYsm4NpAwSJ1RZW5IluTx4PStvJA62RZdRHoaJMuRWaU01AOJL4rcUFPQ5UnK
         Ae5F53pguT0ZQRGoGYU1n7+h9VTwkV+LzrtFZD1T+s1rwVOFWoHhEOozGSqrsCt5Ylb4
         SrIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rjVDYWZQNGoDR3AfOz9WNdT9V1VkyrqPMS3E9BtwqeI=;
        fh=4Y07Yvmnrlob57hNw3Xhx9dhlZtJGTQh0HBFoJRLo08=;
        b=eGVg54Jj/ktz//AIz+swcI9b9R9okhu7xXf2rMjwK+HUXCzmvvNEvnRgJz3rK8M+3v
         Faf/hR1Auv7GUkyBDyyQqSoFG2lQIwsPKkfnlCEr4S3LIf2rexPadxvmQcbbzy/48S5J
         zAWiqq9geg8wva24o5M05S6QHDw/UegWfw0mMSYs87b4C9i3AFbM4IJ4KlKOZlZLj1TZ
         U5wzAyrDOiGdOttIbsHHftATc5o3L2582pvO+/k3fKpJuYI4/IulZl+Xx9lUGbQ6VX2W
         IGlUGmo0YHO1Sr8Ax2PselHaKTC1DBsHfD2EQRtKO8SvK6Q0fRWPNRCSOjGdn9JVGY86
         5syw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781478659; x=1782083459; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjVDYWZQNGoDR3AfOz9WNdT9V1VkyrqPMS3E9BtwqeI=;
        b=Y/rQ9WUnSnRTgnKvIho+BP6VlLmMvQjPMm2L1zRnnSt61zarLhZgCCrippOwoPaJZL
         BGXRYiKduA9nKpb60aYCFcUTC8+UEwrmmHe9mwoEMqpxv/gm1lKiRet29nOGs2cUB63c
         4baP8oFhn5YjQaeGT4x4lOskt/mvh3xgf92q/mrXhUX/IbPqM4MqfuzCu6MaASwC10uz
         PAAwa9VZ3swFVW9R4GN/NsSc8Ba6gvrZR4cmE88JWLADMBIao/e6P9TiUdYriSMLfXuT
         vtrS9NxAXsOxvPjVX1YclDa+kflPiY4BMT40I7E7XkrFe2zLGFo789dqJsXiB2jZYs7o
         7Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781478659; x=1782083459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjVDYWZQNGoDR3AfOz9WNdT9V1VkyrqPMS3E9BtwqeI=;
        b=b/vqFMDoY0bugiYeR1CU7OiEZiMw67G3Tfec22v5Ef4nnsqQ17kmrocTW34eF+kdd5
         2HLFzfR9BbtfT9cRihSxRPfhHBEjZly1ncwFlqz4069mW7wALSUqphnKw72aGwiuT9kk
         5uSAWztsOqxvHZjqC4NBJv2CqLzFmNEk0/Bl/DPYaDSMiyCtTiMczBVX+0gCy8sI5Hyg
         Z1j4ehLBbwzqs2hf2evDgsmLrXcExzOsz19tXrU/yeNovoUHQdaBPEZxZ3LbLJkHbry8
         H/SBqnkYDTUsy/SQY5w8ZnCwPBLcXPfjrESHbHA7AXETIOciJw2NrUo0hgFXyYgdDvjx
         t6Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9OC90uWL+R36ctQf3428w5feL1VBXbakv6aYota87psZ1i9rP5nFOWGxIkpZNsNScD0oQnhNHZ1AU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQuI6rXnZjBeuRO7OcPWnUIzHz25/7/z+MTfIVYhR5eexFh5GC
	DYkASDia/PdbrxXKzUZf+5/EJB8ZR877QTpWy9yF6of3DoHxtD/J1FOp78xDJyrA6Lu7WlFQGqB
	rKScTN5jFV7wFQ7Lga2R+u4nOLdCaMbk=
X-Gm-Gg: Acq92OFFIwIhUo2gH/CGVI4X5v9U/uRWeYvnjY/B+oc0Te4Aq6kN8YeqD9C7R9CBpba
	0Cau5rN/NDu1PtX3WgkHcHlCuOwSAgZXCU/+8UekKPNVwnJTTvPz1dAtyVM+Vv3KTwYmi6bVdfF
	9wN47plqlDndiJxqBVyPLG4HnJFu00xy8TTODcLRiS3K1GM68pq007ATFy5etORpALn79mJsQCi
	01RcMd/mgQCEitaTVVHzR4Wu1LTjoHjCOIo8vrfipuC6fAP3/CygDJXQTF+I3CaY4AHj1hbY9RP
	znT+Sd1uwglXj1cGdIJNjiJJb/O3f0CUUiyyHQox2MDlCFqlEJji5qqkzJoLuNGaDuFmybrlzV2
	NsRgs4A==
X-Received: by 2002:a05:690c:b01:b0:7bd:9566:ef0c with SMTP id
 00721157ae682-7f7b862e78fmr119687847b3.26.1781478659551; Sun, 14 Jun 2026
 16:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
 <20260607234343.22109-3-kimjinseob88@gmail.com> <20260614185914.6c14d376@jic23-huawei>
In-Reply-To: <20260614185914.6c14d376@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Mon, 15 Jun 2026 08:10:47 +0900
X-Gm-Features: AVVi8Cdqkxn_jwr_B4sti63s0G3x0_uMazWV8Jxn18jsY8E46VaGjxB-zdDsBH4
Message-ID: <CALMSewJgdzLbX0KYX5QjwOKce_+o8B6jhz0jh7x7PKTRTd0JUQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/6] Documentation: iio: add Open Sensor Fusion
 driver overview
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Same issue on needing this series to be against a suitable
> tree, not on top of your previous version.

Understood, thanks.

I will regenerate the next revision as a full standalone series against a
clean upstream base, not on top of the previous version.

I will also check the final diffstat before sending so files from earlier
versions are not removed, and fold the MAINTAINERS cleanup into the correct
patch.

Thanks,

Jinseob
