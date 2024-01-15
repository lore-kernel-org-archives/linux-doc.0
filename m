Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BF1754E
	for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3WP9Eql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705323306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OdOY5TfnFDP96uyidwJURkq+KNPlInJLGTZ9BVgWgNg=;
	b=F3WP9Eqli1L0+uBaM6LLzxSYi5d2LODNZ2Nepy1p3RziOG8a492ZlYMvrUztIRfVjT3Xp4
	bFmfS0kyvy1ECTncY8XCpFrFZ2ZH3ybvM9n5TGX5dg4017D8kvphglbQiHzGZC5luP+COr
	3m1NbmZ6njmoCXB5L4m5Phk0q1JuRMQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-Tz1tScTmMeiIHB2ZwgbUVA-1; Mon, 15 Jan 2024 07:54:59 -0500
X-MC-Unique: Tz1tScTmMeiIHB2ZwgbUVA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-337550cbe8cso5232529f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 04:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705323298; x=1705928098;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdOY5TfnFDP96uyidwJURkq+KNPlInJLGTZ9BVgWgNg=;
        b=lSvSaKHgPL3MegoXDGTCLkzHfeaNrS66cWe9Y57Lw28Xdvk1HLiOCCUQucfETqfWYm
         tySNlVtOyQfCmLWrfS0G4EBXy+s/jtfh1rjtueH4iDJS099FkZWLyLcpsTNVIlXY2MJe
         jNQZ0XDMUforMNCObjy663l1lXhfK/Cq2LlejtcXkakGIPrnjec9WT5gTwViJvaws0ln
         ZE6TwoTj3P94epQAYhajvUAneZZnFAuL9NtsMpQ45A9grXmpc8WLdVlNMgfHx4lCAfTX
         6k2R3sEtRwP4nPWLoHYq/S6dBbh6G/qapFXBFqQRgO3SkFSLoB44jk0hpWNExBookksM
         e3jg==
X-Gm-Message-State: AOJu0Yx4/faVnDUGAsmkU02HKQNj0562STzyNFDsLc9/TeUjL+fnyo/b
	AhHKzmlpuwIeQ7SegYID4BVDHk2Wmp91JxNYe/NO3oR5elebq+Pf0c2msmkC8aIZKvBhYmsNVs9
	1ez/1bat+r6PX9sOyUdqOsHxu0ceTPl+MnBfn
X-Received: by 2002:a05:600c:211a:b0:40e:6ba4:e052 with SMTP id u26-20020a05600c211a00b0040e6ba4e052mr1896487wml.25.1705323298088;
        Mon, 15 Jan 2024 04:54:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzg0bntWWAcXtuHZuGROwZXvYdlmFhuKVULfmHMeQ1PrfepcSckBb2THm+UeIHVJ5SngMEHg==
X-Received: by 2002:a05:600c:211a:b0:40e:6ba4:e052 with SMTP id u26-20020a05600c211a00b0040e6ba4e052mr1896482wml.25.1705323297800;
        Mon, 15 Jan 2024 04:54:57 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c4ec600b0040e6b0a1bc1sm9160488wmq.12.2024.01.15.04.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 04:54:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, corbet@lwn.net
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/gpu: Reference articles on Linux graphics
 stack
In-Reply-To: <20240115113908.25897-1-tzimmermann@suse.de>
References: <20240115113908.25897-1-tzimmermann@suse.de>
Date: Mon, 15 Jan 2024 13:54:56 +0100
Message-ID: <87zfx6oixr.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add two articles on LWN about the Linux graphics stack to DRM's
> list of external references. The articles document the graphics
> output as a whole, including the kernel side.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

