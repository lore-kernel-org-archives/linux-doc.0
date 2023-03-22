Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF67C6FD1C
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 23:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjCVXVl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 19:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjCVXVk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 19:21:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A429820A3C;
        Wed, 22 Mar 2023 16:21:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A5C162342;
        Wed, 22 Mar 2023 23:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11257C433D2;
        Wed, 22 Mar 2023 23:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679527293;
        bh=r5E8oKs7MVQwqsgWgCGaIPENUKWOMEH9GBkCcDi/94U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Fio5L5OtJO/3Hh6jOEAEW+v2+P27p3hFcfF+HpL+avuoPFNOVFANZF74mgHNHd2EU
         b1GKHBpYe9IXJnWjv0P/5UnVfYFWJPQI9ZUPxQE/uKc5SH7Gn08QaMkaFZE+PdmehL
         n+Ku9zAlXfrAV+EYt2h7juO0jOWwIgxmOCdlnJvk3Rq/GBnfay+OjNel7L1eoyBg4i
         RBpw8AZdEKXfuLorCsrExJdQC7waUorRqAX+m5KzRRCsoIVWvJCK9+ug4zCu/dicp1
         T+BBTRvxoq62+uOCcOzGSiZvggZM+A2XfbBrej22o4pdWY/xJEgDTk12RS3xxcaJZJ
         3+LBS8ZPC0TpA==
Date:   Wed, 22 Mar 2023 16:21:32 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNl?= =?UTF-8?B?bg==?= 
        <toke@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>, corbet@lwn.net,
        jesse.brandeburg@intel.com, mkl@pengutronix.de,
        linux-doc@vger.kernel.org, stephen@networkplumber.org,
        romieu@fr.zoreil.com
Subject: Re: [PATCH net-next v3] docs: networking: document NAPI
Message-ID: <20230322162132.29cc6166@kernel.org>
In-Reply-To: <20230322053848.198452-1-kuba@kernel.org>
References: <20230322053848.198452-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 21 Mar 2023 22:38:48 -0700 Jakub Kicinski wrote:
> Add basic documentation about NAPI. We can stop linking to the ancient
> doc on the LF wiki.
>=20
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Link: https://lore.kernel.org/all/20230315223044.471002-1-kuba@kernel.org/
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz> # for ctucanfd-driver.rst
> Reviewed-by: Tony Nguyen <anthony.l.nguyen@intel.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

I think I'll just fold the latest round of rewordings when applying
the patch. Thanks for reviews everyone!
