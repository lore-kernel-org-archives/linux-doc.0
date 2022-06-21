Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F47ACCA47C
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jun 2022 00:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343718AbiFUAQB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Jun 2022 20:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244646AbiFUAQA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jun 2022 20:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 35C1919F93
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 17:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655770559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=am4ljrsE7Ufjfmqsop2MzHsqSlEXrA5rSRIM1yT2FYE=;
        b=Oa8gRzGY2u2DYqxCXVM5yCVTFVRsVzxdTcxOVLtaoW4nFhj03p7/+84b5DP9JPbgw1lWRC
        I8LH+kdVGSo9Y6oEVDDakR3hqdg+hPdp4gotjnbyD+i/SPR2F+hrqLfHVJJ5f5AW9cTWbH
        5d6ORyviubna4kTKMi6eOkzYL8KJrmQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-t0dcDnsbPbK8BPt_ntvE-A-1; Mon, 20 Jun 2022 20:15:58 -0400
X-MC-Unique: t0dcDnsbPbK8BPt_ntvE-A-1
Received: by mail-wr1-f69.google.com with SMTP id b10-20020adf9b0a000000b0021a0c74738aso2825828wrc.7
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 17:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=am4ljrsE7Ufjfmqsop2MzHsqSlEXrA5rSRIM1yT2FYE=;
        b=1Waxe4AL+darR05ar0Ku3ekuJ/jLxEs4vGnZ3LARAdOCLg690Qbbh7XsX+n4DSjkEK
         clU4yeegN55KuW1hDOPbzivW2b6Hgjnt5FsHMP6Va3H+n+Y+9Zasfx0j+xTMBC13Xdl4
         j/xY63Bd9PL55Wvl9SWDsk9XVFicJQynJLnzxQtRiJAoan+mFMNLy9M9eoWy1kclth3g
         OfM+lc4L4Aypr1I6u+lPa6E+35r72+PZ1MBJegIQl9x9AICjBgzKBH80rbtnYNERy2gu
         RaerG7NXp7GGgYeiQB6T8qzNU/MTBWm45/YPZ1iVGmo1+gzvQxvfKSUeEvlTOAYgC6n3
         jMxg==
X-Gm-Message-State: AOAM532fIm+U/JQbKWB1n3IXIHFX2KEaoQUVOgpXc8C1ndtNy5+PLdJj
        tKGKilEgw7hPP2oTWeAZbSjQ5SFI8jhj28XfdEYJjg2Ug3rIVI249JjdAB18cCgBes47j5c0XXv
        YJoFX5zG1FtNMdaTegsrd
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id m5-20020a05600c3b0500b0039754ce0896mr37343018wms.3.1655770556335;
        Mon, 20 Jun 2022 17:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuF9L1be7ni3J1YmYNIb9c4ZabGtFSUgGjCv0tSabp2R2QRhWX6wNq50I5/oKWe6fZHu9qDw==
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id m5-20020a05600c3b0500b0039754ce0896mr37343003wms.3.1655770556103;
        Mon, 20 Jun 2022 17:15:56 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e13-20020adfe7cd000000b0021b89181863sm7340790wrn.41.2022.06.20.17.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 17:15:55 -0700 (PDT)
Message-ID: <e6306933-45c4-f38a-bae1-3ad149d67e1b@redhat.com>
Date:   Tue, 21 Jun 2022 02:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] vfio/pci: Remove console drivers
Content-Language: en-US
To:     Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, gregkh@linuxfoundation.org
Cc:     linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541193265.1955826.8778757616438743090.stgit@omen>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <165541193265.1955826.8778757616438743090.stgit@omen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Alex,

On 6/16/22 22:38, Alex Williamson wrote:
> Console drivers can create conflicts with PCI resources resulting in
> userspace getting mmap failures to memory BARs.  This is especially
> evident when trying to re-use the system primary console for userspace
> drivers.  Use the aperture helpers to remove these conflicts.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---

Patch looks good to me. 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

