Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A916C00140
	for <linux-doc@archiver.kernel.org>; Wed, 24 Aug 2022 17:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240048AbiHXRfB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Aug 2022 13:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240133AbiHXRe7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 13:34:59 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179545A2EF
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 10:34:59 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-f2a4c51c45so21705270fac.9
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=iUc7iTn6xTAH7nh/o6yxXHdfKGNX4Z/5Jv6PbbsrmvE=;
        b=RlaeiBa5eL8zu0NgF7ARiV93OK31F7GkkyowxpdoTtVaIt6Yd6AwdmZeT4UhqxTOir
         TaQbTq0RY8Y6y+tGLDAhuRgnPvpdkEIOG/XPkwF4v5NCae8dReQI9E0ZTHaROIT2w45q
         f9sqGu0D99xgh/NvOUXrlPA/eOIMcCfk0srM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=iUc7iTn6xTAH7nh/o6yxXHdfKGNX4Z/5Jv6PbbsrmvE=;
        b=vNPmyrTKvYpHuuPFszucfbdDm4ngs0qVj+p7HeMcpV2D2lgwtAwfkZV8ZFfWR32Vi8
         6PRo4JkU/4GEOCxhPMrIHC+l9jreVNMn9VLP07rlqj50mDOCpI4ofJd51s6e6gcJNcEm
         fXT3inWlow4cAB0CuiFKWlegXuJnrmw8saQx/59sNHqR4NRbnpstmmVZ12fDTmvPd7AE
         DpHL5aakaEkKe4jI1n5rxarW+fq16T+FAMJBX4GGTQDBe0c+ioGxkddrP8saleW5N82C
         L52ndpqSrZl0dqhS74K3BSLkC8lh4b+Oxm8lA56artPFlYQpVfsuXPd/3TFfZ9LrM5mM
         MqDA==
X-Gm-Message-State: ACgBeo3AjBPGp2YaA+kVS/TrIwS7C7HagLDgkKgAx4dV+kkE9QtUSoy7
        Z+vxTInMdYI+t/pkMhaUB220RhZ1nhc/HA==
X-Google-Smtp-Source: AA6agR7B7CcmDmy8w5F3CrV7EN9fkoFqIUXZBI2yhfYlWY6xcqJHx/I5J4vFKolteiz1WpDS5WHahA==
X-Received: by 2002:a05:6870:ac2c:b0:11c:743b:8c9f with SMTP id kw44-20020a056870ac2c00b0011c743b8c9fmr4314034oab.209.1661362498313;
        Wed, 24 Aug 2022 10:34:58 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id f15-20020a056870d14f00b0010e73e252b8sm4731110oac.6.2022.08.24.10.34.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 10:34:58 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-11c5ee9bf43so21711842fac.5
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 10:34:57 -0700 (PDT)
X-Received: by 2002:a05:6808:3096:b0:342:ff93:4672 with SMTP id
 bl22-20020a056808309600b00342ff934672mr120785oib.174.1661362486729; Wed, 24
 Aug 2022 10:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220823222526.1524851-1-evgreen@chromium.org>
 <20220823152108.v2.4.I32591db064b6cdc91850d777f363c9d05c985b39@changeid> <YwYR/rzvrkvgZzBm@farprobe>
In-Reply-To: <YwYR/rzvrkvgZzBm@farprobe>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 24 Aug 2022 10:34:10 -0700
X-Gmail-Original-Message-ID: <CAE=gft48Tg6NnEUqfM-n1eOT3qa35dtowQGYCL3sbYBmr_Wm_w@mail.gmail.com>
Message-ID: <CAE=gft48Tg6NnEUqfM-n1eOT3qa35dtowQGYCL3sbYBmr_Wm_w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] security: keys: trusted: Allow storage of PCR
 values in creation data
To:     list.lkml.keyrings@me.benboeckel.net
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>,
        Jarkko Sakkinen <jarkko@kernel.org>, zohar@linux.ibm.com,
        linux-integrity@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        apronin@chromium.org, Daniil Lunev <dlunev@google.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthew Garrett <matthewgarrett@google.com>,
        Matthew Garrett <mjg59@google.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        Paul Moore <paul@paul-moore.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 24, 2022 at 4:56 AM Ben Boeckel <me@benboeckel.net> wrote:
>
> On Tue, Aug 23, 2022 at 15:25:20 -0700, Evan Green wrote:
> > diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
> > index 0bfb4c33974890..dc9e11bb4824da 100644
> > --- a/Documentation/security/keys/trusted-encrypted.rst
> > +++ b/Documentation/security/keys/trusted-encrypted.rst
> > @@ -199,6 +199,10 @@ Usage::
> >         policyhandle= handle to an authorization policy session that defines the
> >                       same policy and with the same hash algorithm as was used to
> >                       seal the key.
> > +       creationpcrs= hex integer representing the set of PCR values to be
> > +                     included in the PCR creation data. The bit corresponding
> > +                  to each PCR should be 1 to be included, 0 to be ignored.
> > +                  TPM2 only.
>
> There's inconsistent whitespace here. Given the context, I suspect the
> tabs should be expanded to spaces.
>
> As for the docs themselves, this might preferrably mention how large
> this is supposed to be. It seems to be limited to 32bits by the code.
> What happens if fewer are provided? More? Will there always be at most
> 32 PCR values? Also, how are the bits interpreted? I presume bit 0 is
> for PCR value 0?

Makes sense, I'll pin down the specification a bit better here and fix
up the spacing.

>
> Thanks for including docs.

Thanks for looking at them!

-Evan
