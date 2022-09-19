Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6147C6FA86
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 16:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiISQRO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 12:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiISQRL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 12:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5D529812
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663604229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Xn5fnqKtyryYA5w5sfE3wIiUTcmcdDi6qpfcSbkJ4Lw=;
        b=gvS/LdR0maZ69qRF+LRVo4hBcSsZrKehnRsKkVWPbxPgh8zoi3Xa8s4Nf6vkAkw6aFZecj
        8nntOrwh46jfZKmUDMYdGKYCcWKumUUTP+ioXnSUXr+5XDNeWRPAYNZylQO9zZPeVu0MP0
        jNhQBDFSQkW7w8DoH34QcU1C4k6z2Yg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-MrQQsEa9Mei03og1DjfsmA-1; Mon, 19 Sep 2022 12:17:06 -0400
X-MC-Unique: MrQQsEa9Mei03og1DjfsmA-1
Received: by mail-qt1-f198.google.com with SMTP id ew15-20020a05622a514f00b0035cb76e35e5so12057074qtb.7
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 09:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Xn5fnqKtyryYA5w5sfE3wIiUTcmcdDi6qpfcSbkJ4Lw=;
        b=t69vqhpqNgzwD/AdxqN5Uk+sHaQc2lOOyKVd++d5wpsaGdC3s2nmQTk5dEoQjlgLZz
         vOH2yzgb0VEdyXmiNwSOjfWw+xXU9Jw685LNc77G0u5DMcuKGBW7SVfhl+F71hXcITPK
         mlfdHnYRKR9qEQzUVEUX0zaP1Xf0kFrmxfRkcZjCGpdyekoccex9gM3tJ1oZBNOg8P6F
         q8gB9MKt+p7nMF0TcFkTxE58pkgH7qKuWMVQL90wCFxkqkx7ksQv1aoSqT6f64a0VKvl
         2qN4WduXNCGcGJP90b70/8BZ/QxsMUpxGckWqPpgpNZXIkJCez4bLFltpEZ5xkAuhf3l
         ygyw==
X-Gm-Message-State: ACrzQf2lUifCkemgAl0AMsBHZ+hb3B0rvYUHJ/dYZ9PFXxU3Fliutyl2
        OGU8sznvy8LvwCgdQBiFthmU/jNNdlWB+r8mDvJ3kEyhgjQFCcAEvnHAIJpMXOIbCeX7kQCz/5Z
        u/WbGReuO/mrnsYM4l+/x
X-Received: by 2002:ac8:5e0a:0:b0:35c:e8d8:6c19 with SMTP id h10-20020ac85e0a000000b0035ce8d86c19mr5068672qtx.178.1663604225353;
        Mon, 19 Sep 2022 09:17:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51+LmYDmB5JjErlr4hYbacMbbiBwggTg81wkAjJVlWGP8agHsUu4S5cY7WS6QJw0cvQ6qJIg==
X-Received: by 2002:ac8:5e0a:0:b0:35c:e8d8:6c19 with SMTP id h10-20020ac85e0a000000b0035ce8d86c19mr5068640qtx.178.1663604225144;
        Mon, 19 Sep 2022 09:17:05 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id bv12-20020a05622a0a0c00b0035cf2995ad8sm826570qtb.51.2022.09.19.09.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:17:04 -0700 (PDT)
Date:   Mon, 19 Sep 2022 12:17:02 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gavin Shan <gshan@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, kvmarm@lists.cs.columbia.edu,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        catalin.marinas@arm.com, linux-kselftest@vger.kernel.org,
        bgardon@google.com, shuah@kernel.org, corbet@lwn.net,
        drjones@redhat.com, will@kernel.org, zhenyzha@redhat.com,
        dmatlack@google.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pbonzini@redhat.com,
        oliver.upton@linux.dev, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/5] KVM: x86: Introduce KVM_REQ_RING_SOFT_FULL
Message-ID: <YyiV/l7O23aw5aaO@xz-m1.local>
References: <20220916045135.154505-1-gshan@redhat.com>
 <20220916045135.154505-2-gshan@redhat.com>
 <YyS78BqsQxKkLOiW@xz-m1.local>
 <87illlkqfu.wl-maz@kernel.org>
 <a2e0b9bc-2c67-8683-d722-7298bd65058c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2e0b9bc-2c67-8683-d722-7298bd65058c@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 19, 2022 at 09:58:10AM +1000, Gavin Shan wrote:
> I think Marc's explanation makes sense. It won't make difference in terms
> of performance. We need to explicitly handle barrier when kvm_test_request()
> is used. So I prefer to keep the code if Peter agrees.

No strong opinion here. I keep thinking clear+set look awkward even if it's
unlikely path to trigger (ring should be recycled when reaching here for
any sane user app), but if it's already 2:1 then please go ahead. :)

Thanks,

-- 
Peter Xu

