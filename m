Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB64AA030
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401629; cv=none; b=NvRATZEWPrBm2VecEkhvj2cBTRDtP12c6dzddA3lR/Ez+m5C1GGDmNMFMEPmcFxteVwI6uYgJY+RVtqQofuoiMlFYA05oLWE7hXG9pG7tk+VmwRYYb4naOynr0UDHkKcbIscloFH2RIwgthAheS9m07DyIeguJ7FI+dbH5G7kiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401629; c=relaxed/simple;
	bh=23uLVGVu4LenPJTiUbtiHkyS7W5/ZO7Ic3YJWLzrJ8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FtPylIdCekc0M2cXDTS7S7MFxEwrirBTL4JEc6wAwY/jXworKjuzaD67SqdsBST+yHobmdgG+cHXUafgm4VwGSfEsjBPlBn5YvjmAlHMfzRZ1wvW57Wj2CrkZ6vRbunOwEYLFrOxeBiUXa61yuTVNXWuFzJwIGOcMP7nwpeWjXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=YkAQvvIu; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="YkAQvvIu"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c45551fa84eso18248266b.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792401625; x=1793006425; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rCnbEw2lvBYbntrA6KDS3EO6vufdqSnBrzMmqli8drs=;
        b=YkAQvvIuHuowSee2x3VLY7CfVobYt77NsPUM3HIsxQ///kzMSqrSD12p2MrYnfCP4+
         dmPvKSy/aEAnG7LcnZDQ28BRTliLTVT6V0BefFCBQAL7Xe0ydWI7Nyg+z6SnjSSD6GnR
         37VqCbD8afiqNGMMkLSv0qu2/nveqKtAWPWjah1dWrAZhbSd105mAz+mUPAch5CwFn8D
         azULWHO7AsryJ6TeTa0OdyBb5r6dluUSfaa7m/+nCoviOzIUy9EOelYtWnXYfyR5H+1S
         HUEyumbSmBcGUSRNs9l0dvzCeZ+C126RKbgWytgm3YoYDodC//4wDFGix5cOQm4sLbuc
         3Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401625; x=1793006425;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rCnbEw2lvBYbntrA6KDS3EO6vufdqSnBrzMmqli8drs=;
        b=Pgcz4XeQGJgcolzIK355mtXT+2ABUgubu21379ZzfrJUkSIIfG9Yt304Ty2g9EFW9z
         60ypOHL/18au54aRh950AHyvVMcp3SaCr5MEEfhLTlKiXNIhIVEy7a8VNS19JrDzwAis
         W6HQ7gAcihOLd89N4no/LQtmoa2oafdFgmAtR6rVp5qsE6+gZecMXj1aLEPJHXldRcPl
         b3J9GxKx6FSL8jHw4gpz30lkAWCEy8UgS/cSI+KYKy5FFiaDzVnbG6WzO+TtRMrJ2hhq
         iMn7OZBRlkd9/by+UrCYhdP1+JdZkGcoZHfJ9cQYG2IRdZ/4hkS+BgMWocrwpWeJ8NWl
         hvaw==
X-Forwarded-Encrypted: i=1; AKwUvBycIkPQYRGdSTxs3Fy8op2119vLWhaAcRq8rb5nEkSaXvQ0z35iVsnuiQVKsKZ6cnesLNrrM5fQ8sc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/6/nuIJYmiscURgqp7lL6HdTy1kj+t4BpZLAdiI87qW+ClzAE
	WDkaEaQZpRLhErzXK5u0LJEcUOd0ZIWKLiz0rRQuHSdtCsma7TNz9VEEJS2bzpwIVJI=
X-Gm-Gg: AYBFou3D1QfqK4D1Qgu9Ao0VRnzBuz2zz0nyv8g61DskmNF0vHOZ6vJqVKpP40ZUCB4
	Nw5ct1k+BrH7lf+CiSJNyekTp04H29yPUj27Ig00pkoX+o7FFyOx80rIQ6zysu+J6bTDVclpvJF
	EM1WMlGhFu2xhV5ndfDect5ww9x96UKxy9D2ZRyyVuVAiSa8YC/bLaf06SC7+zJ0/nGmu+HqO0S
	UZM+olBDJsPDlSGtNGLk3Uc9uZan0A3VYUWosLwqzozLTbeJYkL741pONdwFD+xoUSiTu6uEAm8
	urjq4SWj6BKfW3UAsIXULg1Z73lelyMTL0HXdL/8Bh3i14M6p2hQhQBgO9vflNFsimCImOVbFPn
	tRFYK2zopJAlVIW5/CvHXMGxfcKJ2VXM8ShbmrFakFY+nho5TPxgsGv3aZPQ3Xbw9U6WunUCI8d
	Vm9NhTbqVY4EpQNOKdo7xCt3cWK1OhsA6uFx/uTI9PwpEeUavE/dZ21xPDB3MG
X-Received: by 2002:a17:906:ba89:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c4196dac03amr433604866b.0.1792401625664;
        Mon, 19 Oct 2026 02:20:25 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:5067:2dc::49:220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm342196266b.61.2026.10.19.02.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:20:25 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>,  netdev@vger.kernel.org,
  davem@davemloft.net,  edumazet@kernel.org,  kuba@kernel.org,
  pabeni@redhat.com,  ncardwell@google.com,  bpf@vger.kernel.org,
  ast@kernel.org,  daniel@iogearbox.net,  andrii@kernel.org,
  eddyz87@gmail.com,  memxor@gmail.com,  linux-doc@vger.kernel.org,
  corbet@lwn.net,  linux-kselftest@vger.kernel.org,  shuah@kernel.org,
  linux-kernel@vger.kernel.org,  kernel-team@cloudflare.com
Subject: Re: [RFC PATCH net-next 0/4] tcp: carry a BPF-chosen identifier in
 TSval low bits
In-Reply-To: <atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com> (Stanislav
	Fomichev's message of "Thu, 15 Oct 2026 14:45:02 -0700")
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
	<atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 19 Oct 2026 11:20:24 +0200
Message-ID: <87a4oaf3mv.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hey Stan,

On Thu, Oct 15, 2026 at 02:45 PM -07, Stanislav Fomichev wrote:
> On 10/13, Willem Ferguson wrote:

[...]

>> Questions for reviewers:
>> 
>>  1. Is encoding an identifier in the low bits of TSval acceptable in
>>     principle, given the trade-offs above?
>>  2. If so, what feedback do you have on the implementation?
>
> Don't see any feedback yet, so from the top of my head: looks like you
> control two sides of the communication, so why not a custom (bpf) tcp option?
> Would you need that on every packet and it makes it expensive?
>
> Or any other field you can abuse maybe? IPv6 Flow label?

Nah, we don't control the client unfortunately.

Client here is any device that connects to our edge PoP.

> Implementation-wise, the sock_ops is going away in favor of bpf_tcp_ops,
> so BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG is a no go.

Yeah, we have just recently realized [1].

Thanks for feedback.

[1] https://lore.kernel.org/all/877bjk893u.fsf@cloudflare.com/


