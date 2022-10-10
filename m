Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA071C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 09:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbiJJJ4z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 05:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJJJ4x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 05:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3163C5F21F
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665395812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qEUa83HipRTO4aAhoNtLoSIs7ceIGkhT1Fj1jwGOpHk=;
        b=UCD0kBLPDvKOmHcc7jQQGk1JnObvQY/jW5RAW+ygAmJYFNF2tyhJwNjniKDVlJ9+r+iAYf
        eKw1z3tCGo+BvtSkum3ESK84vdTXtzvVGD12S1U/lOWQH7qQ8DPsBCAi/catniN2FwG1U8
        M6rE0QA+yGCeBiouoKKLYHNh2Ntp1yM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-I_v0iiVZMsmm-9l5vyiz0A-1; Mon, 10 Oct 2022 05:56:51 -0400
X-MC-Unique: I_v0iiVZMsmm-9l5vyiz0A-1
Received: by mail-wm1-f70.google.com with SMTP id 2-20020a05600c268200b003c4290989e1so1442669wmt.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 02:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEUa83HipRTO4aAhoNtLoSIs7ceIGkhT1Fj1jwGOpHk=;
        b=r/crIbzZ6BkV47Vuvoxox57D+s0xVevS8ceRQNl6gRB9yXCDlQsoZqpNWa3q6QJOYM
         kVYd5dv6MDa+o6rTpooCSkycF6Xndj1PFlG9EvcqzHCAz3TqoDR79uUNer+8e65a6B1z
         yHUkSRdpWBC+YdyShj247ZBNpMkzvOJXp3gj5uLb8kL6rchl09xWMNwzcecJI8A9PM/w
         vAG4/oDlBqcIiFXeocNgAad471H96UhS9J/RlzLjsrPxtal+LcppGKxLio4pB+3G20oo
         ZDS7g+XKXI6xuvQgWgSaZ2uMaOpunjQ/TAUUFk3Noo2vILGl3nN9YMmgr2jbdK3Eo7h5
         fH/w==
X-Gm-Message-State: ACrzQf3H68OS4DQwiTIQ9f5FxQx16e9rYvYcn2H6NuxME/uvgRP426Rw
        ee/hbf7ICEXC3jLgp8c1Z46BnW707JdiFUT99CwFgNvegZH+j/C7Ef4TipXQz8rQfosqK/OeJzG
        lhradh4KFEWlnzu5ddGX/
X-Received: by 2002:a5d:5a18:0:b0:22f:4f72:213a with SMTP id bq24-20020a5d5a18000000b0022f4f72213amr6878631wrb.57.1665395809994;
        Mon, 10 Oct 2022 02:56:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM433FYGI8FP7Isu9a7tQilMCo+PxGRCkwbjKG09o/JkR0yJ5o40ZY2V9beVG4PmGMfS4c1STg==
X-Received: by 2002:a5d:5a18:0:b0:22f:4f72:213a with SMTP id bq24-20020a5d5a18000000b0022f4f72213amr6878611wrb.57.1665395809729;
        Mon, 10 Oct 2022 02:56:49 -0700 (PDT)
Received: from localhost.localdomain ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id r1-20020a05600c35c100b003a84375d0d1sm15561178wmq.44.2022.10.10.02.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 02:56:49 -0700 (PDT)
Date:   Mon, 10 Oct 2022 11:56:45 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, robh@kernel.org, johannes@sipsolutions.net,
        ecree.xilinx@gmail.com, stephen@networkplumber.org, sdf@google.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH net-next v2 1/7] docs: add more netlink docs (incl. spec
 docs)
Message-ID: <20221010095645.GA3551@localhost.localdomain>
References: <20220930023418.1346263-1-kuba@kernel.org>
 <20220930023418.1346263-2-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930023418.1346263-2-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 07:34:12PM -0700, Jakub Kicinski wrote:
> +==============================
> +Netlink spec C code generation
> +==============================
> +
> +This document describes how Netlink specifications are used to render
> +C code (uAPI, policies etc.). It also defines the additional properties
> +allowed in older families by the ``genetlink-c`` protocol level,
> +to control the naming.
> +
> +For brevity this document refers to ``name`` properties of various
> +objects by the object type. For example ``$attr`` is the value
> +of ``name`` in an attribute, and ``$family`` is the name of the
> +family (the global ``name`` property).
> +
> +The upper case is used to denote literal values, e.g. ``$family-CMD``
> +means the concatenation of ``$family``, a dash character, and the literal
> +``CMD``.
> +
> +The names of ``#defines`` and enum values are always converted to upper case,
> +and with dashes (``-``) replaced by underscores (``_``).
> +
> +If the constructured name is a C keyword, an extra underscore is

s/constructured/constructed/

[...]

> +header
> +~~~~~~
> +
> +For C-compatible languages, header which already defines this value.
> +In case the definition is shared by multiple families (e.g. ``IFNAMSIZ``)
> +code generators for C-compabile languages may prefer to add an appropriate

s/C-compabile/C-compatible/

