Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E450C41513
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 15:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344033AbjHPPM3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344058AbjHPPMM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 11:12:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804F326A5
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 08:12:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 142256102E
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 15:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039DFC433C7;
        Wed, 16 Aug 2023 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692198730;
        bh=4umvi0Zd4qyu8CE0DXTGHbHgH3ugeqP0mZ6kaZi1KiY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=snwyMyXUWaq02SFi54cPvrQz8A+ioAg7hJlPnUY+jSDRIbvRmHrqoPycpHq6tcmEH
         4+q9YaCVERFoN24i+gZvjtqNXh4xJk6JkaJ+yCl7GnNILjuokxOD7CVb1MNEZJv96A
         Pbu7Z084TBuNp4W4XzFB/ijZXeQ8nY+6FazPYXEsEFMNlvQqk3rJqwos4qRvnKpO/h
         ClsF/mBM2w2sf4P5u9XuchePTIb5DhpDfV51zTzWdmWw4ex/r8kJaHxBpQIf0rDoO8
         3XuHxdqF9mZ3iThQroSgcr2Cnw3PNbmNpO3SweLNr5LaVXLjFU6bVFEk7teimg+N4+
         w1Yv4C/tUuJpA==
Date:   Wed, 16 Aug 2023 08:12:09 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 04/10] tools/ynl: Add mcast-group schema
 parsing to ynl
Message-ID: <20230816081209.56b48f07@kernel.org>
In-Reply-To: <20230815194254.89570-5-donald.hunter@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-5-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Aug 2023 20:42:48 +0100 Donald Hunter wrote:
> +class SpecMcastGroup(SpecElement):
> +    """Netlink Multicast Group
> +
> +    Information about a multicast group.

I'd add more info about value here. Say something along the lines
of value is specified in the spec only for classic netlink
(netlink-raw) families, genetlink families use dynamic ID allocation
so the ids of multicast groups need to be resolved at runtime.
value will be None for genetlink families.

> +
> +    Attributes:
> +        name      name of the mulitcast group
> +        value     numerical id of this multicast group for netlink-raw
> +        yaml      raw spec as loaded from the spec file
> +    """
> +    def __init__(self, family, yaml):
> +        super().__init__(family, yaml)
> +        self.value = self.yaml.get('value')
