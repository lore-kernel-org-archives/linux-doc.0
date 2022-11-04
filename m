Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2111C433FE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Nov 2022 18:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbiKDSel (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Nov 2022 14:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbiKDSeg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Nov 2022 14:34:36 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C8D40931
        for <linux-doc@vger.kernel.org>; Fri,  4 Nov 2022 11:34:33 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id b29so5202964pfp.13
        for <linux-doc@vger.kernel.org>; Fri, 04 Nov 2022 11:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fFlgEoQ+2ARPKvzYCLdvHvwC3pq/RnzvVojet0DXLgg=;
        b=nJ8Xa/ROHn8AT1PIg/dhjRMINqphLAL/bOrhvxGaJRCtDh1l/knL1nNHyUgybie2+i
         4/4cKvfd0kb4xC00W02DHqwHRJlnuzWSqU376vzNvl9FZx33yev9vWF/3XjSBccf27dl
         Emj5vMOkiP2lYyhiVng01hYuCLd3maODPa/LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFlgEoQ+2ARPKvzYCLdvHvwC3pq/RnzvVojet0DXLgg=;
        b=HlnddtP1KbqIJrDiEqhBF6cuuFJ1j8U15RRvKV4toblajBgCZd1qw10PDB0KP+uZpv
         i+7I1a+B85HGVnOE3ZEknOwG55mLsO06gc2OwfSVBpZX9h9tp0ZXF0ZjjwF3EgcN3bK6
         dfdghh5tYGcp8KbV0yR5R3tX+UwUcWJo/6H92GD+iMR+NxFhd66r/yrsSXujkYIuyBtg
         kFUMRowOmbq8JTACbSV/oMQ3SIng1c1NsZMhm1MBr0O+QK288x9JF8D7tji1DSPsE+sz
         z2YUi6JfP5Z8DA4PlUAzzLFekHbmDdUuSbiLHOUgg+bDLunjIUVhsQmGuzTrDVF0crQD
         7bBg==
X-Gm-Message-State: ACrzQf0izUaY2BtDF4nIgR7HBAKbONHUV7z7lcSTgcw3ImnkoMvitlIt
        vxfZNmLrRbD8TfeIQcU6hFvvpg==
X-Google-Smtp-Source: AMsMyM6S7zxtJ4UwzgqjmSKGYJg8U3NwTZne4WYB2avbtJ8sShe6lVSGKAHshLFa5m0rqJszHDmCRw==
X-Received: by 2002:a63:1206:0:b0:470:18c:1489 with SMTP id h6-20020a631206000000b00470018c1489mr14766650pgl.357.1667586872547;
        Fri, 04 Nov 2022 11:34:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b9-20020aa79509000000b0056bc30e618dsm3071068pfp.38.2022.11.04.11.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 11:34:32 -0700 (PDT)
Date:   Fri, 4 Nov 2022 11:34:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-pm@vger.kernel.org, rjw@rjwysocki.net, gwendal@chromium.org,
        apronin@chromium.org, Pavel Machek <pavel@ucw.cz>,
        Matthew Garrett <mgarrett@aurora.tech>,
        linux-integrity@vger.kernel.org, jejb@linux.ibm.com,
        zohar@linux.ibm.com, dlunev@google.com,
        Eric Biggers <ebiggers@kernel.org>,
        Ben Boeckel <me@benboeckel.net>, jarkko@kernel.org,
        Matthew Garrett <matthewgarrett@google.com>,
        Matthew Garrett <mjg59@google.com>,
        Ben Boeckel <linux@me.benboeckel.net>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        Paul Moore <paul@paul-moore.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4 05/11] security: keys: trusted: Allow storage of PCR
 values in creation data
Message-ID: <202211041134.927C258@keescook>
References: <20221103180120.752659-1-evgreen@chromium.org>
 <20221103105558.v4.5.I32591db064b6cdc91850d777f363c9d05c985b39@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103105558.v4.5.I32591db064b6cdc91850d777f363c9d05c985b39@changeid>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 03, 2022 at 11:01:13AM -0700, Evan Green wrote:
> From: Matthew Garrett <matthewgarrett@google.com>
> 
> When TPMs generate keys, they can also generate some information
> describing the state of the PCRs at creation time. This data can then
> later be certified by the TPM, allowing verification of the PCR values.
> This allows us to determine the state of the system at the time a key
> was generated. Add an additional argument to the trusted key creation
> options, allowing the user to provide the set of PCRs that should have
> their values incorporated into the creation data.
> 
> Link: https://lore.kernel.org/lkml/20210220013255.1083202-6-matthewgarrett@google.com/
> Signed-off-by: Matthew Garrett <mjg59@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
