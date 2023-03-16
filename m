Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE17C61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 01:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjCPBiu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 21:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCPBit (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 21:38:49 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB8A2748A
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 18:38:48 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id j13so227013pjd.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 18:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112; t=1678930728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AFsNWCEt4Tra7IYWsq0la2F6kxqXukdmZeCb1dGw+g=;
        b=Wx3pja8dNPlAc+jli798ffqGzlhCxObRdSSMKM/ln1oAAICe5yxLrv3+eS0H96FUAD
         XlrFuArrhQqpLHJdk9NR3jQb0OCWdnPhkeLIpewg7ghTnVETdEDV5jAQe2W1zoDr+bv/
         GOOhCwL3AHwsKgcZ3piUIIweDB0aRsHfJV7Pg6AEAME1kW7luzMjSXgvIpt5HyBkuE/n
         pcFHVSigLjlagUkW3dUk7xx+cPB97+dfq4yPLVdCwaSCa6hCUfjsZq2XoQSuB5pg81qe
         5Qkaj8ieBPR2MIdKKWWa0h9K6dVw+Ojaykp4l+nmNQqXdYsa6dVZwXy28JCCbO5h2plm
         F7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678930728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AFsNWCEt4Tra7IYWsq0la2F6kxqXukdmZeCb1dGw+g=;
        b=3Hyb1aXo+8VZxYAlyRsU0KIfiqNrYsYuXqq4V3Fd2L1rtFUXevUuGF9CeU8QLUUArt
         rWPxOx4aZPEJa3D4jZHMXY/Rc//UoVsX+oFE86zEYiiK3uaMYNltByc/pOXUSeGCoxA/
         tQJmSqrqXCXYEbeh59YCeeLjDwvFhzvJtgTLg53Fs9BBg3sNHAoNxA8iOsUr9nmsAJE4
         3bvxNZlhUrKoTaSq6pXAgLU9MHpWDWgHRWjH7m0f94ZzS/le2uJ9R5jX7+ZKq7rI4QVe
         Tbdzs9UKRsW4sFWVxr2UEEhgn26rnPXWZ1BLf3C/H6yWtgzkyXajFEhrnzsFe+x3qe1i
         Jh5A==
X-Gm-Message-State: AO0yUKU8sixgzzgrlZ6tt2rQDIn2rxIM46Dm3Lr8TY9oDq3ggxJ8X6YP
        Fy8kzl0BjgxSRWCOxsPFGIPsyQ==
X-Google-Smtp-Source: AK7set/tHS/PFlmJd1WPqOmIpYWDDjKvUkdT2AhlMOza4pCnAs1vjpmSCnLyORYBs+6ytqo8kFnuJw==
X-Received: by 2002:a17:902:fa47:b0:19e:6700:174 with SMTP id lb7-20020a170902fa4700b0019e67000174mr1319506plb.25.1678930728138;
        Wed, 15 Mar 2023 18:38:48 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id kb5-20020a170903338500b0019a6cce2060sm4271020plb.57.2023.03.15.18.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:38:47 -0700 (PDT)
Date:   Wed, 15 Mar 2023 18:38:46 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: document NAPI
Message-ID: <20230315183846.3eb99271@hermes.local>
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

Older pre LF wiki NAPI docs still survive here
https://lwn.net/2002/0321/a/napi-howto.php3
