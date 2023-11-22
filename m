Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgKniuUK"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC10AD40
	for <linux-doc@vger.kernel.org>; Wed, 22 Nov 2023 04:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700657399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t7CwGgnA5jX9Ulr8vRs5/VIijolfgnKW6FNaANq6NMw=;
	b=LgKniuUK1qMEE26G4bb+UQyvZWVjzjQ+6Ao9XZrVnihGm44Tryt2u1WSXRSRTtBDGWf9Wm
	cFAV6kWmJPbehkpjIdm5joNSQaTNz2jTc4HklDFbvzKCA0eD2Iq2IjgdbghgGkO436hIxU
	zMBptiz0w6oa1Or9pwq6TwU11JR1+M0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-pKTBIl2VOoimuEVrSZTqfQ-1; Wed, 22 Nov 2023 07:49:58 -0500
X-MC-Unique: pKTBIl2VOoimuEVrSZTqfQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2c876d239e6so38371071fa.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Nov 2023 04:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657397; x=1701262197;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7CwGgnA5jX9Ulr8vRs5/VIijolfgnKW6FNaANq6NMw=;
        b=wWiQO8/Zsl6QY8AT9NzN43T05ZvTJA4T3Y+R5jMWuPcjIZYgYkDUAc8nnHrR+V+beQ
         WfwY7VyexlXgvqh1RMkxf6PhZa7Kow5GPazHL2ksZMuQ65NxLlITND9hLJ9ejMB0SvN+
         bH64sBaQsA/oaJ41c1dMy6YcOVgQP0L8hYXaHgq+0A5blfeMyLYy4wXTR6t2poqywM2P
         7ZRWPIVdpDV8DBdlEWsQdWF5OMedauRthtO6Esr9BrWt4Nuki5u2a/zqDIrYcmKpftjU
         g5xhDIJblQ6MvB/ZgQNL54SJ1RVjdu9k+9ZQ8k3Cx277gKYqR8x1i2FTI7/WkoQiMl7P
         TcUA==
X-Gm-Message-State: AOJu0Yw1/vqtVVp6HRRB0n7uEqyUxmzLWHB50PmjF8QLQTxzUpQ66A0R
	dE+XT/StrjOXG6MsbLzlUh0aj557bNk8y9ptm/jmmNfjViFS+5/Dd4ukiVhRanHwqMeJ8PlWxFT
	p+PavS3fObN1o/hAYHSQX
X-Received: by 2002:a2e:98c2:0:b0:2c5:2132:24f6 with SMTP id s2-20020a2e98c2000000b002c5213224f6mr1644885ljj.12.1700657397036;
        Wed, 22 Nov 2023 04:49:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjsqJ2SuGehTUxt/XdTWeav04muk69t7/+AFuoFYCMhKZg56Vp4jkvGQpcnN18Ay8LgHfnHQ==
X-Received: by 2002:a2e:98c2:0:b0:2c5:2132:24f6 with SMTP id s2-20020a2e98c2000000b002c5213224f6mr1644863ljj.12.1700657396682;
        Wed, 22 Nov 2023 04:49:56 -0800 (PST)
Received: from localhost ([90.167.94.248])
        by smtp.gmail.com with ESMTPSA id bg36-20020a05600c3ca400b0040775501256sm2103506wmb.16.2023.11.22.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:49:56 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, Simon Ser <contact@emersion.fr>
Cc: qemu-devel@nongnu.org, zackr@vmware.com, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 iforbes@vmware.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chia-I Wu <olvaffe@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, Matt Roper
 <matthew.d.roper@intel.com>, David Airlie <airlied@gmail.com>,
 banackm@vmware.com, Rob Clark <robdclark@gmail.com>, krastevm@vmware.com,
 spice-devel@lists.freedesktop.org, Gurchetan Singh
 <gurchetansingh@chromium.org>, Jonathan Corbet <corbet@lwn.net>, David
 Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, mombasawalam@vmware.com, Daniel Vetter
 <daniel@ffwll.ch>, ppaalanen@gmail.com, VMware Graphics Reviewers
 <linux-graphics-maintainer@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
In-Reply-To: <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
 <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
Date: Wed, 22 Nov 2023 13:49:55 +0100
Message-ID: <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Albert Esteve <aesteve@redhat.com> writes:

Hello,

[...]

>
>> > Mutter patch:
>> > https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>>
>> Seems like this link is same as IGT? Copy-pasta fail maybe?
>>
>>
> Ah yes, my bad, this is the correct link:
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3337

The mutter chages are already in good shape and the MR has even be
approved by a mutter developer. Any objections to merge the series ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

