Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF714A85
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 21:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFwVoMog"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961F610C0
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 14:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698096583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1k2Vg92RJrxv+gYLNepXp/tJyAR04nx8wa9wG6p0is=;
	b=CFwVoMogzV4Qz4YmSsv9H4cpP+52uNeTiojOyzZsya3cH/yZZszOaVTLguoFbbti0k3hoH
	N88ayd0tDntQqMryR2zyhAEuf9gJ/MO9NSZSe4I8xSotP/BFZGuBm5kQVGL51y7Ht4Nhok
	lkn5/eK7V724T7LWxcELX0kC++QG7uo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-CXcMjla2NwicfzPwKZLX5w-1; Mon, 23 Oct 2023 17:29:41 -0400
X-MC-Unique: CXcMjla2NwicfzPwKZLX5w-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5df65f9f4so23179595e9.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 14:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698096580; x=1698701380;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1k2Vg92RJrxv+gYLNepXp/tJyAR04nx8wa9wG6p0is=;
        b=qA/xN7k9+9VbW2Oon+Jb0YBSpDblyipPaMYWDnB/RmfCl7PJsO9KVoNaaao2BAfME7
         badt5gQRChDIPl2Cic1XGHcLpPutF4h8GiNCOAPLVGQ8G4Lap0910Emqz3TUl9jg79pb
         KmJlbd1Gl+6LdFhLwOXz7cPqu4eItpSa23vxDMmyX5xRuiO/pCqEIm4XFwGIVptDRg7Q
         jh0c1wEMBDs/samGZM3H8Nc1G79HozwCTG/1U9KERNEjZO0Ti84ghzFdmGd0u6t88DAQ
         vGWnyyCL3JP1w8SDntytJd79gwAOoO4FXnIJaNWl9SGwnqY96DlxRJRz8tLP9nFY0kEn
         Tasw==
X-Gm-Message-State: AOJu0YwYVxgHGBrGI1XYmojua0VBsh667obVgzdN5Tge//1bEBqQA9DH
	nruE3rfK3hvW4V4e9ux/bpWj4akCFVm8weMfbUBdg3CCvPW4kVM23fYn9nExWd94TaW2uh0W5oD
	MejwvCqULQ9rOtkG3HwXa
X-Received: by 2002:a05:600c:45ca:b0:408:575e:f24f with SMTP id s10-20020a05600c45ca00b00408575ef24fmr5647874wmo.28.1698096580662;
        Mon, 23 Oct 2023 14:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwIqmyWxHtLCEV9sJcM7Mm48Qpb+Y1PSoNkRJSeRh4CaGlNviwDWwltxau6u5GNETKD69b9g==
X-Received: by 2002:a05:600c:45ca:b0:408:575e:f24f with SMTP id s10-20020a05600c45ca00b00408575ef24fmr5647840wmo.28.1698096580275;
        Mon, 23 Oct 2023 14:29:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e7-20020a05600c218700b00407efbc4361sm14963606wme.9.2023.10.23.14.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:29:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org
Cc: zackr@vmware.com, contact@emersion.fr, linux-doc@vger.kernel.org,
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
Subject: Re: [PATCH v6 9/9] drm: Introduce documentation for hotspot properties
In-Reply-To: <20231023074613.41327-10-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <20231023074613.41327-10-aesteve@redhat.com>
Date: Mon, 23 Oct 2023 23:29:39 +0200
Message-ID: <87h6mh10zg.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Albert Esteve <aesteve@redhat.com> writes:

> From: Michael Banack <banackm@vmware.com>
>
> To clarify the intent and reasoning behind the hotspot properties
> introduce userspace documentation that goes over cursor handling
> in para-virtualized environments.
>
> The documentation is generic enough to not special case for any
> specific hypervisor and should apply equally to all.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>

The author is Michael Banack but it's missing a SoB from them.
I don't think there's a need to resend for this, can be added
when applying. But either Michael or Zack should confirm that
is the correct thing to do for this patch.

The doc itself looks great to me and it clarifies a lot about
cursor hotspots.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

