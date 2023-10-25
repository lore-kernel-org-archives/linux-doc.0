Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BBF2581
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 06:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dsYwNf6M"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A437A91
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 23:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698215764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3QCkYDGehxxNqzt09gBv9p4n2vFS1oLTgsSq6IkVxVA=;
	b=dsYwNf6M7WcSA53ZGzkRMeh4A0kzl9ETfZzNY2Vg52/aFz49wuJ5l0SDK6NaklQ8xcsSvV
	5hMEuhwQa/MKTpbdh+3c5UMf02PuxHtu+QqtZLAhBjaujOL3d/qFW24hGi/gv4B+ln+NXe
	kA7PCfr+thDnqxN3Vf/9lAxtWVzgeHI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-D4RuutMfN7-CDYsF1ndUrg-1; Wed, 25 Oct 2023 02:36:02 -0400
X-MC-Unique: D4RuutMfN7-CDYsF1ndUrg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-32f5b22e806so111466f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 23:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698215761; x=1698820561;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QCkYDGehxxNqzt09gBv9p4n2vFS1oLTgsSq6IkVxVA=;
        b=JKxCmzXfJFzfYG0FhdhAy+Q3JxY7ZfXuzsYrpZxAc+9K6DLAAs50gaa8lB9p8kTVeE
         nYAB27VmPzy5dyThZuxmMoYWRnye09AHJaR+qc3U9FA3RqiLi6nif6WcQ+h3wHMWr+zm
         h/z1Uoi0+zniuhapFsNk6wPLEsaNKM6rm9I83q9E40oEv1z7Jj6abI2NYrOTb9ky6/IO
         A3vOBhssWo1t8PoNXoBX66bQrYu8+ZvN+e33OGBvJclTqPopH2wqCHNi47inQK8Lffha
         j4hU2h3k3My8OJns5MGA8d+HV6l+k9bv+Y9jTNuC/I4qi0U9KQGBEqK1adJmEq1t2iBW
         jWRA==
X-Gm-Message-State: AOJu0YwmKus6qel1r7EYV9/m5nS6GVn1RzMU2yoDbq5534NZk1w5rBtT
	lSDE32gBveSC2Kavoz5SotUPMBZuDCqfDquQxV2KCYh2he/76YAKrJqFX5tZkS2Ue2Sdwy3RLgf
	YQqzFIH+/9zpwuao8+Bvq
X-Received: by 2002:adf:f64a:0:b0:32d:a49c:dfd0 with SMTP id x10-20020adff64a000000b0032da49cdfd0mr9244582wrp.64.1698215761754;
        Tue, 24 Oct 2023 23:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5pjp6+UGcNGf+pR7eCaZquF6TdQK9ic+pGsGfXKq7QOOQ0Jp5pQG5o2Uq/SY5UVuq/3Y74g==
X-Received: by 2002:adf:f64a:0:b0:32d:a49c:dfd0 with SMTP id x10-20020adff64a000000b0032da49cdfd0mr9244562wrp.64.1698215761437;
        Tue, 24 Oct 2023 23:36:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d534e000000b0032710f5584fsm11318664wrv.25.2023.10.24.23.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 23:36:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Michael Banack <banackm@vmware.com>, Albert Esteve <aesteve@redhat.com>,
 qemu-devel@nongnu.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann
 <kraxel@redhat.com>, mombasawalam@vmware.com, iforbes@vmware.com, Jonathan
 Corbet <corbet@lwn.net>, VMware Graphics Reviewers
 <linux-graphics-maintainer@vmware.com>, David Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 ppaalanen@gmail.com, spice-devel@lists.freedesktop.org, Gurchetan Singh
 <gurchetansingh@chromium.org>, Matt Roper <matthew.d.roper@intel.com>,
 linux-kernel@vger.kernel.org, krastevm@vmware.com
Subject: Re: [PATCH v6 9/9] drm: Introduce documentation for hotspot properties
In-Reply-To: <1bbee4ad-79fe-4968-0edc-3eee34ad5972@vmware.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <20231023074613.41327-10-aesteve@redhat.com>
 <87h6mh10zg.fsf@minerva.mail-host-address-is-not-set>
 <1bbee4ad-79fe-4968-0edc-3eee34ad5972@vmware.com>
Date: Wed, 25 Oct 2023 08:36:00 +0200
Message-ID: <87a5s79pkf.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michael Banack <banackm@vmware.com> writes:

Hello Michael,

> Yes, that patch should be:
>
> Signed-off-by: Michael Banack <banackm@vmware.com>
>

Great, thanks for the confirmation.

> --Michael Banack
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

