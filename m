Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A9FEB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 15:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbjF3PS5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 11:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbjF3PSj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 11:18:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D6946B2
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 08:17:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 76EED61771
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 15:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A049C433C8;
        Fri, 30 Jun 2023 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688138277;
        bh=gnuxV5kzjS5tgTjg2uJ7Rw7C3mBNcN1hr74skn4arK8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o9SK8k4m4GHJWiJr9nFXMiZOwiDOgCxqZa3NgvpDJ+mti0zgBVeSQLmiThea6rMjF
         /DPPXenS1ln+915LJGR9aLe4tE7VqAFIuthSyxqNksbxMCki0eSlwIMFmldl5YNrWD
         GhTF+Av65dMQfgtbTsdRe0H4TpqvqQFLvDr/FQOtpet/iov0JM5VVET0W0C8ZmXERz
         5vr5aKZAeKFjThtyWIZw/1s+W34Wgo7EyB1djozuOi1EU8Wh+3wDyp2B3g+0A17Pe1
         QtMzZUO+t1uExNXHAbqVQYNRgT0Bp/VhD6/1uM71r70oWjONjDbU88xhcqPOYf9kk4
         3r76l+s9jycVg==
Date:   Fri, 30 Jun 2023 08:17:56 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
Cc:     <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
        <corbet@lwn.net>, <netdev@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <andersson@kernel.org>,
        <quic_jhugo@quicinc.com>,
        "Sean Tranchetti" <quic_stranche@quicinc.com>
Subject: Re: [PATCH net v2] docs: networking: Update codeaurora references
 for rmnet
Message-ID: <20230630081756.609ba7fa@kernel.org>
In-Reply-To: <1688108686-16363-1-git-send-email-quic_subashab@quicinc.com>
References: <1688108686-16363-1-git-send-email-quic_subashab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 30 Jun 2023 01:04:46 -0600 Subash Abhinov Kasiviswanathan wrote:
> -https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/dataservices/tree/rmnetctl
> +The driver uses rtnl_link_ops for communication.
> \ No newline at end of file

Please add the new line at the end of the file.
-- 
pw-bot: cr
