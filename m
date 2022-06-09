Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82160C43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 14:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbiFIO3Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 10:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244646AbiFIO23 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 10:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 395DF182181
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654784905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D9bt/rT+ACc5asHr7sl5YVnLU/QODOwZ6hb9zGalE84=;
        b=Qh6wC/HP4n2qDtl8+mCafn/lpyNqoPiI2Ln55jWtNYc8bcWcvGVqyGlksFqn5Dfehqdv8Z
        jRKoLS75g/8Rx8hIA+ntfi6j4B4uXlx7k+1Ay//+cu9cRQ+LEOFhEkJ8LkJLaodl0QFPIT
        nlqvCOw3L8HbWmHhagEt7WR0RhM/ZJw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-LOSKeO-sO96RywoUgQEFSg-1; Thu, 09 Jun 2022 10:28:24 -0400
X-MC-Unique: LOSKeO-sO96RywoUgQEFSg-1
Received: by mail-wr1-f71.google.com with SMTP id d14-20020adfa40e000000b00219b63c426bso520777wra.16
        for <linux-doc@vger.kernel.org>; Thu, 09 Jun 2022 07:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D9bt/rT+ACc5asHr7sl5YVnLU/QODOwZ6hb9zGalE84=;
        b=BQjz81k6l1zBD8236SreKXg0U2v2dQ8yQtMMTr8TmN7Df6Y8iQGbQCc361E1j+ACSl
         2VQaaDnt3hzTwJ8V6+LMhLDxzhr74kgE5XSRptpNTIutdNJ4ykv0iKlDzcCQ8fs2fPH+
         h81UW/7hvwG2LmtxINOsUtJothfaAVpizc51FO7FWHa+PdNaK5d1bsfJ0L3Kv01whx9T
         m6TZ7Oc/oKC5+Dmz8jZY0o2EM8FF0myCQ+BKqz8NFY8CIB1ZT6Ql030jWPGgyCrSgDQR
         ea2krdOPFvKcs8sGwy5TcpQPzFJtWCyo8HzJjQZLYeRJp7w6y1qEIYnHYoq9RPhiViZd
         74Vg==
X-Gm-Message-State: AOAM533z9WPqwmXZmlx0TKk2iAxWZIjHKWVcCWDO8M4auMUZZDaxZlw+
        GbRSJ2RcFD7GZWcdAT4NKIlblla4Je/cHYgIW0dwJEKH8N11dsxYPSf9fRouTofXMCXT+mzEb8f
        8CKyFqn7au1tHzwMpjx9g
X-Received: by 2002:a05:600c:2312:b0:397:7647:2ac4 with SMTP id 18-20020a05600c231200b0039776472ac4mr3586862wmo.125.1654784902876;
        Thu, 09 Jun 2022 07:28:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwESbXtfgCVdHUHBlqUyB7+uBGuQskr7UH7a9ukf3MhwYxhwZpS3sh4RAgSo9rKZX/Kfrr0xg==
X-Received: by 2002:a05:600c:2312:b0:397:7647:2ac4 with SMTP id 18-20020a05600c231200b0039776472ac4mr3586843wmo.125.1654784902646;
        Thu, 09 Jun 2022 07:28:22 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c4ed300b0039c4506bd25sm24810750wmq.14.2022.06.09.07.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 07:28:22 -0700 (PDT)
Message-ID: <66dc8d78-ccd3-ac21-644d-26b8d20ba791@redhat.com>
Date:   Thu, 9 Jun 2022 16:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/5] Fix some races between sysfb device registration
 and drivers probe
Content-Language: en-US
To:     linux-kernel@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laszlo Ersek <lersek@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>, kvm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Peter Jones <pjones@redhat.com>, linux-doc@vger.kernel.org,
        linux-fbdev@vger.kernel.org
References: <20220607182338.344270-1-javierm@redhat.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220607182338.344270-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/7/22 20:23, Javier Martinez Canillas wrote:
> The patches in this series contain mostly changes suggested by Daniel Vetter
> Thomas Zimmermann. They aim to fix existing races between the Generic System
> Framebuffer (sysfb) infrastructure and the fbdev and DRM device registration.
> 
> For example, it is currently possible for sysfb to register a platform
> device after a real DRM driver was registered and requested to remove the
> conflicting framebuffers. Or is possible for a simple{fb,drm} to match with
> a device previously registered by sysfb, even after a real driver is present.
> 
> A symptom of this issue, was worked around with the commit fb561bf9abde
> ("fbdev: Prevent probing generic drivers if a FB is already registered")
> but that's really a hack and should be reverted instead.
> 
> This series attempt to fix it more correctly and revert the mentioned hack.
> That will also allow to make the num_registered_fb variable not visible to
> drivers anymore, since that's internal to fbdev core.
> 

Pushed patches 1-4 to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

