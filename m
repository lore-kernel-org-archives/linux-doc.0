Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2LLAbXe"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C3D1FCC
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 06:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700836964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a/pi8w6/WijyPjt6aPj0xPcMBW60wKYF9Ml5rCWYt0U=;
	b=h2LLAbXeHERM/hlDr4W3epi5xBTlNWRFDlI4GWenKk29u8Hcjx21efUj/KqEXWtHOZ2taO
	FhMntyc3mzJ4dZRXZgYIFdx2fvOPM6itDPzJgHzTk1C3iFYJvT4mNa+Mhu5PK2NBZ3U25M
	yG4QOwsBPExxdXTxN3RHYVG5NlPrscY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-OpV7h18ePMqSFE7YJIuCPQ-1; Fri, 24 Nov 2023 09:42:42 -0500
X-MC-Unique: OpV7h18ePMqSFE7YJIuCPQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-332e18f4fdbso782759f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 06:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836961; x=1701441761;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/pi8w6/WijyPjt6aPj0xPcMBW60wKYF9Ml5rCWYt0U=;
        b=vilx9+TatzwVFSxNBM4UCe4qViYot4HAHmNRk2bmyPfW2Br5SHlPRhANuweGFVQaGt
         9t4CeHbKPAfIXcXC129iKLub6TjGUaLpDNOBOAz31uG+V+jop3l5QgnzTE2h4c1mG+jr
         HGFp8yELVpmbAUYmeFi4DrplpqRwoRXxkRn9lot72fobwRsteXRctuwOLULKrBBgkiYx
         U4srEZ5wsqvlemBvCwAzkFRbH/yAOEtJnc2ZnsyyH8sGI0MHQSm7woK7vyhG8i1dxSDj
         qix9jMFwmUOCSPg9HN4r9Z99FoF8+7SQEjCBOzQYD2XMRowr5DIhg1FCtWpelIJ5L1cu
         tkdQ==
X-Gm-Message-State: AOJu0YxnGV1Zg4k/GHhqf6esV4qaWtgIwm3jB8xKfeQHXaxqkdxBIau2
	xnvBpYhZaRGixixudstXJbJRTjzuzeXAQ5mgzLGfQV9ZGOuDqky081Qb3Mi28u6ZdzTPxPpXKkN
	W3Ji4jkn4cMXKRx8REYAA
X-Received: by 2002:a5d:66d1:0:b0:331:3c1f:b94b with SMTP id k17-20020a5d66d1000000b003313c1fb94bmr2312261wrw.6.1700836961489;
        Fri, 24 Nov 2023 06:42:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb9V9v8SZQGN7fIWFWH3GRjooaAzuc2Aw0JD0xHBxjeAnsUuYv6FgvkSaM+Z/yReNVL78ccQ==
X-Received: by 2002:a5d:66d1:0:b0:331:3c1f:b94b with SMTP id k17-20020a5d66d1000000b003313c1fb94bmr2312234wrw.6.1700836961142;
        Fri, 24 Nov 2023 06:42:41 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020a5d6581000000b00331a55d3875sm4455226wru.38.2023.11.24.06.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:42:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Zack Rusin <zackr@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Simon Ser <contact@emersion.fr>, Erico Nunes <nunes.erico@gmail.com>, Sima
 Vetter <daniel.vetter@ffwll.ch>, Chia-I Wu <olvaffe@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, VMware Graphics Reviewers
 <linux-graphics-maintainer@vmware.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v4 0/5] drm: Allow the damage helpers to handle buffer
 damage
In-Reply-To: <20231123221315.3579454-1-javierm@redhat.com>
References: <20231123221315.3579454-1-javierm@redhat.com>
Date: Fri, 24 Nov 2023 15:42:40 +0100
Message-ID: <87edgfcivz.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Hello,
>
> This series is to fix an issue that surfaced after damage clipping was
> enabled for the virtio-gpu by commit 01f05940a9a7 ("drm/virtio: Enable
> fb damage clips property for the primary plane").
>
> After that change, flickering artifacts was reported to be present with
> both weston and wlroots wayland compositors when running in a virtual
> machine. The cause was identified by Sima Vetter, who pointed out that
> virtio-gpu does per-buffer uploads and for this reason it needs to do
> a buffer damage handling, instead of frame damage handling.
>
> Their suggestion was to extend the damage helpers to cover that case
> and given that there's isn't a buffer damage accumulation algorithm
> (e.g: buffer age), just do a full plane update if the framebuffer that
> is attached to a plane changed since the last plane update (page-flip).
>
> It is a v4 that addresses issues pointed out by Sima Vetter in v3:
>
> https://lists.freedesktop.org/archives/dri-devel/2023-November/431409.html
>
> Patch #1 adds a ignore_damage_clips field to struct drm_plane_state to be
> set by drivers that want the damage helpers to ignore the damage clips.
>
> Patch #2 fixes the virtio-gpu damage handling logic by asking the damage
> helper to ignore the damage clips if the framebuffer attached to a plane
> has changed since the last page-flip.
>
> Patch #3 does the same but for the vmwgfx driver that also needs to handle
> buffer damage and should have the same issue (although I haven't tested it
> due not having a VMWare setup).
>
> Patch #4 adds to the KMS damage tracking kernel-doc some paragraphs about
> damage tracking types and references to links that explain frame damage vs
> buffer damage.
>
> Finally patch #5 adds an item to the DRM todo, about the need to implement
> some buffer damage accumulation algorithm instead of just doing full plane
> updates in this case.
>
> Because commit 01f05940a9a7 landed in v6.4, the first 2 patches are marked
> as Fixes and Cc stable.
>
> I've tested this on a VM with weston, was able to reproduce the issue
> reported and the patches did fix the problem.
>
> Best regards,
> Javier
>
> Changes in v4:
> - Refer in ignore_damage_clips kernel-doc to "Damage Tracking Properties"
>   KMS documentation section (Sima Vetter).
> - Add another paragraph to "Damage Tracking Properties" section to mention
>   the fields that drivers with per-buffer upload target should check to set
>   drm_plane_state.ignore_damage_clips (Sima Vetter).
> - Reference the &drm_plane_state.ignore_damage_clips and the damage helpers
>   in the buffer damage TODO entry (Sima Vetter).
>
> Changes in v3:
> - Fix typo in the kernel-doc (Simon Ser).
> - Add a paragraph explaining what the problem in the kernel is and
>   make it clear that the refeference documents are related to how
>   user-space handles this case (Thomas Zimmermann).
>
> Changes in v2:
> - Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
>   .atomic_check, instead of having different helpers (Thomas Zimmermann).
> - Set struct drm_plane_state .ignore_damage_clips in virtio-gpu plane's
>   .atomic_check instead of using a different helpers (Thomas Zimmermann).
> - Set struct drm_plane_state .ignore_damage_clips in vmwgfx plane's
>   .atomic_check instead of using a different helpers (Thomas Zimmermann).
>
> Javier Martinez Canillas (5):
>   drm: Allow drivers to indicate the damage helpers to ignore damage
>     clips
>   drm/virtio: Disable damage clipping if FB changed since last page-flip
>   drm/vmwgfx: Disable damage clipping if FB changed since last page-flip
>   drm/plane: Extend damage tracking kernel-doc
>   drm/todo: Add entry about implementing buffer age for damage tracking
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

