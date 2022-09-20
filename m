Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D152C6FA92
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 22:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiITWwi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 18:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbiITWwe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 18:52:34 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDD171BCC
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 15:52:33 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id w13so3890259plp.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 15:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=csHCOpX4Thr2QRrHr400VPFVzlVPJ8/efH6qq4nAHXc=;
        b=aDBP4/2lo+pXphddlVIa2FTCAzhZ91faxjotdaCnJaSpL/aaDEkohKi/G9sUhhvB5s
         KMUGnoXYj3i89qIOkEuj5X5q6NGMUXkkTwKWrVXeRs3yHmNL7JiWxSIoTavOqdn9DmtZ
         WrROCn/b2HS8AyqdqV4GgA4eGe+8jr7IfQMaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=csHCOpX4Thr2QRrHr400VPFVzlVPJ8/efH6qq4nAHXc=;
        b=Qfc00HFsGjE0TQpQAijeJjFlaIDHIwFnnjflyK5N8oC6Bo2AqMdVbZE+ru43RCPHno
         FOj6fyLprSO4lh4IhcJAXqZK28nx2X1mZoVYUozQP65QN9qoIUPB+AILxHFplTlFLLR2
         ve6bXQIcI/mzKJbG3L98qk8v5C61Tyk99YPmweQlF2WjS3BNKI65RnkrGDlaDmRiRPRV
         GE6AbwAeoYRZ2fpvzLTEgpO0xzo3wGTAiIu031rnpDIHkNkHnf41IkejQjbN3XkSgfGz
         P0w/5MJ0RrMVwdFL/QaGnTMRtXKleoX+Vd3lWa/bGzRWO+PTwZt0WLeCHEFUCR7UIv4D
         U0Cg==
X-Gm-Message-State: ACrzQf1D2ww0A5nxEoRsMLjtOUl6HJwlZhc3kmzjfxf2lbO9oFBiwvpu
        D5O11dZxwnJ7s/GUdlvjJ2rnUg==
X-Google-Smtp-Source: AMsMyM5f+/GVDaMh8mBt+g8Z2/ClIUN5JBPSQy1AM58w9hhHp0b6WHVvMFj25tmNNs2JJPVMGUhEFQ==
X-Received: by 2002:a17:902:f683:b0:176:cc02:ce83 with SMTP id l3-20020a170902f68300b00176cc02ce83mr1802714plg.88.1663714352678;
        Tue, 20 Sep 2022 15:52:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f13-20020a170902ce8d00b0016dc6279ab7sm421363plg.149.2022.09.20.15.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:52:31 -0700 (PDT)
Date:   Tue, 20 Sep 2022 15:52:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     linux-kernel@vger.kernel.org, gwendal@chromium.org,
        Eric Biggers <ebiggers@kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>, jarkko@kernel.org,
        zohar@linux.ibm.com, linux-integrity@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, apronin@chromium.org,
        dlunev@google.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        corbet@lwn.net, jejb@linux.ibm.com,
        David Howells <dhowells@redhat.com>,
        Hao Wu <hao.wu@rubrik.com>, James Morris <jmorris@namei.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Len Brown <len.brown@intel.com>,
        Matthew Garrett <matthewgarrett@google.com>,
        Paul Moore <paul@paul-moore.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 00/10] Encrypted Hibernation
Message-ID: <202209201550.D2F47108@keescook>
References: <20220823222526.1524851-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823222526.1524851-1-evgreen@chromium.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 23, 2022 at 03:25:16PM -0700, Evan Green wrote:
> This series adopts that primitive as a foundation, tweaking and building
> on it a bit. Where Matthew's series used the TPM-backed key to encrypt a
> hash of the image, this series uses the key directly as a gcm(aes)
> encryption key, which the kernel uses to encrypt and decrypt the
> hibernate image in chunks of 16 pages. This provides both encryption and
> integrity, which turns out to be a noticeable performance improvement over
> separate passes for encryption and hashing.

I like this series! I would ask that someone more familiar with the
cryptographic constraints here confirm that the primitives you're using
are going to actually provide you the constraints you want (i.e.
encryption, integrity, etc). My understanding is that gcm(aes) is
exactly right, but I Am Not A Cryptographer. ;)

I'll reply more to individual patches ...

-- 
Kees Cook
