Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294DF2C1B0
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PgySCaPV"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C4D121
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 10:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699985211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g+Ea5F9/sxF9OVzOjdMf3/GKiJbULr6v8M/iO5If8mA=;
	b=PgySCaPV7U6702rTpjynAX5Vykg1VSUbWo3v5PSGNsI/qx06dGHnC7anhrw92awqGGJeFH
	tlmcC9+fE8N3cXQXEby9ZCbw+3swPTatcAlmjWiqSJqDH19AU3GH9TY5QaeKSyRR5HCMYa
	dFnjI8mrHhsgUpr0mHzPCv5Jjz8mfJs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-p4HieITZM2yftJKfNaNSFA-1; Tue, 14 Nov 2023 13:06:49 -0500
X-MC-Unique: p4HieITZM2yftJKfNaNSFA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-407da05ee50so38516545e9.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 10:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699985208; x=1700590008;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+Ea5F9/sxF9OVzOjdMf3/GKiJbULr6v8M/iO5If8mA=;
        b=tvudg2khzBgaJXxrjzKh7YItCWUqyHLn3vbGciyGTMTou64DXfIia0JMAwAEHsALDs
         EGv+H/5Sl9XyxorqDoyouHVwRNRkvOms7pVg4ZZERYQC/hhNrxjgKLhjoQ9vEgPItyY1
         0g06p8OL9SHVGNC3eCwcb7Q/G4Ee0B90sCsB6DmwKRG7iPgXbBXKpUXqd2CCEoXa5FZG
         d0xxllI4a4qS7U/2hZSmY5l8Dds8+74+Ze8yqD+ggSpnuk2eDYQCAOutHwJMxE/f/Fm7
         JVwOSfPI2H1JYK7mAZnVoGbbn3ELLbRh0gcluvsH9aRCMUp0Y5g37RcKO/0ltSNe5S1L
         XgEw==
X-Gm-Message-State: AOJu0YxzLxGqBdEbSkTVB25vfvJ7COiL6xFtWOsXBZ8/zjE73L8FRaDL
	IivqSyLpkY8Lp9fytH/PX690bAOkBzRo9GWlSEng2knD7PXvfrwewMmW+bBcz6iaRlSVxAw0cc2
	2cq8qTb86KW9zz+AM7IyG
X-Received: by 2002:a05:600c:5247:b0:405:39c1:a98b with SMTP id fc7-20020a05600c524700b0040539c1a98bmr8106106wmb.20.1699985208351;
        Tue, 14 Nov 2023 10:06:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENiVmHUzsZj8Er9uv42BdyJgrcXyOCc16SNziUSzQjnDVU3jq0kl5Cj3OWEcuy37bKRTjH0g==
X-Received: by 2002:a05:600c:5247:b0:405:39c1:a98b with SMTP id fc7-20020a05600c524700b0040539c1a98bmr8106082wmb.20.1699985207946;
        Tue, 14 Nov 2023 10:06:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c4d9200b004068495910csm17570724wmp.23.2023.11.14.10.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 10:06:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>, Bilal
 Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Gurchetan Singh
 <gurchetansingh@chromium.org>, VMware Graphics Reviewers
 <linux-graphics-maintainer@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Erico Nunes
 <nunes.erico@gmail.com>
Subject: Re: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
In-Reply-To: <c28b6e4a-aea0-4de4-a194-aa1024a93476@suse.de>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
 <87wmuk5mfj.fsf@minerva.mail-host-address-is-not-set>
 <c28b6e4a-aea0-4de4-a194-aa1024a93476@suse.de>
Date: Tue, 14 Nov 2023 19:06:47 +0100
Message-ID: <87ttpo5hvs.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi

[...]

>>> And why does it flicker? Is there old data stored somewhere?
>>>
>> 
>> It flickers because the framebuffer changed and so the damage tracking
>> is not used correctly to flush the damaged areas to the backing storage.
>
> I think I got it from the links in patch 5.  In out other drivers, 
> there's a single backing storage for each plane (for example in the 
> video memory). Here, there's a backing storage for each buffer. On page

Correct, that's what I understood too.

> flips, the plane changes its backing storage.  Our GEM buffer is up to 
> date, but the respective backing storage is missing all the intermediate 
> changes.
>
> If I'm not mistaken, an entirely different solution would be to 
> implement a per-plane back storage in these drivers.
>

I believe so but I'm not sure if that's possible since the virtio-gpu spec
defines that the VM should send a VIRTIO_GPU_CMD_RESOURCE_FLUSH to the VMM
in the host to do an update and the granularity for that is a framebuffer.

For that reason the only solution (other than forcing a full plane update
like this patch-set does) is to implement tracking suppor for buffer damage.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

