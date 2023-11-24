Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kr9xJILE"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49E7D46
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 02:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700823411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4lIC23ZyZLJj/oYUj3wwJ9PbugdSurQXfcrH9U9VfYw=;
	b=Kr9xJILEsCPZcG+HXfPp/9dtj5Z9MEmt4nGvPpZjmT9PMzHxukUHX/ZqnAsZzlCaxAZH6v
	b7OA2vhSZQkmy7jqNLcqN+1+UsKV4RFKmUGNfsEGUIfwaplqNb2yAP1NViRi445qEQY0CH
	nlzYIPC2iH8M785p+acQ4w1cLESXDf4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-liTB31jrPhGRtC5v4UpwOA-1; Fri, 24 Nov 2023 05:56:49 -0500
X-MC-Unique: liTB31jrPhGRtC5v4UpwOA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-332c4291572so1028230f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 02:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700823408; x=1701428208;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lIC23ZyZLJj/oYUj3wwJ9PbugdSurQXfcrH9U9VfYw=;
        b=IO9uepte5OnU6mMzdVQHcJ4CQ03tr0z/6cYpuqccqkxc6XBIe0GCFXeAnqatBDoM6f
         jIHXnqSLdtXzvy4QhqRCcWBW3TH4AljXqOn5uIR+lheWiKefHPtfSBrWVUx4u3wVmemv
         5FASO0xu0pO+s2OhEnhliYNlBbYWLJui+tVCpBUumklW/ygYhP71TC1ns6ePkTKb82tO
         i1RiZZba+FO6QKjmbcsEm/W004CqvxXUHhIi5k20OyuqtZF/tm5LEiLsXEIu+NQQ1jud
         HGeECxkxEQDz0P+TSiVGsPYBuS7mDAnZ7RL+rgTr9YfFsXFDTezt2HTl4rRogjzSrZVp
         FJmg==
X-Gm-Message-State: AOJu0YwWN+risPE48Jj1YJVlNZcg0F28O2bkKxwZwH2dzOh6U9s58Pjm
	MTqbXgqgl+XPrGZ4QjfJswVz6uS9430Q6tFa5v9+cdso8C94m5yXAmRliwhQ3jgge0LF2+NbfKq
	omeYHPBmNYhiqW2GD2FDH
X-Received: by 2002:adf:b1d5:0:b0:32d:aa11:221d with SMTP id r21-20020adfb1d5000000b0032daa11221dmr1609058wra.27.1700823408225;
        Fri, 24 Nov 2023 02:56:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8B1Z5Xh4NJM4v+jFXHb5dS3jyH1zOINaNv+9ttW9vntLWVjkhOG5VMvKimijwhgUpy+ZIgA==
X-Received: by 2002:adf:b1d5:0:b0:32d:aa11:221d with SMTP id r21-20020adfb1d5000000b0032daa11221dmr1609038wra.27.1700823407919;
        Fri, 24 Nov 2023 02:56:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b00327de0173f6sm4052394wrr.115.2023.11.24.02.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:56:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Simon Ser <contact@emersion.fr>
Cc: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org,
 zackr@vmware.com, linux-doc@vger.kernel.org,
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
In-Reply-To: <xUgaKXv4lqgCEWWlB4KRGx-yLXefTg-uXEdXaTqAhOTxC4G7bCILTK9SH6ymdmMMBLooAl3_Kdvl5JXeUA8Hofg9PcCMBhPWhVhnCoxvgqA=@emersion.fr>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
 <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
 <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
 <xUgaKXv4lqgCEWWlB4KRGx-yLXefTg-uXEdXaTqAhOTxC4G7bCILTK9SH6ymdmMMBLooAl3_Kdvl5JXeUA8Hofg9PcCMBhPWhVhnCoxvgqA=@emersion.fr>
Date: Fri, 24 Nov 2023 11:56:46 +0100
Message-ID: <87leanctch.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Simon Ser <contact@emersion.fr> writes:

Hello Simon,

> On Wednesday, November 22nd, 2023 at 13:49, Javier Martinez Canillas <javierm@redhat.com> wrote:
>
>> Any objections to merge the series ?
>
> No objections from me :)
>

Perfect, I'll merge this series then to unblock the mutter MR. Thanks again!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

