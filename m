Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9101EC636D6
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 16:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjBQQrv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 11:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjBQQru (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 11:47:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3834F2680
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 08:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676652426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l1LxwWmWqf8IjOm2G4QGdHlkYxOfwoVPScy+qKlyy5U=;
        b=Zzi1ModXIV9xUQXeIqFF6wzKrTj4V8wISUc0TeTte80UbLKU6vVfAU7S2L9p6uz31JxTfZ
        HzRUmD7nn5Z6/DFffEsKYvJ3v7rHciLBtghTYRrduYXE04txf0tC+sONKRKKkzHGhFmown
        uMMqFNzAsqdh+YcvUhwfKvyz4m8g1W0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-5Bm0ZBsINHyA9BkS2t3gyg-1; Fri, 17 Feb 2023 11:47:04 -0500
X-MC-Unique: 5Bm0ZBsINHyA9BkS2t3gyg-1
Received: by mail-qk1-f199.google.com with SMTP id j11-20020a05620a288b00b007051ae500a2so141805qkp.15
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 08:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1LxwWmWqf8IjOm2G4QGdHlkYxOfwoVPScy+qKlyy5U=;
        b=n6C177ny+uiyt11r80eVaVefZvgM68wGAN9+i7EpzeyBWLfPb/4hd3ypOdagwdC/Xp
         /nECzgTXUrNHQR+fkGs5k26xHVHFwMvENGl+b43zCkulXlmqSagQN1BRkPPbRsY39oTB
         tb1CvQG0ovHBrRgfsvAtKKcZLUmlk0V81kPN9VYm6pMZ+NkpFXjruV0aHLBC63xWPjPR
         jJM8jVQCqZNboS3zFOxnpvPAITiMwR7Eb2u1tJ+HXD+VU3K9lEGntC/taRIPChIqAUxS
         e9dl+rDKyAdcviFH3slKus25eHhAOynXjSoOer76kZUyo+8mo7Cjh2iA3tRudIfh+htJ
         nlPA==
X-Gm-Message-State: AO0yUKUz7pmw0lbihshP70Yn/XQRNmMPPVOTHZhX/EEPRMjTyB+CZud1
        TQWh2EFIzPULhuynNXjEx/KQGenP7jASEVcuBxKX0dhZZ4m49ZZ3DDB3CYPBTozQJCLlc02SxfW
        aDRv8Nz9pHV45tKUoxwuS
X-Received: by 2002:a05:622a:1790:b0:3bd:142d:64dd with SMTP id s16-20020a05622a179000b003bd142d64ddmr7110990qtk.3.1676652424293;
        Fri, 17 Feb 2023 08:47:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8cIx+NjXXQGUOhiogUNo6kn4XAge3rNmfZI5qHreTVLPFExzEzU56U5DlzoVCTINkGDPve7Q==
X-Received: by 2002:a05:622a:1790:b0:3bd:142d:64dd with SMTP id s16-20020a05622a179000b003bd142d64ddmr7110954qtk.3.1676652423974;
        Fri, 17 Feb 2023 08:47:03 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id c76-20020ae9ed4f000000b00728bbe45888sm3562145qkg.10.2023.02.17.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 08:47:03 -0800 (PST)
Message-ID: <07293a5cbb4ac1680d7b737105b1c308d626a72c.camel@redhat.com>
Subject: Re: [PATCH] sfc: fix builds without CONFIG_RTC_LIB
From:   Paolo Abeni <pabeni@redhat.com>
To:     "Lucero Palau, Alejandro" <alejandro.lucero-palau@amd.com>,
        Alexander Lobakin <aleksander.lobakin@intel.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-net-drivers (AMD-Xilinx)" <linux-net-drivers@amd.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "habetsm.xilinx@gmail.com" <habetsm.xilinx@gmail.com>,
        "ecree.xilinx@gmail.com" <ecree.xilinx@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "jiri@nvidia.com" <jiri@nvidia.com>
Date:   Fri, 17 Feb 2023 17:46:59 +0100
In-Reply-To: <DM6PR12MB420241B35AB4B8846AB4F568C1A19@DM6PR12MB4202.namprd12.prod.outlook.com>
References: <20230217102236.48789-1-alejandro.lucero-palau@amd.com>
         <ef38e919-f7ea-0b11-f5d5-2eb4fb665c72@intel.com>
         <DM6PR12MB4202D1FA796BF66E6AD4C6C0C1A19@DM6PR12MB4202.namprd12.prod.outlook.com>
         <DM6PR12MB420241B35AB4B8846AB4F568C1A19@DM6PR12MB4202.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2023-02-17 at 15:30 +0000, Lucero Palau, Alejandro wrote:
> BTW, I did not send the net-next tag what I'm not sure if it is required=
=20
> (I would say so).
>=20
> Should I add it?

Indeed is required and you should add it when you will post v2.

Thanks,

Paolo

