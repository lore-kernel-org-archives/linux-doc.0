Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CE3C3063E
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 15:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbjHQPPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 11:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353048AbjHQPPc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 11:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A732D79
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692285288;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rMcUmL6AXhc8fjvYYEPQQR3T2MZJhmm7V1iY9JABclU=;
        b=PVzpipTvElFxArGQC2sAyWchfL+MBC3oL7joy6pas50V3pY6SZJn7eoBLbjk0+cQSlDS74
        TLr9FS5EWaKIWxW3Es1v16Qi0FTSwLAaVFjkv4eZpPtEH9xxPyortOYJaUQEcqV5DPr9uC
        JK64D2itPygRzDtAkECdL535823UiZ0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-vEEeIYQRO22JmGG6UFr2cQ-1; Thu, 17 Aug 2023 11:14:47 -0400
X-MC-Unique: vEEeIYQRO22JmGG6UFr2cQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-589ee10d363so48759577b3.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 08:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692285287; x=1692890087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMcUmL6AXhc8fjvYYEPQQR3T2MZJhmm7V1iY9JABclU=;
        b=O578SVt3W4nG5O4su+7vqZwM96xhuI08z+GyAFrawR5nDJZWoTSrLznLi6PprtONbs
         QmqJErP+fM1CDgSZ0ptG0809bdEYCBF13G5TFpVxgDA9NADNpYrN+mbhPTwHGr11W89w
         1QTkzv2yqYB9vWCSx/bx7fgcp681UsBerXeRUouPkolPMStty47FzGnLlsmx9Eqb6WwS
         turBdRMdXGBZGeUdqBF0XNY859pPBYKB+GV5p2QjynfPowphDks+voO3wWUYWcCMFNso
         9z/LCE6XS+iuRWs2XKeCnCQp0W0fUNvgWQVrHj/nlB7df54u3We1VCaqcn/6j8d6r4Jn
         kXwg==
X-Gm-Message-State: AOJu0YwHTVSzxZry+JgJ61sXvtvZXfInKXFgTGy84NX0pwdWm9mHVG2s
        HfFElhep6eDdR355cdPaFKv+pR5uMXv2nNzhkpJfMQDMCcMjd3atkEf8DTiwfr4ozKc4NRlVsez
        AbjYZWtEhuIs/Yk4ZPKfp6wbv23pV4R8pacvM
X-Received: by 2002:a0d:e815:0:b0:583:d9de:8509 with SMTP id r21-20020a0de815000000b00583d9de8509mr5208736ywe.27.1692285286916;
        Thu, 17 Aug 2023 08:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6kNYiYSV9JRT0QmwiIjzWEUy91weshJK4xrpmANQe+cYDzBWzL6xtqQmHQZdAJ3FxjPQjPHtSEClWX7mtyo4=
X-Received: by 2002:a0d:e815:0:b0:583:d9de:8509 with SMTP id
 r21-20020a0de815000000b00583d9de8509mr5208724ywe.27.1692285286693; Thu, 17
 Aug 2023 08:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230815194254.89570-1-donald.hunter@gmail.com>
 <20230815194254.89570-6-donald.hunter@gmail.com> <20230816082030.5c716f37@kernel.org>
In-Reply-To: <20230816082030.5c716f37@kernel.org>
From:   Donald Hunter <donald.hunter@redhat.com>
Date:   Thu, 17 Aug 2023 16:14:35 +0100
Message-ID: <CAAf2yc=C4N=QT6hpxmLi-uywc+MhuLdAsbfPRORv5ms9k1JAfQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 05/10] tools/net/ynl: Refactor
 decode_fixed_header into NlMsg
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Aug 2023 at 16:20, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 15 Aug 2023 20:42:49 +0100 Donald Hunter wrote:
> > +    def __init__(self, nl_msg, ynl=None):
> > +        self.genl_cmd, self.genl_version, _ = struct.unpack_from("BBH", nl_msg.raw, 0)
> > +        nl_msg.raw = nl_msg.raw[4:]
>
> It's a bit of a layering violation that we are futzing with the raw
> member of NlMsg inside GenlMsg, no?
>
> Should we add "fixed hdrs len" argument to NlMsg? Either directly or
> pass ynl and let get the expected len from ynl? That way NlMsg can
> split itself into hdr, userhdrs and attrs without GenlMsg "fixing it
> up"?

I agree, it breaks the layering. The issue is that GenlMsg gets created at
some point after NlMsg, only when we know the nl_msg is suitable for
decoding. The fixed header bit is quite well encapsulated in NlMsg,
it's the genl header that needs pulled out and NlMsg shouldn't know
anything about it. How about I add a take_bytes(length) method or a
generic decode_subheader(format, length) method to NlMsg?

