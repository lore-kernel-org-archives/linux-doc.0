Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zid15TOM"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03600120
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 23:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700120779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LD5mFa7Ljzodyl4DGNnE3tN04HrOGXS/NNuwBDagln8=;
	b=Zid15TOMC+cBvGr10gBGkotPix/ciruvxBNqe05kXbMxbaHeT2LH15QRsVik+x9LUFJt6P
	nK/Mv41CsBd53PLu429+Aiuu8Cgu7kBaBatOMfvzU0D2Y2w6rautRJB1O2rIqVnC0cAQvk
	cb2M9TZJESOD74zvqeSotjrZnPpajTs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-7ELG10QYOhmXfrtoWSdfvg-1; Thu, 16 Nov 2023 02:46:17 -0500
X-MC-Unique: 7ELG10QYOhmXfrtoWSdfvg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-407da05ee50so2878245e9.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 23:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120776; x=1700725576;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LD5mFa7Ljzodyl4DGNnE3tN04HrOGXS/NNuwBDagln8=;
        b=k0HWlwJmQ3uYb3ktLpTBubi8oAbAN0Fbu3OLHgCV+HwbPHI7hkInO9hwzs2+xYs1yK
         01qtjK6XBzC9Qbs7+FUOA0LTBmqT6gwez+pSKI8uzCGZSSPuo5eXWf66KgRSyk+CAuAr
         Cq9Di66RS/7BwPMWJl401Jnkp5zeotSBeB5Yrvm92cfYlCrIhxSXACnAjKQvGlppCRLM
         EXBVFvGiBjKMCIJUub/w7nf8Q4B59uSRLfMHVGkmb1fD+w1qlnryIskI4sbDmb6cEBlc
         K0odZT8eEhcqqeCZpjGI8m3DZSMJcv9SlJAi0QMA6rNNfkCrQ/SO1LI/gEx6qzSNb2Cz
         swXQ==
X-Gm-Message-State: AOJu0YxagoEl71iTrkH71zsxO48QQm+KUVjpG9HH7GWUGAgidYQzARyj
	MEV8iBTJdiGJTSI77LQDbu/6GSh1O6uqQq6ve92/0AELcszh5XOthVP9L5jvSNfxkPA8Dr+Tk4Q
	CylqomYCwEMozX8JHFTgH
X-Received: by 2002:a05:600c:1d93:b0:406:3977:eccd with SMTP id p19-20020a05600c1d9300b004063977eccdmr11516333wms.33.1700120776416;
        Wed, 15 Nov 2023 23:46:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNCg5qd5AbZ0tYK0uFvI/J3tJ++zfJ/l5opv0/UGjSHKkjb6Zp4IdC4i38tjSPgJYq49xhdQ==
X-Received: by 2002:a05:600c:1d93:b0:406:3977:eccd with SMTP id p19-20020a05600c1d9300b004063977eccdmr11516314wms.33.1700120776005;
        Wed, 15 Nov 2023 23:46:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c4f4700b0040772138bb7sm2455636wmq.2.2023.11.15.23.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:46:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "olvaffe@gmail.com"
 <olvaffe@gmail.com>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "nunes.erico@gmail.com" <nunes.erico@gmail.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "pekka.paalanen@collabora.com"
 <pekka.paalanen@collabora.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "belmouss@redhat.com" <belmouss@redhat.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "airlied@gmail.com" <airlied@gmail.com>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "contact@emersion.fr"
 <contact@emersion.fr>
Subject: Re: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer
 damage
In-Reply-To: <a16a61582f90a5b490fb7681b44864a4801c830a.camel@vmware.com>
References: <20231115131549.2191589-1-javierm@redhat.com>
 <a16a61582f90a5b490fb7681b44864a4801c830a.camel@vmware.com>
Date: Thu, 16 Nov 2023 08:46:14 +0100
Message-ID: <87o7fu5eex.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Zack Rusin <zackr@vmware.com> writes:

Hello Zack,

> On Wed, 2023-11-15 at 14:15 +0100, Javier Martinez Canillas wrote:

[...]

>>
>> Changes in v2:
>> - Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
>>   .atomic_check, instead of having different helpers (Thomas Zimmermann).
>> - Set struct drm_plane_state .ignore_damage_clips in virtio-gpu plane's
>>   .atomic_check instead of using a different helpers (Thomas Zimmermann).
>> - Set struct drm_plane_state .ignore_damage_clips in vmwgfx plane's
>>   .atomic_check instead of using a different helpers (Thomas Zimmermann).
>
> The series looks good to me, thanks for tackling this. I'm surprised that we don't

Thanks. Can I get your r-b or a-b ?

> have any IGT tests for this. Seems like it shouldn't be too hard to test it in a
> generic way with just a couple of dumb buffers.
>

Yes, I haven't looked at it but also think that shouldn't be that hard.

> z

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

