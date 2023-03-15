Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA8EC61DA4
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 22:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjCOWwl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 18:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjCOWwk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 18:52:40 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A701689B
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 15:52:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id p20so21703936plw.13
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 15:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112; t=1678920724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djv5OHuSBMMmlx35xiXRNBf7Q5cAUobzFYrXajasQoA=;
        b=Y+Q+4MxAsQJB5ql+QZZVern/F5atMi3XzZTyQUCf0c0tcp5od0Go8PwXLL7nSvXuV5
         0c47I0Xcj/0i4Q40GPQT5Xp+SzhjwQer7hydVojgaWTjoiBfLywphKU8/kzGC//cTaVw
         eH5eG2nXE7tXdlHQIFF24jLlmqzDP0LPcjtN8CYVNpAaQayCyzZKlysOqZB+ZUdk2Y5F
         hnYcR5Zc5WHF84jlGS0ZX0jMhqo+TwCsBfp+sig60fFbMCPDW2+lEwySgAbF0iCymtml
         sPuHHIRD/yZxVi++GsXnnO+k6yoURWETbe5Jiq5de1cD+AYRpLmAGEfnG2pXEZR+2bTk
         MA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678920724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djv5OHuSBMMmlx35xiXRNBf7Q5cAUobzFYrXajasQoA=;
        b=zkDjn7U1ulKj+V1GEhM8cSAhURx/k4srysop8ZL2LU9lRj5Rdezgg7X1p7wO6O+nUM
         HZTpe7vQPNwVzdVy+4e1j0i41R9VYumTOUdi2FYNk/qa7lPJw+LH9j3c3d+IIpYmZEAO
         L0QcNhnMw+dNqP9iFlcqXmWuWtkK6iF4xYUuIDTCNxOQTlUpcL+RV3oi8DRp05ydr48t
         Krs80iHN2AR2SVRU7bva7X4+A2DUHO7loxgO7A2qA2236/PZl2mzgJ5LiQJlsp2tW7fV
         l3ZeEvFDRizcYSIsyeKHEEp8m5MdEGVydF96cujlR1ZoNH4qArpcCQOXWqRbDKVhOqes
         lUBA==
X-Gm-Message-State: AO0yUKVF3Fzm2M8eV+cGbYGYys//wLcV6dl5KyrnzJmDOpXzHszKu4y4
        YW9FvUprj9A1XM+aobZn5nT1XA==
X-Google-Smtp-Source: AK7set+tRFJoMGo5vh0984+ntTqPEuWYTBLjQJ7xSgE7XqAplge1i3vTpKThP/ki4T00wQbLYn+yBQ==
X-Received: by 2002:a17:90a:1c6:b0:231:24c1:8028 with SMTP id 6-20020a17090a01c600b0023124c18028mr1473644pjd.29.1678920723984;
        Wed, 15 Mar 2023 15:52:03 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id ml17-20020a17090b361100b002311dbb2bc5sm1891377pjb.45.2023.03.15.15.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 15:52:03 -0700 (PDT)
Date:   Wed, 15 Mar 2023 15:52:02 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: document NAPI
Message-ID: <20230315155202.2bba7e20@hermes.local>
In-Reply-To: <20230315223044.471002-1-kuba@kernel.org>
References: <20230315223044.471002-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 15 Mar 2023 15:30:44 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> Add basic documentation about NAPI. We can stop linking to the ancient
> doc on the LF wiki.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: jesse.brandeburg@intel.com
> CC: anthony.l.nguyen@intel.com
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org

The one thing missing, is how to handle level vs edge triggered interrupts.
For level triggered interrupts, the re-enable is inherently not racy.
I.e re-enabling interrupt when packet is present will cause an interrupt.
But for devices with edge triggered interrupts, it is often necessary to
poll and manually schedule again. Older documentation referred to this
as the "rotten packet" problem.

Maybe this is no longer a problem for drivers?
Or maybe all new hardware uses PCI MSI and is level triggered?
